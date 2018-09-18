<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<title>eshop商城</title>
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
<script src="${pageContext.request.contextPath }/static/lib/book.js" type="text/javascript"></script>

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

<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/assets/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="${pageContext.request.contextPath }/assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="${pageContext.request.contextPath }/assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="${pageContext.request.contextPath }/assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath }/assets/ico/apple-touch-icon-57-precomposed.png">
</head>

<body class="">

	<c:import url="/framework"></c:import>

	<div class="content">
		<div class="header">
			<h1 class="page-title">订单管理</h1>
		</div>

		<ul class="breadcrumb">
			<li><a href="ordermanager.jsp">订单管理</a> <span class="divider">/</span></li>
			<li class="active">订单列表</li>
		</ul>

		<div class="container-fluid">

			<div class="row-fluid">

				<div class="block">
					<a href="#page-filter" class="block-heading" data-toggle="collapse">筛选</a>
					<div id="page-filter" class="block-body collapse in">
						<div class="search-well">
							<form class="form-inline" role="search" action="#" method="post">
								<input type="text" class="form-control" placeholder="订单号"
									name="order_id"> 
								<input type="text" class="form-control" placeholder="收货人" 
									name="person">
								<input type="text" class="form-control hasDatepicker"
									placeholder="请选择下单日期" id="datepicker" name="order_date"> 
								<select class="form-control" name="order_status">
									<option value="" selected="selected">--请选择状态--</option>
									<option value="-1">待付款</option>
									<option value="0">已取消</option>
									<option value="1">待发货</option>
									<option value="2">待收货</option>									
									<option value="3">已完成</option>
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

				<span>共有 <b>${requestScope.totalCount }</b> 条记录</span>
				
				<div class="well">
					<div class="search-well">
						<form id="batchdoForm" class="form-inline" action="${pageContext.request.contextPath }/order/deleteOrCancelManyOrder">
							<select name="control">
								<option value="" selected="selected">--请选择--</option>
								<option value="-1">取消</option>
								<option value="0">删除</option>
							</select>
							<button id="btnUpdate" class="btn" type="button">
								<i class="icon-legal"></i>操作
							</button>
						</form>
					</div>	
						<table class="table">
						<thead>
							<tr id="theTableTitle">
								<th><input type="checkbox" id="all_ck"> 订单号</th>
								<th>总金额</th>
								<th>下单时间</th>
								<th>收货人</th>
								<th>收货地址</th>
								<th>订单状态</th>
								<th>操作</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${requestScope.orderList }" var="orderInfo">
								<tr>
									<td><input type="checkbox" id="ck" name="orderId" value="${orderInfo.order_id }">
										${orderInfo.order_id }</td>
									<td>¥${orderInfo.order_price }</td>
									<td><a href="#">${orderInfo.userInfo.user_name }</a>&nbsp&nbsp ${orderInfo.order_date }</td>
									<td>${orderInfo.person }&nbsp&nbsp TEL:${orderInfo.phone }</td>
									<td>${orderInfo.address }</td>
									<td>
										${orderInfo.status==1?"正常":"<span style='color:red'>已取消</span>" },
										${orderInfo.status_pay==1?"已付款":"未付款" },
										${orderInfo.status_send==1?"已发货":"未发货" },
										${orderInfo.status_receive==1?"已收货":"未收货" }
									</td>
									<td><a href="${pageContext.request.contextPath }/order/selectOrderInfo/${orderInfo.order_id }"
											title="查看"> <i class="icon-search"></i></a> 
										<a href="javascript:deleteOrder('${pageContext.request.contextPath }',${orderInfo.order_id });" 
											title="删除"><i class="icon-remove"></i></a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
						</table>
				</div>
			</div>
				<div class="pagination pagination myul">
				
				<c:set var="selectCondition">&order_id=${requestScope.order_id }&person=${requestScope.person }&order_date=${requestScope.order_date }&order_status=${requestScope.order_status }</c:set>
				<c:set var="totalPage">${requestScope.totalPage }</c:set>
				<c:set var="firstPage">
					<c:if test="${requestScope.currentPage==1 }">
						#
					</c:if>
					<c:if test="${requestScope.currentPage!=1 }">
						${pageContext.request.contextPath }/order/selectOrderList?currentPage=1${selectCondition }
					</c:if>
				</c:set>
				<c:set var="lastPage">
					<c:if test="${requestScope.currentPage==1 }">
						#
					</c:if>
					<c:if test="${requestScope.currentPage!=1 }">
						${pageContext.request.contextPath }/order/selectOrderList?currentPage=${requestScope.currentPage-1 }${selectCondition }
					</c:if>
				</c:set>
				<c:set var="nextPage">
					<c:if test="${requestScope.currentPage==requestScope.totalPage }">
						#
					</c:if>
					<c:if test="${requestScope.currentPage!=requestScope.totalPage }">
						${pageContext.request.contextPath }/order/selectOrderList?currentPage=${requestScope.currentPage+1 }${selectCondition }
					</c:if>
				</c:set>
				<c:set var="endPage">
					<c:if test="${requestScope.currentPage==requestScope.totalPage }">
						#
					</c:if>
					<c:if test="${requestScope.currentPage!=requestScope.totalPage }">
						${pageContext.request.contextPath }/order/selectOrderList?currentPage=${requestScope.totalPage }${selectCondition }
					</c:if>
				</c:set>
					<ul>
						<li class='${requestScope.currentPage==1?"disabled":"" }'><a  href="${firstPage }">&laquo;首页</a></li>
						<li class='${requestScope.currentPage==1?"disabled":"" }'><a  href="${lastPage }">上一页</a></li>

						<c:set var="groupC" >${requestScope.currentPage%10==0?(requestScope.currentPage/10):(requestScope.currentPage/10+0.5) }</c:set>
							<fmt:formatNumber var="group" pattern="#">${groupC }</fmt:formatNumber>
						<c:forEach begin="${(group-1)*10+1 }" end="${group*10 }" step="1" var="i">
						<c:set var="middlePage">
								${pageContext.request.contextPath }/order/selectOrderList?currentPage=${i }${selectCondition }
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

			<footer>
			<hr>
			<!-- Purchase a site license to remove this link from the footer: http://www.portnine.com/bootstrap-themes -->
			<p class="pull-right">
				Collect from <a href="http://www.iyunhe.com/" target="_blank">云和数据</a>
			</p>

			<p>
				copyright © 2013-2016 河南云和数据信息技术有限公司深圳分公司&nbsp; <a
					href="http://www.iyunhe.com/" title="河南云和数据信息技术有限公司深圳分公司"
					target="_blank">首页</a>
			</p>
			</footer>

		</div>

	<script src="${pageContext.request.contextPath }/static/lib/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function() {
        	
            $('.demo-cancel-click').click(function(){return false;});
            
            updateOrderStatus('${pageContext.request.contextPath }')
            
        });
    </script>

</body>
</html>