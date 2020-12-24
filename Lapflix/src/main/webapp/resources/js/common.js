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
	
	var svo = document.getElementById("svo").value;
	
	location.href = "/result?laptop_MonitorSize="+svo.laptop_MonitorSize+"&laptop_OS="+svo.laptop_OS+
			"&program_Name="+svo.program_Name+"&status="+svo.status+"&laptop_Weight="+svo.laptop_Weight+"&laptop_Price="+svo.laptop_Price;
};

