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
    
	<!-- 日期选择器 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/stylesheets/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/stylesheets/style.css">
	<script src="${pageContext.request.contextPath }/static/lib/jquery-ui.js" type="text/javascript"></script>

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
    
    <script type="text/javascript">
	    /**日期选择器**/
	    $(function() {
	      $( "#datepicker" ).datepicker();
	    });
    </script>
    
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
  
 	<c:import url="/framework.jsp"></c:import>
    
	<div class="content">
		<div class="header">
			<h1 class="page-title">会员管理</h1>
		</div>
		
		<ul class="breadcrumb">
			<li><a href="accountmanager.jsp">会员管理</a> <span class="divider">/</span></li>
			<li class="active">查看会员信息</li>
		</ul>
		
		<div class="container-fluid">
		
			<div class="row-fluid">

				<div class="block">
					<a href="#page-filter" class="block-heading" data-toggle="collapse">筛选</a>
					<div id="page-filter" class="block-body collapse in">
						<div class="search-well">
							<form  class="form-inline" role="search" action="${pageContext.request.contextPath }/user/selectAllUserList.action?" method="post">
								<input type="text" class="form-control" placeholder="请输入关键字(模糊查询)" 
										name="keyWord" /> 
								<input type="text" class="form-control"
										placeholder="请选择注册时间" id="datepicker" name="date" /> 
								<select class="form-control" name="is_activated">
									<option value="" selected="selected">--请选择状态--</option>
									<option value="1">已激活</option>
									<option value="0">未激活</option>
								</select>
								<button type="submit" class="btn btn-default"><i class="icon-search"></i> 查询</button>

							</form>
						</div>
					</div>
				</div>
			</div>

			<div class="row-fluid">
				
						<span>共有 <b>${requestScope.toatalInfoCount }</b> 条记录</span>
						
						<div class="well">
							<table class="table">
								<thead>
									<tr id="theTableTitle">
										<th>ID</th>
										<th>用户名</th>
										<th>邮箱</th>
										<th>性别</th>
										<th>电话</th>
										<th>状态</th>
										<th>在线</th>
										<th>注册时间</th>
										<th>操作</th>
									</tr>
								</thead>
								
								<tbody>
									<c:forEach items="${requestScope.allUserList }" var="userInfo">
										<tr>
											<td>${userInfo.user_id }</td>
											<td>${userInfo.user_name }</td>
											<td>${userInfo.user_email}</td>
											<td>${userInfo.user_sex }</td>
											<td>${userInfo.user_phone }</td>
											<c:if test="${userInfo.is_activated==0 }">
												<td>未激活</td>
											</c:if>
											<c:if test="${userInfo.is_activated==1 }">
												<td>已激活</td>
											</c:if>
											<td>
												<c:if test="${userInfo.is_online==0 }">
													<img src="${pageContext.request.contextPath }/static/images/no.gif">
												</c:if>
												<c:if test="${userInfo.is_online==1 }">
													<img src="${pageContext.request.contextPath }/static/images/yes.gif">
												</c:if>												
											</td>
											<td>
												${userInfo.time }
											</td>
											<td>
												<a href="${pageContext.request.contextPath }/user/updateinfo.action?userId=" title="编辑"><i class="icon-pencil"></i></a>
	              								<a href="javascript:deleteClick()" title="删除"><i class="icon-remove"></i></a>
											</td>
										</tr>
									</c:forEach>
									
								</tbody>

							</table>
						</div>
						<div class="pagination pagination myul">
						
						<!-- 赋值 -->
						<c:set var="selectCondition">
							&keyWord=${requestScope.keyWord }&regDate=${requestScope.regDate }&isActivated=${requestScope.isActivated }
						</c:set>
						<c:set var="totalPage">
							toatalInfoCount%10==0?totalCount/10:Math.ceil(totalCount/10)
						</c:set>
						<c:set var="firstPage">
							<c:if test="${requestScope.currentPage==1 }">#</c:if>
							<c:if test="${requestScope.currentPage!=1 }">
								${pageContext.request.contextPath }/user/selectAllUserList.action?currentPage=1${selectCondition }
							</c:if>
						</c:set>
						<c:set var="lastPage">
							<c:if test="${requestScope.currentPage==1 }">#</c:if>
							<c:if test="${requestScope.currentPage!=1 }">
								${pageContext.request.contextPath }/user/selectAllUserList.action?currentPage=${requestScope.currentPage-1 }${selectCondition }
							</c:if>
						</c:set>
						<c:set var="nextPage">
							<c:if test="${requestScope.currentPage==requestScope.totalPage }">#</c:if>
							<c:if test="${requestScope.currentPage!=requestScope.totalPage }">
								${pageContext.request.contextPath }/user/selectAllUserList.action?currentPage=${requestScope.currentPage+1 }${selectCondition }
							</c:if>
						</c:set>
						<c:set var="endPage">
							<c:if test="${requestScope.currentPage==requestScope.totalPage }">#</c:if>
							<c:if test="${requestScope.currentPage!=requestScope.totalPage }">
								${pageContext.request.contextPath }/user/selectAllUserList.action?currentPage=${requestScope.totalPage }${selectCondition }
							</c:if>
						</c:set>
						
							<ul>
								<li class='${requestScope.currentPage==1?"disabled":"" }'><a  href="${firstPage }">&laquo;首页</a></li>
								<li class='${requestScope.currentPage==1?"disabled":"" }'><a  href="${lastPage }">上一页</a></li>
								<c:set var="group">
									<c:if test="${requestScope.currentPage%10==0 }">
										<fmt:formatNumber value="${requestScope.currentPage/10 }" pattern="#" />
									</c:if>
									<c:if test="${requestScope.currentPage%10!=0 }">
										<fmt:formatNumber value="${requestScope.currentPage/10+0.5 }" pattern="#" />
									</c:if>
							    </c:set>
								<c:forEach begin="${(group-1)*10+1 }" end="${group*10 }" step="1" var="i">
									<c:set var="middlePage">
										${pageContext.request.contextPath }/user/selectAllUserList.action?currentPage=${i }${selectCondition }
									</c:set>
									<c:if test="${i<=requestScope.totalPage }">
										<li class='${i==requestScope.currentPage?"active":"" }'><a href='${middlePage }'>${i }</a></li>
									</c:if>
								</c:forEach>
								<li class='${requestScope.currentPage==requestScope.totalPage?"disabled":"" }'><a  href="${nextPage }">下一页</a></li>
								<li class='${requestScope.currentPage==requestScope.totalPage?"disabled":"" }'><a  href="${endPage }">尾页&raquo;</a></li>
							</ul>
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
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});            
        });
    </script>
    
  </body>
</html>
