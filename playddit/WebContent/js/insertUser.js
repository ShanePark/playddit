/**
 * 
 */

function codeSubmit(){
	//event.preventDefault();
	mail = $('input[name=mail]').val().trim();
	nickname = $('input[name=nickname]').val().trim();
	pass = $('input[name=pass]').val().trim();
	name = $('input[name=name]').val().trim();
	phone = $('input[name=phone]').val().trim();
	birth = $('input[name=birth]').val().trim();
	class_id = $('select[name=itemclass]').val();

	if(class_id === undefined){
		class_id = 'C000';
	}

	$.ajax({
		url : '/playddit/join/joinSessionAdd.do',
		type : 'post',
		data : { 
				 'mail' : mail,
				 'nickname' : nickname,
				 'pass' : pass,
				 'name' : name,
				 'phone' : phone,
				 'birth' : birth,
				 'class_id' : class_id
		},
		success : function(res){
			if(res == '1'){
				alert(mail +"로 인증코드가 전송되었습니다. 메일을 확인해주세요.");
			}else
				alert("인증코드 전송에 실패했습니다.");
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'	
	})
}
