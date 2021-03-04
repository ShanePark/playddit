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
        <link href="css/view.css" rel="stylesheet" />
        <link href="css/feed.css" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
		<script src="script/script.js"></script>
		<script src="script/emoji_jk.js"></script>
		<script src="script/view.js"></script>
		<script src="script/feedView.js"></script>
	</head>
    <body>
       <!-- header.jsp include -->
	    <jsp:include page="/viewHeader.jsp"></jsp:include>
        
        <div class="cen feedView" id="wrap">
            <div id="viewLeft">
	            <div id="slider">
	            </div>
            </div>
            <div id="viewRight">
                <div id="userProfile">
                    <!--내 피드라면 버튼이 여기에 출력-->
                </div>
                <div id="cont" class="scrollStyle">
                    <p id="contTxt">
                    </p>
                    <div id="contIcon">
                        <button type="button" class="comment">
                            <i class="far fa-comment-dots"></i>
                        </button>
                        <button type="button" class="dm">
                            <i class="fas fa-paper-plane"></i>
                        </button>
                        
                    </div>
                    <p id="likeBtn"></p>
                    <div id="feedComm">
                        <ul>
                        </ul>
                    </div>
                </div>
				<div id="commentInputBox">
					<div class = "row">
						<div class = "col-lg-2">
						  <img class="emoji_pickup" id="emoji_pickup_before" src="images/emoji/1f642.png">
						  <img class="emoji_pickup" id="emoji_pickup_after" src="images/emoji/1f600.png">

						  <div id="emoji_popup">
							<div id="emoji_navigator">
							  <a href="#people"><img style="margin-left: 6px" class="navigator" id="nav_people" src="images/emoji/nav_people.png" /></a>
							  <a href="#flag"><img class="navigator" id="nav_flag" src="images/emoji/nav_flag.png" /></a>
							  <a href="#activity"><img class="navigator" id="nav_activity" src="images/emoji/nav_activity.png" /></a>
							  <a href="#food"><img class="navigator" id="nav_food" src="images/emoji/nav_food.png" /></a>
							  <a href="#plant"><img class="navigator" id="nav_plant" src="images/emoji/nav_plant.png" /></a>
							  <a href="#animal"><img class="navigator" id="nav_animal" src="images/emoji/nav_animal.png" /></a>
							  <a href="#tool"><img class="navigator" id="nav_tools" src="images/emoji/nav_tools.png" /></a>
							</div>
							<!-- emoji popup div start -->
							<div id="people"><h5>People</h5></div>
							<img class="emoji_list" id="1f644" src="images/emoji/1f644.png" />
							<img class="emoji_list" id="1f643" src="images/emoji/1f643.png" />
							<img class="emoji_list" id="1f642" src="images/emoji/1f642.png" />
							<img class="emoji_list" id="1f641" src="images/emoji/1f641.png" />
							<img class="emoji_list" id="1f640" src="images/emoji/1f640.png" />
							<img class="emoji_list" id="1f639" src="images/emoji/1f639.png" />
							<img class="emoji_list" id="1f638" src="images/emoji/1f638.png" />
							<img class="emoji_list" id="1f637" src="images/emoji/1f637.png" />
							<img class="emoji_list" id="1f636" src="images/emoji/1f636.png" />
							<img class="emoji_list" id="1f635" src="images/emoji/1f635.png" />
							<img class="emoji_list" id="1f634" src="images/emoji/1f634.png" />
							<img class="emoji_list" id="1f633" src="images/emoji/1f633.png" />
							<img class="emoji_list" id="1f632" src="images/emoji/1f632.png" />
							<img class="emoji_list" id="1f631" src="images/emoji/1f631.png" />
							<img class="emoji_list" id="1f630" src="images/emoji/1f630.png" />
							<img class="emoji_list" id="1f629" src="images/emoji/1f629.png" />
							<img class="emoji_list" id="1f628" src="images/emoji/1f628.png" />
							<img class="emoji_list" id="1f627" src="images/emoji/1f627.png" />
							<img class="emoji_list" id="1f626" src="images/emoji/1f626.png" />
							<img class="emoji_list" id="1f625" src="images/emoji/1f625.png" />
							<img class="emoji_list" id="1f624" src="images/emoji/1f624.png" />
							<img class="emoji_list" id="1f623" src="images/emoji/1f623.png" />
							<img class="emoji_list" id="1f622" src="images/emoji/1f622.png" />
							<img class="emoji_list" id="1f621" src="images/emoji/1f621.png" />
							<img class="emoji_list" id="1f620" src="images/emoji/1f620.png" />
							<img class="emoji_list" id="1f619" src="images/emoji/1f619.png" />
							<img class="emoji_list" id="1f618" src="images/emoji/1f618.png" />
							<img class="emoji_list" id="1f617" src="images/emoji/1f617.png" />
							<img class="emoji_list" id="1f616" src="images/emoji/1f616.png" />
							<img class="emoji_list" id="1f615" src="images/emoji/1f615.png" />
							<img class="emoji_list" id="1f614" src="images/emoji/1f614.png" />
							<img class="emoji_list" id="1f613" src="images/emoji/1f613.png" />
							<img class="emoji_list" id="1f612" src="images/emoji/1f612.png" />
							<img class="emoji_list" id="1f611" src="images/emoji/1f611.png" />
							<img class="emoji_list" id="1f610" src="images/emoji/1f610.png" />
							<img class="emoji_list" id="1f609" src="images/emoji/1f609.png" />
							<img class="emoji_list" id="1f608" src="images/emoji/1f608.png" />
							<img class="emoji_list" id="1f607" src="images/emoji/1f607.png" />
							<img class="emoji_list" id="1f606" src="images/emoji/1f606.png" />
							<img class="emoji_list" id="1f605" src="images/emoji/1f605.png" />
							<img class="emoji_list" id="1f604" src="images/emoji/1f604.png" />
							<img class="emoji_list" id="1f603" src="images/emoji/1f603.png" />
							<img class="emoji_list" id="1f602" src="images/emoji/1f602.png" />
							<img class="emoji_list" id="1f601" src="images/emoji/1f601.png" />
							<img class="emoji_list" id="1f600" src="images/emoji/1f600.png" />
							<img class="emoji_list" id="1f929" src="images/emoji/1f929.png" />
							<img class="emoji_list" id="1f928" src="images/emoji/1f928.png" />
							<img class="emoji_list" id="1f927" src="images/emoji/1f927.png" />
							<img class="emoji_list" id="1f925" src="images/emoji/1f925.png" />
							<img class="emoji_list" id="1f924" src="images/emoji/1f924.png" />
							<img class="emoji_list" id="1f923" src="images/emoji/1f923.png" />
							<img class="emoji_list" id="1f922" src="images/emoji/1f922.png" />
							<img class="emoji_list" id="1f920" src="images/emoji/1f920.png" />
							<img class="emoji_list" id="1f917" src="images/emoji/1f917.png" />
							<img class="emoji_list" id="1f915" src="images/emoji/1f915.png" />
							<img class="emoji_list" id="1f914" src="images/emoji/1f914.png" />
							<img class="emoji_list" id="1f913" src="images/emoji/1f913.png" />
							<img class="emoji_list" id="1f912" src="images/emoji/1f912.png" />
							<img class="emoji_list" id="1f911" src="images/emoji/1f911.png" />
							<img class="emoji_list" id="1f910" src="images/emoji/1f910.png" />


							<br /><br /><div id="flag"><h5>Flag</h5></div>
							<img class="emoji_list" id="1f1f0-1f1f7" src="images/emoji/1f1f0-1f1f7.png" />
							<img class="emoji_list" id="1f1f2-1f1eb" src="images/emoji/1f1f2-1f1eb.png" />
							<img class="emoji_list" id="1f1f1-1f1f7" src="images/emoji/1f1f1-1f1f7.png" />
							<img class="emoji_list" id="1f1e6-1f1e8" src="images/emoji/1f1e6-1f1e8.png" />
							<img class="emoji_list" id="1f1e6-1f1e9" src="images/emoji/1f1e6-1f1e9.png" />
							<img class="emoji_list" id="1f1e6-1f1ea" src="images/emoji/1f1e6-1f1ea.png" />
							<img class="emoji_list" id="1f1e6-1f1f2" src="images/emoji/1f1e6-1f1f2.png" />
							<img class="emoji_list" id="1f1e6-1f1f4" src="images/emoji/1f1e6-1f1f4.png" />
							<img class="emoji_list" id="1f1e6-1f1f7" src="images/emoji/1f1e6-1f1f7.png" />
							<img class="emoji_list" id="1f1e6-1f1fd" src="images/emoji/1f1e6-1f1fd.png" />
							<img class="emoji_list" id="1f1e7-1f1ea" src="images/emoji/1f1e7-1f1ea.png" />
							<img class="emoji_list" id="1f1e7-1f1ec" src="images/emoji/1f1e7-1f1ec.png" />
							<img class="emoji_list" id="1f1e7-1f1f7" src="images/emoji/1f1e7-1f1f7.png" />
							<img class="emoji_list" id="1f1e8-1f1e6" src="images/emoji/1f1e8-1f1e6.png" />
							<img class="emoji_list" id="1f1e8-1f1ee" src="images/emoji/1f1e8-1f1ee.png" />
							<img class="emoji_list" id="1f1e8-1f1f1" src="images/emoji/1f1e8-1f1f1.png" />
							<img class="emoji_list" id="1f1e8-1f1f3" src="images/emoji/1f1e8-1f1f3.png" />
							<img class="emoji_list" id="1f1e9-1f1f0" src="images/emoji/1f1e9-1f1f0.png" />
							<img class="emoji_list" id="1f1ec-1f1e6" src="images/emoji/1f1ec-1f1e6.png" />
							<img class="emoji_list" id="1f1eb-1f1f2" src="images/emoji/1f1eb-1f1f2.png" />
							<img class="emoji_list" id="1f1ea-1f1fa" src="images/emoji/1f1ea-1f1fa.png" />
							<img class="emoji_list" id="1f1ec-1f1f9" src="images/emoji/1f1ec-1f1f9.png" />
							<img class="emoji_list" id="1f1ef-1f1f5" src="images/emoji/1f1ef-1f1f5.png" />
							<img class="emoji_list" id="1f1f0-1f1ed" src="images/emoji/1f1f0-1f1ed.png" />
							<img class="emoji_list" id="1f1f2-1f1f0" src="images/emoji/1f1f2-1f1f0.png" />
							<img class="emoji_list" id="1f1f5-1f1f1" src="images/emoji/1f1f5-1f1f1.png" />
							<img class="emoji_list" id="1f1f5-1f1f8" src="images/emoji/1f1f5-1f1f8.png" />
							<img class="emoji_list" id="1f1f5-1f1fe" src="images/emoji/1f1f5-1f1fe.png" />
							<img class="emoji_list" id="1f1f6-1f1e6" src="images/emoji/1f1f6-1f1e6.png" />
							<img class="emoji_list" id="1f1f8-1f1f4" src="images/emoji/1f1f8-1f1f4.png" />
							<img class="emoji_list" id="1f1f8-1f1fe" src="images/emoji/1f1f8-1f1fe.png" />
							<img class="emoji_list" id="1f1fa-1f1f2" src="images/emoji/1f1fa-1f1f2.png" />


							<br /><br /><div id="activity"><h5>Activity</h5></div>
							<img class="emoji_list" id="26f9-1f3ff-2642" src="images/emoji/26f9-1f3ff-2642.png" />
							<img class="emoji_list" id="1f939" src="images/emoji/1f939.png" />
							<img class="emoji_list" id="1f938-2642" src="images/emoji/1f938-2642.png" />
							<img class="emoji_list" id="1f93d-1f3fd-2642" src="images/emoji/1f93d-1f3fd-2642.png" />
							<img class="emoji_list" id="1f93d-2642" src="images/emoji/1f93d-2642.png" />
							<img class="emoji_list" id="1f93c-2642" src="images/emoji/1f93c-2642.png" />
							<img class="emoji_list" id="1f93a" src="images/emoji/1f93a.png" />
							<img class="emoji_list" id="1f9d8-1f3fc-2640" src="images/emoji/1f9d8-1f3fc-2640.png" />
							<img class="emoji_list" id="1f9d7-1f3fd-2642" src="images/emoji/1f9d7-1f3fd-2642.png" />
							<img class="emoji_list" id="1f6cc-1f3ff" src="images/emoji/1f6cc-1f3ff.png" />
							<img class="emoji_list" id="1f6c0-1f3fc" src="images/emoji/1f6c0-1f3fc.png" />
							<img class="emoji_list" id="1f6b6-1f3ff" src="images/emoji/1f6b6-1f3ff.png" />
							<img class="emoji_list" id="1f6b5-1f3fc" src="images/emoji/1f6b5-1f3fc.png" />
							<img class="emoji_list" id="1f6a3-2642" src="images/emoji/1f6a3-2642.png" />
							<img class="emoji_list" id="1f3cc-2642" src="images/emoji/1f3cc-2642.png" />
							<img class="emoji_list" id="1f3cb-1f3fd" src="images/emoji/1f3cb-1f3fd.png" />
							<img class="emoji_list" id="1f3c4-2640" src="images/emoji/1f3c4-2640.png" />
							<img class="emoji_list" id="1f3c3-1f3fe-2640" src="images/emoji/1f3c3-1f3fe-2640.png" />
							<img class="emoji_list" id="1f3c2-1f3ff" src="images/emoji/1f3c2-1f3ff.png" />
							<img class="emoji_list" id="1f3a8" src="images/emoji/1f3a8.png" />
							<img class="emoji_list" id="1f3ac" src="images/emoji/1f3ac.png" />
							<img class="emoji_list" id="1f3ae" src="images/emoji/1f3ae.png" />
							<img class="emoji_list" id="1f3be" src="images/emoji/1f3be.png" />
							<img class="emoji_list" id="1f3b1" src="images/emoji/1f3b1.png" />
							<img class="emoji_list" id="1f3b4" src="images/emoji/1f3b4.png" />
							<img class="emoji_list" id="1f3b3" src="images/emoji/1f3b3.png" />
							<img class="emoji_list" id="1f3b5" src="images/emoji/1f3b5.png" />
							<img class="emoji_list" id="1f3c0" src="images/emoji/1f3c0.png" />
							<img class="emoji_list" id="1f94a" src="images/emoji/1f94a.png" />
							<img class="emoji_list" id="1f94b" src="images/emoji/1f94b.png" />
							<img class="emoji_list" id="1f94c" src="images/emoji/1f94c.png" />
							<img class="emoji_list" id="26be" src="images/emoji/26be.png" />
							<img class="emoji_list" id="26bd" src="images/emoji/26bd.png" />


							<br /><br /><div id="food"><h5>Food</h5></div>
							<img class="emoji_list" id="1f96a" src="images/emoji/1f96a.png" />
							<img class="emoji_list" id="1f95f" src="images/emoji/1f95f.png" />
							<img class="emoji_list" id="1f95e" src="images/emoji/1f95e.png" />
							<img class="emoji_list" id="1f95d" src="images/emoji/1f95d.png" />
							<img class="emoji_list" id="1f95b" src="images/emoji/1f95b.png" />
							<img class="emoji_list" id="1f379" src="images/emoji/1f379.png" />
							<img class="emoji_list" id="1f378" src="images/emoji/1f378.png" />
							<img class="emoji_list" id="1f377" src="images/emoji/1f377.png" />
							<img class="emoji_list" id="1f376" src="images/emoji/1f376.png" />
							<img class="emoji_list" id="1f375" src="images/emoji/1f375.png" />
							<img class="emoji_list" id="1f374" src="images/emoji/1f374.png" />
							<img class="emoji_list" id="1f373" src="images/emoji/1f373.png" />
							<img class="emoji_list" id="1f372" src="images/emoji/1f372.png" />
							<img class="emoji_list" id="1f371" src="images/emoji/1f371.png" />
							<img class="emoji_list" id="1f370" src="images/emoji/1f370.png" />
							<img class="emoji_list" id="1f369" src="images/emoji/1f369.png" />
							<img class="emoji_list" id="1f368" src="images/emoji/1f368.png" />
							<img class="emoji_list" id="1f367" src="images/emoji/1f367.png" />
							<img class="emoji_list" id="1f366" src="images/emoji/1f366.png" />
							<img class="emoji_list" id="1f365" src="images/emoji/1f365.png" />
							<img class="emoji_list" id="1f364" src="images/emoji/1f364.png" />
							<img class="emoji_list" id="1f363" src="images/emoji/1f363.png" />
							<img class="emoji_list" id="1f362" src="images/emoji/1f362.png" />
							<img class="emoji_list" id="1f361" src="images/emoji/1f361.png" />
							<img class="emoji_list" id="1f360" src="images/emoji/1f360.png" />
							<img class="emoji_list" id="1f359" src="images/emoji/1f359.png" />
							<img class="emoji_list" id="1f358" src="images/emoji/1f358.png" />
							<img class="emoji_list" id="1f357" src="images/emoji/1f357.png" />
							<img class="emoji_list" id="1f356" src="images/emoji/1f356.png" />
							<img class="emoji_list" id="1f355" src="images/emoji/1f355.png" />
							<img class="emoji_list" id="1f354" src="images/emoji/1f354.png" />
							<img class="emoji_list" id="1f353" src="images/emoji/1f353.png" />
							<img class="emoji_list" id="1f352" src="images/emoji/1f352.png" />
							<img class="emoji_list" id="1f351" src="images/emoji/1f351.png" />
							<img class="emoji_list" id="1f350" src="images/emoji/1f350.png" />
							<img class="emoji_list" id="1f349" src="images/emoji/1f349.png" />
							<img class="emoji_list" id="1f348" src="images/emoji/1f348.png" />
							<img class="emoji_list" id="1f347" src="images/emoji/1f347.png" />
							<img class="emoji_list" id="1f346" src="images/emoji/1f346.png" />
							<img class="emoji_list" id="1f345" src="images/emoji/1f345.png" />


							<br /><br /><div id="plant"><h5>Plant</h5></div>
							<img class="emoji_list" id="1f343" src="images/emoji/1f343.png" />
							<img class="emoji_list" id="1f342" src="images/emoji/1f342.png" />
							<img class="emoji_list" id="1f341" src="images/emoji/1f341.png" />
							<img class="emoji_list" id="1f340" src="images/emoji/1f340.png" />
							<img class="emoji_list" id="1f339" src="images/emoji/1f339.png" />
							<img class="emoji_list" id="1f338" src="images/emoji/1f338.png" />
							<img class="emoji_list" id="1f337" src="images/emoji/1f337.png" />
							<img class="emoji_list" id="1f336" src="images/emoji/1f336.png" />
							<img class="emoji_list" id="1f335" src="images/emoji/1f335.png" />
							<img class="emoji_list" id="1f334" src="images/emoji/1f334.png" />
							<img class="emoji_list" id="1f333" src="images/emoji/1f333.png" />
							<img class="emoji_list" id="1f332" src="images/emoji/1f332.png" />
							<img class="emoji_list" id="1f331" src="images/emoji/1f331.png" />
							<img class="emoji_list" id="1f33a" src="images/emoji/1f33a.png" />
							<img class="emoji_list" id="1f33b" src="images/emoji/1f33b.png" />
							<img class="emoji_list" id="1f33c" src="images/emoji/1f33c.png" />
							<img class="emoji_list" id="1f33d" src="images/emoji/1f33d.png" />
							<img class="emoji_list" id="1f33e" src="images/emoji/1f33e.png" />
							<img class="emoji_list" id="1f33f" src="images/emoji/1f33f.png" />


							<br /><br /><div id="animal"><h5>Animal</h5></div>
							<img class="emoji_list" id="1f439" src="images/emoji/1f439.png" />
							<img class="emoji_list" id="1f438" src="images/emoji/1f438.png" />
							<img class="emoji_list" id="1f437" src="images/emoji/1f437.png" />
							<img class="emoji_list" id="1f436" src="images/emoji/1f436.png" />
							<img class="emoji_list" id="1f435" src="images/emoji/1f435.png" />
							<img class="emoji_list" id="1f434" src="images/emoji/1f434.png" />
							<img class="emoji_list" id="1f433" src="images/emoji/1f433.png" />
							<img class="emoji_list" id="1f432" src="images/emoji/1f432.png" />
							<img class="emoji_list" id="1f431" src="images/emoji/1f431.png" />
							<img class="emoji_list" id="1f430" src="images/emoji/1f430.png" />
							<img class="emoji_list" id="1f429" src="images/emoji/1f429.png" />
							<img class="emoji_list" id="1f428" src="images/emoji/1f428.png" />
							<img class="emoji_list" id="1f427" src="images/emoji/1f427.png" />
							<img class="emoji_list" id="1f426" src="images/emoji/1f426.png" />
							<img class="emoji_list" id="1f425" src="images/emoji/1f425.png" />
							<img class="emoji_list" id="1f424" src="images/emoji/1f424.png" />
							<img class="emoji_list" id="1f423" src="images/emoji/1f423.png" />
							<img class="emoji_list" id="1f422" src="images/emoji/1f422.png" />
							<img class="emoji_list" id="1f421" src="images/emoji/1f421.png" />
							<img class="emoji_list" id="1f420" src="images/emoji/1f420.png" />
							<img class="emoji_list" id="1f419" src="images/emoji/1f419.png" />
							<img class="emoji_list" id="1f418" src="images/emoji/1f418.png" />
							<img class="emoji_list" id="1f417" src="images/emoji/1f417.png" />
							<img class="emoji_list" id="1f416" src="images/emoji/1f416.png" />
							<img class="emoji_list" id="1f415" src="images/emoji/1f415.png" />
							<img class="emoji_list" id="1f414" src="images/emoji/1f414.png" />
							<img class="emoji_list" id="1f413" src="images/emoji/1f413.png" />
							<img class="emoji_list" id="1f412" src="images/emoji/1f412.png" />
							<img class="emoji_list" id="1f411" src="images/emoji/1f411.png" />
							<img class="emoji_list" id="1f410" src="images/emoji/1f410.png" />
							<img class="emoji_list" id="1f409" src="images/emoji/1f409.png" />
							<img class="emoji_list" id="1f408" src="images/emoji/1f408.png" />
							<img class="emoji_list" id="1f407" src="images/emoji/1f407.png" />
							<img class="emoji_list" id="1f406" src="images/emoji/1f406.png" />
							<img class="emoji_list" id="1f405" src="images/emoji/1f405.png" />
							<img class="emoji_list" id="1f404" src="images/emoji/1f404.png" />
							<img class="emoji_list" id="1f403" src="images/emoji/1f403.png" />
							<img class="emoji_list" id="1f402" src="images/emoji/1f402.png" />
							<img class="emoji_list" id="1f401" src="images/emoji/1f401.png" />
							<img class="emoji_list" id="1f400" src="images/emoji/1f400.png" />


							<br /><br /><div id="tool"><h5>Tool & Transportation</h5></div>
							<img class="emoji_list" id="1f58a" src="images/emoji/1f58a.png" />
							<img class="emoji_list" id="1f58b" src="images/emoji/1f58b.png" />
							<img class="emoji_list" id="1f58c" src="images/emoji/1f58c.png" />
							<img class="emoji_list" id="1f58d" src="images/emoji/1f58d.png" />
							<img class="emoji_list" id="1f52a" src="images/emoji/1f52a.png" />
							<img class="emoji_list" id="1f52b" src="images/emoji/1f52b.png" />
							<img class="emoji_list" id="1f52c" src="images/emoji/1f52c.png" />
							<img class="emoji_list" id="1f52d" src="images/emoji/1f52d.png" />
							<img class="emoji_list" id="1f529" src="images/emoji/1f529.png" />
							<img class="emoji_list" id="1f528" src="images/emoji/1f528.png" />
							<img class="emoji_list" id="1f527" src="images/emoji/1f527.png" />
							<img class="emoji_list" id="1f526" src="images/emoji/1f526.png" />
							<img class="emoji_list" id="1f525" src="images/emoji/1f525.png" />
							<img class="emoji_list" id="1f512" src="images/emoji/1f512.png" />
							<img class="emoji_list" id="1f511" src="images/emoji/1f511.png" />
							<img class="emoji_list" id="1f510" src="images/emoji/1f510.png" />
							<img class="emoji_list" id="1f489" src="images/emoji/1f489.png" />
							<img class="emoji_list" id="1f576" src="images/emoji/1f576.png" />
							<img class="emoji_list" id="1f963" src="images/emoji/1f963.png" />
							<img class="emoji_list" id="1f962" src="images/emoji/1f962.png" />
							<img class="emoji_list" id="26cf" src="images/emoji/26cf.png" />
							<img class="emoji_list" id="2699" src="images/emoji/2699.png" />
							<img class="emoji_list" id="2697" src="images/emoji/2697.png" />
							<img class="emoji_list" id="2696" src="images/emoji/2696.png" />
							<img class="emoji_list" id="2694" src="images/emoji/2694.png" />
							<img class="emoji_list" id="2693" src="images/emoji/2693.png" />
							<img class="emoji_list" id="2692" src="images/emoji/2692.png" />
							<img class="emoji_list" id="2708" src="images/emoji/2708.png" />
							<img class="emoji_list" id="1f699" src="images/emoji/1f699.png" />
							<img class="emoji_list" id="1f698" src="images/emoji/1f698.png" />
							<img class="emoji_list" id="1f697" src="images/emoji/1f697.png" />
							<img class="emoji_list" id="1f696" src="images/emoji/1f696.png" />
							<img class="emoji_list" id="1f695" src="images/emoji/1f695.png" />
							<img class="emoji_list" id="1f694" src="images/emoji/1f694.png" />
							<img class="emoji_list" id="1f693" src="images/emoji/1f693.png" />
							<img class="emoji_list" id="1f692" src="images/emoji/1f692.png" />
							<img class="emoji_list" id="1f691" src="images/emoji/1f691.png" />
							<img class="emoji_list" id="1f690" src="images/emoji/1f690.png" />
							<img class="emoji_list" id="1f689" src="images/emoji/1f689.png" />
							<img class="emoji_list" id="1f688" src="images/emoji/1f688.png" />
							<img class="emoji_list" id="1f687" src="images/emoji/1f687.png" />
							<img class="emoji_list" id="1f686" src="images/emoji/1f686.png" />
							<img class="emoji_list" id="1f685" src="images/emoji/1f685.png" />
							<img class="emoji_list" id="1f684" src="images/emoji/1f684.png" />
							<img class="emoji_list" id="1f683" src="images/emoji/1f683.png" />
							<img class="emoji_list" id="1f682" src="images/emoji/1f682.png" />
							<img class="emoji_list" id="1f681" src="images/emoji/1f681.png" />
							<img class="emoji_list" id="1f680" src="images/emoji/1f680.png" />
							<!-- emoji popup div end -->
							</div>
					  </div>
					  <div id="input_area" contenteditable="true" class="scrollStyle"></div>
					  <button type="button" id="commentSend">게시</button>
					</div>
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
      
        <!--본인 글, 댓글, 대댓글 삭제 모달-->
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
  		
   		<!-- footer.jsp include -->
	    <jsp:include page="/viewFooter.jsp"></jsp:include>
	    
	    <script>
			var slideH = $(".slide img").height();
			$("#viewRight").height(slideH);

            $(function(){
                $(window).resize(function(){
                    var slideH = $(".slide img").height();
					$("#viewRight").height(slideH);
                });
                
                //feed slick
                $("#viewLeft #slider").slick({
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    infinite: true,
                    dots: true,
                    prevArrow: "<button class='left slideBtn'><i class='fas fa-chevron-left'></i></button>",
                    nextArrow: "<button class='right slideBtn'><i class='fas fa-chevron-right'></i></button>"
                }); 
                
                $.each($("#viewLeft"), function(i){
                    if($(this).find(".slide").length <= 1){
                        $(this).find(".slick-dots").css("display", "none");
                    }
                });
                
                $('.slick-dots li').html('<i class="far fa-circle"></i>');
                $('.slick-dots li.slick-active').html('<i class="fas fa-circle"></i>');
                
                $(".slick-dots li").on("click", function(){
                    $(this).parents("#viewLeft").find(".slick-dots li").html('<i class="far fa-circle"></i>');
                    $(this).html('<i class="fas fa-circle"></i>');
                });
                
                $(".slideBtn").each(function(){
                    $(this).click(function(){
                        var index = $(this).parent("#viewLeft #slider").slick('slickCurrentSlide');
                        
                        $(this).parents("#viewLeft").find(".slick-dots li").html('<i class="far fa-circle"></i>');
                        $(this).parents("#viewLeft").find(".slick-dots li").eq(index).html('<i class="fas fa-circle"></i>');
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
				
            	//대댓글 보기 버튼 동적으로 만들기
            	$('#viewRight').on('click', '.replyBtnView', function(){
            		$(this).parent(".comment").children('.replyList').slideToggle(300);
            	})
				
				//대댓글 달기 버튼
				$(".replyBtn").each(function(){
					$(this).click(function(){
						$("#input_area").focus();
					});
				});
				
				//댓글달기 버튼 누르면 focus 이동하기
				$(".comment").click(function(){
					$("#input_area").focus();	
				});
				
				//내 피드 삭제하기 모달
				var modal2 = true;

				$(".myFeed").click(function(){
					if(modal2){
						$('body').addClass('scrollOff').on('scroll touchmove mousewheel', function(e){
							e.preventDefault();
						});
						
						$("#feedDelModal p").text("피드를 삭제하시겠습니까?");
						
						$("#reportBack").show();
						$("#feedDel").show();
						$("#feedDelModal").slideDown(500);
						modal2 = true;
					}
				});
				
				//내 댓글, 대댓글 삭제하기 모달
				$(".myComm").click(function(){
					if(modal2){
						$('body').addClass('scrollOff').on('scroll touchmove mousewheel', function(e){
							e.preventDefault();
						});
						
						$("#feedDelModal p").text("댓글을 삭제하시겠습니까?");
						
						$("#reportBack").show();
						$("#feedDel").show();
						$("#feedDelModal").slideDown(500);
						modal2 = true;
					}
				});
				
				$(".myReply").click(function(){
					if(modal2){
						$('body').addClass('scrollOff').on('scroll touchmove mousewheel', function(e){
							e.preventDefault();
						});
						
						$("#feedDelModal p").text("대댓글을 삭제하시겠습니까?");
						
						$("#reportBack").show();
						$("#feedDel").show();
						$("#feedDelModal").slideDown(500);
						modal2 = true;
					}
				});
				
				$("#reportBack, #goCancel").click(function(){
                    $("#feedDelModal").slideUp(500);
                    $("#feedDel").delay(200).hide();
                    $("#reportBack").hide();
                    modal2 = true;
                    $('body').removeClass('scrollOff').off('scroll touchmove mousewheel');
                });
            });
        </script>
    </body>
</html>
