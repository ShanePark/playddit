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