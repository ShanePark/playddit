<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div id="profile">
        <div id="infoBox">
			<a href="#" id="userPic">
				<img src="images/default.png" />
			</a>
			<div id="userBox">
				<a href="#" id="userName"></a><br/>
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