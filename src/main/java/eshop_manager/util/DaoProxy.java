package eshop_manager.util;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

import org.apache.ibatis.session.SqlSession;

import eshop_manager.entity.RoleInfo;
import eshop_manager.entity.BookInfo;

public class DaoProxy {
	
	
	public static Object getInstance(Class<?> clazz){
		
		Object obj=Proxy.newProxyInstance(clazz.getClassLoader(), new Class[]{clazz}, new Myinvocation(clazz));
	
	return obj;
	}
	private static class Myinvocation implements InvocationHandler{
		private Class<?> clazz;
		public Myinvocation(Class<?> clazz){
			this.clazz=clazz;
		}
		public Object invoke(Object proxy, Method method, Object[] args)
				throws Throwable {
			// TODO Auto-generated method stub
			SqlSession session=MySqlSessionFactory.getInstance().getFactory().openSession();
			Object obj=session.getMapper(clazz);
			Object returnValue;
			if(method.getName().equals("addBook")){
				
				returnValue=method.invoke(obj, args);
				//returnValue=userInfo.getUser_id();
				BookInfo bookInfo=(BookInfo) args[0];
				returnValue=bookInfo.getBook_id();
				
			}else if(method.getName().equals("addRole")){
				
				returnValue=method.invoke(obj, args);
				//returnValue=userInfo.getUser_id();
				RoleInfo roleInfo=(RoleInfo) args[0];
				returnValue=roleInfo.getRole_id();
				
			}else{
				
				returnValue=method.invoke(obj, args);
				System.out.println(args);
			}
			session.commit();
			session.close();
			return returnValue;
		}
		
	}
}
