function sendTempPass(){
	
	event.preventDefault(); // submit의 고유 기능 방지
 	
	let email = $('#findmail').val().trim();
	var regemail = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+(\.[a-zA-Z]+){1,2}$/;
	if(!regemail.test(email)){
		alert("이메일 형식에 맞게 입력해주세요.");
		return;
	}
	
	$.ajax({
		url : '/playddit/users/idCheck.do',
		type : 'post',
		data : { 'id' : email },
		success : function(res){
			let result = res.result;
			if(result=='1'){
				$('#msg').text('이메일 발송중입니다. 잠시만 기다려주세요.');
				sendTempPass2(email);
			}else{
				$('#msg').text('가입되지 않은 이메일 입니다.');
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}

function sendTempPass2(email){
	$.ajax({
		url : '/playddit/users/sendTempPass2.do',
		type : 'post',
		data : {'email' : email},
		success : function(res){
			if(res.result=='1'){
				alert(email+"로 이메일 전송이 완료되었습니다.");
				$("#modal").fadeOut(200);
				$('#msg').text('');
				$('#findmail').val('');
			}else{
				alert(res.result);
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
		
	})
}

function idPassCheck(){
	event.preventDefault(); // submit의 고유 기능 방지
	idvalue = $('#idCheck').val().trim();
	pwvalue = $('#passCheck').val().trim();
	
	if(idvalue.length < 1 || pwvalue.length < 1){
		alert("아이디 또는 비밀번호를 입력해주세요.");
		return;
	}
	
	var regemail = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+(\.[a-zA-Z]+){1,2}$/;
	if(!regemail.test(idvalue)){
		alert("이메일 형식에 맞게 아이디를 입력해주세요.");
		return;
	}
	
	if( $('#idchk').is(":checked")){
		rememberId();
	}else{
		forgetId();
	}
	
	$.ajax({
		url : '/playddit/users/match.do',
		type : 'post',
		data : { 'user_id': idvalue,
				 'user_pw' : pwvalue },
		success : function(res){
			if( res.id == 'null' ){
				alert("아이디나 비밀번호를 확인해주세요.");
			}else{
				alert("접속완료 !!! 아이디 : " + res.id + "닉네임 : "+res.nickname);
				location.href="./main.html";
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
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

function rememberId(){
	id = $('#idCheck').val().trim();
	setCookie("remember_id", id, 30);
}

function forgetId(){
	setCookie("remember_id",'',-1);
}







