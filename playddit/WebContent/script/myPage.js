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