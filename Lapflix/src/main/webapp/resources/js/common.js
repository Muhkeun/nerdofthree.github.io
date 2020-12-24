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
			var surveyURL = sessionStorage.getItem("surveyURL");
			location.href="/result?"+surveyURL;
		}	
	});
}

function result(){
	var surveyURL = sessionStorage.getItem("surveyURL");
	
	location.href = "/result?"+surveyURL;
};

