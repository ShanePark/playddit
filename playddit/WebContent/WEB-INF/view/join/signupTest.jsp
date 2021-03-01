<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="initial-scale=1, width=device-width" />
<meta name="author" content="playddit" />
<meta name="description" content="대덕인재개발원 학생들을 위한 스터디그룹, 소모임, 학급 공지사항, 주변 맛집 검색 등 다양한
                                            커뮤니티 서비스를 제공합니다." />
<meta name="keywords" content="대덕인재개발원, 대전 중구 대덕인재개발원, 대덕인재, 개발자과정, 프로그래머, 자바" />
<title>playddit</title>
<link href="favicon.ico" rel="icon shortcut" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link href="../css/common.css" rel="stylesheet"/>
<link href="../css/user.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="../script/modal.js"></script>
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/signupTest.js"></script>
<script src="../js/badwords.js"></script>
<script src="../js/doubleCheck.js"></script>
<script src="../js/insertUser.js"></script>
<script src="../js/jquery.serializejson.min.js"></script>
<style>
.eye{
	width : 40px;
	hight : 40px;
}
</style>

<script>
	$(function(){
		// id(email) check
 		$('#mail').on('keyup', function(){		
			idCheck();
		})
		
		//id(email) doubleCheck
		$('#idDbtn').on('click', function(){
			if(idCheck()){
				idDcheck(this);
			}else {
				//msg에 이메일 형식에 맞게 입력하세요. 출력 해주세요.
				$('#mail').parents('.box').find('.msg').text("이메일 형식을 확인해주세요.");
				return false;
			}
		})
		
		$('#mail').change(function(){
			$('#idDbtn').removeClass("active");

		})
		
		
		// nickname check
		$('#nickname').on('keyup', function(){
			nickvalue = $('#nickname').val().trim();

			if(nickvalue.length < 2 || nickvalue.length > 8){
				$('#nickname').parents('.box').find('.msg').text("2글자 이상 8글자 이하로 입력하세요.");
				return false;
			}		
			wordchk(nickvalue);	
		})
		
		// nickname doubleCheck
		$('#nickDbtn').on('click', function(){
			nickvalue = $('#nickname').val().trim();
			if(nickvalue.length < 2 || nickvalue.length > 8){
				$(this).parents('.box').find('.msg').text("닉네임 형식을 확인해주세요.");
			}else{	
				nickCheck(this);
			}
		})
		
		$('#nickname').change(function(){
			$('#nickDbtn').removeClass("active");
		})
		
		
		
		// password check
		$('#pass').on('keyup', function(){
			pwvalue = $('#pass').val().trim();
			if(pwvalue.length < 8 || pwvalue.length > 12){
				$('#pass').parents('.box').find('.msg').text("8글자 이상 12글자 이하로 입력하세요.");
			}else{
				pwCheck();
			}
		})
		
		// password recheck
		$('#passchk').on('keyup', function(){
			pwChkvalue = $('#passchk').val().trim();
			if(pwvalue != pwChkvalue){
				$('#passchk').parents('.box').find('.msg').text("비밀번호가 일치하지 않습니다.").css('color', 'red');	
			}else{
				$('#passchk').parents('.box').find('.msg').empty();
			}
		})
		
		// name check
		$('#name').on('keyup input change', function(){
			namevalue = $('#name').val().trim();
			
			if(namevalue.length < 2 || namevalue.length > 5){
				$('#name').parents('.box').find('.msg').text("한글 2자 이상 5자 이하로 입력하세요.");
			}else{
				nameCheck();
			}
			
			if(namevalue == ""){
				$('#name').parents('.box').find('.msg').text("");
			}		
		})
		
		
		// ph check
		$('#phone').on('keyup', function(){
			phCheck();
			
			if($('#phone').val().trim() == ""){
				$('#phone').parents('.box').find('.msg').text("");
			}
		})
		
		// birth check
		$('#birth').on('change', function(){
			birthCheck();
			
			if($('#birth').val().trim() == ""){
				$('#birth').parents('.box').find('.msg').text("");
			}
		})
		
		$('#joinBtn').on('click', function(){
			
			
 			if($('#mail').parents('.box').find('.msg').text().length > 1 || $('#mail').val() == ""){
				alert("이메일을 입력해주세요.");
				return false;
			} else if(!$('#idDbtn').hasClass('active')){
				alert("이메일 중복확인을 해주세요.");
				return false;
			}else if($('#nickname').parents('.box').find('.msg').text().length > 1 || $('#nickname').val() == ""){
				alert("닉네임을 입력해주세요.");
				return false;
			}else if(!$('#nickDbtn').hasClass('active')){
				alert("닉네임 중복확인을 해주세요.");
			}else if($('#pass').parents('.box').find('.msg').text().length > 1 || $('#pass').val() == ""){
				alert("비밀번호를 입력해주세요.");
				return false;
			}else if($('#passchk').parents('.box').find('.msg').text().legnth > 1 ||  $('#pass').val() != $('#passchk').val()){
				alert("비밀번호 일치여부를 확인해주세요.");
				return false;
			}
 			
		})
		
	})

</script>
</head>
<body >
	 <form method="post" id="joinForm" action="<%= request.getContextPath()%>/users/join.do">
                   <div id="joinLeft" class="joinBox">
                        <div class="box">
                            <p><span class="red">*</span> Email<span class="msg"></span></p>
                            <div class="item">
                                <input type="text" name="mail" id="mail" placeholder="Please enter your email" />
                                <span id="idDbtn" class="double">중복확인</span>
                            </div>
                        </div>
                        
                        <div class="box">
                            <p><span class="red">*</span> Nickname<span class="msg"></span></p>
                            <div class="item">
                                <input type="text" name="nickname" id="nickname" placeholder="Please enter your nickname" />
                                <span id="nickDbtn" class="double">중복확인</span>
                            </div>
                        </div>
                        
                        <div class="box">
                            <p><span class="red">*</span> Password<span class="msg"></span></p>
                            <div class="item">
                                <input type="password" name="pass" id="pass" placeholder="Please enter your password" />
                                <svg class="eye" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 80 80">
                                    <path d="M39.5 49.5C31.688 49.5 25 42.258 25 40c0-1.862 6.514-9.5 14.5-9.5S54 38.138 54 40c0 2.661-6.894 9.5-14.5 9.5zm-12.491-9.453c.319 1.366 5.78 7.453 12.491 7.453 6.804 0 12.234-6.101 12.493-7.461-.436-1.315-5.808-7.539-12.493-7.539-6.553 0-12 6.208-12.491 7.547z" />
                                    <path d="M39.5 45.5c-3.033 0-5.5-2.467-5.5-5.5s2.467-5.5 5.5-5.5c3.032 0 5.5 2.467 5.5 5.5s-2.468 5.5-5.5 5.5zm0-9c-1.93 0-3.5 1.57-3.5 3.5s1.57 3.5 3.5 3.5S43 41.93 43 40s-1.57-3.5-3.5-3.5z" />
                                </svg>
                            </div>
                        </div>
                        
                        <div class="box">
                            <p><span class="red">*</span> Confirm Password<span class="msg"></span></p>
                            <div class="item">
                                <input type="password" name="passchk" id="passchk" placeholder="Please enter your password" />
                                <svg class="eye" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 80 80">
                                    <path d="M39.5 49.5C31.688 49.5 25 42.258 25 40c0-1.862 6.514-9.5 14.5-9.5S54 38.138 54 40c0 2.661-6.894 9.5-14.5 9.5zm-12.491-9.453c.319 1.366 5.78 7.453 12.491 7.453 6.804 0 12.234-6.101 12.493-7.461-.436-1.315-5.808-7.539-12.493-7.539-6.553 0-12 6.208-12.491 7.547z" />
                                    <path d="M39.5 45.5c-3.033 0-5.5-2.467-5.5-5.5s2.467-5.5 5.5-5.5c3.032 0 5.5 2.467 5.5 5.5s-2.468 5.5-5.5 5.5zm0-9c-1.93 0-3.5 1.57-3.5 3.5s1.57 3.5 3.5 3.5S43 41.93 43 40s-1.57-3.5-3.5-3.5z" />
                                </svg>
                            </div>
                        </div>
                    </div>

                    <div id="joinRight" class="joinBox">
                        <div class="box">
                            <p>Name<span class="msg"></span></p>
                            <div class="item">
                                <input type="text" name="name" id="name" placeholder="Please enter your name" />
                            </div>
                        </div>
                        
                        <div class="box">
                            <p>Phone number<span class="msg"></span></p>
                            <div class="item">
                                <input type="tel" name="phone" id="phone" placeholder="Please enter your phone number" />
                            </div>
                        </div>
                        
                        <div class="box">
                            <p>Birthday<span class="msg"></span></p>
                            <div class="item">
                                <input type="date" name="birth" id="birth" date-placeholder="Choose your birthday" />
                            </div> 
                        </div>

                        <p>Class<span class="msg"></span></p>
                        <div class="item">
                            <select name="class">
                                <option>Choose your class</option>
                                <option value="학급번호">풀-스택 개발자 양성과정 2기 - 401호</option>
                                <option value="학급번호">풀-스택 개발자 양성과정 3기 - 402호</option>
                                <option value="학급번호">풀-스택 개발자 양성과정 4기 - 403호</option>
                                <option value="학급번호">풀-스택 개발자 양성과정 5기 - 404호</option>
                                <option value="학급번호">풀-스택 개발자 양성과정 6기 - 302호</option>
                                <option value="학급번호">AI 소프트웨어 엔지니어링 1기 - 405호</option>
                                <option value="학급번호">풀-스택 개발자 양성과정 7기 - 406호</option>
                            </select>
                        </div>
                    </div>
                    
                    <div style="clear: both;"></div>
                    
                    <button type="submit" id="joinBtn" class="skyBtn">SIGN UP</button>
                </form>
                
        <script>
            $(document).ready(function(){
                $('.eye').on('click',function(){
                    $(this).toggleClass("active");
                    if($(".eye").hasClass("active")){
                        $(this).prev("input").attr("type", "text");
                    }else{
                        $(this).prev("input").attr("type", "password");
                    }
                });
                
            });
        </script>

</body>
</html>