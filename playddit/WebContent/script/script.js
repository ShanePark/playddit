$(function(){
    /*모바일 메뉴*/
    var stat = true;
    
    $("#ham, #mham").click(function(){
        if(stat){
            $('body').addClass('scrollOff').on('scroll touchmove mousewheel', function(e){
                e.preventDefault();
            });
            $("#back").stop().fadeIn(200);
            $("#mnav").css({
                marginLeft: 0
            });
            $("#ham, #mham").addClass("ex");
            stat = false;
        }else{
            $("#mnav").css({
                marginLeft: "-120%"
            });
            $("#back").stop().fadeOut(200);
            $("#ham, #mham").removeClass("ex");
            stat = true;
            $('body').removeClass('scrollOff').off('scroll touchmove mousewheel');
        }
    });
    
    $("#back").on("click", function(){
        $("#mnav").css({
            marginLeft: "-120%"
        });
        $("#back").stop().fadeOut(200);
        $("#ham, #mham").removeClass("ex");
        stat = true;
        $('body').removeClass('scrollOff').off('scroll touchmove mousewheel');
    });
    
    $(window).resize(function(){
        var winW = $(window).width();
        if(winW >= 1024){
            $("#mnav, #back").removeAttr("style");
        }else{
            $("#back").fadeOut();
            $("#mnav").css({marginLeft: "-120%"});
            $("#ham, #mham").removeClass("ex");
            stat = true;
        }
    });
});