$(function(){
	user_id = getCookie("user_id");
	
	loadProfile();
	loadGroup();
	
	
	
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
	
	// 팔로우 혹은 팔로잉 목록 불러오는 이벤트
	 $(".followBtn").click(function(){
        title = $(this).parent("li").children(".th").text();
		if(title == "팔로워"){
			loadFollower();
		}else{
			loadFollowing();
		}
    });
		
	$('#logout').on('click', function(){
		logout();
	})

	// 팔로우 버튼 이벤트
	$('.followList').on('click', '.followBtn', function(){
		$(this).remove();
		var targetId = this.getAttribute('follow');
		follow(targetId);
	})
	// 언팔로우 버튼 이벤트 
	$('.followList').on('click', '.unfollowBtn', function(){
		$(this).parents('li').remove();
		var targetId = this.getAttribute('follow');
		unfollow(targetId);
	})
	
	// 알람 모달 
    $(".alarmBtn").click(function(){
		getAlarm();
        if(!visi){
            $("#alarmEdge2 , #alarmEdge, #modal").show();
            visi = true;
        }else{
            $("#alarmEdge2, #alarmEdge").hide();
            $("#modal").fadeOut(300);
            visi = false;
        }
    });
	
})

function loadGroup(){
	$.ajax({
		url : '/playddit/users/getGroup.do',
		error : function(xhr){
			if(xhr.status == 500){
				location.href="index.html";
				return false;
			}
			alert("status : " + xhr.status);
		},
		success : function(res){
			
			$.each(res, function(i,v){
				var li = '<li class="group"><a href="'+v.groupId+'">'
                    li += '<div class="groupCir"><img src="images/default.png"/></div>'
                    li += '<div class="groupInfo"><p class="groupName">'+v.name+'</p>'
                    if(v.type == 'class'){
						li += '<span class="mem">소속인원 '+v.num+'</span>'
					}else{
						li += '<span class="mem">스터디원 '+v.num+'</span>'
					}
						
                    li += '</div> </a> </li>'
				$('#myGroup').find('ul').append(li);
			})
			
		},
		dataType : 'json'
	})
}

function logout(){
	setCookie("user_id",'',-1);
	$.ajax({
		url : '/playddit/login/logout.do',
		error : function(xhr){
			alert("status : " + xhr.status);
		}
	})
	location.href="./index.html";
}

function loadProfile(){
	$.ajax({
		url : '/playddit/login/login.do',
		type : 'post',
		success : function(res){
			$('#allFeed').text(res.allfeed);
			$('#allFeed').attr("href",'myPage.jsp?feed_id='+res.user_id)
			$('#Follower').text(res.follower);	
			$('#Following').text(res.following);	
			$('#className').text(res.classname1);	
			$('#self').text(res.user_bio);
			$('#userName').text(res.user_nickname);
			$('#userName').attr("href",'myPage.jsp?feed_id='+res.user_id);
			$('#userPic').attr("href",'myPage.jsp?feed_id='+res.user_id);
			$('#userMail').text(res.user_id);
			$('#userPic').children('img').attr("src",'images/profile/'+res.user_pic);
			
			if(res.user_pic == null){
				res.user_pic = 'default.png';
			}
			
			
		},
		error : function(xhr){
			if(xhr.status == 500){
				location.href="index.html";
				return false;
			}
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})

}


loadFollower = function(){
	$('.followList').empty();
	$.ajax({
		url : '/playddit/users/followerList.do',
		type : 'post',
		data : {'id' : user_id},
		success : function(res){
			$.each(res, function(i,v){
				var li = '<li>';
				li += '<a href=myPage.jsp?feed_id='+v.id+' class="followPic" nick="'+v.nickname+'">';
				li += '<img src="images/profile/'+v.profile+'" /></a>';
				li += '<div class="followInfo"> <a href=myPage.jsp?feed_id='+v.id+' nick="'+v.nickname+'">';
				li += '<p class="followName">'+v.nickname+'</p>';
				li += '<span class="followClass">'+v.department+'</span></a></div>';
				if(v.followback == 0){
					li += '</div><button type="button" follow="'+v.id+'" class="f4f followBtn">Follow</button>'
				}
				li += '</li>';
				$('.followList').append(li);
			})
		},
		error : function(xhr){
			alert("status : " + xhr.status);
		},
		dataType : 'json'
	})
}

loadFollowing = function(){
	$('.followList').empty();
	$.ajax({
		url : '/playddit/users/followingList.do',
		type : 'post',
		data : {'id' : user_id},
		success : function(res){
			$.each(res, function(i,v){
				var li = '<li>';
				li += '<a href=myPage.jsp?feed_id='+v.id+' class="followPic" nick="'+v.nickname+'">';
				li += '<img src="images/profile/'+v.profile+'" /></a>';
				li += '<div class="followInfo"> <a href=myPage.jsp?feed_id='+v.id+' nick="'+v.nickname+'">';
				li += '<p class="followName">'+v.nickname+'</p>';
				li += '<span class="followClass">'+v.department+'</span></a></div>';
				if(v.followback == 0){
					li += '</div><button type="button" follow="'+v.id+'" class="f4f followBtn">Follow</button>'
				}else{
					li += '</div><button type="button" follow="'+v.id+'" class="f4f unfollowBtn">Unfollow</button>'
					
				}
				li += '</li>';
				$('.followList').append(li);
			})
		},
		error : function(xhr){
			alert("status : " + xhr.status);
		},
		dataType : 'json'
	})
}

follow = function(targetId){
	$.ajax({
		url : '/playddit/users/followUser.do',
		type : 'post',
		data : {'targetId' : targetId},
		success : function(res){
			// 프로필 쪽 숫자 바꾸기
			$('#Following').empty();
			$('#Following').append(res);

		},
		error : function(xhr){
			alert("status : " + xhr.status);
		},
		dataType : "text"
	})
}
unfollow = function(targetId){
	$.ajax({
		url : '/playddit/users/unfollowUser.do',
		type : 'post',
		data : {'targetId' : targetId},
		success : function(res){
			// 모달창 숫자 바꾸기 
			$('.followTitle').find('span').empty();
			$('.followTitle').find('span').append(res);
			
			// 프로필쪽 숫자 바꾸기
			$('#Following').empty();
			$('#Following').append(res);	
			
		},
		error : function(xhr){
			alert("status : " + xhr.status);
		},
		dataType : "text"
	})
}

getAlarm = function(){
	
	$.ajax({
		url : '/playddit/alarm/getAlarm.do',
		success : function(res){
			var alarm = '';
			$.each(res, function(i,v){
				
				if(v.type == 10){	// 학급 승인 관련 알람일경우
					alarm += '<div class="alarm classMoniter" targetId="'+v.sender+'" alarmno="'+v.alarm_no+'"">'
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
					alarm += '<div class="alarm" alarmno="'+v.alarm_no+'">'
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
			alert("status : " + xhr.status);
		},
		dataType : 'json'
	})
}

function setCookie(name, value, exp){
	var date = new Date();
	date.setTime(date.getTime() + exp*24*60*60*1000);
	document.cookie = name+'='+escape(value)+';expires='+date.toUTCString()+';path=1';
}

function getCookie(name) {
  const value = `; ${document.cookie}`;
  const parts = value.split(`; ${name}=`);
  if (parts.length === 2) return unescape(parts.pop()).split(';').shift();
}
