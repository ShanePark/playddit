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
            $("#msearch").slideUp(100);
            $("#hsearch_btn").css("background-position","3px 3px");
        }else{
            $("#mnav").css({
            marginLeft: "-85%"
            });
            $("#back").stop().fadeOut(200);
            $("#ham").removeClass("ex");
            stat = true;
        }
    });
});