<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Bootstrap Admin</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/stylesheets/theme.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/lib/font-awesome/css/font-awesome.css">

    <script src="${pageContext.request.contextPath }/lib/jquery-1.7.2.min.js" type="text/javascript"></script>

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

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="lib/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
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

			<h1 class="page-title">设置密保问题</h1>
		</div>
		
		<div class="container-fluid">
		
			<div class="row-fluid">

				<div class="block">
					<a href="#page-filter" class="block-heading" data-toggle="collapse">筛选</a>
					<div id="page-filter" class="block-body collapse in">
						<div class="search-well">
							<form  class="form-inline" role="search" action="${pageContext.request.contextPath }/question/select_questionlist.action" method="post">
								<input type="text" class="form-control" placeholder="请输入关键字(模糊查询)" 
										name="question_title" /> 
								<button type="submit" class="btn btn-default"><i class="icon-search"></i> 查询</button>

							</form>
						</div>
					</div>
					<div id="page-filter" class="block-body collapse in">
						<div class="search-well">
							<form  class="form-inline" role="search" action="${pageContext.request.contextPath }/question/addquestion.action" method="post">
								<input type="text" class="form-control" placeholder="请输入密保问题" 
										name="addquestion" /> 
								<button type="submit" class="btn btn-default"><i class="icon-search"></i>添加</button>

							</form>
						</div>
					</div>
				</div>
			</div>

			<div class="row-fluid">
						
						<div class="well">
							<table class="table">
								<thead>
									<tr id="theTableTitle">
										<th>ID</th>
										<th>密保问题</th>
										
									</tr>
								</thead>
								
								<tbody>
									<c:forEach items="${requestScope.questionlist }" var="qu">
										<tr>
											<td>${qu.question_id }</td>
											<td>${qu.question_title }</td>
											<td>
												<a href="${pageContext.request.contextPath }/user/updateinfo.action?userId=" title="编辑"><i class="icon-pencil"></i></a>
	              								<a href="${pageContext.request.contextPath }/question/deletequestion.action?question_id=${qu.question_id }" title="删除"><i class="icon-remove"></i></a>
											</td>
										</tr>
									
									</c:forEach>
								</tbody>

							</table>
						</div>
						
				<footer>
					<hr>
					<!-- Purchase a site license to remove this link from the footer: http://www.portnine.com/bootstrap-themes -->
					<p class="pull-right">
						Collect from <a href="http://www.iyunhe.com/" target="_blank">云和数据</a>
					</p>

					<p>
						copyright &copy; 2013-2018 河南云和数据信息技术有限公司深圳分公司&nbsp; <a
							href="http://www.iyunhe.com/" title="河南云和数据信息技术有限公司深圳分公司"
							target="_blank">首页</a>
					</p>
				</footer>			
						
	</div>

    <script src="${pageContext.request.contextPath }/lib/bootstrap/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath }/static/lib/encrypted.js"></script>
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
        });
    </script>
    
  </body>
</html>
