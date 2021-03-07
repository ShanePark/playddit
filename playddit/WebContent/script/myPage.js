$(function(){			
	user_id = getCookie("user_id");
	feed_id = getParameterByName('feed_id');
	
	loadUserProfile(feed_id);
	loadUserFeeds(feed_id);
	
	
	// 팔로우 혹은 팔로잉 목록 불러오는 이벤트
	 $(".followBtn").click(function(){
        title = $(this).parent("li").children("p").text();
		if(title == "팔로워"){
			loadFollower();
		}else{
			loadFollowing();
		}
    });

	// 알람 버튼 이벤트 수행시 목록 받아 붙이기
	$(".alarmBtn").click(function(){
		getAlarm();
	});

	// 팔로우 버튼 이벤트
	$('.followList').on('click', '.followBtn', function(){
		$(this).remove();
		var targetId = this.getAttribute('follow');
		followFunc(targetId);
	})
	// 언팔로우 버튼 이벤트 
	$('.followList').on('click', '.unfollowBtn', function(){
		$(this).parents('li').remove();
		var targetId = this.getAttribute('follow');
		unfollowFunc(targetId);
	})
	
	
	
	/************************************************************************** 
	
								모달 이벤트 관련 함수들입니다
			
	***************************************************************************/

	//팔로우 목록 모달창
	var follow = $("#back2").is(":visible");

	$(".followBtn").click(function(){
		if(!follow){
			title = $(this).parent("li").children("p").text();
			
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
	
	

})






/************************************************************************** 

							여기부터 함수 선언부입니다. 
		
 ***************************************************************************/

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


loadFollower = function(){
	$('.followList').empty();
	$.ajax({
		url : '/playddit/users/followerList.do',
		type : 'post',
		data : {'id' : feed_id},
		success : function(res){
			$.each(res, function(i,v){
				var li = '<li>'
						+	'<a href=myPage.jsp?feed_id='+v.id+' class="followPic" nick="'+v.nickname+'">'
						+		 '<img src="images/profile/'+v.profile+'" />'
						+	'</a>'		
						+	'<div class="followInfo"> '
						+		'<a href=myPage.jsp?feed_id='+v.id+' nick="'+v.nickname+'">'
						+			'<p class="followName">'+v.nickname+'</p>'
						+			'<span class="followClass">'+v.department+'</span>'
						+		'</a>'
						+	'</div>';
						
				if(user_id == feed_id && v.followback == 0){
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
		data : {'id' : feed_id},
		success : function(res){
		$.each(res, function(i,v){
				var li = '<li>'
						+	'<a href=myPage.jsp?feed_id='+v.id+' class="followPic" nick="'+v.nickname+'">'
						+		 '<img src="images/profile/'+v.profile+'" />'
						+	'</a>'		
						+	'<div class="followInfo"> '
						+		'<a href=myPage.jsp?feed_id='+v.id+' nick="'+v.nickname+'">'
						+			'<p class="followName">'+v.nickname+'</p>'
						+			'<span class="followClass">'+v.department+'</span>'
						+		'</a>'
						+	'</div>';
						
				if(user_id == feed_id && v.followback == 0){
					li += '</div><button type="button" follow="'+v.id+'" class="f4f followBtn">Follow</button>'
				}else if(user_id == feed_id){
					li += '</div><button type="button" follow="'+v.id+'" class="f4f unfollowBtn">unfollow</button>'
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

followFunc = function(targetId){
	$.ajax({
		url : '/playddit/users/followUser.do',
		type : 'post',
		data : {'targetId' : targetId},
		success : function(res){
			// 프로필 쪽 숫자 바꾸기
			$('#myFollowing').children('span').text(res);

		},
		error : function(xhr){
			alert("status : " + xhr.status);
		},
		dataType : "text"
	})
}
unfollowFunc = function(targetId){
	$.ajax({
		url : '/playddit/users/unfollowUser.do',
		type : 'post',
		data : {'targetId' : targetId},
		success : function(res){
			// 모달창 숫자 바꾸기 
			$('.followTitle').find('span').text(res);
			
			// 프로필쪽 숫자 바꾸기
			$('#myFollowing').children('span').empty();
			$('#myFollowing').children('span').text(res);	
			
		},
		error : function(xhr){
			alert("status : " + xhr.status);
		},
		dataType : "text"
	})
}


function loadUserProfile(){
	$.ajax({
		url : '/playddit/users/loadUserProfile.do',
		type : 'post',
		data : {'feed_id' : feed_id},
		success : function(res){
			$('#myName').text(res.user_nickname);
			$('#myClass').text(res.classname2);
			$('#myIntro').text(res.user_bio);
			$('#myFeed').children('span').text(res.allfeed);
			$('#myFollower').children('span').text(res.follower);
			$('#myFollowing').children('span').text(res.following);
			var proPic = 'background-image: url(images/profile/'+res.user_pic+');'
			$('#myProfile').attr("style",proPic)
			
			if(user_id == feed_id){	// 본인의 페이지일경우 setting 버튼만 추가 
				var buttons = '<div id="mySet">'
					+ '<a id="setBtn"><i class="fas fa-cog"></i>Setting</a></div>';
				
				$('#myLeft').append(buttons);
			}else{	// 본인의 페이지가 아닐 경우 follow 버튼과 message 버튼 추가
				var buttons='<div id="btnBox"><div class="myIcon" id="toFollow">'
 					+ '<i class="fas fa-user"></i> <div class="button_su">'
                    + '<span class="su_button_circle"></span>'   	
                    + '<a href="#" class="button_su_inner">'        
                    + '<span class="button_text_container">Follow</span></a></div></div>'
                    + '<div class="myIcon"><i class="fas fa-envelope"></i>'     
                    + '<div class="button_su"><span class="su_button_circle"></span>'          
                    + '<a href="#" class="button_su_inner">'
                    + '<span class="button_text_container">Message</span>'    
                    + '</a></div></div></div>';    
				$('#myLeft').append(buttons);
			}
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}
function loadUserFeeds(){
	$.ajax({
		url : '/playddit/feed/loadUserFeeds.do',
		type : 'post',
		data : {'feed_id' : feed_id},
		success : function(feedList){
			$.each(feedList, function(i,feed){
				
				var thums = '<div class="thums" onclick=location.href="feedView.jsp?feedno='+feed.feed_no+'">'
						+		'<a class="thumCont" style="background-image: url(images/feed/' + feed.pic +');">';
				if(feed.pic === undefined){
					thums +='<p>'+feed.content+'</p>'
				}		
						
				thums +=		'</a>'
						+		'<div class="icons">'
						+			'<div class="heart">'
						+				'<i class="far fa-heart"></i>'
						+				'<span>'+feed.likes+'</span>'
						+			'</div>'
						+			'<div class="comment">'
						+				'<i class="far fa-comment"></i>'
						+				'<span>'+feed.comments+'</span>'
						+			'</div>'
						+		'</div>'
						+ '</div>'
				
				$('#thumsBox').append(thums);

			
			})
			
			var thumsW = $(".thums").width();
			$(".thums").height(thumsW + 40);
			$(".thums a").height(thumsW);
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}

/************************************************************************** 

					쿠키, 파라미터 획득 관련 함수입니다
		
 ***************************************************************************/

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

function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}