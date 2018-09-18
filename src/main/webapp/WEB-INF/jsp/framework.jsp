<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Bootstrap Admin</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/static/lib/bootstrap/css/bootstrap.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/static/stylesheets/theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/static/lib/font-awesome/css/font-awesome.css">

<script
	src="${pageContext.request.contextPath }/static/lib/jquery-1.7.2.min.js"
	type="text/javascript"></script>

<!-- Demo page code -->

<style type="text/css">
#line-chart {
	height: 300px;
	width: 800px;
	margin: 0px auto;
	margin-top: 1em;
}

.brand {
	font-family: georgia, serif;
}

.brand .first {
	color: #ccc;
	font-style: italic;
}

.brand .second {
	color: #fff;
	font-weight: bold;
}
</style>

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="lib/html5.js"></script>
    <![endif]-->

<!-- Le fav and touch icons -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/static/lib/font-awesome/docs/assets/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="${pageContext.request.contextPath }/static/lib/font-awesome/docs/assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="${pageContext.request.contextPath }/static/lib/font-awesome/docs/assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="${pageContext.request.contextPath }/static/lib/font-awesome/docs/assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath }/static/lib/font-awesome/docs/assets/ico/apple-touch-icon-57-precomposed.png">
</head>

<!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
<!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
<!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
<!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<body class="">
	<!--<![endif]-->

	<div class="navbar">
        <div class="navbar-inner">
                <ul class="nav pull-right">
                    
                    <li id="fat-menu" class="dropdown">
                        <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="icon-user"></i> ${sessionScope.managerInfo.manager_name }
                            <i class="icon-caret-down"></i>
                        </a>

                        <ul class="dropdown-menu">
                            <li><a tabindex="-1" href="#">我的账号</a></li>
                            <li class="divider"></li>
                            <li><a tabindex="-1" class="visible-phone" href="#">设置</a></li>
                            <li class="divider visible-phone"></li>
                            <li><a tabindex="-1" href="sign-in.html">注销</a></li>
                        </ul>
                    </li>
                    
                </ul>
                <a class="brand" href="${pageContext.request.contextPath }/manager/index"><span class="first"></span> <span class="second">EshopManager</span></a>
        </div>
    </div>




	<div class="sidebar-nav">
		<c:forEach items="${requestScope.perList }" var="pid">
		<c:if test="${pid==1 }">
		<a href="${pageContext.request.contextPath }/manager/index" class="nav-header"><i class="icon-comment"></i>首页</a>
		</c:if>
		<c:if test="${pid==2 }">
		<a href="#book-menu" class="nav-header" data-toggle="collapse"><i class="icon-dashboard"></i>图书管理</a>
		<ul id="book-menu" class="nav nav-list collapse">
			<li class="active"><a href="${pageContext.request.contextPath }/book/bookManagerPage">查看图书信息</a></li>
			<li><a href="${pageContext.request.contextPath }/book/addBookPage">添加图书信息</a></li>
			<li><a href="${pageContext.request.contextPath }/book/selectGarbage/1">回收站</a></li>
		</ul>
		</c:if>
		<c:if test="${pid==3 }">
		<a href="#ad-menu" class="nav-header" data-toggle="collapse"><i class="icon-dashboard"></i>促销管理</a>
		<ul id="ad-menu" class="nav nav-list collapse">
			<li><a href="${pageContext.request.contextPath }/ad/addPage">首页轮播</a></li>
			<li><a href="${pageContext.request.contextPath }/promotion/proPage">公告板</a></li>
		</ul>
		</c:if>
		<c:if test="${pid==4 }">
		<a href="#type-menu" class="nav-header" data-toggle="collapse"><i class="icon-briefcase"></i>分类管理</a>
		<ul id="type-menu" class="nav nav-list collapse">
			<li><a href="${pageContext.request.contextPath }/type_manager.jsp">分类列表管理</a></li>
		</ul>
		</c:if>
		<c:if test="${pid==5 }">
		<a href="#order-menu" class="nav-header" data-toggle="collapse"> <i
			class="icon-legal"></i>订单管理 <span class="label label-info">+3</span>
		</a>
		<ul id="order-menu" class="nav nav-list collapse">
			<li><a href="${pageContext.request.contextPath }/order/selectOrderList">订单列表</a></li>
			<li><a href="${pageContext.request.contextPath }/sendlist.jsp">发货单列表</a></li>
			<li><a href="${pageContext.request.contextPath }/returnlist.jsp">退货单列表</a></li>
		</ul>
		</c:if>	
		<c:if test="${pid==6 }">
		<a href="#account-menu" class="nav-header" data-toggle="collapse">
			<i class="icon-legal"></i>会员管理 <span class="label label-info">+3</span>
		</a>
		<ul id="account-menu" class="nav nav-list collapse">
			<li><a href="${pageContext.request.contextPath }/user/selectAllUserList">查看会员信息</a></li>
			<li><a href="${pageContext.request.contextPath }/user/addUserPage">添加会员</a></li>
		</ul>
		</c:if>
		<c:if test="${pid==7 }">
		<a href="#stat-menu" class="nav-header" data-toggle="collapse">
		<i class="icon-legal"></i>报表统计
		</a>
		<ul id="stat-menu" class="nav nav-list collapse" style="height: 0px;">
			<li><a href="${pageContext.request.contextPath }/statcustomer.jsp">客户统计</a></li>
			<li><a href="${pageContext.request.contextPath }/statsales.jsp">销售概况</a></li>
			<li><a href="${pageContext.request.contextPath }/statbooktop.jsp">图书销售排行</a></li>
		</ul>
		</c:if>
		<c:if test="${pid==8 }">
		<a href="#setting-menu" class="nav-header" data-toggle="collapse"> 
		<i class="icon-legal"></i>系统设置
		</a>
		<ul id="setting-menu" class="nav nav-list collapse" style="height: 0px;">
			<li><a href="${pageContext.request.contextPath }/settingarea.jsp">地区列表</a></li>
			<li><a href="${pageContext.request.contextPath }/settingemail.jsp">设置发件邮箱</a></li>
			<li><a href="${pageContext.request.contextPath }/question/select_questionlist">设置密保问题</a></li>
		</ul>
		</c:if>
		<c:if test="${pid==9 }">
		<a href="#permission-menu" class="nav-header" data-toggle="collapse"> 
		<i class="icon-legal"></i>权限管理
		</a>
		<ul id="permission-menu" class="nav nav-list collapse" style="height: 0px;">
			<li><a href="${pageContext.request.contextPath }/manager/managerPage">用户列表</a></li>
			<li><a href="${pageContext.request.contextPath }/role/rolePage">角色列表</a></li>
			<li><a href="${pageContext.request.contextPath }/permission/perPage">权限列表</a></li>
		</ul>
		</c:if>
		
		</c:forEach>
	</div>

	<script src="${pageContext.request.contextPath }/static/lib/bootstrap/js/common.js"></script>
	<script src="${pageContext.request.contextPath }/static/lib/bootstrap/js/bootstrap.js"></script>

</body>
</html>


