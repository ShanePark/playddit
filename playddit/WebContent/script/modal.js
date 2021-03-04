$(document).ready(function(){
	$("#forgotPass").click(function(){
		$("#modal").fadeIn(200);
		$("#modalBody").delay(100).animate({marginTop:0},400);
	});
    
	$("#condition").on("click",".fas", function(){
		$("#modal").fadeIn(200);
		$("#modalBody, #condiModal").delay(100).animate({marginTop:0},400);
	});
	
	$("#condiModal, #modalBody, #codeModal").on("click", '#close', function(){
		$("#modalBody, #codeModal, #condiModal").animate({marginTop:"300px"},300);
		$("#modal").delay(100).fadeOut(300);
	});
});