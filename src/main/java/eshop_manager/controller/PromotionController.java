package eshop_manager.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import eshop_manager.biz.PromotionBiz;
import eshop_manager.entity.PromotionInfo;
import eshop_manager.util.MyAnnotation.CheckLoginRequired;

@Controller
@RequestMapping("/promotion")
public class PromotionController {
	@Autowired
	private PromotionBiz promotionBiz;
	
	@RequestMapping("/proPage")
	@CheckLoginRequired
	public ModelAndView addPage() throws Exception{	
		ModelAndView modelAndView=new ModelAndView();
		List<PromotionInfo> proList=promotionBiz.selectPromotionInfo();
		modelAndView.addObject("proList", proList);
		modelAndView.setViewName("promotion");
		return modelAndView;
	}
	@RequestMapping(value="/deletePro",method={RequestMethod.POST})
	@CheckLoginRequired
	public @ResponseBody int deletePro(
			@RequestParam("promotion_context") String promotion_context
			)throws Exception{	
		System.out.println("ajax´«²ÎÊÇ"+promotion_context);
		try {
			promotionBiz.deleteProByName(promotion_context);
			return 200;
		} catch (Exception e) {
			return 500;
		}
	}
	
	@RequestMapping("/addPro")
	@CheckLoginRequired
	public String addPro(
			HttpServletRequest request,
			@RequestParam("book_id") int book_id,
			@RequestParam("news_contents") String promotion_context
			)throws Exception{
		PromotionInfo promotionInfo=new PromotionInfo();
		promotionInfo.setBook_id(book_id);
		promotionInfo.setPromotion_context(promotion_context);
		promotionBiz.addPromotion(promotionInfo);;
		return "redirect:/promotion/proPage";
	}
	
}
