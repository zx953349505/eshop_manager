
var rootURL;

function loadQuestion_Address(rURL){
	rootURL=rURL;
	$(function(){
			//查询问题列表
			$.post(rootURL+"/question/selectQuestionList",null,function(response){
					
					var htmlStr="<option value=''>--请选择一个问题--</option>";
					for(var i=0;i<response.length;i++){
							var obj=response[i];
						htmlStr=htmlStr+"<option value="+obj.question_id+">"+obj.question_title+"</option>"
					}
					//console.log(htmlStr);
					$("#question").html(htmlStr);
			});
			
			//查询省列表			
			$.post(rootURL+"/address/province",null,function(response){

					var str="<option value=''>--请选择省--</option>";
					for(var i=0;i<response.length;i++){
							var obj=response[i];
							str=str+"<option value="+obj.id+">"+obj.name+"</option>"
					}
					//console.log(str);
					$("#province").html(str);

			});
			
			//查询市列表
			$("#province").change(function() {
				
				var params={province_id:this.value};
				$.post(rootURL+"/address/city",params,function(response){
					
					var str="<option value=''>--请选择市--</option>";
					for(var i=0;i<response.length;i++){
							var obj=response[i];
							str=str+"<option value="+obj.id+">"+obj.name+"</option>"
					}
						//console.log(str);
						$("#city").html(str);

				});
			});
			
			// 查询区列表				 
			$("#city").change(function(){	
				
					var params={city_id:this.value};
					$.post(rootURL+"/address/area",params,function(response){
									
							var str="<option value=''>--请选择区/县--</option>";
							for(var i=0;i<response.length;i++){
								var obj=response[i];
								str+="<option value='"+obj.id+"'>"+obj.name+"</option>";
							}					
							$("#area").html(str);

					});
					
				});
			
	});
}

		
function subAdd(){

	var province_id=$("#province").val();
	var city_id=$("#city").val();
	var area_id=$("#area").val();
	var question_id=$("#question").val();
	console.log($("#user_name").val());
	if(province_id==''){
		show_err_msg("请选择省份");
	}else if(city_id==''){
		show_err_msg("请选择市");
	}else if(area_id==''){
		show_err_msg("请选择区/县");
	}else if(question_id==''){
		show_err_msg("请选择密保问题");
	}else{
		
			var addUrl=rootURL+"/user/addUser";
			var addData={
					user_name:$("#user_name").val(),
					user_pwd:$("#user_pwd").val(),
					user_email:$("#user_email").val(),
					user_sex:$("input[name='sex']:checked").val(),
					user_phone:$("#user_phone").val(),
					question_id:$("#question").val(),
					question_answer:$("#answer").val(),
					province_id:$("#province").val(),
					city_id:$("#city").val(),
					area_id:$("#area").val(),
					user_address:$("#address").val(),
			};
			
			$.post(addUrl,addData,function(response){
				var responseURL=rootURL+"/user/selectAllUserList";
				if(response.status==200){
					show_msg("添加成功！",responseURL);
					
				}else{
					show_err_msg("添加失败");
				}
			});

	}
}
