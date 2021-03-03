/**
 * 
 */
	$(function(){			
		$('input[name=itemclass]').on('click', function(){
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
				alert("학급을 선택하기 위해서는 이름, 전화번호, 생년월일을 입력해야 합니다.");
				return false;
			}else{
				selectClass();
			}				
		})
			
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
	})