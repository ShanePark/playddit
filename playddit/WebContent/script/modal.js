$(document).ready(function(){
	$("#forgotPass").click(function(){
		$("#modal").fadeIn(200);
		$("#modalBody").delay(100).animate({marginTop:0},400);
	});
    
    $(".fas").click(function(){
		$("#modal").fadeIn(200);
		$("#modalBody, #condiModal").delay(100).animate({marginTop:0},400);
	});
	
	$("#close, #modal").click(function(){
		$("#modalBody, #condiModal").animate({marginTop:"300px"},300);
		$("#modal").delay(100).fadeOut(300);
	});
    
    // 회원가입
    $("#joinBtn").click(function(){
		$("#modal").fadeIn(200);
        $("#codeModal").delay(100).animate({marginTop:0},400);
	});
});