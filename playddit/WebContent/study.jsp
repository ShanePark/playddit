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
        <link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
        <link href="css/common.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/study.css" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
		<script src="script/script.js"></script>
		<script src="script/main.js"></script>
		<script src="script/study.js"></script>
	</head>
    <body>
    	<div class="cen" id="wrap">
	        <!-- header.jsp include -->
	        <jsp:include page="/header.jsp"></jsp:include>
	        
			<!-- 컨텐츠 시작 -->
                <div id="studyWrap">
                    <div id="buttonArea">
                        <h2>My study list</h2>
                        <button><i class="fas fa-plus"></i></button>
                    </div>
                    
                    <!--학급, 스터디가 없을때 나오는 태그-->
                    <div id="noneClass">
                        <img src="images/study.png"/>
                        <p>
                            대덕인재개발원 학생, 선생님들과<br/>
                            소통을 시작해볼까요?
                        </p>
                    </div>
                    
                    <div id="myClass">
                        <h3>My class</h3>
                        <div id="classBox" onClick="location.href='chat.jsp'" class="studys">
                            <a href="#" id="classProfile" class="studyPic" style="background: url(images/feed3.jpg);"></a>
                            <div id="classInfo">
                                <h6>풀스택 개발자 과정 6기-302호</h6>
                                <p>학급인원 <span>25</span>명</p>
                            </div>
                        </div>
                    </div>
                    <div id="myStudy">
                        <h3>My Study</h3>
                        <div class="studyBox studys">
                            <a href="#" class="studyProfile studyPic" style="background: url(images/profile/expedition1205@gmail.com.jpg);"></a>
                            <div class="studyInfo">
                                <h6>공부 열심히 할사람들~</h6>
                                <p>스터디원 <span>1</span>명</p>
                            </div>
                        </div>
                        <div class="studyBox studys">
                            <a href="#" class="studyProfile studyPic" style="background: url(images/profile/chdnjs7610@gmail.com.jpg);"></a>
                            <div class="studyInfo">
                                <h6>프로그래머스 스터디방</h6>
                                <p>스터디원 <span>4</span>명</p>
                            </div>
                        </div>
                        <div class="studyBox studys">
                            <a href="#" class="studyProfile studyPic" style="background: url(images/profile/psh40963@naver.com.png);"></a>
                            <div class="studyInfo">
                                <h6>맥북 사용자들의 모임</h6>
                                <p>스터디원 <span>6</span>명</p>
                            </div>
                        </div>
                    </div>
                </div>
				<div id="mask"></div>
            </div>
            <!--컨텐츠 끝-->
            
            <!-- footer.jsp include -->
            <jsp:include page="/footer.jsp"></jsp:include>
            
            <script>
            $(function(){
            	
          		//메뉴 active
				$("#studyH").addClass("active");
            })
            </script>
	</body>
</html>