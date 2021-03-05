$(function(){			
	user_id = getCookie("user_id");
	var feed_id = getParameterByName('feed_id');
	
	loadUserProfile(feed_id);
	loadUserFeeds(feed_id);
})






/************************************************************************** 

							여기부터 함수 선언부입니다. 
		
 ***************************************************************************/

function loadUserProfile(feed_id){
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
function loadUserFeeds(feed_id){
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

function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}