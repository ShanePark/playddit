/**
 * 
 */

function insert(){
	event.preventDefault();
	
	idvalue = $('input[name=mail').val().trim();
	
	$.ajax({
		url : '/playddit//join.do',
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