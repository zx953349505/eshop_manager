package eshop_manager.controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import eshop_manager.biz.AdBiz;
import eshop_manager.entity.AdInfo;
import eshop_manager.util.MyAnnotation.CheckLoginRequired;

@Controller
@RequestMapping("/ad")
public class AdController {
	@Autowired
	private AdBiz adBiz;
	
	@RequestMapping("/addPage")
	@CheckLoginRequired
	public ModelAndView addPage() throws Exception{	
		ModelAndView modelAndView=new ModelAndView();
		List<AdInfo> adList=adBiz.selectAdInfo();
		modelAndView.addObject("adList", adList);
		modelAndView.setViewName("advertise");
		return modelAndView;
	}
	@RequestMapping(value="/deleteAdvertise",method={RequestMethod.POST})
	@CheckLoginRequired
	public @ResponseBody int deleteAd(
			@RequestParam("ad_name") String ad_name
			)throws Exception{	
		System.out.println("ajax传参是"+ad_name);
		try {
			adBiz.deleteAdByName(ad_name);
			return 200;
		} catch (Exception e) {
			return 500;
		}
	}
	
	@RequestMapping("/addAd")
	@CheckLoginRequired
	public String addAd(
			HttpServletRequest request,
			@RequestParam("book_id") int book_id,
			@RequestParam("ad_img") MultipartFile ad_img
			)throws Exception{
		//获取项目录下的upload目录
		String path=request.getServletContext().getRealPath("/upload");
		
		//将大图文件写入upload目录
		String ad_img_name = generatorFileName(ad_img.getOriginalFilename());
		File file1=new File(path, ad_img_name);
		//如果父目录不存，则自动创建
		file1.getParentFile().mkdirs();
		ad_img.transferTo(file1);
		System.out.println("大图："+ad_img_name);
		AdInfo adInfo=new AdInfo();
		adInfo.setAd_name(ad_img_name);
		adInfo.setBook_id(book_id);
		adBiz.addAdvertise(adInfo);
		return "redirect:/ad/addPage";
	}
	
	public String generatorFileName(String FileOldName){
		String randNum=Math.random()+"";
		String randNumStr=randNum.substring(randNum.lastIndexOf(".")+1);
		//使用时间戳和随机数生成新文件名称(存入数据库的名称)
		return new Date().getTime()+randNumStr+ FileOldName.substring(FileOldName.lastIndexOf("."));
	}
}
