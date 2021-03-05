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

<title>modify feed!!</title>
<script src="../js/jquery-3.5.1.min.js"></script>
<style>

</style>

<%
	String sfeedno = request.getParameter("feedno");
%>

<script type="text/javascript">
	var feedno = <%=sfeedno%>;


	$(function() {
		$.ajax({
				url : '/playddit/feed/getOneFeed.do',
				type : 'post',
				data : {'feed_no' :feedno},
				success : function(res){
					
					var modifeed = "";
					
					modifeed += '<label>피드내용</label>'
					modifeed += '<p><textarea cols="50" rows="10" name="feedcont">'+res.cont+'</textarea><p><br><br>'
					modifeed += '<label>피드사진</label>'
					modifeed += '<input type = "text" name ="feedpic"><br><br>'
					
					$('#modifyFeedForm').append(modifeed);
				},
				error : function(xhr){
					alert("status : " + xhr.status);
				},
				dataType : 'json'
				
			})
	
			
			$("#modifyfeed").on('click',function(){
			alert("test1")
			modifyfeed(feedno);
			
			
		})
		
	
	
	

	
	var modifyfeed = function(feedno){
		alert(feedno)
		alert("test2")
		var content = $('textarea[name=feedcont]').val();
		content = content.replace(/<br>/g, "\n");
		alert(content)
		$.ajax({
			url : '/playddit/feed/modifyFeed.do',
			type : 'post',
			data : {'feed_no' : feedno,
					'feed_cont' : content},
			success : function(res){
				alert("성공");
				location.href='feedtest.jsp';
			},
			error : function(xhr){
				alert("status : " + xhr.status);
			},
			dataType : 'text'
			
		})
	}
		
	})

</script>
</head>
<body>
<h2>Modify Feed</h2>
<hr>
<a href="../index.html">세션필요할때(500에러) 로그인 하고오기</a><br><br><br>
<hr>


<form id ="modifyFeedForm" method="post" >
	
</form>

<button type = "button" id = "modifyfeed">수정</button>


</body>
</html>