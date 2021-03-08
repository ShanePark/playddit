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
				getNewsList();
				
				$('#news').on('click', '.newsTitle', function(){
					news_no = $(this).parents(".thums").attr("idx");
					var newsUrl = '/playddit/tests_summer/newsView_test.jsp?news_no='+news_no;
					window.location.href=newsUrl;
				})
			})
			
			getNewsList = function(){
				$.ajax({
					url : '/playddit/news/getNewsList.do',
					type : 'post',
					success : function(res){
							
						code = '<div id="newsList">';
						$.each(res, function(i, v){	
							let url = '/playddit/tests_summer/newsView_test.jsp?news_no=' + v.news_no;
							code += '<a href="#" class="thums" no="' + i + '"idx="' + v.news_no +'">';
	                        code += '<div class="newsCont">';		
							if(v.news_pic != "none"){
	                        	code += '<div class="newsPic" style="background-image: url(../images/news/' + v.news_pic +')"></div>';
	                        }else{
	                        	code += '<p class="newsCont">"' + v.news_cont + '"</p>';
	                        } 
	                        code += '</div>'
	                        code += '<div class="newsTitle">'
	                        code += '<h3>'
	                        code += v.news_title;
	                        code += '</h3>';
	                        code += '<p>' + v.news_date + '</p>';
	                        code += '</div>';
	                        code += '</a>'; 

						})
	                    code += '<div style="clear: both;"></div></div>';
						$('#newsList').html(code);
						
			            var thumsW = $("#newsList").find(".thums").width();
			            $("#newsList").find(".thums").height(thumsW);
			             $("#newsList").find(".thums .newsCont").height(thumsW - 100);
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
						code += '<tr><td><img src="../images/news/' + res.news_pic +'"width="300px" height="300px"></td></tr>';
						code += '<tr><td>' + (res.news_cont).replaceAll("\n", "<br>") +'</td></tr>';
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
    	<div class="cen" id="wrap">
	        <!-- header.jsp include -->
	        <jsp:include page="..//header.jsp"></jsp:include>
	        
			<!-- 컨텐츠 시작 -->
                <div id="news" class="scrollStyle">
                    <div id="newsList">
                        
                        <div style="clear: both;"></div>
                    </div>
                </div>

				<div id="mask"></div>
            </div>
            <!--컨텐츠 끝-->
            
            <!-- footer.jsp include -->
            <jsp:include page="..//footer.jsp"></jsp:include>
            
        <script>
            var thumsW = $("#newsList").find(".thums").width();
           $("#newsList").find(".thums").height(thumsW);
            $("#newsList").find(".thums .newsCont").height(thumsW - 100);

            $(function(){
                /*.thums cont 생략기호*/
                $('.thums').each(function(){
                    var content = $(this).children('.newsCont').children("p");
                    var content_txt = content.text();
                    var content_txt_short = content_txt.substring(0,100)+"...";

                    if(content_txt.length >= 100){
                        content.html(content_txt_short);
                    }
                }); 

                $(window).resize(function(){
                    $(".thums").height(thumsW);
                    $(".thums .newsCont").height(thumsW - 100);
                });
            });
        </script>

	</body>
</html>