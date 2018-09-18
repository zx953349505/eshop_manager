<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>EShopManager</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/lib/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/lib/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/stylesheets/theme.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/lib/font-awesome/css/font-awesome.css" />
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

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="lib/html5.js"></script>
    <![endif]-->
  </head>
<body>

	<c:import url="/framework"></c:import>
    
    <div class="content">
		<div class="header">
			<h1 class="page-title">用户管理</h1>
		</div>
		
		<ul class="breadcrumb">
			<li><a href="adimg.jsp">用户管理</a> <span class="divider">/</span></li>
			<li class="active">用户列表</li>
		</ul>
		
		<div class="container-fluid">
		<div class="row-fluid">

				<div class="block">
					<a href="#page-filter" class="block-heading" data-toggle="collapse">添加用户</a>
					<div id="page-filter" class="block-body collapse in">
						<div class="search-well">
							<form class="form-inline" role="search"
								action="${pageContext.request.contextPath }/manager/addMan" method="post">
								<input type="text" class="form-control" placeholder="请输入用户名" name="manager_name"/> 
								<input type="text" class="form-control" placeholder="请输入密码" name="manager_pwd" />
								<select class="form-control" name="manager_role" id="role_id">
		        						<c:forEach items="${requestScope.roleList }" var="roleInfo">
		        							<option value="${roleInfo.role_id }">${roleInfo.role_name }</option>	
		        						</c:forEach>   	
								</select>
								<button type="submit" class="btn btn-default">
									<i class="icon-search"></i> 保存
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="row-fluid">
				
						<span>共有 <b>99</b> 条记录</span>
						
						<div class="well">
							<table class="table">
								<thead>
									<tr id="theTableTitle">
										<th>用户ID</th>
										<th>用户名</th>
										<th>用户密码</th>
										<th>用户角色</th>
										<th>操作</th>
									</tr>
								</thead>
								
								<tbody>
									<c:forEach items="${requestScope.manList }" var="managerInfo">
										<tr>
											<td>${managerInfo.manager_id }</td>
											<td>${managerInfo.manager_name }</td>
											<td>${managerInfo.manager_pwd}</td>
											<c:set var="role_name">
												<c:forEach items="${requestScope.roleList }" var="roleInfo">
													<c:if test="${roleInfo.role_id==managerInfo.manager_role }">${roleInfo.role_name }</c:if>
												</c:forEach>
											</c:set>
											<td>${role_name }</td>
											<td>
												<a href="${pageContext.request.contextPath }/user/updateinfo?userId=" title="编辑"><i class="icon-pencil"></i></a>
	              								<a href="javascript:deleteClick('${managerInfo.manager_id }')" title="删除"><i class="icon-remove"></i></a>
											</td>
										</tr>
									</c:forEach>
									
								</tbody>

							</table>
						</div>
						<div class="pagination pagination myul">
							<ul>
								<li class='disabled'><a href="#">&laquo;首页</a></li>
								<li class='disabled'><a href="#">上一页</a></li>
								<li><a href="#">1</a></li>
								<li class='active'><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">下一页</a></li>
								<li><a href="#">尾页&raquo;</a></li>
							</ul>
						</div>
			</div>
			<c:import url="/foot.jsp"/>
		</div>		
	</div>
    
    <script src="${pageContext.request.contextPath }/static/lib/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/lib/tooltips.js"></script>
	<script type="text/javascript">
	$("[rel=tooltip]").tooltip();
	$(function() {
		$('.demo-cancel-click').click(function() {
			return false;
		});
		
		$("#btnSave").click(function(){
			var book_id=$("input[name='book_id']").val();
			var news_contents=$("input[name='news_contents']").val();
			if (book_id=='') {
				show_err_msg("请输入书籍ID");
			}else if (news_contents=='') {
				show_err_msg("请输入公告内容");
			}else{
				
				show_loading();
				$(".form-inline").submit;
			/* 	var url="${pageContext.request.contextPath }/promotion/addPro";
				var data={
						book_id:book_id,
						news_contents:news_contents
				};
				$.post(url,data,function(response){
					var jsonData=$.parseJSON(response);
					if (jsonData.status==200) {
						show_msg("添加成功", "/EShopManager/promotion/adnews.action");
					}

				}); */
				
			}
			
			return false;
		});
	});
	function deleteClick(manager_id) {
		if (confirm("你确定删除吗？")) {
			show_loading();
			var url="${pageContext.request.contextPath }/manager/deleteMan";
			var data={
					manager_id:manager_id
			};
			
			$.post(url,data,function(response){
				var responseUrl="${pageContext.request.contextPath }/manager/managerPage";
				if(response=="200"){
					show_msg('操作成功',responseUrl);
				}else{
					show_err_msg('操作失败');
				}

			});
		}
		
	}
	</script>

</body>
</html>