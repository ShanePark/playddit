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
        <link href="css/mine.css" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="script/script.js"></script>
		<script src="script/view.js"></script>
	</head>
	<body>
		<!-- header.jsp include -->
		<jsp:include page="/viewHeader.jsp"></jsp:include>
	        
	    <!--컨텐츠 시작-->
		<div class="cen" id="myPage">
			<div id="myLeft">
			    <div id="my">
                    <div id="myProfile" style="background-image: url(images/profile/bomik0614@gmail.com.jpg);">
                    </div>
                    <ul id="myText">
                        <li id="myName">SUMMERSU</li>
                        <li id="myClass">6기 - 302호</li>
                    </ul>
			    </div>
               
                <p id="myIntro">
                    안녕하세요~~ 저는 써머에요~! 제일 좋아하는 계절은?? 여름입니다^^ㅎㅎ
                </p>
				
				<ul id="myFollow">
					<li id="myFeed">
						<p>게시물</p>
						<span>100</span>
					</li>
					<li id="myFollower">
						<p>팔로워</p>
						<span class="followBtn">15</span>
					</li>
					<li id="myFollowing">
						<p>팔로잉</p>
						<span class="followBtn">10</span>
					</li>
				</ul>
				
				<!--다른 사람의 페이지라면 나오는 버튼들-->
				<div id="btnBox">
                    <div class="myIcon" id="toFollow">
                        <i class="fas fa-user"></i>
                        <div class="button_su">
                            <span class="su_button_circle">
                            </span>
                            <a href="#" class="button_su_inner">
                              <span class="button_text_container">
                                Follow
                              </span>
                            </a>
                        </div>
                    </div>
                    <div class="myIcon">
                        <i class="fas fa-envelope"></i>
                        <div class="button_su">
                            <span class="su_button_circle">
                            </span>
                            <a href="#" class="button_su_inner">
                              <span class="button_text_container">
                                Message
                              </span>
                            </a>
                        </div>
                    </div>
				</div>
			</div><!--꼭 있어야하는 태그입니다!-->
			
			<!--나의 페이지라면 나오는 버튼-->
			<div id="mySet">
			  <a id="setBtn"><i class="fas fa-cog"></i>Setting</a> 
			</div>
		
			<div id="myRight">
				<h2>Feed</h2>
				<div id="thumsBox" class="scrollStyle">
					<div class="thums">
						<!--이미지가 있는 글이라면 아래 태그를 노출시켜주시는데
						style 속성의 url 안에 이미지 소스를 넣으시면 됩니다.-->
						<a class="thumCont" style="background-image: url(images/profile/expedition1205@gmail.com.jpg);"></a>
						<div class="icons">
							<div class="heart">
								<i class="far fa-heart"></i>
								<span>100</span><!--좋아요 개수만 출력-->
							</div>
							<div class="comment">
								<i class="far fa-comment"></i>
								<span>50</span><!--댓글 개수만 출력-->
							</div>
						</div>
					</div>
					<div class="thums">
						<!--이미지가 있는 글이라면 아래 태그를 노출시켜주시는데
						style 속성의 url 안에 이미지 소스를 넣으시면 됩니다.-->
						<a class="thumCont" style="background-image: url(images/feed4.jpg);"></a>
						<div class="icons">
							<div class="heart">
								<i class="far fa-heart"></i>
								<span>100</span><!--좋아요 개수만 출력-->
							</div>
							<div class="comment">
								<i class="far fa-comment"></i>
								<span>50</span><!--댓글 개수만 출력-->
							</div>
						</div>
					</div>
					<div class="thums">
						<!--이미지가 있는 글이라면 아래 태그를 노출시켜주시는데
						style 속성의 url 안에 이미지 소스를 넣으시면 됩니다.-->
						<a class="thumCont" style="background-image: url(images/feed5.jpg);"></a>
						<div class="icons">
							<div class="heart">
								<i class="far fa-heart"></i>
								<span>100</span><!--좋아요 개수만 출력-->
							</div>
							<div class="comment">
								<i class="far fa-comment"></i>
								<span>50</span><!--댓글 개수만 출력-->
							</div>
						</div>
					</div>
					<div class="thums">
						<!--이미지가 없는 글이라면 아래 태그를 노출시켜주시면 됩니다.-->
						<a class="thumCont">
							<p>
								이미지가 없는 글이 노출되는 섬네일 입니다. 이 피드는 이미지가 없는 피드 입니다.
								이미지가 없으니까 글이 노출되는 섬네일!!!! 글 줄임 테스트 하려고 많이 씁니다~~!
								이미지가 없는 글이 노출되는 섬네일 입니다. 이 피드는 이미지가 없는 피드 입니다.
								이미지가 없으니까 글이 노출되는 섬네일!!!! 글 줄임 테스트 하려고 많이 씁니다~~!
								미지가 없는 글이 노출되는 섬네일 입니다. 이 피드는 이미지가 없는 피드 입니다.
								이미지가 없으니까 글이 노출되는 섬네일!!!! 글 줄임 테스트 하려고 많이 씁니다~~!
								이미지가 없는 글이 노출되는 섬네일 입니다. 이 피드는 이미지가 없는 피드 입니다.미지가 없는 글이 노출되는 섬네일 입니다. 이 피드는 이미지가 없는 피드 입니다.
								이미지가 없으니까 글이 노출되는 섬네일!!!! 글 줄임 테스트 하려고 많이 씁니다~~!
								이미지가 없는 글이 노출되는 섬네일 입니다. 이 피드는 이미지가 없는 피드 입니다.
							</p>
						</a>
						<div class="icons">
							<div class="heart">
								<i class="far fa-heart"></i>
								<span>100</span><!--좋아요 개수만 출력-->
							</div>
							<div class="comment">
								<i class="far fa-comment"></i>
								<span>50</span><!--댓글 개수만 출력-->
							</div>
						</div>
					</div>
					<div class="thums">
						<!--이미지가 있는 글이라면 아래 태그를 노출시켜주시는데
						style 속성의 url 안에 이미지 소스를 넣으시면 됩니다.-->
						<a class="thumCont" style="background-image: url(images/profile/chdnjs7610@gmail.com.jpg);"></a>
						<div class="icons">
							<div class="heart">
								<i class="far fa-heart"></i>
								<span>100</span><!--좋아요 개수만 출력-->
							</div>
							<div class="comment">
								<i class="far fa-comment"></i>
								<span>50</span><!--댓글 개수만 출력-->
							</div>
						</div>
					</div>
					<div class="thums">
						<!--이미지가 있는 글이라면 아래 태그를 노출시켜주시는데
						style 속성의 url 안에 이미지 소스를 넣으시면 됩니다.-->
						<a class="thumCont" style="background-image: url(images/feed4.jpg);"></a>
						<div class="icons">
							<div class="heart">
								<i class="far fa-heart"></i>
								<span>100</span><!--좋아요 개수만 출력-->
							</div>
							<div class="comment">
								<i class="far fa-comment"></i>
								<span>50</span><!--댓글 개수만 출력-->
							</div>
						</div>
					</div>
					<div class="thums">
						<!--이미지가 있는 글이라면 아래 태그를 노출시켜주시는데
						style 속성의 url 안에 이미지 소스를 넣으시면 됩니다.-->
						<a class="thumCont" style="background-image: url(images/feed4.jpg);"></a>
						<div class="icons">
							<div class="heart">
								<i class="far fa-heart"></i>
								<span>100</span><!--좋아요 개수만 출력-->
							</div>
							<div class="comment">
								<i class="far fa-comment"></i>
								<span>50</span><!--댓글 개수만 출력-->
							</div>
						</div>
					</div>
					<div class="thums">
						<!--이미지가 있는 글이라면 아래 태그를 노출시켜주시는데
						style 속성의 url 안에 이미지 소스를 넣으시면 됩니다.-->
						<a class="thumCont" style="background-image: url(images/feed4.jpg);"></a>
						<div class="icons">
							<div class="heart">
								<i class="far fa-heart"></i>
								<span>100</span><!--좋아요 개수만 출력-->
							</div>
							<div class="comment">
								<i class="far fa-comment"></i>
								<span>50</span><!--댓글 개수만 출력-->
							</div>
						</div>
					</div>
					<div class="thums">
						<!--이미지가 있는 글이라면 아래 태그를 노출시켜주시는데
						style 속성의 url 안에 이미지 소스를 넣으시면 됩니다.-->
						<a class="thumCont" style="background-image: url(images/profile/expedition1205@gmail.com.jpg);"></a>
						<div class="icons">
							<div class="heart">
								<i class="far fa-heart"></i>
								<span>100</span><!--좋아요 개수만 출력-->
							</div>
							<div class="comment">
								<i class="far fa-comment"></i>
								<span>50</span><!--댓글 개수만 출력-->
							</div>
						</div>
					</div>
					<div class="thums">
						<!--이미지가 없는 글이라면 아래 태그를 노출시켜주시면 됩니다.-->
						<a class="thumCont">
							<p>
								이미지가 없는 글이 노출되는 섬네일 입니다. 이 피드는 이미지가 없는 피드 입니다.
								이미지가 없으니까 글이 노출되는 섬네일!!!! 글 줄임 테스트 하려고 많이 씁니다~~!
								이미지가 없는 글이 노출되는 섬네일 입니다. 이 피드는 이미지가 없는 피드 입니다.
								이미지가 없으니까 글이 노출되는 섬네일!!!! 글 줄임 테스트 하려고 많이 씁니다~~!
							</p>
						</a>
						<div class="icons">
							<div class="heart">
								<i class="far fa-heart"></i>
								<span>100</span><!--좋아요 개수만 출력-->
							</div>
							<div class="comment">
								<i class="far fa-comment"></i>
								<span>50</span><!--댓글 개수만 출력-->
							</div>
						</div>
					</div>
					<div class="thums">
						<!--이미지가 있는 글이라면 아래 태그를 노출시켜주시는데
						style 속성의 url 안에 이미지 소스를 넣으시면 됩니다.-->
						<a class="thumCont" style="background-image: url(images/feed4.jpg);"></a>
						<div class="icons">
							<div class="heart">
								<i class="far fa-heart"></i>
								<span>100</span><!--좋아요 개수만 출력-->
							</div>
							<div class="comment">
								<i class="far fa-comment"></i>
								<span>50</span><!--댓글 개수만 출력-->
							</div>
						</div>
					</div>
					
				</div>
			</div>
        </div>
        <!--컨텐츠 끝-->
        
        <!--팔로워, 팔로잉 목록 보는 모달창-->
		<div id="back2"></div>

		<!--팔로워-->
		<!--맞팔이라면 follow 버튼은 노출되지 않도록 설정해주세요!-->
		<!--팔로잉은 unfollow 버튼-->
		<form class="followModal">
			<div class="closeBox">
				<button type="button" class="close" style="color : #a0a0cf;">
					<i class="fas fa-times"></i>
				</button>
			</div>
			<div class="followTitle">
				<h6></h6>
				<span></span>명
			</div>
			<ul class="followList">
				<h5>6기 - 302호 <span>2</span>명</h5>
				<li>
					<a href=" #" class="followPic" nick="shane">
						<img src="images/default.png" />
					</a>
					<div class="followInfo">
						<a href="#" nick="shane">
							<p class="followName">Shane</p>
							<span class="followClass">6기 - 302호</span>
						</a>
					</div>
					<button type="submit" class="f4f">Follow</button>
				</li>

			</ul>

			<ul class="followList">
				<h5>예비학생 <span>2</span>명</h5>
				<li>
					<a href=" #" class="followPic" nick="shane">
						<img src="images/default.png" />
					</a>
					<div class="followInfo">
						<a href="#" nick="shane">
							<p class="followName">Shane</p>
							<span class="followClass">6기 - 302호</span>
						</a>
					</div>
					<button type="submit" class="f4f">Follow</button>
				</li>

			</ul>
		</form>
		
		<!-- footer.jsp include -->
		<jsp:include page="/viewFooter.jsp"></jsp:include>
		
		<script>
            $( ".button_su_inner" ).mouseenter(function(e) {
               var parentOffset = $(this).offset(); 

               var relX = e.pageX - parentOffset.left;
               var relY = e.pageY - parentOffset.top;
               $(this).prev(".su_button_circle").css({"left": relX, "top": relY });
               $(this).prev(".su_button_circle").removeClass("desplode-circle");
               $(this).prev(".su_button_circle").addClass("explode-circle");

            });

            $( ".button_su_inner" ).mouseleave(function(e) {

                 var parentOffset = $(this).offset(); 

                 var relX = e.pageX - parentOffset.left;
                 var relY = e.pageY - parentOffset.top;
                 $(this).prev(".su_button_circle").css({"left": relX, "top": relY });
                 $(this).prev(".su_button_circle").removeClass("explode-circle");
                 $(this).prev(".su_button_circle").addClass("desplode-circle");

            });
			
			var thumsW = $(".thums").width();
			$(".thums").height(thumsW + 40);
			$(".thums a").height(thumsW);
			
			$(function(){

				$(window).resize(function(){
					var thumsW = $(".thums").width();
					$(".thums").height(thumsW + 40);
					$(".thums a").height(thumsW - 40);
				});
				
				//팔로우 목록 모달창
				var follow = $("#back2").is(":visible");

				$(".followBtn").click(function(){
					if(!follow){
						title = $(this).parent("li").children("p").text();
						$(".followTitle h6").text(title);
						n = $(this).text();
						$(".followTitle span").text(n);

						$('body').addClass('scrollOff').on('scroll touchmove mousewheel', function(e){
							e.preventDefault();
						});

						$("#back2").fadeIn(200);
						$(".followModal").delay(100).animate({top: "50%"},400);
						follow = true;
					}
				});

				$(".close, #back2").on("click", function(){
					if(follow){
						$('body').removeClass('scrollOff').off('scroll touchmove mousewheel');
						$(".followModal").delay(100).animate({top: "-30%"},400);
						$("#back2").fadeOut(200);
						follow = false;
					}
				});
				
				//팔로우 버튼
				$("#toFollow").on("click", function(){
					var text = $(this).find(".button_text_container").text();
					
					if(text == "Follow"){
						$(this).find(".button_text_container").text("Unfollow");
					}else{
						$(this).find(".button_text_container").text("Follow");
					}
				});
				
				/*.thums p 생략기호*/
				$('.thums').each(function(){
                    var content = $(this).find('p');
                    var index = content.width();
                    var content_txt = content.text();
                    var content_txt_short = content_txt.substring(0,200)+"...";

                    if(content_txt.length >= 200){
                        content.html(content_txt_short);
                    }
                });
			})
        </script>
	</body>
</html>