<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	
	<!-- TreeTable -->
	<link href="./EShopManager10_files/jquery.treetable.css" rel="stylesheet" type="text/css">
	<link href="./EShopManager10_files/jquery.treetable.theme.default.css" rel="stylesheet">
	<script src="./EShopManager10_files/jquery.treetable.js.下载" type="text/javascript"></script>

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
			<h1 class="page-title">图书管理</h1>
		</div>

		<ul class="breadcrumb">
			<li><a href="bookmanager.jsp">图书管理</a> <span class="divider">/</span></li>
			<li class="active">查看图书信息</li>
		</ul>

		<div class="container-fluid">
			<div class="row-fluid">

				<div class="block">
					<a href="#page-filter" class="block-heading" data-toggle="collapse">筛选</a>
					<div id="page-filter" class="block-body collapse in">
						<div class="search-well">
							<form class="form-inline" role="search"
								action="${pageContext.request.contextPath }/book/bookManagerPage.action" method="post">
								<input type="text" class="form-control" placeholder="请输入书名" name="book_name" value="${requestScope.book_name }" /> 
								<input type="text" class="form-control" placeholder="请输入作者" name="book_author" value="${requestScope.book_author }" />
								<select class="form-control" name="status">
									<option value="-1" <c:if test="${requestScope.status==-1 }">selected</c:if> >--请选择--</option>
										<option value="1" <c:if test="${requestScope.status==1 }">selected</c:if>>上架</option>
										<option value="0" <c:if test="${requestScope.status==0 }">selected</c:if>>下架</option>
								</select>
								<select class="form-control" name="type_id">
									<option value="-1" <c:if test="${requestScope.type_id==-1 }">selected</c:if>>--请选择分类--</option>
										<c:forEach items="${requestScope.typeList }" var="typeInfo">
										<option value="${typeInfo.type_id }" <c:if test="${requestScope.type_id==typeInfo.type_id }">selected</c:if>>${typeInfo.type_name }</option>
										</c:forEach>
								</select>
								<button type="submit" class="btn btn-default">
									<i class="icon-search"></i> 查询
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>

			<div class="row-fluid">

				<span>共有 <b>${requestScope.totalCount }</b> 条记录
				</span>

				<div class="well">
					<div class="search-well">
						<form class="form-inline" action="#">
							<select name="control">
								<option value="" selected="selected">--请选择--</option>
								<option value="garbage">回收站</option>
								<option value="status1">上架</option>
								<option value="status0">下架</option>
								<option value="is_new1">新品</option>
								<option value="is_new0">取消新品</option>
								<option value="is_hot1">热卖</option>
								<option value="is_hot0">取消热卖</option>
							</select>
							<button id="btnUpdate" class="btn" type="button">
								<i class="icon-legal"></i> 操作
							</button>
						</form>
					</div>


					<table class="table">
						<thead>
							<tr id="theTableTitle">
								<th><input type="checkbox" id="all_ck" /> 编号</th>
								<th>书名</th>
								<th>价格</th>
								<th>上架</th>
								<th>新品</th>
								<th>热销</th>
								<th>作者</th>
								<th>所属分类</th>
								<th>库存</th>
								<th>操作</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${requestScope.bookList }" var="bookInfo">
							<tr>
								<td><input type="checkbox" id="ck" name="ck" value="${bookInfo.book_id }" /> ${bookInfo.book_id }</td>
								<td>${bookInfo.book_name }</td>
								<td>￥${bookInfo.book_price }</td>
								<td><a href="javascript:updateIsOnline(38,0)"><img
										src='${pageContext.request.contextPath }/static/images/${bookInfo.status==1?"yes":"no" }.gif'></a></td>
								<td><a href="javascript:updateIsNew(38,0)"><img
										src='${pageContext.request.contextPath }/static/images/${bookInfo.is_new==0?"no":"yes" }.gif'></a></td>
								<td><a href="javascript:updateIsHot(38,0)"><img
										src='${pageContext.request.contextPath }/static/images/${bookInfo.is_hot==0?"no":"yes" }.gif'></a></td>
								<td>${bookInfo.book_author }</td>
								<td>${bookInfo.typeInfo.type_name }</td>
								<td>${bookInfo.store_count }</td>
								<td>
								<a href="http://127.0.0.1:8080/eshop/book/bookInfo.action?book_id=${bookInfo.book_id }"title="查看" target="_blank">
								<i class="icon-search"></i>
								</a>
								<a href="/EShopManager/books/queryinfo/38" title="编辑">
								<i class="icon-pencil"></i>
								</a> 
								<a href="javascript:deleteClick(38)" title="删除">
								<i class="icon-remove"></i>
								</a>
								</td>
							</tr>
							</c:forEach>
						</tbody>

					</table>
				</div>
				<div class="pagination pagination myul">
				
				<c:set var="selectCondition">&type_id=${requestScope.type_id }&book_name=${requestScope.book_name }&book_author=${requestScope.book_author }&status=${requestScope.status }</c:set>
				<c:set var="totalPage">totalCount%pSize==0?totalCount/pSize:Math.ceil(totalCount/pSize)</c:set>
				<c:set var="firstPage">
					<c:if test="${requestScope.currentPage==1 }">
						#
					</c:if>
					<c:if test="${requestScope.currentPage!=1 }">
						${pageContext.request.contextPath }/book/bookManagerPage.action?currentPage=1${selectCondition }
					</c:if>
				</c:set>
				<c:set var="lastPage">
					<c:if test="${requestScope.currentPage==1 }">
						#
					</c:if>
					<c:if test="${requestScope.currentPage!=1 }">
						${pageContext.request.contextPath }/book/bookManagerPage.action?currentPage=${requestScope.currentPage-1 }${selectCondition }
					</c:if>
				</c:set>
				<c:set var="nextPage">
					<c:if test="${requestScope.currentPage==requestScope.totalPage }">
						#
					</c:if>
					<c:if test="${requestScope.currentPage!=requestScope.totalPage }">
						${pageContext.request.contextPath }/book/bookManagerPage.action?currentPage=${requestScope.currentPage+1 }${selectCondition }
					</c:if>
				</c:set>
				<c:set var="endPage">
					<c:if test="${requestScope.currentPage==requestScope.totalPage }">
						#
					</c:if>
					<c:if test="${requestScope.currentPage!=requestScope.totalPage }">
						${pageContext.request.contextPath }/book/bookManagerPage.action?currentPage=${requestScope.totalPage }${selectCondition }
					</c:if>
				</c:set>
					<ul>
						<li class='${requestScope.currentPage==1?"disabled":"" }'><a  href="${firstPage }">&laquo;首页</a></li>
						<li class='${requestScope.currentPage==1?"disabled":"" }'><a  href="${lastPage }">上一页</a></li>



						<!-- 显示页码 -->
						<c:set var="groupC" >${requestScope.currentPage%10==0?(requestScope.currentPage/10):(requestScope.currentPage/10+0.5) }</c:set>
						<fmt:formatNumber var="group" pattern="#">${groupC }</fmt:formatNumber>
						<c:forEach begin="${(group-1)*10+1 }" end="${group*10 }" step="1" var="i">
						<c:set var="middlePage">
								${pageContext.request.contextPath }/book/bookManagerPage.action?currentPage=${i }${selectCondition }
						</c:set>
						<c:if test="${i<=requestScope.totalPage }">
							<li class='${i==requestScope.currentPage?"active":"" }'><a href='${middlePage }'>${i }</a></li>
						</c:if>
						</c:forEach>

						<li class='${requestScope.currentPage==requestScope.totalPage?"disabled":"next" }'><a  href="${nextPage }">下一页</a></li>

						<li class='${requestScope.currentPage==requestScope.totalPage?"disabled":"next" }'><a  href="${endPage }">尾页&raquo;</a></li>

					</ul>
				</div>

			</div>
			<c:import url="/foot.jsp" />
		</div>
	</div>
	<script src="${pageContext.request.contextPath }/static/lib/tooltips.js"></script>
	<script src="${pageContext.request.contextPath }/static/lib/bootstrap/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath }/static/lib/bookmanager.js"></script>
	
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


