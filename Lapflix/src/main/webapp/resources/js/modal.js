// Get the modal
var modal = document.getElementById('modal');
 
// Get the button that opens the modal
var btn = document.getElementById("modal-btn");
 
// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];                                          
 
// When the user clicks on the button, open the modal 
btn.onclick = function(){
	getFavoriteList();
}
// 즐겨찾기 리스트
function getFavoriteList(){
            
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
		if(data.far != null){
			var str = "";
			for(var i=0; i <data.far.length; i++){
				str += "<img src='"+data.far[i].laptop_ImageURL+"><div class='fav-content'><h2>"+data.far[i].laptop_Name+
					"</h2><p>"+data.far[i].laptop_Price+"</p><p><a href=javascript:delFavorite("+f_key+","+data.far[i].laptop_seq+
					")><i class='far fa-star'></i></a><a href='"+data.far[i].laptop_url+"'><i class='fas fa-shopping-cart'></i></a></p></div>";
			}
			$(".fav-slides").html(str);
		}else{
			alert("즐겨찾기 목록이 비어있습니다.");
		}
		
	});
			
	modal.style.display = "block";
}

// 즐겨찾기 리스트 삭제 후 업데이트
function delFavorite(key, seq){
	var f_key = key;
	var laptop_seq = seq;

	$.ajax({
		url: "favorite",
		type: "post",
		data: "f_key="+encodeURIComponent(f_key)+"&laptop_seq="+encodeURIComponent(laptop_seq),
		dataType: "json",
		
	}).done(function(data){
		
		if(data.f_chk == "0"){
			alert("즐겨찾기 목록에서 삭제되었습니다");
			$(".fav-slides").html('');
			getFavoriteList();
		}
	}); 
	
}
 
// When the user clicks on <span> (x), close the modal
span.onclick = function() {
	modal.style.display = "none";
}
 
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
	if (event.target == modal) {
		modal.style.display = "none";
	}
}

