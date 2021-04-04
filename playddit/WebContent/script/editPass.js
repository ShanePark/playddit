function checkPass() {
	event.preventDefault();
	let passCheck = $('#passCheck').val()

	$.ajax({
		url: '/playddit/users/ChangePassword.do',
		type: 'post',
		data: { 'passCheck': passCheck },
		success: function(res) {
			if (res == 'OK') {
				$('#login').hide();
				$("#change").slideDown();
			} else {
				alert("비밀번호가 일치하지 않습니다.");
			}
		},
		dataType: "text",
		error: function(xhr) {
			alert("status : " + xhr.status);
		}
	})
};

function changePass() {
	event.preventDefault();
	let newPass = $('#newPass').val();
	let newPass2 = $('#newPassCheck').val();

	if (newPass.length < 4 || newPass.length > 10) {
		alert("비밀번호를 4~10자 사이로 지정해주세요.")
		return
	} else if (newPass != newPass2) {
		alert("비밀번호가 서로 일치하지 않습니다.");
		return
	} else {
		$.ajax({
			url: '/playddit/users/ChangePassword.do',
			type: 'post',
			data: { 'newPass': newPass },
			success: function(res) {
				if (res == '1') {
					alert("비밀번호 변경이 완료되었습니다.");
					location.href = "setting.jsp";
				} else {
					alert("비밀번호 변경에 실패했습니다.");
				}
			},
			dataType: "text",
			error: function(xhr) {
				alert("status : " + xhr.status);
			}
		})
	}

}
