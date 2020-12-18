$("#modal-btn").click(function(){

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
		dataType: "json"
	}).done(function(data){
		var str = "";
		for(var i=0; i <data.far.length; i++){
			str += "<h2>"+data.far[i].laptop_Name+"</h2><p>"+data.far[i].laptop_Weight+"kg</p><a href='#'><i class='far fa-star'></i>Favorite</a>"
		}
		$(".fav-content").html(str);
	});
});


// Get the modal
var modal = document.getElementById('modal');
 
// Get the button that opens the modal
var btn = document.getElementById("modal-btn");
 
// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];                                          
 
// When the user clicks on the button, open the modal 
btn.mouseup = function() {
	modal.style.display = "block";
}
 
// When the user clicks on <span> (x), close the modal
span.mouseup = function() {
	modal.style.display = "none";
}
 
// When the user clicks anywhere outside of the modal, close it
window.mouseup = function(event) {
	if (event.target == modal) {
		modal.style.display = "none";
	}
}