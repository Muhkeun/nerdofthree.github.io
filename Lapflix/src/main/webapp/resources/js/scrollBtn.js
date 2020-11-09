
// 아래로 내려가는 스크롤
function moveTo(seq){
    var offset = $("#page" + (seq)).offset()
    $('html, body').animate({
        scrollTop : offset.top
    },
    // 스크롤속도
    800
    ); }

    $("document").ready(function() {  
        $(window).scroll(function() {  
                
                    // 현재 스크롤바의 위치값을 반환
                var position = $(window).scrollTop();
                    
                    pageSize =  $('#page2').offset().top - $('#page1').offset().top

                        
                for (var i = 1; i <= $('.scrollBtn_Btn').length; i++){  
                        
                    nowPageOffset = $('#page'+i).offset()
                    nextPageOffset = $('#page'+(i+1)).offset()
                       
                    if(position+(pageSize*0.5) >= nowPageOffset.top && position+(pageSize*0.5) < nextPageOffset.top){
                    
                        $("#scrollBtn_Btn" + i).css("color","black");
                        var i = i;                          
                    }else{
                        $("#scrollBtn_Btn" + i).css("color","grey")
                    }

                    

                }
        });
            
    });  

    
