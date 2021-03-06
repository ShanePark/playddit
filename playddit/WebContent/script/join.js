/**
 * 
 */
	$(function(){	

		var resentTime = new Date();
		
		selectClass();
		
		// id(email) check
		$('input[name=mail]').on('keyup', function() {
			idCheck();
		})
	
		//id(email) doubleCheck
		$('#idDbtn').on('click', function() {
			if (idCheck()) {
			idDcheck(this);
		} else {
			//msg에 이메일 형식에 맞게 입력하세요. 출력 해주세요.
			$('input[name=mail]').parents('.box').find('.msg').text("이메일 형식에 맞게 입력하세요.");
			return false;
			}
		})
	
		$('input[name=mail]').change(function() {
			$('#idDbtn').removeClass("active");
		})

		// nickname check
		$('input[name=nickname]').on('keyup', function() {
			nickvalue = $('input[name=nickname]').val().trim();

			if (nickvalue.length < 2 || nickvalue.length > 8) {
				$('input[name=nickname]').parents('.box').find('.msg').text("2글자 이상 8글자 이하로 입력하세요.");
					return false;
				}
				wordchk(nickvalue);
			})

		// nickname doubleCheck
		$('#nickDbtn').on('click', function() {
			nickvalue = $('input[name=nickname]').val().trim();
			if (nickvalue.length < 2 || nickvalue.length > 8) {
				$(this).parents('.box').find('.msg').text("닉네임 형식을 확인해주세요.");
			} else {
				nickCheck(this);
			}
		})

		$('input[name=nickname]').change(function() {
			$('#nickDbtn').removeClass("active");
		})

		// password check
		$('input[name=pass]').on('keyup', function() {
			pwvalue = $('input[name=pass]').val().trim();
			if (pwvalue.length < 8 || pwvalue.length > 12) {
				$('input[name=pass]').parents('.box').find('.msg').text("8글자 이상 12글자 이하로 입력하세요.");
			} else {
				pwCheck();
			}
		})

		// password recheck
		$('input[name=passchk]').on('keyup', function() {
			pwChkvalue = $('input[name=passchk]').val().trim();
			if (pwvalue != pwChkvalue) {
				$('input[name=passchk]').parents('.box').find('.msg').text("비밀번호가 일치하지 않습니다.");
			} else {
				$('input[name=passchk]').parents('.box').find('.msg').empty();
			}
		})

		// name check
		$('input[name=name]').on('keyup input change', function() {
			namevalue = $('input[name=name]').val().trim();

			if (namevalue.length < 2 || namevalue.length > 5) {
				$('input[name=name]').parents('.box').find('.msg').text("한글 2자 이상 5자 이하로 입력하세요.");
			} else {
				nameCheck();
			}

			if (namevalue == "") {
				$('input[name=name]').parents('.box').find('.msg').text("");
			}
		})

		// ph check
		$('input[name=phone]').on('keyup', function() {
			phCheck();

			if ($('input[name=phone]').val().trim() == "") {
				$('input[name=phone]').parents('.box').find('.msg').text("");
			}
		})

		// birth check
		$('input[name=birth]').on('change', function() {
			birthCheck();

			if ($('input[name=birth]').val().trim() == "") {
				$('input[name=birth]').parents('.box').find('.msg').text("");
			}
		})
		
		// 선택입력사항 입력해야 학급 선택 가능하게

		$('#joinBtn').on('click', function() {	
			if ($('input[name=mail]').parents('.box').find('.msg').text().length > 1 || $('input[name=mail]').val() == "") {
				alert("이메일을 입력해주세요.");
				return false;
		 	} else if (!$('#idDbtn').hasClass('active')) {
				alert("이메일 중복확인을 해주세요.");
				return false;
			} else if ($('input[name=nickname]').parents('.box').find('.msg').text().length > 1 || $('input[name=nickname]').val() == "") {
				alert("닉네임을 입력해주세요.");
				return false;
			} else if (!$('#nickDbtn').hasClass('active')) {
				alert("닉네임 중복확인을 해주세요.");
			} else if ($('input[name=pass]').parents('.box').find('.msg').text().length > 1 || $('input[name=pass]').val() == "") {
				alert("비밀번호를 입력해주세요.");
				return false;
			} else if ($('input[name=passchk]').parents('.box').find('.msg').text().legnth > 1 || $('input[name=pass]').val() != $('input[name=passchk]').val()) {
				alert("비밀번호 일치여부를 확인해주세요.");
				return false;
			}else{
				$("#modal").fadeIn(200);
		        $("#codeModal").delay(100).animate({marginTop:0},400);
			}	
			
			mail = $('input[name=mail]').val();
			$('#codeMail').text(mail);
			codeSubmit();
			
		})
		
			
		$('#subCode').on('click', function(){
				event.preventDefault();
				codeCheck();
	})
		
	$('#remail').on('click', function(){
		var waitTime = 1;
		if((new Date() - resentTime) < 60 * 1000){
		alert("인증코드를 재발송하려면 " + waitTime + " 분을 기다려야합니다." + (Math.round((waitTime * 60 * 1000 - (new Date() - resentTime))/1000)) + "초 남음");
		
		return false;
	}
			
		resentTime = new Date();
		sendCode();
			
	})
})
	
	
// class 정보 출력하기
	
selectClass = function(){
	$.ajax({
		url : '/playddit/join/getClassList.do',
		type : 'get',
		success : function(res){
			code = "";
			code += "<ul class='itemclass'>";
			code += "<li id='classCho' idx='C000'><span>Choose your class</span><i class='fas fa-chevron-down'></i>";
			code += "<ul class='scrollStyle'>";
			code += "<li idx='C000'>소속 학급 없음</li>";
			$.each(res, function(i, v){
				code += "<li idx=" + v.class_id +"> " + v.classname + "</li>"; 
			})
			code += "</ul>";
			code += "</li>";
			code += "</ul>";
			$('#tagChange').html(code);
			
            $("#tagChange").on("click", ".itemclass",function(){
            	$(this).find(".scrollStyle").slideToggle();
            });
            
            $("#tagChange").on('click', '.itemclass ul li', function(){
    			var nameLength = $('input[name=name]').val().length;
    			var phoneLength = $('input[name=phone]').val().length;
    			var birthLength = $('input[name=birth]').val().length;
    			var multiValue = nameLength * phoneLength * birthLength;
    				
    			var nameSpan = $('input[name=name]').parents('.box').find('.msg').text().length;
    			var phoneSpan = $('input[name=phone]').parents('.box').find('.msg').text().length;
    			var birthSpan = $('input[name=birth]').parents('.box').find('.msg').text().length;
    				
    			if(nameSpan > 1){
    				alert("이름 형식을 확인해주세요");
    				return false;
    			}else if(phoneSpan > 1){
    				alert("전화번호 형식(-없이 숫자만 입력해주세요)을 확인해주세요");
    			}else if(birthSpan > 1){
    				alert("생년월일을 확인해주세요.");
    			}else if(multiValue == 0){
    				alert("학급을 선택하기 위해서는 \n이름, 전화번호, 생년월일을 입력해야 합니다.");
    				$("#tagChange").find(".itemclass .scrollStyle").slideUp(200);
    				$("input[name=name]").focus();
    				stat = false;
    				return false;
    			}
    			
    			var choice = $(this).attr("idx");
    			var choiceText = $(this).text();
    			$(this).parents("#tagChange").find("#classCho").attr("idx", choice);
    			$(this).parents("#tagChange").find("#classCho").children("span").text(choiceText);
    		});
            
            $("#tagChange").find(".itemclass .scrollStyle").slideUp(200);
            
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

function codeSubmit(){
	//event.preventDefault();
	mail = $('input[name=mail]').val().trim();
	nickname = $('input[name=nickname]').val().trim();
	pass = $('input[name=pass]').val().trim();
	name = $('input[name=name]').val().trim();
	phone = $('input[name=phone]').val().trim();
	birth = $('input[name=birth]').val().trim();
    //class_id = $('select[name=itemclass]').val();
	class_id =$("#tagChange").find("#classCho").attr("idx");

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

codeCheck = function(){
	
	var code = $('input[name=code]').val().trim();
	
	$.ajax({
		url : '/playddit/join/codeCheck.do',
		type : 'post',
		data : { 'code' : code},
		success : function(res){
			if(code == res){
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
	
				$("#codeModal").animate({marginTop:"300px"},300);
				$("#modal").delay(100).fadeOut(300);

				location.href="/playddit/play.html";

			}else{
				alert("회원 가입에 실패했습니다. 반복 실패시 관리자에게 문의해주세요.");
				
				$("#codeModal").animate({marginTop:"300px"},300);
				$("#modal").delay(100).fadeOut(300);
				
				location.href="/playddit/conditions.html";
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

