$(function() {
	loadProfile();
	loadtClass();
})


// 프로필 정보 불러오기
function loadProfile(){
	className = "";
	
	$.ajax({
		url : '/playddit/login/login.do',
		type : 'post',
		success : function(res){
			$('#cir').attr("style",'background-image : url(images/profile/'+ res.user_pic + ');');
			$('#setInfo h3').text(res.user_nickname);
			$('#setInfo p').text(res.user_id);
			$(".item textarea").val(res.user_bio);
			$("input[name='name']").val(res.user_name);
			$("input[name='tel']").val(res.user_tel);
			$("input[name='birth']").val(res.user_birth);
			
			className = res.class_id;
			
			if(res.user_pic == null){
				res.user_pic = 'default.png';
			}
			
			
		},
		error : function(xhr){
			if(xhr.status == 500){
				location.href="index.html";
				return false;
			}
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})

}

// 학급 정보 불러오기
loadtClass = function(){
	$.ajax({
		url : '/playddit/join/getClassList.do',
		type : 'get',
		success : function(res){
			code = "";
			code += '<select name="myClass">';
			
			$.each(res, function(i, v){
				let selected = "";
				if(className == v.class_id){
					selected = "selected"
				}
				code += '<option idx="' + v.class_id +'" '+selected+'> '+ v.classname + '</option>'; 
			})
			
			code += '</select>';
			
			$('#myClass').append(code);
            
		},
		error : function(xhr){
			alert('상태 : ' + xhr.status);
		},
		dataType : 'json'
	})
}
