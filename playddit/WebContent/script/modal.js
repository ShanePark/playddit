$(document).ready(function(){
	$("#forgotPass").click(function(){
		$("#modal").fadeIn(200);
		$("#modalBody").delay(100).animate({marginTop:0},400);
	});
    
    $(".fas").click(function(){
		$("#modal").fadeIn(200);
		$("#modalBody").delay(100).animate({marginTop:0},400);
	});
	
	$("#close").click(function(){
		$("#modalBody").animate({marginTop:"300px"},300);
		$("#modal").delay(100).fadeOut(300);
	});
});