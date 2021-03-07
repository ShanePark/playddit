$(function(){
    
	getAudiences();

	
	// 채팅 목록에서 유저 클릭시 
	$('#chatList').on('click','.chats',function(){
		var chatUser = new Object();
		chatUser.id = $(this).attr("userid");
		chatUser.classname = $(this).attr("classname");
		chatUser.bio = $(this).attr("bio");
		chatUser.nickname = $(this).find('h6').text();
		var profileStyle = $(this).find('.chatPic').attr("style");
		chatUser.profile = profileStyle.substr(profileStyle.indexOf('profile/')+8);
		chatUser.profile = chatUser.profile.substr(0,chatUser.profile.length-1);
		
		$('#curChatPic').attr('href','myPage.jsp?feed_id='+chatUser.id);
		$('#curChatPic').attr('style','background-image: url(images/profile/'+chatUser.profile+')');
		$('#curChatInfo').html('<h4>'+chatUser.nickname+'<span>'+chatUser.classname+'</span></h4>');
		$('#chatUserName').text(chatUser.nickname);
		$('#chatUserMail').text(chatUser.id);
		$('#chatUserIntro').text(chatUser.bio);
		$('#chatUserPic').attr('style','background-image: url(images/profile/'+chatUser.profile+')');
		$('#chatUserPic').attr('href','myPage.jsp?feed_id='+chatUser.id);
		
		getMessage(chatUser.id, chatUser.nickname);
		
	});
	
	$('#commentSend').on('click', function(){
		sendMessage();
	});
	
	// 알람 버튼 이벤트 수행시 목록 받아 붙이기
	$(".alarmBtn").click(function(){
		getAlarm();
	});
	
	// 알람에서 학급승인 처리 이벤트
	$("#alarmWrap").on("click","button", function(){
		// 승인을 하든 거절을 하든 해당 알람은 삭제된다.
		$(this).parent().remove();
		
		var targetId = $(this).parent().attr("targetId");
		var approve;
		
		if($(this).children('i').hasClass("red")){
			approve = 'false';
		}else{
			approve = 'true';		
		}
		
		$.ajax({
			url : '/playddit/users/approveClass.do',
			type : 'post',
			data : {'targetId' : targetId, 'approve' : approve},
			error : function(xhr){
				alert("status : " + xhr.status);
			},
		})
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


sendMessage = function(){
	
	var receiver = $('#chatUserMail').text();
	var content = document.getElementById('input_area').innerHTML;
	
	var from = '<div class="to">'
			+		'<div class="myBubble">'+content
			+		'</div>'
			+		'<p>now</p>'
			+	'</div>';
	$('#curChatBox').append(from);
	$('#input_area').empty();
	
	$('#chatList').children('.chats').each(function(){
		if($(this).attr("userid") == receiver){
			contShow = content;
			if(content.length > 18){
				contShow = contShow.substr(0,16)+'...';
			}
			$(this).find('.small').text(contShow);
		}
	})
	
	// 스크롤을 제일 아래로 내려준다.
	$('#curChatBox').scrollTop($('#curChatBox')[0].scrollHeight);
	
	$.ajax({
		url : '/playddit/message/sendMessage.do',
		type : 'post',
		data : {'receiver' : receiver, 'content' : content},
		error : function(xhr){
			alert("status : " + xhr.status);
		},
	})
}

getAudiences = function(){

	$.ajax({
		url : '/playddit/message/getAudiences.do',
		type : 'post',
		success : function(res){
			if(res.length == 0){
				var chatStart = '<div id="chatStart">'
								+	'<img src="images/message.png" />'
								+	'<p>친구에게 메시지를 보내보세요.</p>'
								+' </div>';
				$('#chatRight').html(chatStart);
			}
			$.each(res, function(i,v){
				if(v.content.length > 18){
					v.content = v.content.substr(0,16)+'...';
				}
				var chats = '<div class="chats" bio="'+v.bio+'" classname="'+v.classname+'" userid="'+v.id+'">'
							+	'<a class="chatPic" style="background-image: url(images/profile/'+v.profile+')">'
				         	+	'</a>'
                        	+	'<div class="chatInfo">'
							+		'<h6>'+v.nickname+'</h6>'
                        	+		'<p class="small">'+v.content+'</p>'
							+	'</div>'
                          	+	'</div>';
				$('#chatList').append(chats);
			})
			
			// 첫번째 유저 채팅기록 불러오며 함수 종료
			if(res.length != 0){
				$('#curChatPic').attr('href','myPage.jsp?feed_id='+res[0].id);
				$('#curChatPic').attr('style','background-image: url(images/profile/'+res[0].profile+')');
				$('#curChatInfo').html('<h4>'+res[0].nickname+'<span>'+res[0].classname+'</span></h4>');
				$('#chatUserName').text(res[0].nickname);
				$('#chatUserMail').text(res[0].id);
				$('#chatUserIntro').text(res[0].bio);
				$('#chatUserPic').attr('style','background-image: url(images/profile/'+res[0].profile+')');
				$('#chatUserPic').attr('href','myPage.jsp?feed_id='+res[0].id);
				
				getMessage(res[0].id, res[0].nickname);
			}
			
		},
		error : function(xhr){
			alert("status : " + xhr.status);
		},
		dataType : 'json'
	})
}

getMessage = function(audience, audience_nickname){
	
	$('#curChatBox').empty();
	
	$.ajax({
		url : '/playddit/message/getMessage.do',
		type : 'post',
		data : {'audience' : audience},
		success : function(msg){
			
			// 첫 메시지 날짜 출력 후 기억
			var date = msg[0].sentdate.substr(0,10);
			$('#curChatBox').append('<p class="chatDate">'+dateFormat(strToDate(date))+'</p>');
			
			$.each(msg, function(i,v){
				newDate = v.sentdate.substr(0,10);
				if(date != newDate){	// 날짜가 바뀔때마다 날짜를 찍어준다.
					date = newDate;
					$('#curChatBox').append('<p class="chatDate">'+dateFormat(strToDate(date))+'</p>');
				}
				if(v.sender == audience_nickname){
					var from = '<div class="from">'
							+		'<div class="bubble">'+v.content
						    +        '</div>'        
                        	+		'<p>'+v.sentdate.substr(11,5)+'</p>'
                        	+	'</div>';
				}else{
					var from = '<div class="to">'
							+		'<div class="myBubble">'+v.content
							+		'</div>'
							+		'<p>'+v.sentdate.substr(11,5)+'</p>'
							+	'</div>';
				}
				$('#curChatBox').append(from);
			})
			
			// 스크롤을 제일 아래로 내려준다.
			$('#curChatBox').scrollTop($('#curChatBox')[0].scrollHeight);
			
		},
		error : function(xhr){
			alert("status : " + xhr.status);
		},
		dataType : 'json'
	})
	
	
}

strToDate = function(str){	// 받아온 날짜 문자열을 date 객체로 변환 
	var strArr = str.split('-');
	return new Date(strArr[0], strArr[1]-1, strArr[2]);
}
dateFormat = function(date){	// date 객체를 원하는 포맷으로 출력 
	var week = new Array('Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat')
	var year = date.getFullYear();              //yyyy
    var month = (1 + date.getMonth());          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
	var dayName = week[date.getDay()];

    return  year + '.' + month + '.' + day +' ' + dayName;
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