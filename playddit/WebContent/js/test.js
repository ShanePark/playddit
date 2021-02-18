function idcheck(){
	idvalue = $('#id').val().trim();
			
	if(idvalue.length < 1){
		alert("아이디를 입력하세요.");
		return false;
	}
	$.ajax({
		url : '/playddit/idCheck.do',
		type : 'post',
		data : { 'id' : idvalue },
		success : function(res){
			$('#idspan').html(res.result).css('color', 'green');
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}

function followingList(){
	var idvalue = $('#followingList').val().trim();
	
	if(idvalue.length < 1){
		$('#flspan').html("조회할 아이디를 입력하세요.");
		return;
	}
	
	$.ajax({
		url : '/playddit/followingList.do',
		type : 'post',
		data : { 'user_id' : idvalue},
		success : function(res){
			var code="<br>조회하신 "+idvalue+"의 팔로잉 리스트는 다음과 같습니다.<br>";
			$.each(res, function(i,v){
				code+= "<p> 아이디 : "+v.id;
				code+= ",이름 : "+v.name;
				code+= ",닉네임 : "+v.nickname+"</p>"
			})
			
			$('#flspan').html(code);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}

function idPassCheck(){
	idvalue = $('#idCheck').val().trim();
	pwvalue = $('#passCheck').val().trim();
	
	if(idvalue.length < 1 || pwvalue.length < 1){
		$('#idPassSpan').html("아이디 또는 비밀번호를 입력해주세요.");
		return;
	}
	
	$.ajax({
		url : '/playddit/match.do',
		type : 'post',
		data : { 'user_id': idvalue,
				 'user_pw' : pwvalue },
		success : function(res){
			if( res.id == 'null' ){
				code = "아이디나 비밀번호를 확인해주세요.";
			}else{
				code = "아이디 : " + res.id;	
				code += "닉네임 : " + res.nickname;
			}
			
			$('#idPassSpan').html(code);
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
	setCookie("id", id, 30);
}

function forgetId(){
	setCookie("id",'',-1);
}















