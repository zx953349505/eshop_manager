var rootURL;
function loadingMethod(url) {
	rootURL=url;
	$.post(rootURL+"/user/selectAllCount.action",null,function(response){
		$("#usercount").html(response);
	})
	$.post(rootURL+"/user/selectOnlineCount.action",null,function(response){
		$("#onlineuser").html(response);
	})
	$.post(rootURL+"/user/selectAllUser.action",null,function(response){
		console.log("----"+response)
		var html="";
		for (var int = 0; int < response.length; int++) {
			var userInfo=response[int];
			html+="<tr><td>"+userInfo.user_name+"</td><td>";
			html+=userInfo.user_email+"</td><td>"+userInfo.user_sex+"</td><td>";
			var act=userInfo.is_activated==1?"激活":"未激活";
			html+=act+"</td></tr>";		
		} 	
		$("#userList").html(html);
	})
	$.post(rootURL+"/order/selectSendOrder.action",null,function(response){
		console.log(response);
		$("#send").html("<font color='orange'>"+response+"</font>");
	})
	$.post(rootURL+"/order/selectPayOrder.action",null,function(response){
		$("#pay").html(response);
	})
	$.post(rootURL+"/order/selectCompleteOrder.action",null,function(response){
		$("#complete").html(response);
	})
	$.post(rootURL+"/order/selectCancelOrder.action",null,function(response){
		$("#cancel").html(response);
	})
	$.post(rootURL+"/order/selectSale.action",null,function(response){
		$("#sale").html(response);
	})
}
