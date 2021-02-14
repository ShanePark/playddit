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