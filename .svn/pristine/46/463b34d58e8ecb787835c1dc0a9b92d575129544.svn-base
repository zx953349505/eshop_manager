package eshop_manager.entity;

import java.io.Serializable;
import java.util.HashMap;

import javax.servlet.http.HttpSessionActivationListener;
import javax.servlet.http.HttpSessionEvent;


public class MyHashMap extends HashMap<Integer, Integer> implements HttpSessionActivationListener,Serializable{

	private static final long serialVersionUID = 8907671133017034892L;

	public void sessionDidActivate(HttpSessionEvent session) {
		// TODO Auto-generated method stub
		System.out.println("购物车激活了");
	}

	public void sessionWillPassivate(HttpSessionEvent session) {
		// TODO Auto-generated method stub
		System.out.println("购物车钝化了");
		/**
		 * 同步购物车数据到数据库
		 */
		/*UserInfo userInfo=(UserInfo) session.getSession().getAttribute("userInfo");
		if (userInfo!=null) {
			CartBiz cartBiz=new CartBizImpl();
			if(this!=null&&this.size()!=0){		
				MyHashMap dbMap=cartBiz.selectByUserId(userInfo.getUser_id());
				System.out.println("----------db中的CartMap----------");
				if(dbMap!=null&&dbMap.size()!=0){
					Set<Integer> dbKeySet=dbMap.keySet();
					boolean flag=false;//默认不同步
					for (Integer key : dbKeySet) {
						System.out.println("key:"+key+",value:"+dbMap.get(key));
						if(!this.containsKey(key)){
							flag=true;
							break;
						}else{
							if(this.get(key).intValue()!=dbMap.get(key).intValue()){
								flag=true;
								break;
							}
						}
					}
					if(!flag){
						System.out.println("----------session中的CartMap----------");
						Set<Integer> seKeySet=this.keySet();
						for (Integer key : seKeySet) {
							System.out.println("key:"+key+",value:"+this.get(key));
							if(!dbMap.containsKey(key)){
								flag=true;
								break;
							}
						}
						
					}
					if(flag){
						cartBiz.updateCartByUserId(this, userInfo.getUser_id());
						System.out.println("购物车同步成功！");
					}else{
						System.out.println("购物车不需同步！");
					}
				}else{
					cartBiz.addCartByUserId(this, userInfo.getUser_id());
					System.out.println("购物车同步成功！");
				}
				
			}else{
				cartBiz.deleteCartByUserId(userInfo.getUser_id());
				System.out.println("购物车同步成功！");
			}
			
		}*/
	}

}
