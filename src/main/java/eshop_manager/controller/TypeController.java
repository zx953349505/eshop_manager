package eshop_manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import eshop_manager.biz.TypeBiz;
import eshop_manager.entity.TypeInfo;
import eshop_manager.util.MyAnnotation.CheckLoginRequired;

@Controller
@RequestMapping("/type")
public class TypeController {
	@Autowired
	private TypeBiz typeBiz;
	@RequestMapping("/selectType")
	@CheckLoginRequired
	public ModelAndView selectType() throws Exception{
		ModelAndView mv =new ModelAndView();
		List<TypeInfo> typelist=typeBiz.selectType();
		mv.addObject("typelist", typelist);
		mv.setViewName("type_manager");
		return mv;
	}
	
	@RequestMapping("/selectParentType")
	@CheckLoginRequired
	public @ResponseBody List<TypeInfo> selectParentType() throws Exception{

		List<TypeInfo> parentTypeList=typeBiz.selectTypeAll();		
		
		return parentTypeList;
	}
	
	@RequestMapping("/selectChildType")
	@CheckLoginRequired
	public @ResponseBody List<TypeInfo> selectChildType() throws Exception{

		List<TypeInfo> childTypeList=typeBiz.selectChildTypeAll();
		
		return childTypeList;
	}
}
