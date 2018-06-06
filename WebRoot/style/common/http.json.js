

function doSubmitForm(url, form, callback, async) {
	$.ajax({
		type : "POST",
		url : url,
		dataType : "JSON",
		data : form.serialize(),
		processData : false,
		async : async == undefined ? true : async,
		success : function(rs) {
			if (typeof(rs) == "string") {
				rs=eval("("+rs+")");
				//rs = JSON.stringify(rs);
			}
			callback(rs);
		},
		error : errTip
	});
}

function errTip(req, status, error) {
	alert(req.status + "," + req.readyState + "," + status + "\n" + error);
}