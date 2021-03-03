$(function(){
	loadProfile();
	loadFollower();
	loadFollowing();
		
	$('#logout').on('click', function(){
		logout();
	})
	

	$('.followList').on('click', '.followBtn', function(){
		var targetId = this.getAttribute('follow');
		follow(targetId);
	})
	$('.followList').on('click', '.unfollowBtn', function(){
		var targetId = this.getAttribute('follow');
		unfollow(targetId);
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
	$('.followList').empty();
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

follow = function(targetId){
	$.ajax({
		url : '/playddit/users/followUser.do',
		type : 'post',
		data : {'targetId' : targetId},
		success : function(res){
			$('.followTitle').find('span').empty();
			$('.followTitle').find('span').append(res);
			loadFollowing();
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
			$('.followTitle').find('span').empty();
			$('.followTitle').find('span').append(res);
			loadFollowing();
		},
		error : function(xhr){
			alert("status : " + xhr.status);
		},
		dataType : "text"
	})
}
