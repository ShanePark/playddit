/**
 * 
 */
$(function(){	
	var resentTime = new Date();
			
	$('#subCode').on('click', function(){
		event.preventDefault();
		codeCheck();
	})
		
	$('#remail').on('click', function(){
		var waitTime = 10;
		if((new Date() - resentTime) < 10 * 1000){
		alert("인증코드를 재발송하려면" + waitTime + "초를 기다려야합니다." + (Math.round((waitTime * 1000 - (new Date() - resentTime))/1000)) + "초 남음");
		
		return false;
	}
			
		resentTime = new Date();
		sendCode();
			
	})
		
})

codeCheck = function(){
		
	const code = $('input[name=code]').val().trim();
	
	$.ajax({
		url : '/playddit/join/codeCheck.do',
		type : 'post',
		data : { 'code' : code},
		success : function(res){
			if(code == res){
				alert("코드가 일치합니다.");
				$('input[name=code]').val('');
				join();
			}else{
				alert("코드가 일치하지 않습니다. 올바른 코드를 입력해주세요.");
				$('input[name=code]').val('');
			}
		},
		error : function(xhr){
			alert("status : " + xhr.status);
		},
		dataType : 'text'
	})
	
}
	
function sendCode(){
		
	$.ajax({
		url : '/playddit/join/sendCode.do',
		type : 'post',
		success : function(res){
			if(res == '1'){
				alert("인증코드가 전송되었습니다. 메일을 확인해주세요.");
			}else
				alert("인증코드 전송에 실패했습니다.");
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}
	
function join(){
	var pick1 = getCookie("pick1");
	var pick2 = getCookie("pick2");
	var pick3 = getCookie("pick3");		
		
	$.ajax({
		url : '/playddit/join/join.do',
		type : 'post',
		data : { 
				'pick1' : pick1,
				'pick2' : pick2,
				'pick3' : pick3
		},
		success : function(res){
			if(res == '1'){
				alert("회원 가입 성공");	
	
				$("#codeModal").animate({marginTop:"300px"},300);
				$("#modal").delay(100).fadeOut(300);

				location.href="/playddit/play.html";

			}else if(res == '0'){
				alert("회원 가입 실패");
				
				$("#codeModal").animate({marginTop:"300px"},300);
				$("#modal").delay(100).fadeOut(300);
				
				location.href="/playddit/conditions.html";
			}else{
				location.href = "/playddit/index.html";		
			}
		},
		error : function(xhr){
			alert('상태 : ' + xhr.status);
		},
		dataType : 'json'
	})
}
	
// 쿠키 저장
function setCookie(name, value, exp){
	var date = new Date();
	date.setTime(date.getTime() + exp*24*60*60*1000);
	document.cookie = name+'='+escape(value)+';expires='+date.toUTCString()+';path=1';
}
	
// 저장한 쿠키 가져오기
	function getCookie(name) {
	  const value = `; ${document.cookie}`;
	  const parts = value.split(`; ${name}=`);
	  if (parts.length === 2) return unescape(parts.pop()).split(';').shift();
}