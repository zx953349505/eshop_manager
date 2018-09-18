var url="/eshop_manager/type/selectType";
var purl="/eshop_manager/type/selectparent";
var parid;
$(function() { 
	$.post(url,null,function(response){
		console.log(response);
		var selectInnerHTML="";
		for (var i = 0; i < response.length; i++) {
			var typeInfo=response[i];
			selectInnerHTML+="<tr data-tt-id='"+typeInfo.type_id+"' " +
					"class='branch collapsed'>" +
					"<td><span class='indenter' style='padding-left: 0px;'>" +
					"<a href='javascript:pareatClick("+typeInfo.type_id+")' title='Expand'>&nbsp;</a></span>"+typeInfo.type_name+"</td>" +
					"<td>一级分类</td>" +
					"<td>"+typeInfo.type_id+"</td>" +
					"<td><a href='http://182.61.25.211/EShopManager/books/queryinfo.action?book_id='"+typeInfo.type_id+" title='编辑'><i class='icon-pencil'></i></a>"+
		              "<a href='javascript:deleteClick()' title='删除'><i class='icon-remove'></i></a></td>";
		}
		$("#selectInnerHTML").html(selectInnerHTML);
	});
	
})