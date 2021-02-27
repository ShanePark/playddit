<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav id="lnb">
    <ul>
        <li class="main active">
            <a href="#">
                <i class="fas fa-comment-dots"></i>Feed
            </a>
        </li>
        <li class="main">
            <a href="#">
                <i class="far fa-newspaper"></i>News
            </a>
        </li>
        <li class="main">
            <a href="#">
                <i class="fas fa-users"></i>Study
            </a>
        </li>
        <li class="main">
            <a href="#">
                <i class="fas fa-utensils"></i>Food
            </a>
        </li>
        <li class="main">
            <a href="#">
                <i class="fas fa-store"></i>Store
            </a>
        </li>
        <li class="main">
            <a href="#">
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

<div id="contents">
    <div id="back"></div>
    
    <header>
        <a href="#">
            <img src="images/logo1.png" alt="logo" />
        </a>
        
        <div id="search">
            <form>
                <input type="text" name="searchBox" placeholder="search"/>
                <button type="button" name="search">
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
                <form>
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
                <a href="#">
                    <i class="fas fa-comment-dots"></i>Feed
                </a>
            </li>
            <li class="main">
                <a href="#">
                    <i class="far fa-newspaper"></i>News
                </a>
            </li>
            <li class="main">
                <a href="#">
                    <i class="fas fa-users"></i>Study
                </a>
            </li>
            <li class="main">
                <a href="#">
                    <i class="fas fa-utensils"></i>Food
                </a>
            </li>
            <li class="main">
                <a href="#">
                    <i class="fas fa-store"></i>Store
                </a>
            </li>
            <li class="main">
                <a href="#">
                    <i class="fas fa-cog"></i>Setting
                </a>
            </li>
        </ul>
    </nav>
    
    <!--알람 모달 -->
    <div id="alarmEdge"></div>
    <div id="modal">
        <div id="alarmWrap">
            <div class="alarm">
                <a class="alarmUser" href="#">
                    <img src="images/default.png" />
                </a>
                <a class="alarmCont" href="#">
                    <span class="alarmNick">josh</span>님이 나를 follow 했습니다.
                </a>
            </div>
            <div class="alarm">
                <a class="alarmUser" href="#">
                    <img src="images/default.png" />
                </a>
                <a class="alarmCont" href="#">
                    <span class="alarmNick">summer</span>님이 내가 쓴 글을 좋아합니다.
                </a>
            </div>
            <div class="alarm">
                <a class="alarmUser" href="#">
                    <img src="images/default.png" />
                </a>
                <a class="alarmCont" href="#">
                    <span class="alarmNick">shane</span>님이 내가 쓴 글에 댓글을 남겼습니다.
                </a>
            </div>
            <div class="alarm">
                <a class="alarmUser" href="#">
                    <img src="images/default.png" />
                </a>
                <a class="alarmCont" href="#">
                    <span class="alarmNick">홍길동</span>님이 나를 follow 취소했습니다.
                </a>
            </div>
            <div class="alarm">
                <a class="alarmUser" href="#">
                    <img src="images/default.png" />
                </a>
                <a class="alarmCont" href="#">
                    <span class="alarmNick">프로그래머스 스터디</span>에서 공지사항이 올라왔습니다.
                </a>
            </div>
            <div class="alarm">
                <a class="alarmUser" href="#">
                    <img src="images/default.png" />
                </a>
                <a class="alarmCont" href="#">
                    <span class="alarmNick">프로그래머스 스터디</span>에서 공지사항이 올라왔습니다.
                </a>
            </div>
            <div class="alarm">
                <a class="alarmUser" href="#">
                    <img src="images/default.png" />
                </a>
                <a class="alarmCont" href="#">
                    <span class="alarmNick">shane</span>님이 내가 쓴 글에 댓글을 남겼습니다.
                </a>
            </div>
             <div class="alarm">
                <a class="alarmUser" href="#">
                    <img src="images/default.png" />
                </a>
                <a class="alarmCont" href="#">
                    <span class="alarmNick">asdgasdgasdgasdg</span>님이 내가 쓴 글에 댓글을 남겼습니다.
                </a>
            </div>
            <div class="alarm">
                <a class="alarmUser" href="#">
                    <img src="images/default.png" />
                </a>
                <a class="alarmCont" href="#">
                    <span class="alarmNick">홍길동</span>님이 나를 follow 취소했습니다.
                </a>
            </div>
            <div class="alarm">
                <a class="alarmUser" href="#">
                    <img src="images/default.png" />
                </a>
                <a class="alarmCont" href="#">
                    <span class="alarmNick">abcdefg</span>님이 나를 follow 했습니다.
                </a>
            </div>
        </div>
    </div>
    <div id="alarmEdge2"></div>