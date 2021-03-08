<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="initial-scale=1, width=device-width" />
		<meta name="author" content="playddit" />
		<meta name="description" content="대덕인재개발원 학생들을 위한 스터디그룹, 소모임, 학급 공지사항, 주변 맛집 검색 등 다양한커뮤니티 서비스를 제공합니다." />
		<meta name="keywords" content="대덕인재개발원, 대전 중구 대덕인재개발원, 대덕인재, 개발자과정, 프로그래머, 자바" />
		<title>playddit</title>
		<link href="favicon.ico" rel="icon shortcut" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link href="css/common.css" rel="stylesheet" />
        <link href="css/view.css" rel="stylesheet" />
        <link href="css/edit.css" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="script/view.js"></script>
	</head>
    <body>
        <!-- header.jsp include -->
	    <jsp:include page="/viewHeader.jsp"></jsp:include>
        
        <!--컨텐츠시작-->
        <div id="set" class="cen">
            <div id="setLeft">
                <ul>
                    <li><a href="setting.jsp"><i class="fas fa-user-edit"></i>Edit your profile</a></li>
                    <li><a href="#"><i class="fas fa-key"></i>Changing Password</a></li>
                </ul>
            </div>
            <div id="setRight">
                <div id="passwordBox">
                    <p id="passCon">
                        본인 확인을 위해 비밀번호를 입력해주세요.
                    </p>
                    <form onsubmit="idPassCheck()" id="login">
                        <div class="loginBox">
                            <i disabled class="fas fa-lock"></i>
                            <input type="password" id="passCheck" name="pass" placeholder="Password" />
                        </div>
                        
                        <!--스크립트 보여드릴려고 button 타입으로 했습니다.-->
                        <!--submit으로 바꿔주세요!-->
                        <button type="button" id="changeBtn" class="purBtn">ENTER</button>
                    </form>
                    <form id="change">
                        <div class="loginBox">
                            <i disabled class="fas fa-lock"></i>
                            <input type="password" id="newPass" name="pass" placeholder="New Password" />
                        </div>
                        <div class="loginBox">
                            <i disabled class="fas fa-key"></i>
                            <input type="password" id="newPassCheck" name="pass" placeholder="Confirm New Password" />
                        </div>
                        
                        <button type="button" id="changeBtn" class="purBtn">CHANGE</button>
                    </form>
                </div>
            </div>
        </div>
        <!--컨텐츠 끝-->
        
        <!-- footer.jsp include -->
	    <jsp:include page="/viewFooter.jsp"></jsp:include>
        
        <script>
			$("#changeBtn").on("click", function(){
                $(this).hide();
               $("#change").slideDown();
            });
		</script>
    </body>
</html>
