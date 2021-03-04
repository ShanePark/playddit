$(function(){
	loadFeed();
})

var loadFeed = function(){
	$.ajax({
		url : '/playddit/feed/getFeed.do',
		dataType : 'json',
		success : function(res) {
		
		},
		error : function(xhr) {
			alert("status : " + xhr.status);
		}
	})
		
}