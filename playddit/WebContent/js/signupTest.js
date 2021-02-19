/**
 * 
 */


// 아이디 정규화(이메일형식)
function idCheck(){
		idvalue = $('#id').val().trim();
		
		// 형식
		regemail = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+(\.[a-zA-Z]+){1,2}$/;
		
		if(regemail.test(idvalue)){
			$('#idspan').text("올바른 형식입니다.").css('color', 'green');
		}else{
			$('#idspan').text("이메일 형식에 맞게 입력하세요.").css('color', 'red');
		}
}

// 비밀번호 정규화(영문대소문자, 숫자, 특수문자를 한개씩. 8~12글자)
function pwCheck(){
	pwvalue = $('#pw').val().trim();
	
	// 형식 - 영문대소문자, 숫자, 특수문자를 반드시 한개이상씩 입력
	passreg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[~!@#$%^&*()]).{8,12}$/;
	
	if(passreg.test(pwvalue)){
		$('#pwspan').text("올바른 형식입니다.").css('color', 'green');
	}else{
		$('#pwspan').text("비밀번호 형식에 맞게 입력하세요.").css('color', 'red');
	}
	
}

// 이름 정규화 (한글 2~5글자)
function nameCheck(){
	namevalue = $('#name').val().trim();
	
	// 형식 - 한글 2~5글자
	regname = /^[가-힣]{2,5}$/;
	
	if(regname.test(namevalue)){
		$('#namespan').text("올바른 형식입니다.").css('color', 'green');
	}else{
		$('#namespan').text("올바른 형식이 아닙니다.").css('color', 'red');
	}
}

// 핸드폰 번호 정규화(가운데 숫자 3or4글자 가능)
function phCheck(){
	phonevalue = $('#phone').val().trim();
	
	// 형식
	reghp = /^\d{3}-\d{3,4}-\d{4}$/;
	
	if(reghp.test(phonevalue)){
		$('#phonespan').text("올바른 형식입니다.").css('color', 'green');
	}else{
		$('#phonespan').text("올바른 형식이 아닙니다.").css('color', 'red');
		
	}

}

// 생년월일 정규화 (18세 이상 90세이하)
function birthCheck(){
	birthvalue = $('#birth').val();
	
	// 나이 체크
	birth = new Date(birthvalue);
	today = new Date();
	
	toyear = today.getFullYear();  // 현재 년도
	birthyear = birth.getFullYear(); // 입력한 년도
	
	year = toyear - birthyear;
	
	if(year >= 18 && year <= 90){
		$('#birthspan').text("가입 가능합니다.").css('color', 'green');
	}else{
		$('#birthspan').text("가입 불가능합니다.").css('color', 'red');
	}
}

















