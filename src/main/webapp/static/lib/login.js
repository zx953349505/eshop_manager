// JavaScript Document
//支持Enter键登录
var rootURL;
function loadMethodIndex(rURL,serverName,port){
	rootURL=rURL;
	console.log(rootURL);
}
		document.onkeydown = function(e){
			if($(".bac").length==0)
			{
				if(!e) e = window.event;
				if((e.keyCode || e.which) == 13){
					var obtnLogin=document.getElementById("submit_btn")
					obtnLogin.focus();
				}
			}
		}
		
		function sublogin() {//登录验证
			console.log(rootURL);
		    var manager_name = $("#manager_name").val();
		    var manager_pwd = $("#manager_pwd").val();
		    var authCode=$("#authCode").val();
		    if (manager_name == "") {
		    	show_err_msg("请输入用户名");
		    } else if (manager_pwd == "") {
		    	show_err_msg("请输入密码！");
		    } else if (authCode==""){
		    	show_err_msg("请输入验证码！");
		    } else{
		    	show_loading();
		    	//ajax开始请求 	
		    	var params={"manager_name":manager_name,"manager_pwd":manager_pwd,"authCode":authCode};
		    	$.post(rootURL+"/manager/login",params,function(response){
		    		var jo=$.parseJSON(response);
		    		if(jo.status==501){
		    			show_err_msg("验证码错误！");
		    			changeCode();
		    		}else if(jo.status==502){
		    			show_err_msg("账号或密码错误！");
		    			changeCode();
		    		}else{//登录成功
		    			var isrememberme=$("#rememberme").prop("checked");
		    			if(isrememberme){
		    				setCookie("manager_id",jo.manager_id)
		    			}
		    			if(jo.lastPage==null||jo.lastPage==""){
		    				show_msg("登录成功！", rootURL+"/manager/index");
		    			}else{
		    				show_msg("登录成功！", jo.lastPage);
		    			}
		    			
		    		}
		    		
		    	})
		    }
		}