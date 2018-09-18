var rooturl;
var quid;
function deleteClick(url,qu_id) {
	var rooturl=url;
	var quid=qu_id;
	var para={question_id:qu_id};
	$.post(rooturl+"/question/deletequestion.action",para,function(response){
		var result=$.parseJSON(response);
		
	})
}