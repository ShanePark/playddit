function sendTempPass(){
 	let email = $('#findmail').val().trim();
	
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











