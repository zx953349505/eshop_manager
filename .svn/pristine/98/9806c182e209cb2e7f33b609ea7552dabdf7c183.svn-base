var rootURL;
function loadingMethod(url) {
	rootURL=url;
	$.post(rootURL+"/user/selectAllCount",null,function(response){
		var result=$.parseJSON(response);
		$("#usercount").html(result.count);
	})
	$.post(rootURL+"/user/selectOnlineCount",null,function(response){
		var result=$.parseJSON(response);
		$("#onlineuser").html(result.count);
	})
	$.post(rootURL+"/user/selectAllUser",null,function(response){
		var result=$.parseJSON(response);
		var userList=result.userList;
		console.log(result);
		var html="";
		for (var int = 0; int < userList.length; int++) {
			var userInfo=userList[int];
			html+="<tr><td>"+userInfo.user_name+"</td><td>";
			html+=userInfo.user_email+"</td><td>"+userInfo.user_sex+"</td><td>";
			var act=userInfo.is_activated==1?"激活":"未激活";
			html+=act+"</td></tr>";		
		} 	
		$("#userList").html(html);
	})
	$.post(rootURL+"/order/selectSendOrder",null,function(response){
		var result=$.parseJSON(response);
		$("#send").html("<font color='orange'>"+result.count+"</font>");
	})
	$.post(rootURL+"/order/selectPayOrder",null,function(response){
		var result=$.parseJSON(response);
		$("#pay").html(result.count);
	})
	$.post(rootURL+"/order/selectCompleteOrder",null,function(response){
		var result=$.parseJSON(response);
		$("#complete").html(result.count);
	})
	$.post(rootURL+"/order/selectCancelOrder",null,function(response){
		var result=$.parseJSON(response);
		$("#cancel").html(result.count);
	})
	$.post(rootURL+"/order/selectSale",null,function(response){
		var result=$.parseJSON(response);
		$("#sale").html(result.sum);
	})
}
