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
                        <div class="feed">
                            <div class="proBox" action="scarlett">
                                <div class="proCir">
                                    <img src="images/default.png" alt="프로필사진" />
                                </div>
                                <p class="proName">
                                    Scarl-ett
                                    <span class="proClass">6기 - 302호</span>
                                </p>
                            </div>

                            <div class="feedPic">
                                <div class="slider">
                                    <div class="slide">
                                        <img src="images/feed.png" />
                                    </div>
                                </div>
                            </div>

                            <div class="icon">
                                <button type="submit" class="like">
                                    <i class="far fa-heart"></i>
                                </button>
                                <button type="button" class="comment">
                                    <i class="far fa-comment-dots"></i>
                                </button>
                                <button type="button" class="dm">
                                    <i class="fas fa-paper-plane"></i>
                                </button>

                                <button type="button" class="report">
                                    <i class="fas fa-exclamation-circle"></i>
                                </button>
                            </div>
                            
                            <div class="likeCount">
                                좋아요 <span>100</span>개
                            </div>

                            <div class="txt">
                                <p class="proName">Scarl-ett</p>
                                <p class="txtCont">
                                    프로그래머스 문제풀이 중..ㅠ<br /> 어떤 경우에 틀렸는지 좀 알려주세요...ㅠㅠ
                                </p>
                            </div>

                            <div class="countComm">
                                댓글 <span class="count">13</span>개
                            </div>

                            <div class="commentBox">
                                <ul>
                                    <li class="comm"><a href="#" class="commUser">summer</a> <span>프로그래머스
                                            언제 다하죠?ㅠ</span>
                                    <li class="comm"><a href="#" class="commUser">홍길동</a> <span>화이팅~!</span>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="feed">
                            <div class="proBox" action="scarlett">
                                <div class="proCir">
                                    <img src="images/default.png" alt="프로필사진" />
                                </div>
                                <p class="proName">
                                    Scarl-ett
                                    <span class="proClass">6기 - 302호</span>
                                </p>
                            </div>

                            <div class="feedPic">
                                <!--글만 있을 경우 출력되지 않는다.-->
                                <!--<div class="slider">
                                    <div class="slide">
                                        <img src="images/feed.png"  />
                                    </div>
                                </div>-->
                                <p class="txtCont">
                                    안되나용 왜 나는 안되나용
                                    그놈은 되고 왜 나는 안되나용
                                    
                                    사랑 때문에 너무 아프다
                                    너무 아파서 술 한잔 때렸다
                                    모질게 나를 버리고 가면
                                    남겨진 나는 어떡하라고
                                    사느냐 죽느냐 그것이 문제로다
                                    
                                    안되나용 왜 나는 안되나용
                                    그놈은 되고 왜 나는 안되나용
                                    얼굴이니 아니면 입방정이니
                                    그러면 나는 누구를 만나나용
                                    
                                    그놈 때문에 뚜껑 열렸다
                                    뚜껑 열려서 술 한잔 때렸다
                                    그렇게 그녈 데리고 가면
                                    남겨진 나는 어떡하라고
                                    썸한번 못 타고 이렇게 끝나나용
                                    
                                    안되나용 왜 나는 안되나용
                                    그놈은 되고 왜 나는 안되나용
                                    얼굴이니 아니면 그냥 아니니
                                    그러면 나는 영원히 안되나용
                                </p>
                            </div>
                            
                            <div class="icon">
                                <button type="submit" class="like">
                                    <i class="far fa-heart"></i>
                                </button>
                                <button type="button" class="comment">
                                    <i class="far fa-comment-dots"></i>
                                </button>
                                <button type="button" class="dm">
                                    <i class="fas fa-paper-plane"></i>
                                </button>

                                <button type="button" class="report">
                                    <i class="fas fa-exclamation-circle"></i>
                                </button>
                            </div>
                            
                            <div class="likeCount">
                                좋아요 <span>100</span>개
                            </div>
                            
                            <div class="txt" style="display: none;">
                                <p class="proName">Scarl-ett</p>
                                <p class="txtCont">
                                    안되나용 왜 나는 안되나용
                                    그놈은 되고 왜 나는 안되나용
                                    
                                    사랑 때문에 너무 아프다
                                    너무 아파서 술 한잔 때렸다
                                    모질게 나를 버리고 가면
                                    남겨진 나는 어떡하라고
                                    사느냐 죽느냐 그것이 문제로다
                                    
                                    안되나용 왜 나는 안되나용
                                    그놈은 되고 왜 나는 안되나용
                                    얼굴이니 아니면 입방정이니
                                    그러면 나는 누구를 만나나용
                                    
                                    그놈 때문에 뚜껑 열렸다
                                    뚜껑 열려서 술 한잔 때렸다
                                    그렇게 그녈 데리고 가면
                                    남겨진 나는 어떡하라고
                                    썸한번 못 타고 이렇게 끝나나용
                                    
                                    안되나용 왜 나는 안되나용
                                    그놈은 되고 왜 나는 안되나용
                                    얼굴이니 아니면 그냥 아니니
                                    그러면 나는 영원히 안되나용
                                </p>
                            </div>
                        
                            <div class="countComm">
                                댓글 <span class="count">13</span>개
                            </div>

                            <div class="commentBox">
                                <ul>
                                    <li class="comm"><a href="#" class="commUser">summer</a> <span>프로그래머스
                                            언제 다하죠?ㅠ</span>
                                    <li class="comm"><a href="#" class="commUser">홍길동</a> <span>화이팅~!</span>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="feed">
                            <div class="proBox" action="scarlett">
                                <div class="proCir">
                                    <img src="images/default.png" alt="프로필사진" />
                                </div>
                                <p class="proName">
                                    Scarl-ett
                                    <span class="proClass">6기 - 302호</span>
                                </p>
                            </div>

                            <div class="feedPic">
                                <div class="slider">
                                    <div class="slide">
                                        <img src="images/feed2.png" />
                                    </div>
                                    <div class="slide">
                                        <img src="images/feed3.jpg" />
                                    </div>
                                </div>
                            </div>

                            <div class="icon">
                                <button type="submit" class="like">
                                    <i class="far fa-heart"></i>
                                </button>
                                <button type="button" class="comment">
                                    <i class="far fa-comment-dots"></i>
                                </button>
                                <button type="button" class="dm">
                                    <i class="fas fa-paper-plane"></i>
                                </button>

                                <button type="button" class="report">
                                    <i class="fas fa-exclamation-circle"></i>
                                </button>
                            </div>
                            
                            <div class="likeCount">
                                좋아요 <span>100</span>개
                            </div>

                            <div class="txt">
                                <p class="proName">Scarl-ett</p>
                                <p class="txtCont">
                                    안되나용 왜 나는 안되나용
                                    그놈은 되고 왜 나는 안되나용
                                    
                                    사랑 때문에 너무 아프다
                                    너무 아파서 술 한잔 때렸다
                                    모질게 나를 버리고 가면
                                    남겨진 나는 어떡하라고
                                    사느냐 죽느냐 그것이 문제로다
                                    
                                    안되나용 왜 나는 안되나용
                                    그놈은 되고 왜 나는 안되나용
                                    얼굴이니 아니면 입방정이니
                                    그러면 나는 누구를 만나나용
                                    
                                    그놈 때문에 뚜껑 열렸다
                                    뚜껑 열려서 술 한잔 때렸다
                                    그렇게 그녈 데리고 가면
                                    남겨진 나는 어떡하라고
                                    썸한번 못 타고 이렇게 끝나나용
                                    
                                    안되나용 왜 나는 안되나용
                                    그놈은 되고 왜 나는 안되나용
                                    얼굴이니 아니면 그냥 아니니
                                    그러면 나는 영원히 안되나용
                                </p>
                            </div>

                            <div class="countComm">
                                댓글 <span class="count">0</span>개
                            </div>

                            <div class="commentBox">
                            </div>
                        </div>
                        
                        <div class="feed">
                            <div class="proBox" action="scarlett">
                                <div class="proCir">
                                    <img src="images/default.png" alt="프로필사진" />
                                </div>
                                <p class="proName">
                                    Scarl-ett
                                    <span class="proClass">6기 - 302호</span>
                                </p>
                            </div>

                            <div class="feedPic">
                                <div class="slider">
                                    <div class="slide">
                                        <img src="images/feed4.jpg" />
                                    </div>
                                    <div class="slide">
                                        <img src="images/feed5.jpg" />
                                    </div>
                                    <div class="slide">
                                        <img src="images/feed6.jpg" />
                                    </div>
                                </div>
                            </div>
                            
                            <div class="icon">
                                <button type="submit" class="like">
                                    <i class="far fa-heart"></i>
                                </button>
                                <button type="button" class="comment">
                                    <i class="far fa-comment-dots"></i>
                                </button>
                                <button type="button" class="dm">
                                    <i class="fas fa-paper-plane"></i>
                                </button>

                                <button type="button" class="report">
                                    <i class="fas fa-exclamation-circle"></i>
                                </button>
                            </div>
                            
                            <div class="likeCount">
                                좋아요 <span>100</span>개
                            </div>
                            
                            <div class="txt">
                                <p class="proName">Scarl-ett</p>
                                <p class="txtCont">
                                    놀러가고싶다...
                                </p>
                            </div>

                            <div class="countComm">
                                댓글 <span class="count">13</span>개
                            </div>

                            <div class="commentBox">
                                <ul>
                                    <li class="comm"><a href="#" class="commUser">summer</a> <span>퍼가요~</span>
                                    <li class="comm"><a href="#" class="commUser">홍길동</a> <span>화이팅~!</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
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
            <!--컨텐츠 끝-->
            
            <!-- footer.jsp include -->
            <jsp:include page="/footer.jsp"></jsp:include>
        </div>
        
        <script>
            $(function(){
                //feed 이미지박스 크기
                $(window).resize(function(){
                    var squareW = $(".square").width();
                    $(".square").height(squareW);
                    $(".square .slide").height(squareW);

                    var rectW = $(".rect").width();
                    $(".rect").height(4 * rectW / 3);
                    $(".rect .slide").height(4 * rectW / 3);
                });
                
                //feed slick
                $(".feedPic .slider").slick({
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    infinite: true,
                    dots: true,
                    prevArrow: "<button class='left slideBtn'><i class='fas fa-chevron-left'></i></button>",
                    nextArrow: "<button class='right slideBtn'><i class='fas fa-chevron-right'></i></button>"
                }); 
                
                $.each($(".feedPic"), function(i){
                    if($(this).find(".slide").length <= 1){
                        $(this).find(".slick-dots").css("display", "none");
                    }
                });
                
                $('.slick-dots li').html('<i class="far fa-circle"></i>');
                $('.slick-dots li.slick-active').html('<i class="fas fa-circle"></i>');
                
                $(".slick-dots li").on("click", function(){
                    $(this).parents(".feedPic").find(".slick-dots li").html('<i class="far fa-circle"></i>');
                    $(this).html('<i class="fas fa-circle"></i>');
                });
                
                $(".slideBtn").each(function(){
                    $(this).click(function(){
                        var index = $(this).parent(".feedPic .slider ").slick('slickCurrentSlide');
                        
                        $(this).parents(".feedPic").find(".slick-dots li").html('<i class="far fa-circle"></i>');
                        $(this).parents(".feedPic").find(".slick-dots li").eq(index).html('<i class="fas fa-circle"></i>');
                    }); 
                });
                
                //like button
                $(".like").on("click", function(){
                    var like = $(this).hasClass("on");
                    
                    if(like){
                        $(this).removeClass("on");
                        $(this).html('<i class="far fa-heart"></i>');
                        like = false;
                    }else{
                        $(this).addClass("on");
                        $(this).html('<i class="fas fa-heart"></i>');
                        like = true;
                    }
                });
                
                //feed text
                $('.txt').each(function(){
                    var content = $(this).children('.txtCont');
                    var index = content.width();
                    var content_txt = content.text();
                    var content_txt_short = content_txt.substring(0,200)+"...";
                    var btn_more = $('<a href="javascript:void(0)" class="more">더보기</a>');

                    $(this).append(btn_more);

                    if(content_txt.length >= 200){
                        content.html(content_txt_short);
                    }else{
                        btn_more.hide();
                    }

                    btn_more.click(toggle_content);

                    function toggle_content(){
                        if($(this).hasClass('short')){
                            // 접기 상태
                            $(this).html('더보기');
                            content.html(content_txt_short)
                            $(this).removeClass('short');
                        }else{
                            // 더보기 상태
                            $(this).html('접기');
                            content.html(content_txt);
                            $(this).addClass('short');

                        }
                    }
                });
                
                var visi = false;

                $(".alarmBtn").click(function(){
                    if(!visi){
                        $("#alarmEdge2 , #alarmEdge, #modal").show();
                        visi = true;
                    }else{
                        $("#alarmEdge2, #alarmEdge").hide();
                        $("#modal").fadeOut(300);
                        visi = false;
                    }
                });
                
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
                    $("#feedSearch").hide();
                });
            });
        </script>
    </body>
</html>
