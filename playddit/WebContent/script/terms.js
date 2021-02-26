/**
 * 
 */

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
            	code += "<i class='fas fa-chevron-right'></i>";
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
            	code += "<input type='checkbox' class='pickCondi' name='pick"+ (i + 1)+"' id='pick" + (i + 1) + "'/>";
            	code += "<label for='must" + (i + 1) + "'>";
            	code += "<span class='chk'></span>";
            	code += "<span> " + v.title + '(선택)' + "</span>";
            	code += "</label>";
            	code += "<i class='fas fa-chevron-right'></i>";
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