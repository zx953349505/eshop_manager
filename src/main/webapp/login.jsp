<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">

<head>
<meta charset="utf-8">
<title>云和数据教学管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- CSS -->

<link rel="stylesheet" href="${pageContext.request.contextPath }/static/stylesheets/supersized.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/stylesheets/login.css">
<link href="${pageContext.request.contextPath }/static/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	<script src="js/html5.js"></script>
<![endif]-->
<script type="text/javascript" src="${pageContext.request.contextPath }/static/lib/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/lib/jquery.form.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/lib/tooltips.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/lib/login.js"></script>
<script src="${pageContext.request.contextPath }/static/lib/cookie_util.js" type="text/javascript"></script>


</head>

<body>

<div class="page-container">
	<div class="main_box">
		<div class="login_box">
			<div class="login_form" id="normalLogin">
			<h1>EShop后台管理系统</h1>
				<form>
					<div class="form-group">
						用户名：
						<input id="manager_name" value="" name="manager_name" type="text" class="form-control x319 in" 
						autocomplete="off">
					</div>
					<div class="form-group">
						密　码：
						<input id="manager_pwd" value="" name="manager_pwd" type="password" 
						class="password form-control x319 in" />
					</div>
					<div class="form-group">
						验证码：
						 <input id="authCode" name="authCode" type="text" class="form-control x164 in" />
						 <a href="javascript:changeCode()"><img id="img" src="${pageContext.request.contextPath }/verify"></a>
					</div>
					<div class="form-group">
						<label class="t"></label>
						<label for="j_remember" class="m">
						<input id="rememberme" name="rememberme" type="checkbox" value="true">&nbsp;记住登陆状态</label>
					</div>
					<div class="form-group space">
						<label class="t"></label>　　
						<button type="button"  id="submit_btn" class="btn btn-primary btn-lg" onclick="javascript:sublogin()">&nbsp;登&nbsp;录&nbsp; </button>
						<input type="reset" value="&nbsp;重&nbsp;置&nbsp;" class="btn btn-default btn-lg">
					</div>
				</form>
			</div>
			
			
		</div>
		
	</div>
</div>

<!-- Javascript -->

<script src="${pageContext.request.contextPath }/static/lib/supersized.3.2.7.min.js"></script>
<script src="${pageContext.request.contextPath }/static/lib/scripts.js"></script>

<script type="text/javascript">
	
	$(function(){
		loadMethodIndex('${pageContext.request.contextPath }');
	});
	function changeCode(){
		document.getElementById("img").src="verify?xxxx="+new Date().getTime()		
	};
</script>

</body>
</html>