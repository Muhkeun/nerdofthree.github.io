// Get the modal
var modal = document.getElementById('modal');
 
// Get the button that opens the modal
var btn = document.getElementById("modal-btn");
 
// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];                                          
 
// When the user clicks on the button, open the modal 
btn.onclick = function getFavoriteList(){
            
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
				str += "<img src='"+data.far[i].laptop_ImageURL+"?shrink=130:130&_v=20200306133943' alt=''><div class='fav-content'><h2>"+data.far[i].laptop_Name+
					"</h2><p>"+data.far[i].laptop_Price+"kg</p><p>"+data.far[i].laptop_url+"</p><a href=javascript:delFavorite("+data.f_key+","+data.far[i].laptop_seq+")><i class='far fa-star'></i></a></div>";
			}
			$(".fav-slides").html(str);
		}else{
			alert("즐겨찾기 목록이 비어있습니다.");
		}
		
	});
			
	modal.style.display = "block";
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
						str += "<img src='"+data.far[i].laptop_ImageURL+"?shrink=130:130&_v=20200306133943' alt=''><div class='fav-content'><h2>"+data.far[i].laptop_Name+
							"</h2><p>"+data.far[i].laptop_Price+"kg</p><p>"+data.far[i].laptop_url+"</p><a href=javascript:delFavorite("+data.f_key+","+data.far[i].laptop_seq+")><i class='far fa-star'></i></a></div>";
					}
					$(".fav-slides").html(str);
				}else{
					alert("즐겨찾기 목록이 비어있습니다.");
				}
				
			});
		}
	}); 
	
}