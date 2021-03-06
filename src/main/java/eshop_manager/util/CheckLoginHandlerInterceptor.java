package eshop_manager.util;

import java.lang.reflect.Method;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import eshop_manager.entity.ManagerInfo;
import eshop_manager.util.MyAnnotation.CheckLoginRequired;

public class CheckLoginHandlerInterceptor implements HandlerInterceptor{

	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		if(handler instanceof HandlerMethod){
			Method method=((HandlerMethod) handler).getMethod();
			boolean flag=method.isAnnotationPresent(CheckLoginRequired.class);
			if(flag){
				ManagerInfo managerInfo = (ManagerInfo) request.getSession().getAttribute("managerInfo");
				if (managerInfo == null) {
					// 去cookie去找userId
					String manager_id = null;
					Cookie[] cookieArray = request.getCookies();
					if (cookieArray != null) {
						for (Cookie cookie : cookieArray) {
							if ("manager_id".equals(cookie.getName())) {// 筛选出了“userID”这个cookie对象
								manager_id = cookie.getValue();
								// userId=URLDecoder.decode(cookie.getValue(),
								// "UTF-8");设置取出编码格式
								break;
							}
						}
					}

					if (manager_id != null) {// cookie有用户对象
						return true;
					} else {
						String lastPage = request.getRequestURI();
						if(lastPage.endsWith("notsure")){
							String json=request.getParameter("json");
							request.getSession().setAttribute("lastPage",lastPage+"?json="+json);	
						}else{
							request.getSession().setAttribute("lastPage",lastPage+"?"+request.getQueryString());	
						}
						System.out.println("参数是"+request.getQueryString());
						request.getRequestDispatcher("/login.jsp").forward(request, response);
					}
				} else {
					return true;
				}
			}
		}
		return true;
	}

	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}

	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}

}
