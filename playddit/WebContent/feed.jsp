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
        <link href="css/feed.css" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
		<script src="script/script.js"></script>
		<script src="script/main.js"></script>
		<script src="script/feed.js"></script>	<!-- 반드시 main.js 를 먼저 불러와야함 -->
	</head>
    <body>
        <div class="cen" id="wrap">
	        <!-- header.jsp include -->
	        <jsp:include page="/header.jsp"></jsp:include>
	        
			<!-- 컨텐츠 시작 -->
                <div id="feedWrap">
                    <div id="storyBox">
                        <div class="story storyOn">
                            <img src="images/default.png" />
                        </div>
                        <div class="story">
                            <img src="images/default.png" />
                        </div>
                        <div class="story storyOn">
                            <img src="images/default.png" />
                        </div>
                    </div>

                    <div id="feedBox">
                    </div>
                </div>
                
                <!-- 피드 검색 모달창 -->
                <div id="mask"></div>
                <div id="feedSearch">
                    <div class="edge"></div>
                    <div id="feedSearchModal">
                        <div id="feedCount">
                            <a href="#" class="feedCir">
                                <i class="fas fa-hashtag"></i>
                            </a>
                            <a href="#" id="feedText">
                                <p id="keyword">검색단어</p>
                                <p id="count">
                                    피드 <span>5,000</span>개
                                </p>
                            </a>
                        </div>
                        
                        <ul id="searchUser">
                            <li>
                                <a href="#" user="scarlet" class="feedCir">
                                    <img src="images/default.png" />
                                </a>
                                <a href="#" class="searchUserBox">
                                    <span href="#" user="scarlet" class="userNick">
                                        scarlett
                                    </span>
                                    <span class="userEmail">chdnjs7610@gmail.com</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" user="scarlet" class="feedCir">
                                    <img src="images/default.png" />
                                </a>
                                <a href="#" class="searchUserBox">
                                    <span href="#" user="scarlet" class="userNick">
                                        scarlett
                                    </span>
                                    <span class="userEmail">chdnjs7610@gmail.com</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" user="scarlet" class="feedCir">
                                    <img src="images/default.png" />
                                </a>
                                <a href="#" class="searchUserBox">
                                    <span href="#" user="scarlet" class="userNick">
                                        scarlett
                                    </span>
                                    <span class="userEmail">chdnjs7610@gmail.com</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" user="scarlet" class="feedCir">
                                    <img src="images/default.png" />
                                </a>
                                <a href="#" class="searchUserBox">
                                    <span href="#" user="scarlet" class="userNick">
                                        scarlett
                                    </span>
                                    <span class="userEmail">chdnjs7610@gmail.com</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" user="scarlet" class="feedCir">
                                    <img src="images/default.png" />
                                </a>
                                <a href="#" class="searchUserBox">
                                    <span href="#" user="scarlet" class="userNick">
                                        scarlett
                                    </span>
                                    <span class="userEmail">chdnjs7610@gmail.com</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" user="scarlet" class="feedCir">
                                    <img src="images/default.png" />
                                </a>
                                <a href="#" class="searchUserBox">
                                    <span href="#" user="scarlet" class="userNick">
                                        scarlett
                                    </span>
                                    <span class="userEmail">chdnjs7610@gmail.com</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" user="scarlet" class="feedCir">
                                    <img src="images/default.png" />
                                </a>
                                <a href="#" class="searchUserBox">
                                    <span href="#" user="scarlet" class="userNick">
                                        scarlett
                                    </span>
                                    <span class="userEmail">chdnjs7610@gmail.com</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <!--신고 모달-->
            <div id="reportBack"></div>
            <div id="reportWrap">
                <div id="reportModal">
                    <div id="reporUserBox">
                        <a href="#" id="reportCir">
                            <img src="images/default.png" />
                        </a>
                        <a href="#" id="reportInfo">
                            <p>scarlettdddd</p>
                            <span>6기 - 302호</span>
                        </a>
                    </div>
                    
                    <p id="reportTxt">피드를 신고하시겠습니까?</p>

                    <div id="reportBtn">
                        <button type="button" id="goUser">프로필보기</button>
                        <button type="button" id="goReport">신고</button>
                        <button type="button" id="cancel">취소</button>
                    </div>
                </div>
            </div>
            
            <!--본인 글 삭제 확인 모달-->
            <div id="feedDel">
                <div id="feedDelModal">
                    <p>피드를 삭제 하시겠습니까?</p>
                    <div id="feedDelBtn">
                        <button type="button" id="goModi">수정</button>
                        <button type="button" id="goDel">삭제</button>
                        <button type="button" id="goCancel">취소</button>
                    </div>
                </div>
            </div>
            <!--컨텐츠 끝-->
            
            <!-- footer.jsp include -->
            <jsp:include page="/footer.jsp"></jsp:include>
        
        <script>
            $(function(){
                //feed 이미지박스 크기
                /*$(window).resize(function(){
                    var squareW = $(".square").width();
                    $(".square").height(squareW);
                    $(".square .slide").height(squareW);

                    var rectW = $(".rect").width();
                    $(".rect").height(4 * rectW / 3);
                    $(".rect .slide").height(4 * rectW / 3);
                });*/
                
                var visi = false;

                //feed Search
                $("#search button, #msearch button").on("click", function(){
                    
                    if(visi){
                        $("#alarmEdge2, #alarmEdge").hide();
                        $("#modal").fadeOut(300);
                        visi = false;
                    }
                    
                    $("#mask").show();
                    $("#feedSearch").show();
                    $("#feedSearchModal").slideDown(500);
                });
                
                $("#mask").click(function(){
                    $(this).hide();
                    $("#feedSearchModal").slideUp(300);
                    $("#feedSearch").delay(200).hide();
                });

            });
        </script>
    </body>
</html>
