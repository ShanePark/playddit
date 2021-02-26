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
    
    //알람
    var visi = true;
    $(".alarmBtn").click(function(){
        if(visi){
            $("#alarmEdge2 , #alarmEdge, #modal").show();
            visi = false;
        }else{
            $("#alarmEdge2, #alarmEdge").hide();
            $("#modal").fadeOut(300);
            visi = true;
        }
    });
    
    //모바일 헤더 설정
    $(window).scroll(function(evt) {
        var winW = $(window).width();

        var y = $(this).scrollTop();
        
        if(winW < 768){
            if (y > 120) {
                $('#mflexBox').css("display", "none");
                $("#mham").css("top", "1.8%");
                $("#alarmEdge").css("top", "52px");
                $("#modal").css("top", "62px");

            } else{
                $('#mflexBox').css("display", "block");
                $("#mham").css("top", "8%");
                $("#alarmEdge").css("top", "120px");
                $("#modal").css("top", "128px");
            }
        }else{
            $('#mflexBox').css("display", "none");
            $("#mham").css("top", "8%");
            $("#alarmEdge").css("top", "120px");
            $("#modal").css("top", "128px");
        }
        
        if(y > 120){
            $("#top").css("display", "block");
        }else{
            $("#top").css("display", "none");
        }
    });
    
    //팔로우 목록 모달창
    $(".followBtn").click(function(){
        $('body').addClass('scrollOff').on('scroll touchmove mousewheel', function(e){
            e.preventDefault();
        });
        $("#back2").fadeIn(200);
		$(".followModal").delay(100).animate({top: "50%"},400);
    });
});