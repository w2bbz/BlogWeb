
$(function() {
	showaddress();
});
function showaddress(){
	var url = basePath+'commonService/getRequestIp.do?random='+ Math.random();
	$.getJSON(url, function(data) {
		//console.log(data);
	    var ip = data.ip;//获取用户IP
	    //alert(ip);
	    document.getElementById("showaddress").innerText=" IP地址: "+ip+" ";
	});
}
