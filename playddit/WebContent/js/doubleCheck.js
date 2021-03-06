/**
 * 
 */

nickCheck = function(btn){
	nickvalue = $('input[name=nickname]').val().trim();
	$.ajax({
		url : '/playddit/users/nicknameCheck.do',
		type : 'post',
		data : { 'user_nickname' : nickvalue },
		success : function(res){
			if(res == null){
				$(btn).addClass("active"); 			
				return true;
			}else{
				$('input[name=nickname]').parents('.box').find('.msg').text("이미 사용중인 닉네임 입니다.");
				return false;
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}

idDcheck = function(btn){
	
	idvalue = $('input[name=mail]').val().trim();
			
	if(idvalue.length < 1){
		alert("아이디를 입력하세요.");
		return false;
	}
	$.ajax({
		url : '/playddit/users/idCheck.do',
		type : 'post',
		data : { 'id' : idvalue },
		success : function(res){
			if(res == null){
				$(btn).addClass("active"); 			
				return true;
			}
			else{
				$('input[name=mail]').parents('.box').find('.msg').text("이미 사용중인 이메일 입니다.");
				return false;
			}

		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}

var checkMail = "";
function resetMail(){
	if(checkMail != idvalue || idDCheck != "사용 가능 Id"){
		alert("ID가 중복거나 변경되었습니다. 새로운 ID를 입력하세요.");
		$(btn).addClass("active");
		return false;	// 서버로 전송을 취소한다.
	}
}

