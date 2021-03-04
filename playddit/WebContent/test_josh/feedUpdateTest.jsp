<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<link href="favicon.ico" rel="icon shortcut" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
        <link href="../css/common.css" rel="stylesheet" />
        <link href="../css/style.css" rel="stylesheet" />
        <link href="../css/feed.css" rel="stylesheet" />

<title>update feed!!</title>
<script src="../js/jquery-3.5.1.min.js"></script>
<style>

</style>

<%
	String sfeedno = request.getParameter("feedno");
%>

<script type="text/javascript">
	var feedno = <%=sfeedno%>;
	console.log(feedno);

	$(function() {
		$.ajax({
				url : '/playddit/feed/getOneFeed.do',
				type : 'post',
				data : {'feed_no' : feedno },
				success : function(res){
					if(res == "0"){
						alert("성공");
					}else{
						alert("실패");
					}
				},
				error : function(xhr){
					alert("status : " + xhr.status);
				},
				dataType : 'text'
				
			})
			
		$('modifyfeed').on('click',function(){
			modifyfeed();
			
		})
		
		
	})
	
	
	
	var modifyfeed = function(){
		var content = $('textarea[name=feedcont]').val(feedno);
		content = content.replace(/<br>/g, "\n");
		$.ajax({
			url : '/playddit/feed/updateFeed.do',
			type : 'post',
			data : {'cont' : content},
			success : function(res){
				
				
			},
			error : function(xhr){
				alert("status : " + xhr.status);
			},
			dataType : 'text'
			
		})
	}

</script>
</head>
<body>
<h2>Update Feed</h2>
<hr>
<a href="../index.html">세션필요할때(500에러) 로그인 하고오기</a><br><br><br>
<hr>
<form id ="updateFeedForm" method="post" >

		<label>피드</label>
		<p>
	

		<label>피드내용</label>
	
			<p><textarea cols="50" rows="10" name="feedcont"></textarea><p>
			
			
			
			<br><br>

	
		<label>피드사진</label>
		
			<input type = "text" name ="feedpic">
			
			<br><br>
		
	
			
	
		
		
	




</form>
<input type = "button" onclick="location.href='feedtest.html'" value = "수정" id = "modifyfeed">

</body>
</html>