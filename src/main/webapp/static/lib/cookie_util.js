/**
 * Cookie操作
 */
//保存cookie
function setCookie(name,value)
{
	var Days = 14; //保存两周
	var exp = new Date();
	exp.setTime(exp.getTime() + Days*24*60*60*1000);
	document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}
//删除cookie
function delCookie(name)
{
	var exp = new Date();
	exp.setTime(exp.getTime() - 1000);
	document.cookie= name+"=;expires="+exp.toGMTString();
		
}
//获取cookie
function getCookie(name)
{
	var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
	if(arr=document.cookie.match(reg))
		return unescape(arr[2]);
	else
		return null;
}