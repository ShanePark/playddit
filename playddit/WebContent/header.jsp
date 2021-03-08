<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav id="lnb">
    <ul>
        <li class="main active">
            <a href="feed.jsp">
                <i class="fas fa-comment-dots"></i>Feed
            </a>
        </li>
        <li class="main">
            <a href="news.jsp">
                <i class="far fa-newspaper"></i>News
            </a>
        </li>
        <li class="main">
            <a href="study.jsp">
                <i class="fas fa-users"></i>Study
            </a>
        </li>
        <li class="main">
            <a href="food.jsp">
                <i class="fas fa-utensils"></i>Food
            </a>
        </li>
        <li class="main">
            <a href="store.jsp">
                <i class="fas fa-store"></i>Store
            </a>
        </li>
        <li class="main">
            <a href="setting.jsp">
                <i class="fas fa-cog"></i>Setting
            </a>
        </li>
    </ul>
</nav>

<!--팔로워, 팔로잉 목록 보는 모달창-->
<div id="back2"></div>

<!--팔로워-->
<!--맞팔이라면 follow 버튼은 노출되지 않도록 설정해주세요!-->
<!--팔로잉은 unfollow 버튼-->
<form id="myFollower" class="followModal">
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
    </ul>
</form>

<div id="contents">
    <div id="back"></div>
    
    <header>
        <a href="feed.jsp">
            <img src="images/logo1.png" alt="logo" />
        </a>
        
        <div id="search">
            <form class="searchs" onsubmit="searchFunc()">
                <input type="text" name="searchBox" placeholder="search"/>
                <button type="submit" name="search">
                    <i class="fas fa-search"></i>
                </button>
            </form>
        </div>
        
        <ul id="gnb">
            <li>
                <a href="#"><i class="fas fa-home"></i></a>
            </li>
            <li>
                <a href="#"><i class="fas fa-envelope"></i></a>
            </li>
            <li>
                <a href="#"><i class="fas fa-pen-nib"></i></a>
            </li>
            <li>
                <a class="alarmBtn"><i class="fas fa-bell"></i></a>
            </li>
        </ul>
    </header>
    
    <!--테블릿, 모바일 용 header-->
    <div id="mo">
        <div id="mflexBox">
            <a href="#">
                <img src="images/logo1.png" alt="logo" />
            </a>
        </div>

        <div id="mheader">
            <div id="mheaderTop">
                <button id="ham">
                    <div class="patty p1"></div>
                    <div class="patty p2"></div>
                    <div class="patty p3"></div>
                </button>

                <div id="flexBox">
                    <a href="#">
                        <img src="images/logo1.png" alt="logo" />
                    </a>
                </div>


                <ul id="mgnb">
                    <li>
                        <a href="#"><i class="fas fa-home"></i></a>
                    </li>
                    <li>
                        <a href="#"><i class="fas fa-envelope"></i></a>
                    </li>
                    <li>
                        <a href="#"><i class="fas fa-pen-nib"></i></a>
                    </li>
                    <li>
                        <a class="alarmBtn"><i class="fas fa-bell"></i></a>
                    </li>
                    <li>
                        <a href="#" id="cir">
                            <img src="images/default.png" />
                        </a>
                    </li>
                </ul>
            </div>

            <div id="msearch">
                <form class="searchs">
                    <input type="text" name="searchBox" placeholder="search"/>
                    <button type="button" name="search">
                        <i class="fas fa-search"></i>
                    </button>
                </form>
            </div>
        </div>

    </div>
    
    <!--햄버거 메뉴 리스트-->
    <button id="mham">
        <div class="patty p1"></div>
        <div class="patty p2"></div>
        <div class="patty p3"></div>
    </button>
    
    <nav id="mnav">
        <ul>
            <li class="main active">
                <a href="feed.jsp">
                    <i class="fas fa-comment-dots"></i>Feed
                </a>
            </li>
            <li class="main">
                <a href="news.jsp">
                    <i class="far fa-newspaper"></i>News
                </a>
            </li>
            <li class="main">
                <a href="study.jsp">
                    <i class="fas fa-users"></i>Study
                </a>
            </li>
            <li class="main">
                <a href="food.jsp">
                    <i class="fas fa-utensils"></i>Food
                </a>
            </li>
            <li class="main">
                <a href="store.jsp">
                    <i class="fas fa-store"></i>Store
                </a>
            </li>
            <li class="main">
                <a href="setting">
                    <i class="fas fa-cog"></i>Setting
                </a>
            </li>
        </ul>
    </nav>
    
    <!--알람 모달 -->
    <div id="alarmEdge"></div>
    <div id="modal">
        <div id="alarmWrap">
        </div>
    </div>
    <div id="alarmEdge2"></div>
