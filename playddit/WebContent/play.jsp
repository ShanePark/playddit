<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<jsp:include page="/preScript.jsp"></jsp:include>
		<meta name="viewport" content="initial-scale=1, width=device-width" />
		<meta name="author" content="playddit" />
		<meta name="description" content="대덕인재개발원 학생들을 위한 스터디그룹, 소모임, 학급 공지사항, 주변 맛집 검색 등 다양한
                                            커뮤니티 서비스를 제공합니다." />
		<meta name="keywords" content="대덕인재개발원, 대전 중구 대덕인재개발원, 대덕인재, 개발자과정, 프로그래머, 자바" />
		<title>playddit</title>
		<link href="favicon.ico" rel="icon shortcut" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link href="css/common.css" rel="stylesheet"/>
        <link href="css/user.css" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="script/modal.js"></script>
		<script src="script/play.js"></script>
	</head>
    <body id="pink">
        <div id="wrap" class="cen">
            <form action="join.jsp" method="post">
                <div id="welcomTop">
                    <div class="title">
                        <h2>Welcome to playddit!</h2>
                        <p class="subtitle">
                            Please set up your profile
                        </p>
                    </div>
                    <div id="profile">
                        <div id="myPic">
                            <div id="cir">
                                <img src="images/default.png" alt="프로필사진" />
                            </div>
                            <input type="file" id="profileUpload" style="display: none;">
                            <span id="modiPic" onclick="onclick=document.all.profileUpload.click()">
                                <i class="fas fa-edit"></i>
                            </span>
                        </div>
                        <p id="name">닉네임</p>
                        <p id="mail">아이디</p>
                    </div>
                </div>
                <div id="welcomBottom">
                    <div id="class">
                        <p>Class<span class="msg"></span></p>
                        <div class="item">
                            <select name="class">
                            </select>
                        </div>
                        <p id="txt">
                            학급을 선택하지 않으시면 playddit 서비스 이용이 제한될 수 있습니다.
                        </p>
                    </div>
                    <div id="followBox">
                    </div>
                    <button type="button" id="refreshPlay"><i class="fas fa-redo-alt"></i></button>
                    <button type="button" id="join">PLAY</button>
                </div>
            </form>
        </div>
        
        <script>
            $(document).ready(function(){
                $('.eye').on('click',function(){
                    $(this).toggleClass("active");
                    if($(".eye").hasClass("active")){
                        $(this).prev("input").attr("type", "text");
                    }else{
                        $(this).prev("input").attr("type", "password");
                    }
                });
                
                $(".double").on("click", function(){
                   $(this).toggleClass("active"); 
                });

            });
        </script>
        
        <script>
			var sel_files = [];
 
			$(document).ready(function() {
				$("#profileUpload").on("change", handleImgsFilesSelect);
			}); 

			function handleImgsFilesSelect(e) {
				var files = e.target.files;
				var filesArr = Array.prototype.slice.call(files);

				filesArr.forEach(function(f) {
					if(!f.type.match("image.*")) {
						alert("이미지만 업로드 하실 수 있습니다.");
						return;
					}

					sel_files.push(f);

					var reader = new FileReader();
					reader.onload = function(e) {
						var img_html = e.target.result;
						$("#cir img").attr("src", img_html);
					}
					reader.readAsDataURL(f);
				});
			}
		</script>
    </body>
</html>





