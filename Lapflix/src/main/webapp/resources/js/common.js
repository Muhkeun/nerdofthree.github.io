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
};

function f_list(){
        		
	var f_key = sessionStorage.getItem("f_key");
	
	if(f_key == null){
		alert("로그인을 해주세요.");
		location.href="/signIn";
		return;
	}
	
	$.ajax({
		url: "getFavoriteList",
		type: "post",
		data: "f_key="+encodeURIComponent(f_key),
	}).done(function(){
		location.href="/favoriteList";
	});
}

