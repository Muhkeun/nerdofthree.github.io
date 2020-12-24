let email = $('#email');
let pw = $('#password');
let button = $('#btn');

$(button).bind('click', function(){
      
    if($(email).val() == ""){
        $(email).next('label').addClass('warning');
        setTimeout(function(){
            $('label').removeClass('warning');
        }, 1500);
    }
    else if($(pw).val() == ""){
        $(pw).next('label').addClass('warning');
        setTimeout(function(){
            $('label').removeClass('warning');
        }, 1500);
    }
	
	$.ajax({
		url: "signIn",
		type: "post",
		data: "email="+encodeURIComponent(email.val())+"&password="+encodeURIComponent(pw.val()),
		dataType: "json",
	}).done(function(data){
		var surveyURL = sessionStorage.getItem("surveyURL");
		if(data.res == "1" && surveyURL != null){
			alert(data.mvo.member_name+"님 환영합니다. 결과화면으로 이동합니다.");
			sessionStorage.setItem("f_key", data.mvo.f_key);
			location.href="/result?"+surveyURL;
		}else if(data.res == "0"){
			alert("이메일 또는 비밀번호가 일치하지 않습니다. 다시 확인해 주세요.");
		}else{
			alert("설문에 참여해주세요.");
			location.href="/";
		}
	});
});