$(function(){

	$("#content").summernote({
		height: 300,
		maxHeight: 400,
		minHeight: 200,
		width: 1000,
		tabSize: 10,
		focus: true,
		lang: "ko-KR",
		placeholder: '음란물, 차별, 비하, 혐오 및 초상권, 저작권 침해 게시물은 민, 형사상의 책임을 질 수 있습니다.',
		callbacks:{
			onImageUpload: function(files, editor){
				 
				for(var i=0; i<files.length; i++){
					sendFile(files[i], editor);
				}
			},
		}
	});
	
	$("#content").summernote("lineHeight", 1.5);	
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