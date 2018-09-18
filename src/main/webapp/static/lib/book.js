/**
 * 添加书籍
 * @param rURL
 */
function loadMethod(rootURL){
	
	$(function(){
			//查询父分类列表
			$.post(rootURL+"/type/selectParentType",null,function(response){
					
					var htmlStr="<option value=''>--请选择分类--</option>";
					for(var i=0;i<response.length;i++){
							var obj=response[i];
						htmlStr=htmlStr+"<option value="+obj.type_id+">"+obj.type_name+"</option>"
					}
					//console.log(htmlStr);
					$("#DropDownTimezone1").html(htmlStr);
			});
			
			//查询子分类列表			
			$.post(rootURL+"/type/selectChildType",null,function(response){

					var str="<option value=''>--请选择子分类--</option>";
					for(var i=0;i<response.length;i++){
							var obj=response[i];
							str=str+"<option value="+obj.type_id+">"+obj.type_name+"</option>"
					}
					$("#DropDownTimezone2").html(str);
			});
	});
}

/**
 * (删除书籍)将书籍移入回收站，此操作不是真正删除
 */
function deleteBook(rootURL, book_id) {
	
	if(confirm("你确定要移入回收站吗？")){
		
		//ajax请求servlet
		var url=rootURL+"/book/deleteBook/"+book_id;
		$.post(url,null,function(response){			
			var responseUrl=rootURL+"/book/selectGarbage/1";
			if(response.status==200){
				show_msg('移入回收站成功',responseUrl);
			}else{
				show_err_msg('移入回收站失败');
			}

		});
	}
}

/**
 * 编辑书籍
 */
function updateBook(rootURL,childTypeId,parentTypeId) {

	console.log(rootURL);
	console.log(childTypeId);
	console.log(parentTypeId);
	
	//查询父分类列表
	$.post(rootURL+"/type/selectParentType",null,function(response){
			
			var htmlStr="<option value=''>--请选择分类--</option>";
			for(var i=0;i<response.length;i++){
					var obj=response[i];
					var isSelected=obj.type_id==parentTypeId?"selected='selected'":"";
				htmlStr=htmlStr+"<option value="+obj.type_id+" "+isSelected+">"+obj.type_name+"</option>"
			}
			//console.log(htmlStr);
			$("#DropDownTimezone1").html(htmlStr);
	});
	
	//查询子分类列表			
	$.post(rootURL+"/type/selectChildType",null,function(response){

			var str="<option value=''>--请选择子分类--</option>";
			for(var i=0;i<response.length;i++){
					var obj=response[i];
					var isSelected=obj.type_id==childTypeId?"selected='selected'":"";
					str=str+"<option value="+obj.type_id+" "+isSelected+" >"+obj.type_name+"</option>"
			}
			//console.log(str);
			$("#DropDownTimezone2").html(str);
	});
}

/**
 * 修改垃圾状态(还原或删除)
 */
function updateGarbageStatus(rootURL) {


	$('#btnUpdate').click(function(){

		if($("select[name='control']").val()==1){
			if(confirm("你确定要删除吗？")){
				var bookIdArray = [];//定义一个空数组 
				$("input[name='ck']:checked").each(function(i){//把所有被选中的复选框的值存入数组
					bookIdArray[i] =$(this).val();
				}); 

				var bookIdStr=bookIdArray.toString();//转字符串传入controller层转String数组，再转bookIdList集合
				console.log(bookIdStr);

				var Url=rootURL+"/book/deleteGarbage";
				var requestData={			
						//is_garbage:$("select[name='control']").val(),
						bookIdStr:bookIdStr			
				};

				$.post(Url,requestData,function(response){
					var responseURL=rootURL+"/book/selectGarbage/1";
					if(response.status==200){
						show_msg("操作成功！",responseURL);

					}else{
						show_err_msg("操作失败");
					}
				});   
			}
		}

		if($("select[name='control']").val()==0){

			var bookIdArray = [];//定义一个空数组 
			$("input[name='ck']:checked").each(function(i){//把所有被选中的复选框的值存入数组
				bookIdArray[i] =$(this).val();
			}); 

			var bookIdStr=bookIdArray.toString();//转字符串传入controller层转String数组，再转bookIdList集合
			console.log(bookIdStr);

			var Url=rootURL+"/book/returnGarbage";
			var requestData={			
					//is_garbage:$("select[name='control']").val(),
					bookIdStr:bookIdStr			
			};

			$.post(Url,requestData,function(response){
				var responseURL=rootURL+"/book/selectGarbage/1";
				if(response.status==200){
					show_msg("操作成功！",responseURL);

				}else{
					show_err_msg("操作失败");
				}
			}); 

		}


	});	

}

/**
 * 单个订单删除
 */
function deleteOrder(rootURL,order_id) {
	
	if(confirm("你确定要删除该订单吗？")){		
		//ajax请求
		var url=rootURL+"/order/deleteSingleOrder/"+order_id;
		$.post(url,null,function(response){
			var responseUrl=rootURL+"/order/selectOrderList";
			if(response.status==200){
				show_msg('删除订单成功',responseUrl);
			}else{
				show_err_msg('删除订单失败');
			}

		});
	}
}

/**
 * 批量修改订单状态
 * @param rootURL
 */
function updateOrderStatus(rootURL) {
	
	$('#btnUpdate').click(function(){

		if($("select[name='control']").val()==0){
			if(confirm("你确定要删除吗？")){
				var bookIdArray = [];//定义一个空数组 
				$("input[name='orderId']:checked").each(function(i){//把所有被选中的复选框的值存入数组
					bookIdArray[i] =$(this).val();
				}); 

				var bookIdStr=bookIdArray.toString();//转字符串传入controller层转String数组，再转bookIdList集合
				var Url=rootURL+"/order/deleteOrCancelManyOrder";
				var requestData={			
						orderStatus:$("select[name='control']").val(),
						bookIdStr:bookIdStr			
				};

				$.post(Url,requestData,function(response){
					var responseURL=rootURL+"/order/selectOrderList";
					if(response.status==200){
						show_msg("操作成功！",responseURL);

					}else{
						show_err_msg("操作失败");
					}
				});   
			}
		}

		if($("select[name='control']").val()==-1){
			if(confirm("你确定要取消吗？")){
				var bookIdArray = [];//定义一个空数组 
				$("input[name='orderId']:checked").each(function(i){//把所有被选中的复选框的值存入数组
					bookIdArray[i] =$(this).val();
				}); 

				var bookIdStr=bookIdArray.toString();//转字符串传入controller层转String数组，再转bookIdList集合
				console.log(bookIdStr);

				var Url=rootURL+"/order/deleteOrCancelManyOrder";
				var requestData={			
						orderStatus:$("select[name='control']").val(),
						bookIdStr:bookIdStr			
				};

				$.post(Url,requestData,function(response){
					var responseURL=rootURL+"/order/selectOrderList";
					if(response.status==200){
						show_msg("操作成功！",responseURL);

					}else{
						show_err_msg("操作失败");
					}
				}); 

			}
		}
	});	

}

function updateBookStatus(rootURL) {

	$('#btnUpdate').click(function(){

		var bookIdArray = [];//定义一个空数组 
		$("input[name='ck']:checked").each(function(i){//把所有被选中的复选框的值存入数组
			bookIdArray[i] =$(this).val();
		}); 

		var bookIdStr=bookIdArray.toString();
		console.log(bookIdStr);
		
		var Url=rootURL+"/book/updateBookStatus";
		var requestData={			
				statusStr:$("select[name='control']").val(),
				bookIdStr:bookIdStr			
		};

		$.post(Url,requestData,function(response){
			var responseURL=rootURL+"/book/bookManagerPage";
			if(response.status==200){
				show_msg("操作成功！",responseURL);

			}else{
				show_err_msg("操作失败");
			}
		});   

	});
}
