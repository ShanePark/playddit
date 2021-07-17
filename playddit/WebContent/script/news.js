/**
 * 
 */
// 뉴스 목록 출력
$(function(){
	getNewsList();
})


/************************************************************
 *                        함 수 시 작 
 ************************************************************/

getNewsList = function(){
	$.ajax({
		url : getContextPath()+'/news/getNewsList.do',
		type : 'post',
		success : function(res){
							
		code = '<div id="newsList">';
		$.each(res, function(i, v){		
			code += '<a href=newsView.jsp?news_no='+v.news_no+' class="thums" no='+i+' >';
	        code += '<div class="newsCont">';		
	        if(v.news_pic != "none"){
	        	code += '<div class="newsPic" style="background-image: url(images/news/' + v.news_pic +')"></div>';
	        }else{
	        	code += '<p class="newsCont">' + v.news_cont + '</p>';
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
			