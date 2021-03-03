/**
 * 
 */
/*$(function(){
	$('#condition').on('click', function(){

			
		if(!(must1 && must2 && must3)){
			alert('필수약관은 반드시 선택해야 합니다.');
			return;
		}
			termsCookie();
		});

});*/

$(function(){
		showTerm();
		showTerm2();

		$("#condition").on("click",".fas", function(){
			no = $(this).attr('must');
			termsCon(no);				
		})
		
		$('#condiBtn').on('click', function(){			
			if($(".mustCondi:checked").length!=3){
				alert("필수 약관은 반드시 선택해야 합니다.");
				return;
			}
			
			termsCookie();
			
			location.href="join.html";
		})		
	})



termsCookie = function(){
	var pick1 = $('#pick0:checked').val() == 'on';
	var pick2 = $('#pick1:checked').val() == 'on';
	var pick3 = $('#pick2:checked').val() == 'on';
	
	alert(pick1);
	
	setCookie("pick1", pick1, 1);
	setCookie("pick2", pick2, 1);
	setCookie("pick3", pick3, 1);
}


// 쿠키로 선택사항 저장하기
//
//$(function(){
//	var PickCookie1 = getCookie("id1");
//	var PickCookie2 = getCookie("id2");
//	var PickCookie3 = getCookie("id3");
//	
//	if( PickCookie1 != undefined){
//		$('#pick0').attr("checked", true);
//	}
//	
//	if(PickCookie2 != undefined){
//		$('#pick1').attr("checked", true);
//	}
//	
//	if(PickCookie3 != undefined){
//		$('#pick2').attr("checked", true);
//	}
//	
//})

// 쿠키저장
function setCookie(name, value, exp){
	var date = new Date();
	date.setTime(date.getTime() + exp*24*60*60*1000);
	document.cookie = name+'='+escape(value)+';expires='+date.toUTCString()+';path=1'; 
}

// 저장한 쿠키 가져오기
function getCookie(name){
	const value = `;${document.cookie}`;
	const parts = value.split(`; ${name}=`);
	if (parts.length === 2) return unescape(parts.pop()).split(';').shift();
}

function remeberPick(){
	id1 = $('#pick0').val().trim();
	id2 = $('#pick1').val().trim();
	id3 = $('#pick2').val().trim();
	
	
	setCookie("id1", id1, 30);
	setCookie("id2", id2, 30);
	setCookie("id3", id3, 30);
}


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
            	code += "<input type='checkbox' class='pickCondi' name='pick"+ i+"' id='pick" + i  + "' value='pick" + i  + "'/>";
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


// 쿠키 저장
function setCookie(name, value, exp){
	var date = new Date();
	date.setTime(date.getTime() + exp*24*60*60*1000);
	document.cookie = name+'='+escape(value)+';expires='+date.toUTCString()+';path=1';
}

// 저장한 쿠키 가져오기
function getCookie(name) {
  const value = `; ${document.cookie}`;
  const parts = value.split(`; ${name}=`);
  if (parts.length === 2) return unescape(parts.pop()).split(';').shift();
  
}


