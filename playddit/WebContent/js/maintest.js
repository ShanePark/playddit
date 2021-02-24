function loadProfile(){
	var user_nickname = 'Scarl-ett';
	var user_id = 'chdnjs7610@gmail.com';
	var allFeed = 100;
	var follower = 100;
	var follwing = 15;
	var className = '풀-스택 개발자 양성과정 6기 - 302호';
	var bio = '여기는 간단한 자기소개가 들어갑니다.<br/>'+
            '최대 3줄정도 들어가는 걸로 디자인 함.<br/>'+
            '간단한 자기소개 끝!!';
	
	$('#userName').append(user_nickname);	
	$('#userMail').append(user_id);	
	$('#allFeed').append(allFeed);	
	$('#Follower').append(follower);	
	$('#Follwing').append(follwing);	
	$('#className').append(className);	
	$('#self').append(bio);	
	
}