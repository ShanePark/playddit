$(function(){
    /*모바일 메뉴*/
    var stat = true;
    
    $("#ham, #mham").click(function(){
        if(stat){
            $("#alarmEdge2, #alarmEdge").hide();
            $("#modal").fadeOut(300);
            visi = true;
            
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
        
        if(winW < 768){
            if(follow){
                $('body').removeClass('scrollOff').off('scroll touchmove mousewheel');
                $(".followModal").delay(100).animate({top: "-30%"},400);
                $("#back2").fadeOut(200);
                follow = false;
            }
        }
    });
    
    //알람
	//feed Search
	$("#search button, #msearch button").on("click", function(){
		$("#mask").show();
		$("#feedSearch").show();
		$("#feedSearchModal").slideDown(500);
	});

	$("#mask").click(function(){
		$(this).hide();
			
		if($("#modal").is(":visible")){
			$("#alarmEdge2, #alarmEdge").hide();
			$("#modal").fadeOut(300);
		}else {
			$("#feedSearchModal").slideUp(300);
			$("#feedSearch").delay(200).hide();
		}
	});
    
    $(".alarmBtn").click(function(){
		$("#mask").show();
		$("#alarmEdge2 , #alarmEdge, #modal").show();
    });
	
    //모바일 헤더 설정
    $(window).scroll(function(evt) {
        var y = $(this).scrollTop();
        /*var winW = $(window).width();*/
        /*
        if(winW < 768){
            if (y > 120) {
                $('#mflexBox').css("display", "none");
                $("#mham").css("top", "1.8%");
                $("#alarmEdge").css("top", "52px");
                $("#modal").css("top", "62px");
                $("#mnav").css("top", "151px");
            } else{
                $('#mflexBox').css("display", "block");
                $("#mham").css("top", "8%");
                $("#alarmEdge").css("top", "120px");
                $("#modal").css("top", "128px");
                $("#mnav").css("top", "0px");
            }
        }else{
            $('#mflexBox').css("display", "none");
            $("#mham").css("top", "8%");
            $("#alarmEdge").css("top", "52px");
            $("#modal").css("top", "62px");
        }*/
        
        if(y > 120){
            $("#top").css("display", "block");
        }else{
            $("#top").css("display", "none");
        }
    });
    
    //팔로우 목록 모달창
    var follow = $("#back2").is(":visible");
    
    $(".followBtn").click(function(){
        if(!follow){
            title = $(this).parent("li").children(".th").text();
            $(".followTitle h6").text(title);
            n = $(this).text();
            $(".followTitle span").text(n);
            
            $('body').addClass('scrollOff').on('scroll touchmove mousewheel', function(e){
                e.preventDefault();
            });
			
            $("#back2").fadeIn(200);
			$(".followModal").delay(100).animate({top: "50%"},400);
            follow = true;
        }
    });
    
    $(".close, #back2").on("click", function(){
        if(follow){
            $('body').removeClass('scrollOff').off('scroll touchmove mousewheel');
            $(".followModal").delay(100).animate({top: "-30%"},400);
            $("#back2").fadeOut(200);
            follow = false;
        }
    });
    
    //top
    $("#top").click(function(){
        $("html,body").animate({scrollTop: 0});
    });
    
    
    //nav 버튼
    $("#lnb .main").click(function(){
        $("#lnb .main").removeClass("active");
        $(this).addClass("active");
    });
});