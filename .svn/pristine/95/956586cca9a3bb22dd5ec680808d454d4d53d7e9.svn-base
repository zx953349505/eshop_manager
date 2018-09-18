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
			<h1 class="page-title">促销管理</h1>
		</div>
		
		<ul class="breadcrumb">
			<li><a href="adimg.jsp">促销管理</a> <span class="divider">/</span></li>
			<li class="active">首页轮播</li>
		</ul>
		
		<div class="container-fluid">
		
			<div class="row-fluid">

				<div class="block">
					<a href="#page-filter" class="block-heading" data-toggle="collapse">添加轮播图</a>
					<div id="page-filter" class="block-body collapse in">
						<div class="search-well">
							<form  class="form-inline" role="search" action="${pageContext.request.contextPath }/ad/addAd" method="post" id="uploadForm" enctype="multipart/form-data">
								<input type="text" class="form-control" placeholder="请输入图书ID" name="book_id" /> 
								<input type="file" class="form-control" name="ad_img" placeholder="请上传轮播图片" /> 
								<button >
									<i class="icon-save"></i> 保存
								</button>

							</form>
						</div>
					</div>
				</div>
			</div>
		
			<div class="row-fluid">
				
				<div class="block">
			        <p class="block-heading">轮播列表</p>
			         <div class="block-body gallery">
			        <c:forEach items="${requestScope.adList }" var="adInfo">	
			      	<a href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }/eshop/book/bookInfo.action?book_id=${adInfo.book_id }" tppabs="http://${request.serverName }:${request.serverPort }/eshop/book/bookInfo.action?book_id=${adInfo.book_id }" title="查看" target="_blank">
			        	<img src="${pageContext.request.contextPath }/upload/${adInfo.ad_name }" tppabs="${pageContext.request.contextPath }/upload/${adInfo.ad_name }" width="450px" class="img-polaroid">
			        </a>
			        <a href="javascript:deleteClick('${adInfo.ad_name }')"><img src="${pageContext.request.contextPath }/static/images/no.gif" tppabs="${pageContext.request.contextPath }/static/images/no.gif" /></a>
			        </c:forEach>		        		
			        </div>
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
				var ad_img=$("input[name='ad_img']").val();
				if (book_id=='') {
					show_err_msg("请输入书籍ID");
				}else if (ad_img=='') {
					show_err_msg("请上传轮播图片");
				}else{
					console.log(book_id);
					console.log(ad_img);
					//show_loading();
					$("#uploadForm").submit;
				}
				
				return false;
			});
			
		});
		
		function deleteClick(ad_name) {
			if (confirm("你确定删除吗？")) {
				show_loading();
				var url="${pageContext.request.contextPath }/ad/deleteAdvertise";
				var data={
						ad_name:ad_name
				};
				
				$.post(url,data,function(response){
					var responseUrl="${pageContext.request.contextPath }/ad/addPage";
					if(response=="200"){
						show_msg('操作成功',responseUrl);
					}else{
						show_err_msg('操作失败');
					}

				});
			}
			
		}
		
		function uploadImg(book_id,fileName){
			var headFile = fileName.substr(fileName.indexOf("."));
		    if(headFile=='.jpg' || headFile=='.jpeg' || headFile=='.png'){
		    	//开始上传图片
		    	show_loading();
		    	var formData=new FormData();
		    	formData.append("fileImg", $("input[name='ad_img']")[0].files[0]);
		    	
		    	$.ajax({
		    	    url: '/EShopManager/upload.action',
		    	    type: 'POST',
		    	    cache: false,
		    	    data: formData,
		    	    processData: false,
		    	    contentType: false
		    	}).done(function(res) {
		    		var jsonData=$.parseJSON(res);
					if (jsonData.status==200) {
						requestAddImg(book_id,jsonData.fileArray[0]);
					}else{
						show_err_msg('上传图片失败');
					}
		    	}).fail(function(res) {
		    		show_err_msg('上传图片失败');
		    	});
		    	
		    }else{
		    	show_err_msg('不支持该图片类型，请上传jpg、jpeg、png格式的图片');
		    }
			
		}
		
		function requestAddImg(book_id,ad_img){
			//ajax请求servlet
		    var url="/EShopManager/promotion/adimg/add.action";
			var data={
					book_id:book_id,
					ad_img:ad_img
			};
			
			$.post(url,data,function(response){
				var jsonData=$.parseJSON(response);
				var result=jsonData.status;
				
				var responseUrl="/EShopManager/promotion/adimg.action";
				if(result=="200"){
					show_msg('操作成功',responseUrl);
				}else{
					show_err_msg('操作失败');
				}

			});
		}
		
	</script>

</body>
</html>