<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>eshop商城</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/stylesheets/theme.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/lib/font-awesome/css/font-awesome.css">
    <script src="${pageContext.request.contextPath }/static/lib/jquery-1.7.2.min.js" type="text/javascript"></script>
    
    <!-- Demo page code -->

    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
        .brand .first {
            color: #ccc;
            font-style: italic;
        }
        .brand .second {
            color: #fff;
            font-weight: bold;
        }
    </style>
    
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath }/assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath }/assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath }/assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath }/assets/ico/apple-touch-icon-57-precomposed.png">
  </head>

  <!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
  <!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
  <!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
  <!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
  <!--[if (gt IE 9)|!(IE)]><!--> 
  
  <body class=""> 
  
 	<c:import url="/framework"></c:import>
    
	<div class="content">
		<div class="header">
			<h1 class="page-title">会员管理</h1>
		</div>

		<ul class="breadcrumb">
			<li><a href="bookmanager.jsp">会员管理</a> <span class="divider">/</span></li>
			<li class="active">添加会员</li>
		</ul>
		
		<div class="container-fluid">

			<div class="row-fluid">

				<div class="btn-toolbar">
				<a href="javascript:subAdd();">
					<button class="btn btn-primary" id="btnSave">
						<i class="icon-save"></i> 添加
					</button>
				</a>
				</div>
				<div class="well">
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane active in" id="basicInfo">
							<form id="addUserForm" action="${pageContext.request.contextPath }/user/addUser" method="post">
								<label>用户名</label>
								<input type="text" id="user_name" name="user_name" class="input-xlarge"> 
								
								<label>密码</label>
								<input type="password" id="user_pwd" name="user_pwd" class="input-xlarge"> 
								
								<label>邮箱</label> 
								<input type="text" id="user_email" name="user_email" class="input-xlarge">
								
								<label>性别</label> 
								男 <input type="radio" class="span1" name="sex" value="男" checked="checked"/>&nbsp;&nbsp;&nbsp;&nbsp
								女 <input type="radio" class="span1" name="sex" value="女" />
                                <label><hr /></label> 
								
								<label>电话</label> 
								<input type="text" id="user_phone" name="user_phone" class="input-xlarge">
								
								<label>密保问题</label>
								
					            <select name="question"  id="question" class="input-xlarge">
					            
					            </select>
								
								<label>密保答案</label>
					            <input type="text" name="question_answer" id="answer"  class="input-xlarge"/>
								
								<label>用户地址</label>
								<div class="wlfg-wrap">									
									<span id="city_area">
				                        <select class="prov" id="province" name="province">
				                                              
				                        </select> 
				                        <select class="city" id="city" name="city">
				                                        
				                        </select>
				                        <select class="dist" id="area" name="area">     
				                                        
				                        </select>
			                    	</span>
				                </div>
				                
				                <label>详细地址</label>
				                <div class="wlfg-wrap">
									<input type="text" name="user_address" id="address" class="rlf-input" placeholder="请输入详细地址" value="${sessionScope.userInfo.user_address }" />
				                </div>
                       					
							</form>
						</div>
						
					</div>

				</div>
				
				<footer>
					<hr>
					<!-- Purchase a site license to remove this link from the footer: http://www.portnine.com/bootstrap-themes -->
					<p class="pull-right">
						Collect from <a href="http://www.iyunhe.com/" target="_blank">云和数据</a>
					</p>
					<p>copyright &copy; 2013-2018 河南云和数据信息技术有限公司深圳分公司&nbsp; 
						<a href="http://www.iyunhe.com/" title="河南云和数据信息技术有限公司深圳分公司" target="_blank">首页</a>
					</p>
				</footer>

			</div>
		</div>
	</div>
	
    <script src="${pageContext.request.contextPath }/static/lib/bootstrap/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath }/static/lib/user.js"></script>
    <script src="${pageContext.request.contextPath }/static/lib/tooltips.js" type="text/javascript"></script>
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function() {
        	
            $('.demo-cancel-click').click(function(){return false;});
            
            loadQuestion_Address('${pageContext.request.contextPath }');
        });
    </script>
    
  </body>
</html>