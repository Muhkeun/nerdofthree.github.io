$(function(){
			
	$("#content").summernote({
		 height: 300,
		 maxHeight: 400,
		 minHeight: 200,
		 tabSize: 10,
		 width: 715,
		 focus: true,
		 lang: "ko-KR",

		 callbacks:{
			 onImageUpload: function(files, editor){
				 
				 for(var i=0; i<files.length; i++){
					 sendFile(files[i], editor);
				 }
			 },
		 }
	});
	
//	$("#content").summernote("lineHeight", 0.7);	
});
	
function sendFile(file, editor){
	var frm = new FormData();
	
	frm.append("file", file);
	
	//비동기식 통신
	$.ajax({
		url: "saveImage",
		type: "post",
		data: frm,
		contentType: false,
		processData: false,
		dataType: "json",
	}).done(function(res){
		//성공시
		$("#content").summernote("editor.insertImage", res.img_url);
	}).fail(function(err){
		//실패시
		console.log(err);
	});
}