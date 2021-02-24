$(function(){
    var stat = true;
    
    $("#ham").click(function(){
        if(stat){
            $("#back").stop().fadeIn(200);
            $("#mnav").css({
                marginLeft: 0
            });
            $("#ham").addClass("ex");
            stat = false;
        }else{
            $("#mnav").css({
                marginLeft: "-120%"
            });
            $("#back").stop().fadeOut(200);
            $("#ham").removeClass("ex");
            stat = true;
        }
    });
    
    $(window).resize(function(){
        var winW = $(window).width();
        if(winW >= 1024){
            $("#mnav, #back").removeAttr("style");
        }else{
            $("#mnav").css({marginLeft: "-120%"});
            $("#ham").removeClass("ex");
            stat = true;
        }
    });
});