var rootURL;
function loadingMethod(url) {
	rootURL=url;
	$.post(rootURL+"/user/selectAllCount",null,function(response){
		$("#usercount").html(response);
	})
	$.post(rootURL+"/user/selectOnlineCount",null,function(response){
		$("#onlineuser").html(response);
	})
	$.post(rootURL+"/user/selectAllUser",null,function(response){
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
	$.post(rootURL+"/order/selectSendOrder",null,function(response){
		console.log(response);
		$("#send").html("<font color='orange'>"+response+"</font>");
	})
	$.post(rootURL+"/order/selectPayOrder",null,function(response){
		$("#pay").html(response);
	})
	$.post(rootURL+"/order/selectCompleteOrder",null,function(response){
		$("#complete").html(response);
	})
	$.post(rootURL+"/order/selectCancelOrder",null,function(response){
		$("#cancel").html(response);
	})
	$.post(rootURL+"/order/selectSale",null,function(response){
		$("#sale").html(response);
	})
	$.post(rootURL+"/pv/selectPvCount",null,function(response){
		$("#pv").html(response);
	})
	$.post(rootURL+"/ip/selectIpList",null,function(response){
		var html="";
		for (var int = 0; int < response.length; int++) {
			var ipInfo=response[int];
			html+="<tr><td>"+ipInfo.ip_address+"</td><td>";
			html+=ipInfo.count+"</td></tr>";		
		} 	
		$("#ipList").html(html);
	})
}
