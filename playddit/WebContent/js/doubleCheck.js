/**
 * 
 */


nickCheck = function(btn){
	nickvalue = $('#nickname').val().trim();
	$.ajax({
		url : '/playddit/users/nicknameCheck.do',
		type : 'post',
		data : { 'user_nickname' : nickvalue },
		success : function(res){
			if(res.result == '0'){
				$(btn).addClass("active"); 			
				alert("사용가능");
				return true;
			}else{
				alert("사용 불가능");
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
	
	idvalue = $('#mail').val().trim();
			
	if(idvalue.length < 1){
		alert("아이디를 입력하세요.");
		return false;
	}
	$.ajax({
		url : '/playddit/users/idCheck.do',
		type : 'post',
		data : { 'id' : idvalue },
		success : function(res){
			if(res.result == '0'){
				$(btn).addClass("active"); 			
				alert("사용가능");
				return true;
			}
			else{
				alert("사용 불가능");
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








