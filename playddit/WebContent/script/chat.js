$(function(){
    
	getAudiences();


	// 알람 버튼 이벤트 수행시 목록 받아 붙이기
	$(".alarmBtn").click(function(){
		getAlarm();
	});

	/************************************************************************** 
	
								모달 이벤트 관련 함수들입니다
			
	***************************************************************************/
	var stat = false;
	
    $("#curChatBtn").click(function(){
        if(!stat){
            $("#mask").fadeIn();
            $("#chatBack").fadeIn(200); $("#chatUserBox").delay(100).animate({marginRight : 0}, 300);
            stat = true;
        }else{
            $("#mask").fadeOut();
            $("#chatUserBox").animate({marginRight : "-80%"}, 300);
            $("#chatBack").delay(100).fadeOut(200); 
            stat = false;
        }
    });

    $("#chatBack, #mask").click(function(){
        $("#mask").fadeOut();
        $("#chatUserBox").animate({marginRight : "-80%"}, 300);
        $("#chatBack").delay(100).fadeOut(200); 
        stat = false;
    });

    $("#chatUserBox h3").on("click","button",function(){
        $("#outWrap").fadeIn(200);
        $("#outModal").delay(200).animate({marginTop:"0"}, 400);
    });

    $("#cancel, #outWrap").click(function(){
        $("#outModal").animate({marginTop:"100px"}, 400);
        $("#outWrap").delay(200).fadeOut(200);
    });
});

/************************************************************************** 

							여기부터 함수 선언부입니다. 
		
 ***************************************************************************/

getAudiences = function(){

	$.ajax({
		url : '/playddit/message/getAudiences.do',
		type : 'post',
		success : function(res){
			$.each(res, function(i,v){
				var chats = '<div class="chats" userid="'+v.id+'">'
							+	'<a class="chatPic" style="background-image: url(images/profile/'+v.profile+')">'
				         	+	'</a>'
                        	+	'<div class="chatInfo">'
							+		'<h6>'+v.nickname+'</h6>'
                        	+		'<p class="small">'+v.content+'</p>'
							+	'</div>'
                          	+	'</div>';
				$('#chatList').append(chats);
			})
		},
		error : function(xhr){
			alert("status : " + xhr.status);
		},
		dataType : 'json'
	})
}

getMessage = function(audience){

	$.ajax({
		url : '/playddit/message/getMessage.do',
		type : 'post',
		data : {'audience' : audience},
		success : function(res){
		
		},
		error : function(xhr){
			alert("status : " + xhr.status);
		},
		dataType : 'json'
	})
}

getAlarm = function(){
	
	$.ajax({
		url : '/playddit/alarm/getAlarm.do',
		success : function(res){
			var alarm = '';
			$.each(res, function(i,v){
				
				if(v.type == 10){	// 학급 승인 관련 알람일경우
					alarm += '<div class="alarm classMoniter alarmno='+v.alarm_no+'">'
							+	'<a class="alarmUser" href=myPage.jsp?feed_id='+v.sender+'>'
							+		'<img src="images/profile/'+ v.sender_pic +'" />'
							+	'</a>'
							+	'<a class="alarmCont" href="#">'
							+		'<span class="alarmNick">'+ v.cont +'</span>님의 학급 승인 요청'
							+	'</a>'
							+	'<button type="button"><i class="fas fa-times red"></i></button>'
							+	'<button type="button"><i class="fas fa-check"></i></button>'
							+'</div>';
					
				}else{
					alarm += '<div class="alarm alarmno='+v.alarm_no+'">'
							+	'<a class="alarmUser" href=myPage.jsp?feed_id='+v.sender+'>'
							+		'<img src="images/profile/'+ v.sender_pic +'" />'
							+	'</a>'
							
					switch(v.type){
					case 11: alarm += '<a class="alarmCont" href=myPage.jsp?feed_id='+v.sender+'><span class="alarmNick">'+ v.cont +'</span>'
									+'님이 나를 follow 하기 시작했습니다.'
						break;
					case 12: alarm += '<a class="alarmCont" href="#"><span class="alarmNick">'+ v.cont +'</span>'
									+'님이 새로운 메시지를 보냈습니다.'
						break;
					case 21: alarm += '<a class="alarmCont" href="#"><span class="alarmNick">'+ v.cont +'</span>'
									+'님이 내가 쓴 글을 좋아합니다.'
						break;
					case 22: alarm += '<a class="alarmCont" href="#"><span class="alarmNick">'+ v.cont +'</span>'
									+ '님이 내가 쓴 글에 댓글을 남겼습니다.'
						break;
					case 31: alarm += '<a class="alarmCont" href="#"><span class="alarmNick">'+ v.cont +'</span>'
									+'에 새로운 공지사항이 올라왔습니다.'
						break;
					default : alarm += '존재하지 않는 알람 타입. 관리자에게 해당 알람번호를 신고해주세요.'
						break;
				}
				alarm += '</a></div>';
				}
			})
			
			$('#alarmWrap').html(alarm);
		},
		error : function(xhr){
			if(xhr.status == 500){
				location.href="index.html";
				return false;
			}
			alert("status : " + xhr.status);
		},
		dataType : 'json'
	})
}