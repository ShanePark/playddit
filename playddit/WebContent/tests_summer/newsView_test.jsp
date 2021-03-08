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
        <link href="../css/common.css" rel="stylesheet" />
        <link href="../css/style.css" rel="stylesheet" />
        <link href="../css/news.css" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
		<script src="../script/script.js"></script>
		<script>
			$(function(){
				var news_no = getParameterByName('news_no');
				
				getNews(news_no);
			})
			
				getNews = function(news_no){
				$.ajax({
					url : '/playddit/news/getNews.do',
					type : 'post',
					data : { "news_no" : news_no},
					success : function(res){
	                    code = '<div id="newsDetail">';
	                    code += '<div id="titleBox">';
	                    code += '<h3>';
	                    code += res.news_title;    
	                    code += '</h3>';
	                    code += '<p>';
	                    code += res.news_date;
	                    code += '</p>';
	                    code += '</div>';
	                    code += '<p>'; 
						if(res.news_pic != 'none'){
                        	code += '<img src="../images/news/"'+ res.news_pic + '"/>';
                        }
						
                       code += res.news_cont.replaceAll("\n", "<br>");
                    
	                    //code += '<img src="../images/news/"'+ res.news_pic + '"/>';
	                    //code += res.news_cont.replaceAll("\n", "<br>");
	                    code += '</p>';
	                    code += '</div>';
						
						$('#newsDetail').html(code);
					},
					error : function(xhr){
						alert("상태 : " + xhr.status);
					},
					dataType : 'json'
				})
			}
			function getParameterByName(name) {
			    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
			    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
			            results = regex.exec(location.search);
			    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
			}
		</script>
	</head>
    <body>
        <div class="cen" id="wrap">
            <!-- header.jsp include -->
	        <jsp:include page="../header.jsp"></jsp:include>
            
                <!-- 컨텐츠 시작 -->
                <div id="news" class="scrollStyle">
                    <div id="newsDetail">
 
                    </div>
                </div>
				<div id="mask"></div>
            </div>
            <!--컨텐츠 끝-->
            
        <!-- footer.jsp include -->
        <jsp:include page="../footer.jsp"></jsp:include>
    </body>
</html>
