$(function(){
	user_id = getCookie("user_id");
	
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
	
	// 알람 모달 
    $(".alarmBtn").click(function(){
		getAlarm();
    });
	
})

// 검색 기능
function searchFunc(){
	event.preventDefault();
	var keyword = $('#search').find('input').val();
	$('#keyword').text(keyword);
	
	$.ajax({
		url : '/playddit/message/searchToChat.do',
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
			$('#searchUser').empty();
			$('#count').find('span').text(res.length);
			
			$.each(res,function(i,v){
				var addLi='<li>'
						+	'<a href=myPage.jsp?feed_id='+v.id+' user="scarlet" class="feedCir">'
						+		'<img src="images/profile/'+v.profile+'" />'
				 		+	'</a>'
						+	'<a href=myPage.jsp?feed_id='+v.id+' class="searchUserBox">'
						+		' <span href="#" user="'+v.nickname+'" class="userNick">'
						+			v.nickname
						+		'</span>'
                        +		'<span class="userEmail">'+v.id+'</span>'
                       	+	'</a>'       
						+'</li>'
				$('#searchUser').append(addLi);
			})
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
					case 12: alarm += '<a class="alarmCont" href="chat.jsp"><span class="alarmNick">'+ v.cont +'</span>'
									+'님이 새로운 메시지를 보냈습니다.'
						break;
					case 21: alarm += '<a class="alarmCont" href=myPage.jsp?feed_id='+user_id+'><span class="alarmNick">'+ v.cont +'</span>'
									+'님이 내가 쓴 글을 좋아합니다.'
						break;
					case 22: alarm += '<a class="alarmCont" href=myPage.jsp?feed_id='+user_id+'><span class="alarmNick">'+ v.cont +'</span>'
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
