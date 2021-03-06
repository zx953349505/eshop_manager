package eshop_manager.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;




import eshop_manager.biz.ManagerBiz;
import eshop_manager.biz.RoleBiz;
import eshop_manager.entity.ManagerInfo;
import eshop_manager.entity.RoleInfo;
import eshop_manager.util.MyAnnotation.CheckLoginRequired;


@Controller
@RequestMapping("/manager")
public class ManagerController {
	@Autowired
	private ManagerBiz managerBiz;
	@Autowired
	private RoleBiz roleBiz;
	@RequestMapping("/managerPage")
	@CheckLoginRequired
	public ModelAndView managerPage() throws Exception{	
		ModelAndView modelAndView=new ModelAndView();
		List<ManagerInfo> manList=managerBiz.selectManList();
		List<RoleInfo> roleList=roleBiz.selectRoleList();
		modelAndView.addObject("roleList", roleList);
		modelAndView.addObject("manList", manList);
		modelAndView.setViewName("pmmsmanager");
		return modelAndView;
	}
	@RequestMapping(value="/deleteMan",method={RequestMethod.POST})
	@CheckLoginRequired
	public @ResponseBody int deleteMan(
			@RequestParam("manager_id") int manager_id
			)throws Exception{	
		System.out.println("ajax传参是"+manager_id);
		try {
			managerBiz.deleteMan(manager_id);
			return 200;
		} catch (Exception e) {
			return 500;
		}
	}
	
	@RequestMapping("/addMan")
	@CheckLoginRequired
	public String addMan(
			HttpServletRequest request,
			@RequestParam("manager_name") String manager_name,
			@RequestParam("manager_pwd") String manager_pwd,
			@RequestParam("manager_role") int manager_role
			)throws Exception{
		ManagerInfo managerInfo=new ManagerInfo();
		managerInfo.setManager_name(manager_name);
		managerInfo.setManager_pwd(manager_pwd);
		managerInfo.setManager_role(manager_role);
		managerBiz.addMan(managerInfo);
		return "redirect:/manager/managerPage";
	}
	@RequestMapping("/login")
	@ResponseBody
	public String login(HttpServletRequest request,
			@RequestParam("manager_name") String manager_name,
			@RequestParam("manager_pwd") String manager_pwd,
			@RequestParam("authCode") String authCode
			)throws ServletException, IOException {
		JSONObject jo = new JSONObject();
		String verifyCode = (String) request.getSession().getAttribute("verifyCode");
		String lastPage = (String) request.getSession().getAttribute("lastPage");
		request.getSession().removeAttribute("verifyCode");
		//request.getSession().removeAttribute("lastPage");
		if (verifyCode.equalsIgnoreCase(authCode)) {//验证码正确
			
			// 从数据库查询出来的用户对象
			ManagerInfo managerInfo=new ManagerInfo();
			managerInfo.setManager_name(manager_name);
			managerInfo.setManager_pwd(manager_pwd);
			managerInfo = managerBiz.selectManByMsg(managerInfo);
			if (managerInfo == null) {//账号密码错误
				jo.put("status", 502);
			} else {
				request.getSession().setAttribute("managerInfo", managerInfo);
				jo.put("status", 200);
				jo.put("manager_id", managerInfo.getManager_id());
				jo.put("lastPage", lastPage);
			}
		} else {
			jo.put("status", 501);//验证码错误
		}
		return jo.toString();
	}
	@RequestMapping("/index")
	@CheckLoginRequired
	public ModelAndView index()throws Exception{
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("index");
		return modelAndView;
	}
}
