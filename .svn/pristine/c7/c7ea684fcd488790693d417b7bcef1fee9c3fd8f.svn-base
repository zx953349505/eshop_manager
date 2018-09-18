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

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/lib/bootstrap/css/bootstrap.css">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/stylesheets/theme.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/lib/font-awesome/css/font-awesome.css">

    <script src="${pageContext.request.contextPath }/static/lib/jquery-1.7.2.min.js" type="text/javascript"></script>

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
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
  </head>
  <body class=""> 
	<c:import url="/framework.jsp"></c:import>

	<div class="content">
		<div class="header">
			<h1 class="page-title">分类管理</h1>
		</div>

		<ul class="breadcrumb">
			<li><a href="typemanager.jsp">分类管理</a> <span class="divider">/</span></li>
			<li class="active">分类列表管理</li>
		</ul>

		<div class="container-fluid">
			
			<div class="row-fluid">

				<div class="block">
					<a href="#page-filter" class="block-heading" data-toggle="collapse">增加分类</a>
					<div id="page-filter" class="block-body collapse in">
						<div class="search-well">
							<form  class="form-inline" role="search"
								action="#" method="post">
								<select class="form-control" id="selType">
									<option value="" selected="selected">--请选择--</option>
									<option value="0">一级分类</option>
									<option value="1">二级分类</option>
								</select>
								
								<input type="text" class="form-control" placeholder="请输入一级分类名称"
										name="parent_type_name" />
										 
								<select class="form-control" name="type_id">
								</select>
								<input type="text" class="form-control" placeholder="请输入二级分类名称"
										name="child_type_name" />
								
								
								<button class="btn btn-primary" id="btnSave">
									<i class="icon-save"></i> 保存
								</button>

							</form>
						</div>
					</div>
				</div>
			</div>


			<div class="row-fluid">

				<table id="example-basic-expandable" class="table">
					<thead>
						<tr id="theTableTitle">
							<th>分类名称</th>
							<th>分类类型</th>
							<th>类型编号</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.typelist }" var="type" varStatus="i">
							<c:set var="tb">
								<c:if test="${type.parent_id==0 }">
									
								</c:if>
								<c:if test="${type.parent_id!=0 }">
									data-tt-parent-id="${type.parent_id	}"
								</c:if>
							</c:set>
							<tr data-tt-id="${type.type_id }" ${tb }>
								<td>${type.type_name }</td>
								<c:set var="tb">
								<c:if test="${type.parent_id==0 }">
									一级分类
								</c:if>
								<c:if test="${type.parent_id!=0 }">
									二级分类
								</c:if>
							</c:set>
								<td>${tb }</td>
								<td>${i.index+1 }</td>
								<td>
									<a href="/EShopManager/books/queryinfo.action?book_id=" title="编辑"><i class="icon-pencil"></i></a>
		              				<a href="javascript:deleteClick()" title="删除"><i class="icon-remove"></i></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>

				</table>

			</div>

			

		<c:import url="/foot.jsp"/>
	</div>

</div>

	<script src="${pageContext.request.contextPath }/static/lib/bootstrap/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath }/static/lib/tooltips.js"></script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		$(function() {
			$('.demo-cancel-click').click(function() {
				return false;
			});
		});
	</script>


  </body>
</html>


