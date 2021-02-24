/**
 * 
 */

function insert(){
	event.preventDefault();
	
	idvalue = $('#id').val().trim();
	
	$.ajax({
		url : '/playddit/users/join.do',
		type : 'post',
		data : $('#insert').serializeJSON(),
		success : function(res){
			$('#insertspan').html(res.result);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}