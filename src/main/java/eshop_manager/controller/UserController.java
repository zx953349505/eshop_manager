package eshop_manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import eshop_manager.biz.UserBiz;
import eshop_manager.entity.UserInfo;
import eshop_manager.util.MyAnnotation.CheckLoginRequired;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserBiz userBiz;
	
	@RequestMapping("/selectAllCount")	
	@CheckLoginRequired
	public @ResponseBody int selectAllCount()throws Exception{
		int count=userBiz.selectUserCount();
		return count;
	}
	@RequestMapping("/selectOnlineCount")
	@CheckLoginRequired
	public @ResponseBody int selectOnlineCount()throws Exception{
		int count=userBiz.selectOnlineUser();
		return count;
	}
	@RequestMapping("/selectAllUser")
	@CheckLoginRequired
	public @ResponseBody List<UserInfo> selectAllUser()throws Exception{
		List<UserInfo> userList=userBiz.selectUserList();
		return userList;
	}
	
	@RequestMapping("/selectAllUserList")
	@CheckLoginRequired
	public ModelAndView selectAllUserList(
			@RequestParam(value="keyWord",required=false) String keyWord ,
			@RequestParam(value="is_activated",required=false) Integer isActivated ,
			@RequestParam(value="date",required=false) String regDate ,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage
			)throws Exception{
		
		ModelAndView model=new ModelAndView();
		
		int pageSize=10;
		List<UserInfo> allUserList=userBiz.selectAllUserList(keyWord,regDate,isActivated,currentPage,pageSize);
		int toatalInfoCount=userBiz.totalUserInfoCount(keyWord,regDate,isActivated);		
		int totalPage=toatalInfoCount % pageSize == 0 ? toatalInfoCount / pageSize : toatalInfoCount / pageSize + 1;
		model.addObject("keyWord", keyWord);
		model.addObject("regDate", regDate);
		model.addObject("isActivated", isActivated);
		model.addObject("currentPage", currentPage);		
		model.addObject("toatalInfoCount", toatalInfoCount);
		model.addObject("totalPage", totalPage);
		
		model.addObject("allUserList", allUserList);
		
		model.setViewName("users");

		return model;
	}
	
	@RequestMapping("/addUserPage")
	@CheckLoginRequired
	public ModelAndView toAddUserPage(){
		
		ModelAndView model=new ModelAndView();
		model.setViewName("adduser");
		return model;
	}
			
	@RequestMapping("/addUser")
	@CheckLoginRequired
	public @ResponseBody Map<String, Object> addUser(
			@RequestParam("user_name") String user_name,
			@RequestParam("user_pwd") String user_pwd,
			@RequestParam("user_email") String user_email,
			@RequestParam("user_sex") String user_sex,
			@RequestParam("user_phone") String user_phone,
			@RequestParam("question_id") int question_id,
			@RequestParam("question_answer") String question_answer,
			@RequestParam("province_id") String province_id,
			@RequestParam("city_id") String city_id,
			@RequestParam("area_id") String area_id,
			@RequestParam("user_address") String user_address
			)throws Exception{
		
			Map<String, Object> resultMap=new HashMap<String, Object>();
			UserInfo userInfo=new UserInfo();
		
			userInfo.setArea_id(area_id);
			userInfo.setCity_id(city_id);
			userInfo.setProvince_id(province_id);
			userInfo.setQuestion_answer(question_answer);
			userInfo.setQuestion_id(question_id);
			userInfo.setUser_address(user_address);
			userInfo.setUser_email(user_email);
			userInfo.setUser_name(user_name);
			userInfo.setUser_phone(user_phone);
			userInfo.setUser_pwd(user_pwd);
			userInfo.setUser_sex(user_sex);
			
			userBiz.addUser(userInfo);
			resultMap.put("status", 200);
			
			return resultMap;
	}
	
}
