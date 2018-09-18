var serverUrl = "http://127.0.0.1:8080/EShopManager/";
var imgUrl = "http://127.0.0.1:8080/EShopManager/images/";
// var headUrl="http://127.0.0.1:8080/YunheStuScoresManager/upload";
// var serverUrl="http://182.61.33.130/YunheStuScoresInterface";
// var headUrl="http://182.61.33.130/YunheStuScoresManager/upload";

function GetRequest() {
	var myurl = location.search;
	var theRequest = new Object();
	if (myurl.indexOf("?") != -1) {
		var str = myurl.substr(1);
		strs = str.split("&");
		for (var i = 0; i < strs.length; i++) {
			theRequest[strs[i].split("=")[0]] = (strs[i].split("=")[1]);
		}
	}
	return theRequest;
}

function GetServerUrl(strs) {
	var url = serverUrl + strs;
	return url;
}

function GetImgUrl(strs) {
	var url = imgUrl + strs;
	return url;
}
function roundFun(numberRound, roundDigit) // 四舍五入，保留位数为roundDigit
{
	if (numberRound >= 0) {
		var tempNumber = parseInt((numberRound * Math.pow(10, roundDigit) + 0.5))
				/ Math.pow(10, roundDigit);
		return tempNumber;
	} else {
		numberRound1 = -numberRound
		var tempNumber = parseInt((numberRound1 * Math.pow(10, roundDigit) + 0.5))
				/ Math.pow(10, roundDigit);
		return -tempNumber;
	}
}
$(function(){
	//得到当前的href
	var curPath=window.document.location.href;
	//得到所有的a标签
	$(".sidebar-nav ul li a").each(function(){
		//如果当前的href和a标签中href相等
		if(curPath.match($(this).attr("href"))){
			$(this).parents('li').attr("class","active")
			$(this).parents('ul').attr("class","nav nav-list in collapse")
		}else{
			$(this).parents('li').attr("class","")
			
		}
	});
})