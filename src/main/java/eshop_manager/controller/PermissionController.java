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

import eshop_manager.biz.PermissionBiz;
import eshop_manager.entity.PermissionInfo;
import eshop_manager.util.MyAnnotation.CheckLoginRequired;

@Controller
@RequestMapping("/permission")
public class PermissionController {
	@Autowired
	private PermissionBiz permissionBiz;
	
	@RequestMapping("/perPage")
	@CheckLoginRequired
	public ModelAndView perPage() throws Exception{	
		ModelAndView modelAndView=new ModelAndView();
		List<PermissionInfo> perList=permissionBiz.selectPerList();
		modelAndView.addObject("perList", perList);
		modelAndView.setViewName("pmmspermission");
		return modelAndView;
	}
	@RequestMapping(value="/deletePer",method={RequestMethod.POST})
	@CheckLoginRequired
	public @ResponseBody int deletePer(
			@RequestParam("permission_id") int permission_id
			)throws Exception{	
		System.out.println("ajax´«²ÎÊÇ"+permission_id);
		try {
			permissionBiz.deletePer(permission_id);
			return 200;
		} catch (Exception e) {
			return 500;
		}
	}
	
	@RequestMapping("/addPer")
	@CheckLoginRequired
	public String addPer(
			HttpServletRequest request,
			@RequestParam("permission_name") String permission_name
			)throws Exception{
		permissionBiz.addPer(permission_name);
		return "redirect:/permission/perPage";
	}
}
