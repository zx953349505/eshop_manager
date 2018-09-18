package eshop_manager.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

public class MyExceptionHandler implements HandlerExceptionResolver{

	public ModelAndView resolveException(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception exception) {
		Logger logger=LogManager.getLogger(handler.getClass());
		StringBuffer sb=new StringBuffer();
		sb.append(exception.toString());
		
		//异常类型、异常描述
		sb.append(exception.getClass());
		sb.append(exception.getMessage());
		sb.append("\n");
		
		//打印“运行栈列表信息”
		StackTraceElement[] stackArray =exception.getStackTrace();
		for(StackTraceElement element:stackArray){
			sb.append(element.toString());
			sb.append("\n");
		}		
		logger.error("-----------------------------------------------");
		logger.error("------------         LOG           ------------");
		logger.error("-----------------------------------------------");
		logger.error(sb);	
		
		ModelAndView model=new ModelAndView();
		model.setViewName("500");
		return model;
	}

}
