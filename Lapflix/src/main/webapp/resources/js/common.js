function signOut_ok(){
	
	$("#signOut").html("<a href='javascript:signOut()'>SignOut</a>");
	
}

function signOut(){
	
	$.ajax({
		url: "signOut",
		dataType: "json",
	}).done(function(data){
		
		if(data.res == "0"){
			alert("정상적으로 로그아웃 처리되었습니다.");
			sessionStorage.removeItem("f_key");
			location.href="/result?laptop_MonitorSize="+data.svo.laptop_MonitorSize+"&laptop_OS="+data.svo.laptop_OS+"&program_Name="+data.svo.program_Name+
			"&status="+data.svo.status+"&laptop_Weight="+data.svo.laptop_Weight+"&laptop_Price="+data.svo.laptop_Price;		
		}	
	});
}

function result(){
	var laptop_MonitorSize = sessionStorage.getItem("laptop_MonitorSize");
	var laptop_OS = sessionStorage.getItem("laptop_OS");
	var program_Name = sessionStorage.getItem("program_Name");
	var status = sessionStorage.getItem("status");
	var laptop_Weight = sessionStorage.getItem("laptop_Weight");
	var laptop_Price = sessionStorage.getItem("laptop_Price");
	
	location.href = "/result?laptop_MonitorSize="+laptop_MonitorSize+"&laptop_OS="+laptop_OS+
			"&program_Name="+program_Name+"&status="+status+"&laptop_Weight="+laptop_Weight+"&laptop_Price="+laptop_Price;
};

