<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
</div>
    
    <div id="profile">
        <div id="infoBox">
            <a href="#" id="userPic">
                <img src="images/default.png" />
            </a>
            <div id="userBox">
                <a href="#" id="userName"></a>
                <span id="userMail"></span>
            </div>
        </div>
        <div id="followBox">
            <ul>
                <li>
                    <span class="th">게시물</span><br/>
                    <a href="#" id="allFeed"></a>
                </li>
                <li>
                    <span class="th">팔로워</span><br/>
                    <a class="followBtn" id="Follower"></a>
                </li>
                <li>
                    <span class="th">팔로잉</span><br/>
                    <a class="followBtn" id="Following"></a>
                </li>
            </ul>
        </div>
        <div id="myInfo">
            <a href="#" id="className"></a>
            <p id="self"></p>
        </div>
        <div id="myGroup">
            <ul>
                <li class="group">
                    <a href="#">
                        <div class="groupCir">
                            <img src="images/default.png"/>
                        </div>
                        <div class="groupInfo">
                            <p class="groupName">6기 - 302호</p>
                            <span class="mem">소속인원 25</span>
                        </div>
                    </a>
                </li>
                 <li class="group">
                    <a href="#">
                        <div class="groupCir">
                            <img src="images/default.png"/>
                        </div>
                        <div class="groupInfo">
                            <p class="groupName">정보처리기사</p>
                            <span class="mem">스터디원 6</span>
                        </div>
                    </a>
                </li>
                 <li class="group">
                    <a href="#">
                        <div class="groupCir">
                            <img src="images/default.png"/>
                        </div>
                        <div class="groupInfo">
                            <p class="groupName">프로그래머스 스터디</p>
                            <span class="mem">스터디원 20</span>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
        
        <button type="button" id="logout">
            <i class="fas fa-sign-out-alt"></i>
        </button>
    </div>
</div>

<footer>
    <p id="copy">&copy; PLAYDDIT All Rights Reserved</p>
    
    <div id="top">
        <a href="#" alt="to top">
            <i class="fas fa-arrow-up"></i>
        </a>
    </div>
</footer>