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
								<input type="text" class="form-control" placeholder="订单号" name="stu_name"> 
								<input type="text" class="form-control" placeholder="收货人" name="person_name"> 
								<input type="text" class="form-control hasDatepicker" placeholder="请选择下单日期" id="datepicker" name="date">
								<select class="form-control" name="stu_sex">
									<option value="" selected="selected">--请选择状态--</option>
									<option value="-1">待付款</option>
									<option value="1">待发货</option>
									<option value="2">待收货</option>
									<option value="0">已取消</option>
									<option value="3">已完成</option>
								</select>
								<button type="submit" class="btn btn-default"><i class="icon-search"></i> 查询</button>

							</form>
						</div>
					</div>
				</div>
			</div>

			<div class="row-fluid">
				
						<span>共有 <b>99</b> 条记录</span>
						
						<div class="well">
							
							<div class="search-well">
				                <form class="form-inline" action="#">
				                    <select name="control">
										<option value="" selected="selected">--请选择--</option>
										<option value="1">取消</option>
										<option value="1">删除</option>
									</select>
				                    <button class="btn" type="button"><i class="icon-legal"></i> 操作</button>
				                </form>
            				</div>
							
							<table class="table">
								<thead>
									<tr id="theTableTitle">
										<th>
										<input type="checkbox" id="all_ck">
										订单号
										</th>
										<th>总金额</th>
										<th>下单时间</th>
										<th>收货人</th>
										<th>收货地址</th>
										<th>订单状态</th>
										<th>操作</th>
									</tr>
								</thead>
								
								<tbody>
									
										<tr>
											<td>
											<input type="checkbox" id="ck" name="ck" value="1">	
											1534211972456
											</td>
											<td>￥309.4</td>
											<td>
												<a href="#">yock</a>
												<br>
												2018-08-14 09:59:32.0
											</td>
											<td>
												yyy
												<br>
												TEL：18975523553
											</td>
											<td>广东省深圳市南山区平山大园工业区</td>
											<td>
												
												
												
												
													
													
													
														正常
													
													,
													
													
														已付款
													
													,
													
														未发货
													
													
													,
													
														未收货
													
													
													
												
												
												
												
											</td>
											<td>
												<a href="/EShopManager/orders/info.action?order_id=1534211972456" title="查看">
													<i class="icon-search"></i>
												</a>
	              								<a href="javascript:deleteClick()" title="删除"><i class="icon-remove"></i></a>
											</td>
										</tr>
									
										<tr>
											<td>
											<input type="checkbox" id="ck" name="ck" value="1">	
											1534148442088
											</td>
											<td>￥266.6</td>
											<td>
												<a href="#">yock</a>
												<br>
												2018-08-13 16:20:42.0
											</td>
											<td>
												yiock
												<br>
												TEL：18975523553
											</td>
											<td>广东省深圳市南山区平山大园工业区</td>
											<td>
												
												
												
												
													
													
													
														正常
													
													,
													
													
														已付款
													
													,
													
														未发货
													
													
													,
													
														未收货
													
													
													
												
												
												
												
											</td>
											<td>
												<a href="/EShopManager/orders/info.action?order_id=1534148442088" title="查看">
													<i class="icon-search"></i>
												</a>
	              								<a href="javascript:deleteClick()" title="删除"><i class="icon-remove"></i></a>
											</td>
										</tr>
									
										<tr>
											<td>
											<input type="checkbox" id="ck" name="ck" value="1">	
											1534148339280
											</td>
											<td>￥266.6</td>
											<td>
												<a href="#">yock</a>
												<br>
												2018-08-13 16:18:59.0
											</td>
											<td>
												yock deng
												<br>
												TEL：18975523553
											</td>
											<td>广东省深圳市南山区平山大园工业区</td>
											<td>
												
												
												
												
													
													
													
														正常
													
													,
													
														未付款
													
													
													,
													
														未发货
													
													
													,
													
														未收货
													
													
													
												
												
												
												
											</td>
											<td>
												<a href="/EShopManager/orders/info.action?order_id=1534148339280" title="查看">
													<i class="icon-search"></i>
												</a>
	              								<a href="javascript:deleteClick()" title="删除"><i class="icon-remove"></i></a>
											</td>
										</tr>
									
										<tr>
											<td>
											<input type="checkbox" id="ck" name="ck" value="1">	
											1534132995461
											</td>
											<td>￥293.9</td>
											<td>
												<a href="#">yock</a>
												<br>
												2018-08-13 12:03:15.0
											</td>
											<td>
												张全蛋
												<br>
												TEL：18975523553
											</td>
											<td>广东省深圳市南山区平山大园工业区</td>
											<td>
												
												
												
												
													
													
													
														正常
													
													,
													
														未付款
													
													
													,
													
														未发货
													
													
													,
													
														未收货
													
													
													
												
												
												
												
											</td>
											<td>
												<a href="/EShopManager/orders/info.action?order_id=1534132995461" title="查看">
													<i class="icon-search"></i>
												</a>
	              								<a href="javascript:deleteClick()" title="删除"><i class="icon-remove"></i></a>
											</td>
										</tr>
									
										<tr>
											<td>
											<input type="checkbox" id="ck" name="ck" value="1">	
											1534132450890
											</td>
											<td>￥293.9</td>
											<td>
												<a href="#">yock</a>
												<br>
												2018-08-13 11:54:10.0
											</td>
											<td>
												张全蛋
												<br>
												TEL：18975523553
											</td>
											<td>广东省深圳市南山区平山大园工业区</td>
											<td>
												
												
												
												
													
													
													
														正常
													
													,
													
														未付款
													
													
													,
													
														未发货
													
													
													,
													
														未收货
													
													
													
												
												
												
												
											</td>
											<td>
												<a href="/EShopManager/orders/info.action?order_id=1534132450890" title="查看">
													<i class="icon-search"></i>
												</a>
	              								<a href="javascript:deleteClick()" title="删除"><i class="icon-remove"></i></a>
											</td>
										</tr>
									
										<tr>
											<td>
											<input type="checkbox" id="ck" name="ck" value="1">	
											1534125535490
											</td>
											<td>￥70.1</td>
											<td>
												<a href="#">yock</a>
												<br>
												2018-08-13 09:58:55.0
											</td>
											<td>
												张全蛋
												<br>
												TEL：18975523553
											</td>
											<td>广东省深圳市南山区平山大园工业区</td>
											<td>
												
												
												
												
													
													
													
														正常
													
													,
													
														未付款
													
													
													,
													
														未发货
													
													
													,
													
														未收货
													
													
													
												
												
												
												
											</td>
											<td>
												<a href="/EShopManager/orders/info.action?order_id=1534125535490" title="查看">
													<i class="icon-search"></i>
												</a>
	              								<a href="javascript:deleteClick()" title="删除"><i class="icon-remove"></i></a>
											</td>
										</tr>
									
										<tr>
											<td>
											<input type="checkbox" id="ck" name="ck" value="1">	
											1533866141216
											</td>
											<td>￥309.4</td>
											<td>
												<a href="#">yock</a>
												<br>
												2018-08-10 09:55:41.0
											</td>
											<td>
												张全蛋
												<br>
												TEL：18975523553
											</td>
											<td>广东省深圳市南山区平山大园工业区</td>
											<td>
												
												
												
												
													
													
													
														正常
													
													,
													
														未付款
													
													
													,
													
														未发货
													
													
													,
													
														未收货
													
													
													
												
												
												
												
											</td>
											<td>
												<a href="/EShopManager/orders/info.action?order_id=1533866141216" title="查看">
													<i class="icon-search"></i>
												</a>
	              								<a href="javascript:deleteClick()" title="删除"><i class="icon-remove"></i></a>
											</td>
										</tr>
									
										<tr>
											<td>
											<input type="checkbox" id="ck" name="ck" value="1">	
											1533832576507
											</td>
											<td>￥319.2</td>
											<td>
												<a href="#">yock</a>
												<br>
												2018-08-10 00:36:16.0
											</td>
											<td>
												邓玉坤
												<br>
												TEL：18975523553
											</td>
											<td>广东省深圳市南山区平山大园工业区</td>
											<td>
												
												
												
												
													
													
													
														正常
													
													,
													
														未付款
													
													
													,
													
														未发货
													
													
													,
													
														未收货
													
													
													
												
												
												
												
											</td>
											<td>
												<a href="/EShopManager/orders/info.action?order_id=1533832576507" title="查看">
													<i class="icon-search"></i>
												</a>
	              								<a href="javascript:deleteClick()" title="删除"><i class="icon-remove"></i></a>
											</td>
										</tr>
									
										<tr>
											<td>
											<input type="checkbox" id="ck" name="ck" value="1">	
											1530775551631
											</td>
											<td>￥133.3</td>
											<td>
												<a href="#">yock</a>
												<br>
												2018-07-05 15:25:51.0
											</td>
											<td>
												张全蛋
												<br>
												TEL：18975523553
											</td>
											<td>平山大园工业区</td>
											<td>
												
												
												
												
													
													
													
														正常
													
													,
													
														未付款
													
													
													,
													
														未发货
													
													
													,
													
														未收货
													
													
													
												
												
												
												
											</td>
											<td>
												<a href="/EShopManager/orders/info.action?order_id=1530775551631" title="查看">
													<i class="icon-search"></i>
												</a>
	              								<a href="javascript:deleteClick()" title="删除"><i class="icon-remove"></i></a>
											</td>
										</tr>
									
										<tr>
											<td>
											<input type="checkbox" id="ck" name="ck" value="1">	
											1530775226498
											</td>
											<td>￥133.3</td>
											<td>
												<a href="#">yock</a>
												<br>
												2018-07-05 15:20:26.0
											</td>
											<td>
												张全蛋
												<br>
												TEL：18975523553
											</td>
											<td>平山大园工业区</td>
											<td>
												
												
												
												
													
													
													
														正常
													
													,
													
														未付款
													
													
													,
													
														未发货
													
													
													,
													
														未收货
													
													
													
												
												
												
												
											</td>
											<td>
												<a href="/EShopManager/orders/info.action?order_id=1530775226498" title="查看">
													<i class="icon-search"></i>
												</a>
	              								<a href="javascript:deleteClick()" title="删除"><i class="icon-remove"></i></a>
											</td>
										</tr>
									
										<tr>
											<td>
											<input type="checkbox" id="ck" name="ck" value="1">	
											1525543887502
											</td>
											<td>￥71.5</td>
											<td>
												<a href="#">yock</a>
												<br>
												2018-05-06 02:11:27.0
											</td>
											<td>
												j
												<br>
												TEL：18975523553
											</td>
											<td>平山大园工业区</td>
											<td>
												
												
												
												
													
													
														<span style="color: red">已取消</span>
													
													
													,
													
														未付款
													
													
													,
													
														未发货
													
													
													,
													
														未收货
													
													
													
												
												
												
												
											</td>
											<td>
												<a href="/EShopManager/orders/info.action?order_id=1525543887502" title="查看">
													<i class="icon-search"></i>
												</a>
	              								<a href="javascript:deleteClick()" title="删除"><i class="icon-remove"></i></a>
											</td>
										</tr>
									
										<tr>
											<td>
											<input type="checkbox" id="ck" name="ck" value="1">	
											1515382841988
											</td>
											<td>￥53.4</td>
											<td>
												<a href="#">test1</a>
												<br>
												2018-01-08 11:40:41.0
											</td>
											<td>
												dadasd
												<br>
												TEL：13800138000
											</td>
											<td>广东省深圳市龙华新区汇海大厦</td>
											<td>
												
												
												
												
													
													
													
														正常
													
													,
													
														未付款
													
													
													,
													
														未发货
													
													
													,
													
														未收货
													
													
													
												
												
												
												
											</td>
											<td>
												<a href="/EShopManager/orders/info.action?order_id=1515382841988" title="查看">
													<i class="icon-search"></i>
												</a>
	              								<a href="javascript:deleteClick()" title="删除"><i class="icon-remove"></i></a>
											</td>
										</tr>
									
										<tr>
											<td>
											<input type="checkbox" id="ck" name="ck" value="1">	
											1510387650247
											</td>
											<td>￥68.1</td>
											<td>
												<a href="#">yock</a>
												<br>
												2017-11-11 16:07:30.0
											</td>
											<td>
												隔壁老王
												<br>
												TEL：13800138000
											</td>
											<td>深圳</td>
											<td>
												
												
												
												
													
													
													
														正常
													
													,
													
														未付款
													
													
													,
													
														未发货
													
													
													,
													
														未收货
													
													
													
												
												
												
												
											</td>
											<td>
												<a href="/EShopManager/orders/info.action?order_id=1510387650247" title="查看">
													<i class="icon-search"></i>
												</a>
	              								<a href="javascript:deleteClick()" title="删除"><i class="icon-remove"></i></a>
											</td>
										</tr>
									
										<tr>
											<td>
											<input type="checkbox" id="ck" name="ck" value="1">	
											1510230074513
											</td>
											<td>￥86.4</td>
											<td>
												<a href="#">yock</a>
												<br>
												2017-11-09 20:21:14.0
											</td>
											<td>
												aaa
												<br>
												TEL：13800138000
											</td>
											<td>深圳</td>
											<td>
												
												
												
												
													
													
													
														正常
													
													,
													
														未付款
													
													
													,
													
														未发货
													
													
													,
													
														未收货
													
													
													
												
												
												
												
											</td>
											<td>
												<a href="/EShopManager/orders/info.action?order_id=1510230074513" title="查看">
													<i class="icon-search"></i>
												</a>
	              								<a href="javascript:deleteClick()" title="删除"><i class="icon-remove"></i></a>
											</td>
										</tr>
									
										<tr>
											<td>
											<input type="checkbox" id="ck" name="ck" value="1">	
											1509703406573
											</td>
											<td>￥53.4</td>
											<td>
												<a href="#">yock</a>
												<br>
												2017-11-03 18:03:26.0
											</td>
											<td>
												dd
												<br>
												TEL：13800138000
											</td>
											<td>深圳</td>
											<td>
												
												
												
												
													
													
													
														正常
													
													,
													
														未付款
													
													
													,
													
														未发货
													
													
													,
													
														未收货
													
													
													
												
												
												
												
											</td>
											<td>
												<a href="/EShopManager/orders/info.action?order_id=1509703406573" title="查看">
													<i class="icon-search"></i>
												</a>
	              								<a href="javascript:deleteClick()" title="删除"><i class="icon-remove"></i></a>
											</td>
										</tr>
									
										<tr>
											<td>
											<input type="checkbox" id="ck" name="ck" value="1">	
											1509699468268
											</td>
											<td>￥259.2</td>
											<td>
												<a href="#">yock</a>
												<br>
												2017-11-03 16:57:48.0
											</td>
											<td>
												迭代
												<br>
												TEL：13800138000
											</td>
											<td>深圳</td>
											<td>
												
												
												
												
													
													
													
														正常
													
													,
													
														未付款
													
													
													,
													
														未发货
													
													
													,
													
														未收货
													
													
													
												
												
												
												
											</td>
											<td>
												<a href="/EShopManager/orders/info.action?order_id=1509699468268" title="查看">
													<i class="icon-search"></i>
												</a>
	              								<a href="javascript:deleteClick()" title="删除"><i class="icon-remove"></i></a>
											</td>
										</tr>
									
										<tr>
											<td>
											<input type="checkbox" id="ck" name="ck" value="1">	
											1509679394573
											</td>
											<td>￥53.4</td>
											<td>
												<a href="#">yock</a>
												<br>
												2017-11-03 11:23:14.0
											</td>
											<td>
												dd
												<br>
												TEL：13800138000
											</td>
											<td>深圳</td>
											<td>
												
												
												
												
													
													
													
														正常
													
													,
													
														未付款
													
													
													,
													
														未发货
													
													
													,
													
														未收货
													
													
													
												
												
												
												
											</td>
											<td>
												<a href="/EShopManager/orders/info.action?order_id=1509679394573" title="查看">
													<i class="icon-search"></i>
												</a>
	              								<a href="javascript:deleteClick()" title="删除"><i class="icon-remove"></i></a>
											</td>
										</tr>
									
										<tr>
											<td>
											<input type="checkbox" id="ck" name="ck" value="1">	
											1509674910284
											</td>
											<td>￥42.8</td>
											<td>
												<a href="#">yock</a>
												<br>
												2017-11-03 10:08:30.0
											</td>
											<td>
												dd
												<br>
												TEL：13800138000
											</td>
											<td>深圳</td>
											<td>
												
												
												
												
													
													
													
														正常
													
													,
													
														未付款
													
													
													,
													
														未发货
													
													
													,
													
														未收货
													
													
													
												
												
												
												
											</td>
											<td>
												<a href="/EShopManager/orders/info.action?order_id=1509674910284" title="查看">
													<i class="icon-search"></i>
												</a>
	              								<a href="javascript:deleteClick()" title="删除"><i class="icon-remove"></i></a>
											</td>
										</tr>
									
										<tr>
											<td>
											<input type="checkbox" id="ck" name="ck" value="1">	
											1509674726471
											</td>
											<td>￥53.4</td>
											<td>
												<a href="#">yock</a>
												<br>
												2017-11-03 10:05:26.0
											</td>
											<td>
												dd
												<br>
												TEL：13800138000
											</td>
											<td>深圳</td>
											<td>
												
												
												
												
													
													
													
														正常
													
													,
													
														未付款
													
													
													,
													
														未发货
													
													
													,
													
														未收货
													
													
													
												
												
												
												
											</td>
											<td>
												<a href="/EShopManager/orders/info.action?order_id=1509674726471" title="查看">
													<i class="icon-search"></i>
												</a>
	              								<a href="javascript:deleteClick()" title="删除"><i class="icon-remove"></i></a>
											</td>
										</tr>
									
										<tr>
											<td>
											<input type="checkbox" id="ck" name="ck" value="1">	
											1509673254518
											</td>
											<td>￥112.5</td>
											<td>
												<a href="#">yock</a>
												<br>
												2017-11-03 09:40:54.0
											</td>
											<td>
												aa
												<br>
												TEL：13800138000
											</td>
											<td>深圳</td>
											<td>
												
												
												
												
													
													
													
														正常
													
													,
													
														未付款
													
													
													,
													
														未发货
													
													
													,
													
														未收货
													
													
													
												
												
												
												
											</td>
											<td>
												<a href="/EShopManager/orders/info.action?order_id=1509673254518" title="查看">
													<i class="icon-search"></i>
												</a>
	              								<a href="javascript:deleteClick()" title="删除"><i class="icon-remove"></i></a>
											</td>
										</tr>
									
										<tr>
											<td>
											<input type="checkbox" id="ck" name="ck" value="1">	
											1509672907612
											</td>
											<td>￥86.4</td>
											<td>
												<a href="#">yock</a>
												<br>
												2017-11-03 09:35:07.0
											</td>
											<td>
												哈哈
												<br>
												TEL：13800138000
											</td>
											<td>深圳</td>
											<td>
												
												
												
												
													
													
													
														正常
													
													,
													
														未付款
													
													
													,
													
														未发货
													
													
													,
													
														未收货
													
													
													
												
												
												
												
											</td>
											<td>
												<a href="/EShopManager/orders/info.action?order_id=1509672907612" title="查看">
													<i class="icon-search"></i>
												</a>
	              								<a href="javascript:deleteClick()" title="删除"><i class="icon-remove"></i></a>
											</td>
										</tr>
									
										<tr>
											<td>
											<input type="checkbox" id="ck" name="ck" value="1">	
											1509521560712
											</td>
											<td>￥113.7</td>
											<td>
												<a href="#">yock</a>
												<br>
												2017-11-01 15:32:40.0
											</td>
											<td>
												11
												<br>
												TEL：13800138000
											</td>
											<td>深圳</td>
											<td>
												
												
												
												
													
													
													
														正常
													
													,
													
														未付款
													
													
													,
													
														未发货
													
													
													,
													
														未收货
													
													
													
												
												
												
												
											</td>
											<td>
												<a href="/EShopManager/orders/info.action?order_id=1509521560712" title="查看">
													<i class="icon-search"></i>
												</a>
	              								<a href="javascript:deleteClick()" title="删除"><i class="icon-remove"></i></a>
											</td>
										</tr>
									
										<tr>
											<td>
											<input type="checkbox" id="ck" name="ck" value="1">	
											1509334928787
											</td>
											<td>￥165.1</td>
											<td>
												<a href="#">yock</a>
												<br>
												2017-10-30 11:42:08.0
											</td>
											<td>
												yock1111
												<br>
												TEL：13800138000
											</td>
											<td>广东省深圳市龙华新区汇海大厦</td>
											<td>
												
												
												
												
													
													
														<span style="color: red">已取消</span>
													
													
													,
													
													
														已付款
													
													,
													
														未发货
													
													
													,
													
														未收货
													
													
													
												
												
												
												
											</td>
											<td>
												<a href="/EShopManager/orders/info.action?order_id=1509334928787" title="查看">
													<i class="icon-search"></i>
												</a>
	              								<a href="javascript:deleteClick()" title="删除"><i class="icon-remove"></i></a>
											</td>
										</tr>
									
								</tbody>

							</table>
						</div>
						<div class="pagination pagination myul">
							<ul>
								<li class="disabled"><a href="#">«首页</a></li>
								<li class="disabled"><a href="#">上一页</a></li>
								<li><a href="#">1</a></li>
								<li class="active"><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">下一页</a></li>
								<li><a href="#">尾页»</a></li>
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
	
    <script src="${pageContext.request.contextPath }/static/lib/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});            
        });
    </script>
    
  </body>
</html>