$(function(){
	getClassChatInfo();
	getAudiences();
	chatTarget = 'class';
	
	// 친구 검색해서 클릭할때 일어날 이벤트
	$('#userList').on('click','li',function(){
		chatTarget = 'user';
		$('#userList').empty();
		$('#input_area').empty();
		$('#curChatBox').empty();
		
		// 모달 닫기
        $('body').removeClass('scrollOff').off('scroll touchmove mousewheel');
        $("#createModal").animate({marginTop : "100px"},400);
        $("#createBack").delay(200).fadeOut(200);
		
		var msgcount = $(this).attr("msgcount");
		var user_id = $(this).attr("user_id");
		var profile = $(this).attr("profile");
		var nickname = $(this).attr("nickname");
		var bio = $(this).attr("bio");
		var classname = $(this).attr("classname");
		
		$('#curChatPic').attr('href','myPage.jsp?feed_id='+user_id);
		$('#curChatPic').attr('style','background-image: url(images/profile/'+profile+')');
		$('#curChatInfo').html('<h4>'+nickname+'<span>'+classname+'</span></h4>');
		$('#chatUserName').text(nickname);
		$('#chatUserMail').text(user_id);
		$('#chatUserIntro').text(bio);
		$('#chatUserPic').attr('style','background-image: url(images/profile/'+profile+')');
		$('#chatUserPic').attr('href','myPage.jsp?feed_id='+user_id);
		
		if(msgcount != 0){
			getMessage(user_id,nickname);
		}
		
	})
	
	// 채팅 목록에서 학급 클릭시 
	$('#chatList').on('click','.groupchat',function(){
		chatTarget = 'class';
		getClassMessage();
	})
	
	// 채팅 목록에서 유저 클릭시 
	$('#chatList').on('click','.chats',function(){
		
		// 학급클릭이면 돌려 보낸다.
		if($(this).hasClass('groupchat')){
			return false;
		}
		chatTarget = 'user';
		
		$('#input_area').empty();
		
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
		
		// 전송 버튼 눌렀을때 학급일경우 분기시켜야 합니다.
		if(chatTarget == 'class'){
			sendClassMessage();
		}else if(chatTarget == 'user'){
			sendMessage();
		}
		
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
sendClassMessage = function(){
	
	var content = document.getElementById('input_area').innerHTML;
	
	var from = '<div class="to">'
			+		'<div class="myBubble">'+content
			+		'</div>'
			+		'<p>now</p>'
			+	'</div>';
	$('#curChatBox').append(from);
	$('#input_area').empty();
	
	contShow = content;
			if(content.length > 18){
				contShow = contShow.substr(0,16)+'...';
			}
	$('#chatList').children('.groupchat').find('.small').text(contShow);
	
	
	// 스크롤을 제일 아래로 내려준다.
	$('#curChatBox').scrollTop($('#curChatBox')[0].scrollHeight);
	
	$.ajax({
		url : getContextPath()+'/message/sendMessageClass.do',
		type : 'post',
		data : {'content' : content},
		error : function(xhr){
			alert("status : " + xhr.status);
		},
	})	
}

getClassMessage = function(){
	var title = $('#chatList').children('.groupchat').attr("title");
	var title2 = $('#chatList').children('.groupchat').attr("title2");
	var class_id = $('#chatList').children('.groupchat').attr("class_id");
	
	$('#curChatPic').attr('href','#');
	$('#curChatPic').attr('style','background-image: url(images/class.jpeg)');
	$('#curChatInfo').html('<h4>'+title+'<span>'+title2+'</span></h4>');
	$('#chatUserName').text(title);
	$('#chatUserMail').text(title2);
	$('#chatUserIntro').text('학급 채팅입니다.');
	$('#chatUserPic').attr('style','background-image: url(images/class.jpeg)');
	$('#chatUserPic').attr('href','#');
		
	$.ajax({
		url : getContextPath()+'/message/getClassMessage.do',
		type : 'post',
		error : function(xhr){
			if(xhr.status == 500){
				location.href="index.html";
				return false;
			}
			alert("status : " + xhr.status);
		},
		success : function(msg){
			$('#curChatBox').empty();
			// 첫 메시지 날짜 출력 후 기억
			var date = "";
			if(msg.length>0){
				date = msg[0].sentdate.substr(0,10);
				$('#curChatBox').append('<p class="chatDate">'+dateFormat(strToDate(date))+'</p>');
			}
			
			
			$.each(msg, function(i,v){
				newDate = v.sentdate.substr(0,10);
				if(date != newDate){	// 날짜가 바뀔때마다 날짜를 찍어준다.
					date = newDate;
					$('#curChatBox').append('<p class="chatDate">'+dateFormat(strToDate(date))+'</p>');
				}
				if(v.isMine== 0){
					var from = '<div class="from">'
							+		'<a href="#" id="curChatPic" style="background-image: url(images/class.jpeg);"></a>'
							+		'<h4>'+v.sender+'</h4>'
							+		'<div class="bubble">'
							+			v.content	
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
		dataType : 'json'
	})
}
getClassChatInfo = function(){
	$.ajax({
		url : getContextPath()+'/message/getClassChatInfo.do',
		type : 'post',
		error : function(xhr){
			if(xhr.status == 500){
				location.href="index.html";
				return false;
			}
			alert("status : " + xhr.status);
		},
		success : function(res){
			var chats = '<div class="chats groupchat" class_id='+res.group_id+' title="'+res.title+'" title2="'+res.title2+'">'
						+	'<a class="chatPic" style="background-image: url(images/class.jpeg)">'
			         	+	'</a>'
                    	+	'<div class="chatInfo">'
						+		'<h6>'+res.title2+'</h6>'
                    	+		'<p class="small">'+res.lastmsg+'</p>'
						+	'</div>'
                      	+	'</div>';
			$('#chatList').prepend(chats);
			
			getClassMessage();

		},
		dataType : 'json'
	})

}
chatSearch = function(){
	event.preventDefault();
	
	// 일단 모달 띄우고
	$('body').addClass('scrollOff').on('scroll touchmove mousewheel', function(e){
        e.preventDefault();
    });
    $("#createBack").fadeIn(200);
    $("#createModal").delay(200).animate({marginTop : "0"},400);
	
	var keyword = $('#chatSearch').find('input').val();
	$('#createModal').find('input').val(keyword);
	createChat();
}

createChat = function(){
	event.preventDefault();
	var keyword = $('#createModal').find('input').val();
	$.ajax({
		url : getContextPath()+'/message/searchToChat.do',
		type : 'post',
		data : {'keyword' : keyword},
		error : function(xhr){
			if(xhr.status == 500){
				location.href="index.html";
				return false;
			}
			alert("status : " + xhr.status);
		},
		success : function(res){
			$('#userList').empty();
			
			$.each(res,function(i,v){
				var audienceLi = '<li msgCount="'+v.content+'" user_id="'+v.id+'" profile="'+v.profile+'" nickname="'+v.nickname+'" bio="'+v.bio+'" classname="'+v.classname+'">'
								+	'<div class="userPic" style="background-image: url(images/profile/'+v.profile+')"></div>'
								+ 		'<div class="userInfo">'
								+			'<h6>'+v.nickname+' <span>'+v.classname+'</span></h6>'
				                +			'<p>'+v.id+'</p>'    
                        		+		'</div>'
								+'</li>';
				$('#userList').append(audienceLi);
			})
		},
		dataType : 'json'
	})
}

sendMessage = function(){
	
	var receiver = $('#chatUserMail').text();
	var content = document.getElementById('input_area').innerHTML;
	
	// 첫 메시지일 경우에 왼쪽에 chats div 새로 하나 만들어 prepend 해준다.
	var isFirst = true;
	$('#chatList').children('.chats').each(function(){
		if($(this).attr("userid") == receiver){
			isFirst = false;
		}
	})
	if(isFirst){
		var newProStyle = $('#curChatPic').attr("style");
		newProfile = newProStyle.substr(newProStyle.indexOf('profile/')+8);
		newProfile = newProfile.substr(0,newProfile.length-1);
		
		newClassname=$('#curChatInfo').find('span').text();
		newNick=$('#chatUserName').text();
		newBio=$('#chatUserIntro').text();
		
		var chats = '<div class="chats" bio="'+newBio+'" classname="'+newClassname+'" userid="'+receiver+'">'
				+	'<a class="chatPic" style="background-image: url(images/profile/'+newProfile+')">'
	         	+	'</a>'
            	+	'<div class="chatInfo">'
				+		'<h6>'+newNick+'</h6>'
            	+		'<p class="small">'+content+'</p>'
				+	'</div>'
              	+	'</div>';
		$('#chatList').prepend(chats);
	}
	
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
			return false;
		}
	})
	
	// 스크롤을 제일 아래로 내려준다.
	$('#curChatBox').scrollTop($('#curChatBox')[0].scrollHeight);
	
	$.ajax({
		url : getContextPath()+'/message/sendMessage.do',
		type : 'post',
		data : {'receiver' : receiver, 'content' : content},
		error : function(xhr){
			alert("status : " + xhr.status);
		},
	})
}

getAudiences = function(){

	$.ajax({
		url : getContextPath()+'/message/getAudiences.do',
		type : 'post',
		success : function(res){

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

getMessage = function(audience, audience_nickname){
	
	$('#curChatBox').empty();
	
	$.ajax({
		url : getContextPath()+'/message/getMessage.do',
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
