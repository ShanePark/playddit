$(function(){
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

	//신고 모달
	$(".report").each(function(){
		var modal = true;

		$(this).click(function(){
			if(modal){
				$('body').addClass('scrollOff').on('scroll touchmove mousewheel', function(e){
					e.preventDefault();
				});
				$("#reportBack").show();
				$("#reportWrap").show();
				$("#reportModal").slideDown(500);
				modal = true;
			}
		});
	});
			 
	$("#reportBack, #cancel").click(function(){
		$("#reportModal").slideUp(500);
		$("#reportWrap").delay(200).hide();
		$("#reportBack").hide();
		modal = false;
		$('body').removeClass('scrollOff').off('scroll touchmove mousewheel');
	});		 
});