/**
 * 
 */
// 뉴스 내용 출력
$(function(){
	var news_no = getParameterByName('news_no');
	getNews(news_no);
})

/*************************************************
 ******************* 함수 시작 **********************
 *************************************************/

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
				code += '<img src="images/news/'+ res.news_pic + '"/>';
			}
						
			code += res.news_cont.replaceAll("\n", "<br>");
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