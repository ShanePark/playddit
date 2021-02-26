$(document).ready(function(){
	$("#forgotPass").on("click", function(){
        $('body').addClass('scrollOff').on('scroll touchmove mousewheel', function(e){
            e.preventDefault();
        });
		$("#modal").fadeIn(200);
		$("#modalBody").delay(100).animate({marginTop:0},400);
	});
    
    $("#condiLeft").on("click",".fas", function(){
		$("#modal").fadeIn(200);
		$("#modalBody, #condiModal").delay(100).animate({marginTop:0},400);
	});
	
	$("#close").on("click", function(){
		$("#modalBody, #condiModal").animate({marginTop:"300px"},300);
		$("#modal").delay(200).fadeOut(300);
        $('body').removeClass('scrollOff').off('scroll touchmove mousewheel');
	});
    
    // 회원가입
    $("#joinBtn").on("click",function(){
        $('body').addClass('scrollOff').on('scroll touchmove mousewheel', function(e){
            e.preventDefault();
        });
		$("#modal").fadeIn(200);
        $("#codeModal").delay(100).animate({marginTop:0},400);
	});
});