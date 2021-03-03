$(function(){
	
	 $(".followBtn").click(function(){
        title = $(this).parent("li").children(".th").text();
	
		if(title == "팔로워"){
			loadFollower();
		}else{
			loadFollowing();
		}
    });

	loadProfile();
	getAlarm();
		
	$('#logout').on('click', function(){
		logout();
	})
	

	$('.followList').on('click', '.followBtn', function(){
		var targetId = this.getAttribute('follow');
		follow(this, targetId);
	})
	$('.followList').on('click', '.unfollowBtn', function(){
		var targetId = this.getAttribute('follow');
		unfollow(this, targetId);
	})
	
})

function logout(){
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
			$('#allFeed').append(res.allfeed);	
			$('#Follower').append(res.follower);	
			$('#Following').append(res.following);	
			$('#className').append(res.className);	
			$('#self').append(res.user_bio);
			
			if(res.user_pic == null){
				res.user_pic = 'default.png';
			}
			
			var profile = '<a href="#" id="userPic">'
			+'<img src="images/profile/'+res.user_pic+'"+ /></a>'
			+'<div id="userBox">'
			+' <a href="#" id="userName">'+res.user_nickname+'</a>'
			+'<span id="userMail">'+res.user_id+'</span></div>'
				
			$('#infoBox').append(profile);
			
		},
		error : function(xhr){
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
		success : function(res){
			$.each(res, function(i,v){
				var li = '<li>';
				li += '<a href="/playddit/users/personalFeed?id='+v.id+'" class="followPic" nick="'+v.nickname+'">';
				li += '<img src="images/profile/'+v.profile+'" /></a>';
				li += '<div class="followInfo"> <a href="/playddit/users/personalFeed?id='+v.id+'" nick="'+v.nickname+'">';
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
		success : function(res){
			$.each(res, function(i,v){
				var li = '<li>';
				li += '<a href="/playddit/users/personalFeed?id='+v.id+'" class="followPic" nick="'+v.nickname+'">';
				li += '<img src="images/profile/'+v.profile+'" /></a>';
				li += '<div class="followInfo"> <a href="/playddit/users/personalFeed?id='+v.id+'" nick="'+v.nickname+'">';
				li += '<p class="followName">'+v.nickname+'</p>';
				li += '<span class="followClass">'+v.department+'</span></a></div>';
				if(v.followback == 0){
					li += '</div><button type="button" follow="'+v.id+'" class="f4f followBtn">Follow</button>'
				}else{
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

follow = function(button, targetId){
	$.ajax({
		url : '/playddit/users/followUser.do',
		type : 'post',
		data : {'targetId' : targetId},
		success : function(res){
			// 모달창 숫자 바꾸기 
			$('.followTitle').find('span').empty();
			$('.followTitle').find('span').append(res);
			
			// 프로필 쪽 숫자 바꾸기
			if(title == "팔로잉"){
				$('#Following').empty();
				$('#Following').append(res);	
				loadFollowing();
			}else{
				// 팔로워 보는 모달일경우 follow 버튼만 삭제한다.
				button.remove();
			}
		},
		error : function(xhr){
			alert("status : " + xhr.status);
		},
		dataType : "text"
	})
}
unfollow = function(button, targetId){
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
			
			// unfollow는 어차피 following 목록에서만 가능하다.
			loadFollowing();
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
				alarm += '<div class="alarm">';
				alarm += '<a class="alarmUser" href="'+v.sender+'"><img src="images/profile/'+ v.sender_pic +'" /></a>'
				alarm += '<a class="alarmCont" href="#"><span class="alarmNick">'+ v.cont +'</span>'
				switch(v.type){
				case 11: alarm += '님이 나를 follow 하기 시작했습니다.'
					break;
				case 12: alarm += '님이 새로운 메시지를 보냈습니다.'
					break;
				case 21: alarm += '님이 내가 쓴 글을 좋아합니다.'
					break;
				case 22: alarm += '님이 내가 쓴 글에 댓글을 남겼습니다.'
					break;
				case 31: alarm += '에 새로운 공지사항이 올라왔습니다.'
					break;
				}
				alarm += '</a></div>';
			})
			$('#alarmWrap').append(alarm);
		},
		error : function(xhr){
			alert("status : " + xhr.status);
		},
		dataType : 'json'
	})
}
