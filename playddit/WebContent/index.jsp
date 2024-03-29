<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<jsp:include page="/preScript.jsp"></jsp:include>
		<meta name="viewport" content="initial-scale=1, width=device-width" />
		<meta name="author" content="playddit" />
		<meta name="description" content="대덕인재개발원 학생들을 위한 스터디그룹, 소모임, 학급 공지사항, 주변 맛집 검색 등 다양한커뮤니티 서비스를 제공합니다." />
		<meta name="keywords" content="대덕인재개발원, 대전 중구 대덕인재개발원, 대덕인재, 개발자과정, 프로그래머, 자바" />
		<title>playddit</title>
		<link href="favicon.ico" rel="icon shortcut" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link href="css/common.css" rel="stylesheet" />
        <link href="css/user.css" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="script/modal.js" defer></script>
		<script src="script/index.js" defer></script>
	</head>
<body>
    <div id="wrap" class="cen">
        <div id="loginLeft">
            <img src="images/index.png" alt="playddit" />
        </div>
        <div id="loginRight">
            <img src="images/logo2.png" alt="logo" />
            <form onsubmit="idPassCheck()" id="login">
                <div class="loginBox">
                    <i disabled class="fas fa-user"></i>
                    <input type="text" id="idCheck" name="mail" placeholder="Useremail" />
                </div>
                <div class="loginBox">
                    <i disabled class="fas fa-lock"></i>
                    <input type="password" id="passCheck" name="pass" placeholder="Password" />
                </div>
                
                <div id="loginBox2">
                    <input type="checkbox" id="idchk" name="auto" value="remember"/><span class="purple">Remember Me</span>
                    <button type="button" class="purple" id="forgotPass">Forgot Password?</button>
                </div>
                
                <button type="submit" id="signIn" class="purBtn">SIGN IN</button>
                <button type="button" id="demo" class="purBtn">DEMO</button>
            </form>
            
            <div id="joinBox">
                <p>Don't have an account?</p>
                <a href="conditions.jsp">SIGN UP NOW</a>
            </div>
            
            <p id="copy">&copy; PLAYDDIT All Rights Reserved</p>
        </div>
    </div>
    
    <!-- forgot password Modal -->
    <div id="modal">
        <div id="modalBody">
            <div id="closeBox">
                <button type="button" id="close" style="color : #a0a0cf;">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <div id="modalCont">
                <i class="fas fa-unlock-alt"></i>
                <p>가입한 이메일 주소를 입력하세요.</p>
                <form id="find" onsubmit="sendTempPass()">
                    <p>
                        <span class="red">*</span>
                        Email
                        <span class="red" id="msg"></span>
                    </p>
                    <input type="text" id="findmail" name="findmail" placeholder="Please enter your email" />
                    <button type="submit" id="passBtn" class="purBtn">임시 비밀번호 전송</button>
                </form>
            </div>
            <p>가입한 이메일 주소로 임시 비밀번호를 전송합니다. 메일함을 확인하세요.</p>
        </div>
    </div>
</body>
</html>




















