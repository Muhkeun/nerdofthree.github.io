let id = $('#id');
let pw = $('#password');
let button = $('#btn');

$(button).on('click', function(){
      
    if($(id).val() == ""){
        $(id).next('label').addClass('warning');
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
});