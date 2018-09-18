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
    <script src="${pageContext.request.contextPath }/static/lib/book.js" type="text/javascript"></script>
    
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
			<h1 class="page-title">图书管理</h1>
		</div>
		
		<ul class="breadcrumb">
			<li><a href="bookmanager.jsp">图书管理</a> <span class="divider">/</span></li>
			<li class="active">回收站</li>
		</ul>
		
		<div class="container-fluid">
		
			<div class="row-fluid">
				
						<span>共有 <b>${requestScope.totalCount  }</b> 条记录</span>
						
						<div class="well">
							<div class="search-well">
				                <form class="form-inline" action="#">
				                    <select name="control">
										<option value="" selected="selected">--请选择--</option>
										<option value="0">还原</option>
										<option value="1">删除</option>
									</select>
				                    <button id="btnUpdate" class="btn" type="button"><i class="icon-legal"></i>操作</button>
				                </form>
            				</div>
						
							
							<table class="table">
								<thead>
									<tr id="theTableTitle">
										<th>
											<input type="checkbox" id="all_ck">编号
										</th>
										<th>书名</th>
										<th>价格</th>
										<th>所属分类</th>
										<th>操作</th>
									</tr>
								</thead>
								
								<tbody>
									<c:forEach items="${requestScope.garbageList  }" var="bookInfo">
										<tr>
											<td>
												<input type="checkbox" id="ck" name="ck" value="${bookInfo.book_id }">${bookInfo.book_id }
											</td>
											<td>${bookInfo.book_name }</td>
											<td>¥${bookInfo.book_price }</td>
											<td>${bookInfo.typeInfo.type_name }</td>
											<td>
												<a href="#" title="还原"><i class="icon-fire"></i></a>
	              								<a href="javascript:deleteGarbage(${bookInfo.book_id })" title="删除"><i class="icon-remove"></i></a>
											</td>
										</tr>
									</c:forEach>
								</tbody>

							</table>
						</div>
						<div class="pagination pagination myul">
						
						<c:set var="totalPage">totalCount%10==0?totalCount/10:Math.ceil(totalCount/pSize)</c:set>
						
						<c:set var="firstPage">
							<c:if test="${requestScope.currentPage==1 }">#</c:if>
							<c:if test="${requestScope.currentPage!=1 }">
								${pageContext.request.contextPath }/book/selectGarbage/1
							</c:if>
						</c:set>
						
						<c:set var="lastPage">
							<c:if test="${requestScope.currentPage==1 }">#</c:if>
							<c:if test="${requestScope.currentPage!=1 }">
								${pageContext.request.contextPath }/book/selectGarbage/${requestScope.currentPage-1 }
							</c:if>
						</c:set>
						
						<c:set var="nextPage">
							<c:if test="${requestScope.currentPage==requestScope.totalPage }">#</c:if>
							<c:if test="${requestScope.currentPage!=requestScope.totalPage }">
								${pageContext.request.contextPath }/book/selectGarbage/${requestScope.currentPage+1 }
							</c:if>
						</c:set>
						
						<c:set var="endPage">
							<c:if test="${requestScope.currentPage==requestScope.totalPage }">#</c:if>
							<c:if test="${requestScope.currentPage!=requestScope.totalPage }">
								${pageContext.request.contextPath }/book/selectGarbage/${requestScope.totalPage }
							</c:if>
						</c:set>
				
							<ul>
								<li class='${requestScope.currentPage==1?"disabled":"" }'><a href="${firstPage }">«首页</a></li>
								<li class='${requestScope.currentPage==1?"disabled":"" }'><a href="${lastPage }">上一页</a></li>
								
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
										${pageContext.request.contextPath }/book/selectGarbage/${i }
									</c:set>
									<c:if test="${i<=requestScope.totalPage }">
										<li class='${i==requestScope.currentPage?"active":"" }'><a href='${middlePage }'>${i }</a></li>
									</c:if>
								</c:forEach>
								
								<li class='${requestScope.currentPage==requestScope.totalPage?"disabled":"" }'><a href="${nextPage }">下一页</a></li>
								<li class='${requestScope.currentPage==requestScope.totalPage?"disabled":"" }'><a href="${endPage }">尾页»</a></li>
							</ul>
						</div>
					</div>
				<footer>
					<hr>
					<!-- Purchase a site license to remove this link from the footer: http://www.portnine.com/bootstrap-themes -->
					<p class="pull-right">
						Collect from <a href="http://www.iyunhe.com/" target="_blank">云和数据</a>
					</p>

					<p>
						copyright © 2013-2016 河南云和数据信息技术有限公司深圳分公司&nbsp; <a href="http://www.iyunhe.com/" title="河南云和数据信息技术有限公司深圳分公司" target="_blank">首页</a>
					</p>
				</footer>
			</div>		
		</div>
	
	<script src="${pageContext.request.contextPath }/static/lib/tooltips.js"></script>
	<script src="${pageContext.request.contextPath }/static/lib/bootstrap/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath }/static/lib/bookmanager.js"></script>
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
            
            loadMethod('${pageContext.request.contextPath }');
            updateGarbageStatus('${pageContext.request.contextPath }');
            
        });
    </script>
    
  </body>
</html>