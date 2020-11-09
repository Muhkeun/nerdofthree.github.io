<script>
$(document).ready(function () {
        $('html, body').animate({
            scrollTop: $('#indexPostion').offset().top
        }, 'fast'); //slow
    });

    jQuery(document).ready(function($) {
        $(".scroll").click(function(event){
            event.preventDefault();
            $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
        });
    });
</script>