package eshop_manager.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import eshop_manager.util.VerifyCodeUtilByYock;

@Controller
public class VerifyController {
	@RequestMapping("/verify")
	public void Verify(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//设置“不允许客户端缓存”（出于安全考虑）
				response.setDateHeader("expries", -1);
				response.setHeader("Cache-Control", "no-cache");
				response.setHeader("Pragma", "no-cache");
				
		String verifyCode = VerifyCodeUtilByYock.generateVerifyCode(4);
		request.getSession().setAttribute("verifyCode", verifyCode);
		VerifyCodeUtilByYock.outputImageStream(180, 50, response.getOutputStream(), verifyCode);
	}
}
