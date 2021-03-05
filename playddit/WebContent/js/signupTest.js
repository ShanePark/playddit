/**
 * 
 */
// class 정보 출력하기

selectClass = function(){
	$.ajax({
		url : '/playddit/join/getClassList.do',
		type : 'get',
		success : function(res){
			code = "";
//            code += "<select name='itemclass'>";
//            code += "<option value='C000'>Choose your class</option>";
//            code += "<option value='C000'>소속 학급 없음</option>";
			code += "<ul class='itemclass'>";
			code += "<li id='classCho' idx='C000'>Choose your class";
			code += "<ul>"
			code += "<li idx='C000'>소속 학급 없음</li>";
			$.each(res, function(i, v){
                //code += "<option value=" + v.class_id +"> " + v.classname + "</option>"; 
				code += "<li idx=" + v.class_id +"> " + v.classname + "</li>"; 
			})
//			code += "</select>";
			code += "</ul>";
			code += "</li>";
			code += "</ul>";
			$('#tagChange').html(code);
		},
		error : function(xhr){
			alert('상태 : ' + xhr.status);
		},
		dataType : 'json'
	})
}

//////////////////////////////////////////////////////////////////////////////////////////

// 아이디 정규화(이메일형식)
idCheck = function() {
	idvalue = $('input[name=mail]').val();

	// 형식
	regemail = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9]+(\.([a-zA-Z]){2,3}){1,2}$/;

	///^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;

	if (!regemail.test(idvalue)) {
		$('input[name=mail]').parents('.box').find('.msg').text("이메일 형식에 맞게 입력하세요.");
		return false;
	} else {
		$('input[name=mail]').parents('.box').find('.msg').empty();
		return true;
	}
}

// 비밀번호 정규화(영문대소문자, 숫자, 특수문자를 한개씩. 8~12글자)
pwCheck = function() {
	pwvalue = $('input[name=pass]').val().trim();

	// 형식 - 영문대소문자, 숫자, 특수문자를 반드시 한개이상씩 입력
	passreg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[~!@#$%^&*()]).{8,12}$/;

	if (!passreg.test(pwvalue)) {
		$('input[name=pass]').parents('.box').find('.msg').text("비밀번호 형식에 맞게 입력하세요.");
	} else {
		$('input[name=pass]').parents('.box').find('.msg').empty();
	}

}

// 이름 정규화 (한글 2~5글자)
function nameCheck() {
	namevalue = $('input[name=name]').val().trim();

	// 형식 - 한글 2~5글자
	regname = /^[가-힣]{2,5}$/;

	if (!regname.test(namevalue)) {
		$('input[name=name]').parents('.box').find('.msg').text("올바른 형식이 아닙니다.").css(
				'color', 'red');
	} else {
		$('input[name=name]').parents('.box').find('.msg').empty();
	}
}

// 핸드폰 번호 정규화(가운데 숫자 3or4글자 가능)
function phCheck() {
	phonevalue = $('input[name=phone]').val().trim();

	// 형식
	reghp = /^\d{3}\d{3,4}\d{4}$/;

	if (!reghp.test(phonevalue)) {
		$('input[name=phone]').parents('.box').find('.msg').text("올바른 형식(-없이 입력해주세요.)이 아닙니다.");
	} else {
		$('input[name=phone]').parents('.box').find('.msg').empty();

	}

}

// 생년월일 정규화 (18세 이상 90세이하)
function birthCheck() {
	birthvalue = $('input[name=birth]').val();

	// 나이 체크
	birth = new Date(birthvalue);
	today = new Date();

	toyear = today.getFullYear(); // 현재 년도
	birthyear = birth.getFullYear(); // 입력한 년도

	year = toyear - birthyear;

	if (year >= 18 && year <= 90) {
		$('input[name=birth]').parents('.box').find('.msg').empty();
	} else {
		$('input[name=birth]').parents('.box').find('.msg').text("가입 불가능합니다.");
	}
}
