var isValidateEmail=false;
var isValidateUsername=false;

var rootURL;

function loadMethod(rURL){
	rootURL=rURL;
	$(function(){
			//查询父分类列表
			$.post(rootURL+"/type/selectParentType.action",null,function(response){
					
					var htmlStr="<option value=''>--请选择分类--</option>";
					for(var i=0;i<response.length;i++){
							var obj=response[i];
						htmlStr=htmlStr+"<option value="+obj.type_id+">"+obj.type_name+"</option>"
					}
					//console.log(htmlStr);
					$("#DropDownTimezone1").html(htmlStr);
			});
			
			//查询子分类列表			
			$.post(rootURL+"/type/selectChildType.action",null,function(response){

					var str="<option value=''>--请选择子分类--</option>";
					for(var i=0;i<response.length;i++){
							var obj=response[i];
							str=str+"<option value="+obj.type_id+">"+obj.type_name+"</option>"
					}
					//console.log(str);
					$("#DropDownTimezone2").html(str);
			});
	});
}

