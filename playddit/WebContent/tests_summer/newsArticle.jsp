<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.5.1.min.js"></script>

<style>
	.news{
		display : inline-block;
		margin-left : 20px;
		
	}
	#content{
		width : 90%;
	}
	#newsBox{
		width : 500px;
	}
</style>
<script>
	$(function(){
		
		getNewsList();		
		
		$('#newsBox').on('click', '.imgClick', function(){
			news_no = $(this).parents(".news").attr("idx");
			console.log(news_no);
			getNews(news_no);
		})
	})
	
	getNewsList = function(){
		$.ajax({
			url : '/playddit/news/getNewsList.do',
			type : 'post',
			success : function(res){
				code = '';
				$.each(res, function(i, v){
					code += '<div class="news" idx="'+ v.news_no +'">';
					code += '<button type="button" name="news" class="imgClick">';
					code += '<img src="../images/news/' + v.news_pic + '" width="200px" height="200px">';
					code += '</button>';
					code += '<br>';
					code += v.news_title + '<br><br>';
					code += '</div>';		
				})
				$('#newsBox').html(code);
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
	}
		
	getNews = function(news_no){	
		$.ajax({
			url : '/playddit/news/getNews.do',
			type : 'post',
			data : { "news_no" : news_no},
			success : function(res){
				
				code = '<table>';
				code += '<tr><td>제목</td><td>' + res.news_title+'</td></tr>';
				code += '<tr><td>작성일</td><td>' + res.news_date +'</td></tr>';
				code += '<tr><td>내용</td><td>' + res.news_cont +'</td></tr>';
				code += '<tr><td><img src="../images/news/' + res.news_pic +'"width="300px" height="300px"></td></tr>';
				code += '</table>';
				
				$('#content').html(code);
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
	}
</script>
</head>
<body>
	<div id="newsBox" idx="news_no">
	
	</div>
 	<div id="content" idx="news_no">

	</div>
</body>
</html>