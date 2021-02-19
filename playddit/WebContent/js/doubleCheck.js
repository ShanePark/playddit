/**
 * 
 */
function nickCheck(){
	nickvalue = $('#nick').val().trim();
	$.ajax({
		url : '/playddit/nicknameCheck.do',
		type : 'post',
		data : { 'user_nickname' : nickvalue },
		success : function(res){
			$('#nickDspan').html(res.result).css('color', 'green');
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}

function idcheck(){
	idvalue = $('#id').val().trim();

	$.ajax({
		url : '/playddit/idCheck.do',
		type : 'post',
		data : { 'id' : idvalue },
		success : function(res){
			$('#idDspan').html(res.result).css('color', 'green');
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}