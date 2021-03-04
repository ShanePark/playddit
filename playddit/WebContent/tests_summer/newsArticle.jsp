<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.newsbox{
		display : inline-block;
		margin-left : 20px;
	}
</style>
<script>
	
</script>
</head>
<body>
	<div class="newsbox">
		<a target="ifr" href="newsMain.jsp"><img src="../images/feed3.jpg" width="200px" height="200px"></a><br>
		 내용
	</div>
	<div class="newsbox">
		<a href="newsMain.jsp" target="ifr"><img src="../images/feed3.jpg" width="200px" height="200px"></a><br>
		내용 블라블라
	</div>
	<br><br></br>
	<div class="newsbox">
		<img src="../images/feed3.jpg" width="200px" height="200px"><br>
		내용 <span id="box1"></span>
	</div>
	<div class="newsbox">
		<img src="../images/feed3.jpg" width="200px" height="200px"><br>
		내용 <span id="box1"></span>
	</div>
</body>
</html>