<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
	<div class="cen">
		<a href="feed.jsp">
			<img src="images/logo1.png" alt="logo"/>
		</a>
		<div id="search">
			<form action="" method="get">
				<input type="text" name="searchBox" placeholder="search"/>
				<button type="button" name="search">
					<i class="fas fa-search"></i>
				</button>
			</form>
		</div>
		<ul id="gnb">
			<li>
				<a href="/WebContent/feed.jsp"><i class="fas fa-home"></i></a>
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

			<!--알람 모달 -->
			<div id="alarmEdge" class="alarmEdge2"></div>
			<div id="modal" class="alarmModal">
				<div id="alarmWrap">
				   <div class="alarm classMoniter">
						<a class="alarmUser" href="#">
							<img src="images/default.png" />
						</a>
						<a class="alarmCont" href="#">
							<span class="alarmNick">adsgasdg</span>님의 학급 승인 요청
						</a>
						<button type="button"><i class="fas fa-times red"></i></button>
						<button type="button"><i class="fas fa-check"></i></button>
					</div>
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
			<div id="alarmEdge2" class="alarmEdge2"></div>
		</ul>
	</div>

	<!-- 피드 검색 모달창 -->
	<div id="mask"></div>
	<div id="feedSearch" class="feedSearch2">
		<div class="edge edge2"></div>
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
</header>