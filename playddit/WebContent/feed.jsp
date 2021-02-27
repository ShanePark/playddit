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
        <link href="css/style.css" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="script/script.js"></script>
		<script src="script/main.js"></script>
	</head>
    <body>
        <div class="cen" id="wrap">
        	<!-- header.jsp include -->
           	<jsp:include page="header.jsp"></jsp:include>
	           
	            <div id="storyBox">
		    <div class="storyOn">
		        <img src="images/default.png" />
		    </div>
		    <div class="storyOff">
		        <img src="images/default.png" />
		    </div>
		    <div class="storyOn">
		        <img src="images/default.png" />
		    </div>
		</div>
		
		<div id="feedBox">
		    <div class="feed">
		        <div class="proBox">
		            <div class="proCir">
		                <img src="images/default.png" alt="프로필사진" />
		            </div>
		            <p class="proName">Scarl-ett</p>
		            <span class="proClass">6기 - 302호</span>
		        </div>
		        
		        <div class="feedPic">
		            <div class="slider">
		                <div class="slide">
		                    <img src="images/feed.png"  />
		                </div>
		            </div>
		        </div>
		        
		        <div class="icon">
		            <form action="feedUpdate.jsp" method="post">
		                <button type="submit" class="like">
		                    <i class="far fa-heart"></i>
		                </button>
		                <button type="button" class="commant">
		                    <i class="far fa-comment-dots"></i>
		                </button>
		                <button type="button" class="dm">
		                    <i class="fas fa-paper-plane"></i>
		                </button>
		            </form>
		            
		            <!--사진이 한 장일 경우 출력되지 않는다.-->
		            <!--<div class="page">
		                <ul>
		                    <li><i class="fas fa-circle"></i></li>
		                    <li><i class="far fa-circle"></i></li>
		                </ul>
		            </div>-->
		            
		            <button type="button" class="report">
		                <i class="fas fa-exclamation-circle"></i>
		            </button>
		        </div>
		        
		        <div class="txt">
		            <p class="proName">Scarl-ett</p>
		            <p class="txtCont">
		                프로그래머스 문제풀이 중..ㅠ<br/>
		                어떤 경우에 틀렸는지 좀 알려주세요...ㅠㅠ
		            </p>
		        </div>
		        <button type="button" class="more">더보기 &gt;</button>
		        
		        <div class="countComm">
		            댓글 <span class="count">13</span>개
		        </div>
		        
		        <div class="commantBox">
		            <ul>
		                <li class="comm">
		                    <a href="#" class="commUser">summer</a>
		                    <span>프로그래머스 언제 다하죠?ㅠ</span>
		                    <ul class="replyBox">
		                        <li class="reply">
		                            <a href="#" class="replyUser">summer</a>
		                            <span>대댓글</span>
		                        </li>
		                        <li class="reply">
		                            <a href="#" class="replyUser">summer</a>
		                            <span>대댓글</span>
		                        </li>
		                    </ul>
		                </li>
		                <li class="comm">
		                    <a href="#" class="commUser">홍길동</a>
		                    <span>화이팅~!</span>
		                </li>
		            </ul>
		        </div>
		    </div>
		    
		    <div class="feed">
		        <div class="proBox">
		            <div class="proCir">
		                <img src="images/default.png" alt="프로필사진" />
		            </div>
		            <p class="proName">Scarl-ett</p>
		            <span class="proClass">6기 - 302호</span>
		        </div>
		        
		        <!--글만 있을 경우 출력되지 않는다.-->
		        <!--<div class="feedPic">
		            <div class="slider">
		                <div class="slide">
		                    <img src="images/feed.png"  />
		                </div>
		            </div>
		        </div>-->
		        
		        <div class="icon">
		            <form action="feedUpdate.jsp" method="post">
		                <button type="submit" class="like">
		                    <i class="far fa-heart"></i>
		                </button>
		                <button type="button" class="commant">
		                    <i class="far fa-comment-dots"></i>
		                </button>
		                <button type="button" class="dm">
		                    <i class="fas fa-paper-plane"></i>
		                </button>
		            </form>
		            
		            <!--글만 있을 경우 출력되지 않는다.-->
		            <!--<div class="page">
		                <ul>
		                    <li><i class="fas fa-circle"></i></li>
		                    <li><i class="far fa-circle"></i></li>
		                </ul>
		            </div>-->
		            
		            <button type="button" class="report">
		                <i class="fas fa-exclamation-circle"></i>
		            </button>
		        </div>
		        
		        <div class="txt">
		            <p class="proName">Scarl-ett</p>
		            <p class="txtCont">
		                안되나용 왜 나는 안되나용<br/>
		                그놈은 되고 왜 나는 안되나용<br/>
		                <br/>
		                사랑 때문에 너무 아프다<br/>
		                너무 아파서 술 한잔 때렸다<br/>
		                모질게 나를 버리고 가면<br/>
		                남겨진 나는 어떡하라고<br/>
		                사느냐 죽느냐 그것이 문제로다<br/>
		                <br/>
		                안되나용 왜 나는 안되나용<br/>
		                그놈은 되고 왜 나는 안되나용<br/>
		                얼굴이니 아니면 입방정이니<br/>
		                그러면 나는 누구를 만나나용<br/>
		                <br/>
		                그놈 때문에 뚜껑 열렸다<br/>
		                뚜껑 열려서 술 한잔 때렸다<br/>
		                그렇게 그녈 데리고 가면<br/>
		                남겨진 나는 어떡하라고<br/>
		                썸한번 못 타고 이렇게 끝나나용<br/>
		                <br/>
		                안되나용 왜 나는 안되나용<br/>
		                그놈은 되고 왜 나는 안되나용<br/>
		                얼굴이니 아니면 그냥 아니니<br/>
		                그러면 나는 영원히 안되나용<br/>
		            </p>
		        </div>
		        <button type="button" class="more">더보기 &gt;</button>
		        
		        <div class="countComm">
		            댓글 <span class="count">13</span>개
		        </div>
		        
		        <div class="commantBox">
		            <ul>
		                <li class="comm">
		                    <a href="#" class="commUser">summer</a>
		                    <span>프로그래머스 언제 다하죠?ㅠ</span>
		                    <ul class="replyBox">
		                        <li class="reply">
		                            <a href="#" class="replyUser">summer</a>
		                            <span>대댓글</span>
		                        </li>
		                        <li class="reply">
		                            <a href="#" class="replyUser">summer</a>
		                            <span>대댓글</span>
		                        </li>
		                    </ul>
		                </li>
		                <li class="comm">
		                    <a href="#" class="commUser">홍길동</a>
		                    <span>화이팅~!</span>
		                </li>
		            </ul>
		        </div>
		    </div>
		    
		    <div class="feed">
		        <div class="proBox">
		            <div class="proCir">
		                <img src="images/default.png" alt="프로필사진" />
		            </div>
		            <p class="proName">Scarl-ett</p>
		            <span class="proClass">6기 - 302호</span>
		        </div>
		        
		        <div class="feedPic">
		            <div class="slider">
		                <div class="slide">
		                    <img src="images/feed2.png"  />
		                </div>
		                <div class="slide">
		                    <img src="images/feed2.png"  />
		                </div>
		            </div>
		        </div>
		        
		        <div class="icon">
		            <form action="feedUpdate.jsp" method="post">
		                <button type="submit" class="like">
		                    <i class="far fa-heart"></i>
		                </button>
		                <button type="button" class="commant">
		                    <i class="far fa-comment-dots"></i>
		                </button>
		                <button type="button" class="dm">
		                    <i class="fas fa-paper-plane"></i>
		                </button>
		            </form>
		            
		            <div class="page">
		                <ul>
		                    <li><i class="fas fa-circle"></i></li>
		                    <li><i class="far fa-circle"></i></li>
		                </ul>
		            </div>
		            
		            <button type="button" class="report">
		                <i class="fas fa-exclamation-circle"></i>
		            </button>
		        </div>
		        
		        <div class="txt">
		            <p class="proName">Scarl-ett</p>
		            <p class="txtCont">
		                프로그래머스 문제풀이 중..ㅠ<br/>
		                어떤 경우에 틀렸는지 좀 알려주세요...ㅠㅠ
		            </p>
		        </div>
		        <button type="button" class="more">더보기 &gt;</button>
		        
		        <div class="countComm">
		            댓글 <span class="count">13</span>개
		        </div>
		        
		        <div class="commantBox">
		            <ul>
		                <li class="comm">
		                    <a href="#" class="commUser">summer</a>
		                    <span>프로그래머스 언제 다하죠?ㅠ</span>
		                    <ul class="replyBox">
		                        <li class="reply">
		                            <a href="#" class="replyUser">summer</a>
		                            <span>대댓글</span>
		                        </li>
		                        <li class="reply">
		                            <a href="#" class="replyUser">summer</a>
		                            <span>대댓글</span>
		                        </li>
		                    </ul>
		                </li>
		                <li class="comm">
		                    <a href="#" class="commUser">홍길동</a>
		                    <span>화이팅~!</span>
		                </li>
		            </ul>
		        </div>
		    </div>
		</div>
		
		<!-- footer.jsp include -->
		<jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
