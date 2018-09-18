<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
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
  <body class=""> 
	<c:import url="/framework.jsp"></c:import>

	<div class="content">
		<div class="header">
			<h1 class="page-title">图书管理</h1>
		</div>

		<ul class="breadcrumb">
			<li><a href="bookmanager.jsp">图书管理</a> <span class="divider">/</span></li>
			<li class="active">修改图书信息</li>
		</ul>
		
		<div class="container-fluid">

			<div class="row-fluid">

				<div class="btn-toolbar">
					<button class="btn btn-primary" id="btnSave">
						<i class="icon-save"></i>保存
					</button>
				</div>
				<div class="well">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#basicInfo" data-toggle="tab">通用信息</a></li>
						<li><a href="#desInfo" data-toggle="tab">详细描述</a></li>
						<li><a href="#otherInfo" data-toggle="tab">其他信息</a></li>
					</ul>
					
					<!-- 通用信息 -->
					<form id="uploadForm" action="${pageContext.request.contextPath }/book/addbook" method="post"  enctype="multipart/form-data">
						<div id="myTabContent" class="tab-content">						
							<div class="tab-pane active in" id="basicInfo">
								<!--<form id="uploadForm" enctype="multipart/form-data">-->
									<label>书籍名称</label>
									<input type="text" name="book_name" class="input-xlarge" value="${requestScope.bookInfo.book_name }"/> 
									
									<label>书籍分类</label> 
									<select name="parent_type_id" id="DropDownTimezone1" class="input-xlarge">
										
									</select>
									<select name="type_id" id="DropDownTimezone2" class="input-xlarge">
										
									</select>
									
									<label>本店售价</label> 
									<input type="text" name="book_price" class="input-xlarge" value="${requestScope.bookInfo.book_price }"/>
									
									<label>市场价</label> 
									<input type="text" name="book_price_old" class="input-xlarge" value="${requestScope.bookInfo.book_price_old }"/> 
									
									<label>作者</label> 
									<input type="text" name="book_author" class="input-xlarge" value="${requestScope.bookInfo.book_author }"/>
									
									<label>出版社</label> 
									<input type="text" name="book_press" class="input-xlarge" value="${requestScope.bookInfo.book_press }"/>
									
									<label>上传商品图片</label>
									<input type="file" name="book_logo_big"
	                       					placeholder="请选择商品图片" class="input-xlarge" "/>
							        		
									<label>上传商品缩略图</label> 
									<input type="file" name="book_logo_small"
	                       					placeholder="请选择商品缩略图" class="input-xlarge" />
	                       					
								<!--</form> -->
							</div>
							
							<!-- 详细描述 -->
							<div class="tab-pane fade" id="desInfo">
								<!--<form id="tab2">-->
									<textarea name="book_description" style="width: 90%" cols="10" rows="20" >
										${requestScope.bookInfo.book_description }
									</textarea>
									<!--  
									<script type="text/javascript">
										CKEDITOR.replace('book_description');
									</script>
									-->
								<!--</form>-->
								  
								<iframe id="api_iframe_51240" name="api_iframe_51240" src="" width="90%" height="500px" scrolling="no" frameborder="0"></iframe>
									<script type="text/javascript">
										//接口生成：https://www.51240.com/api/
										document.getElementById("api_iframe_51240").src = "https://www.51240.com/apiiframe/?api_from=51240&api_url=https://zaixianwangyebianji.51240.com/&api_width=98%&api_backgroundcolor=FFFFFF";
									</script>
								
							</div>
							
							<!-- 其他信息 -->
							<div class="tab-pane fade" id="otherInfo">
								<!--<form id="uploadForm2">-->
									<label>上传商品子图</label>
									 	<input type="file" name="pic_name" class="input-xlarge" />								 
									 	<input type="file" name="pic_name" class="input-xlarge" />
									 	<input type="file" name="pic_name" class="input-xlarge" /><br />
									 	<input type="file" name="pic_name" class="input-xlarge" />
									 	<input type="file" name="pic_name" class="input-xlarge" />
									<br /><br />
									
									<label>商品库存数量</label> 
									<input type="text" name="store_count" value="${requestScope.bookInfo.store_count }" class="input-xlarge" />
									<br /><br />
									
									<label>
									是否新品：&nbsp;&nbsp;
									<c:set var="newValue">
										<c:if test="${requestScope.bookInfo.is_new>0 }">
											${requestScope.bookInfo.is_new }
										</c:if>
									</c:set>
									<c:set var="newChecked">
										<c:if test="${requestScope.bookInfo.is_new>0 }">
											checked="checked"
										</c:if>
									</c:set>
									<c:set var="notNewChecked">
										<c:if test="${requestScope.bookInfo.is_new==0 }">
											checked="checked"
										</c:if>
									</c:set>
									<input type="radio" name="is_new" value="${newValue }" ${newChecked } />是&nbsp;&nbsp;
									<input type="radio" name="is_new" value="0" ${notNewChecked }/>否
									</label>
									<br />
									
									<label>
									是否热销：&nbsp;&nbsp;
									<c:set var="hotValue">
										<c:if test="${requestScope.bookInfo.is_hot>0 }">
											${requestScope.bookInfo.is_hot }
										</c:if>
									</c:set>
									<c:set var="hotChecked">
										<c:if test="${requestScope.bookInfo.is_hot>0 }">
											checked="checked"
										</c:if>
									</c:set>
									<c:set var="notHotChecked">
										<c:if test="${requestScope.bookInfo.is_hot==0 }">
											checked="checked"
										</c:if>
									</c:set>
									
									<input type="radio" name="is_hot" value="${hotValue }" ${hotChecked }/>是&nbsp;&nbsp;
									<input type="radio" name="is_hot" value="0" ${notHotChecked } />否
									</label>
									<br />
									
									<label>
									上架：&nbsp;&nbsp;
									<c:set var="isSale">
										<c:if test="${requestScope.bookInfo.status>0 }">
											checked="checked"
										</c:if>
										<c:if test="${requestScope.bookInfo.status==0 }">
											checked=""
										</c:if>
									</c:set>
									<input type="checkbox" name="status" value="${requestScope.bookInfo.status }" ${isSale } />
									打勾表示允许销售，否则不允许销售
									</label>								
								<!--</form>-->
							</div>						
					</div>
					</form>
				</div>
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
			
			$("#btnSave").click(function() {
				
				$("#uploadForm").submit();
				
			});
			
			updateBook('${pageContext.request.contextPath }','${requestScope.bookInfo.type_id }', '${requestScope.bookInfo.typeInfo.parent_id }');
			
		});
	</script>


  </body>
</html>


