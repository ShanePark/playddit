/**
 * 
 */

// 필수 약관 제목 
showTerm = function(){
	$.ajax({
		url : '/playddit/join/terms.do',
		type : 'get',
		success : function(res){
			code = "";
            code += "<p><span class='red'>*</span> 필수약관</p>";
            code += "<ul class='conditions' id='must'>";
            $.each(res, function(i, v){
            	code += "<li class='longbar'>";
            	code += "<input type='checkbox' class='mustCondi' name='must"+i+"' id='must" +i + "'/>";
            	code += "<label for='must" +i+ "'>";
            	code += "<span class='chk'></span>";
            	code += "<span> " + v.title + '(필수)' + "</span>";
            	code += "</label>";
            	code += "<i  must=" + v.no+" class='fas fa-chevron-right'></i>";
            	code += "</li>";

            })    
            code += "</ul>";
            $('#condiLeft').html(code);

		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
	

}

// 선택 약관 제목
showTerm2 = function(){
	$.ajax({
		url : '/playddit/join/terms2.do',
		type : 'get',
		success : function(res){
			code = "";
            code += "<p>선택약관</p>";
            code += "<ul class='conditions' id='pick'>";
            $.each(res, function(i, v){
            	code += "<li class='longbar'>";
            	code += "<input type='checkbox' class='pickCondi' name='pick"+ i+"' id='pick" + i  + "'/>";
            	code += "<label for='pick" + i  + "'>";
            	code += "<span class='chk'></span>";
            	code += "<span> " + v.title + '(선택)' + "</span>";
            	code += "</label>";
            	code += "<i  must=" + v.no+" class='fas fa-chevron-right'></i>";
            	code += "</li>";

            })    
            code += "</ul>";
            $('#condiRight').html(code);
		},
		error : function(xhr){
			alert('상태 : ' + xhr.status);
		},
		dataType : 'json'
	})
	
}


// 약관 내용 출력하기
termsCon = function(terms_no){
	$.ajax({
		url : '/playddit/join/termsCon.do',
		type : 'get',
		data : { "no" : terms_no },
		success : function(res){
			code = '<div id="closeBox">';
			code += '<button type="button" id="close" style="color : #A8CCFD;">';
			code += '<i class="fas fa-times"></i>';
			code += '</button>';
			code += '</div>';
			code += '<div style="clear: both;"></div>';
			code += '<h2>' + res.title + '</h2>';
			code += '<div class="longbar"></div>';
			code += '<div id="condiTxt">';
			code +=  res.cont;
			code += '</div>';
				
			$('#condiModal').html(code);
		},
		error : function(xhr){
			alert('상태 : ' + xhr.status);
		},
		dataType : 'json'
	})
}
















