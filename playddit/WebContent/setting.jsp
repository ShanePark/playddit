<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<jsp:include page="/preScript.jsp"></jsp:include>
		<meta name="viewport" content="initial-scale=1, width=device-width" />
		<meta name="author" content="playddit" />
		<meta name="description" content="대덕인재개발원 학생들을 위한 스터디그룹, 소모임, 학급 공지사항, 주변 맛집 검색 등 다양한커뮤니티 서비스를 제공합니다." />
		<meta name="keywords" content="대덕인재개발원, 대전 중구 대덕인재개발원, 대덕인재, 개발자과정, 프로그래머, 자바" />
		<title>playddit</title>
		<link href="favicon.ico" rel="icon shortcut" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link href="css/common.css" rel="stylesheet" />
        <link href="css/view.css" rel="stylesheet" />
        <link href="css/edit.css" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="script/view.js"></script>
		<script src="script/setting.js"></script>
	</head>
    <body>
        <!-- header.jsp include -->
	    <jsp:include page="/viewHeader.jsp"></jsp:include>
        
        <!--컨텐츠시작-->
        <div id="set" class="cen">
            <div id="setLeft">
                <ul>
                    <li><a href="#"><i class="fas fa-user-edit"></i>Edit your profile</a></li>
                    <li><a href="editPass.jsp"><i class="fas fa-key"></i>Change Password</a></li>
                </ul>
            </div>
            <div id="setRight">
                <div id="setProfile">
                    <div id="setPic">
                    	<form id="changeProfile" method="post" enctype="multipart/form-data">
	                        <div id="cir"></div>
		                    <input type="file" name="file" id="profileUpload" style="display: none;">
	                        <span id="modiPic">
                            <i class="fas fa-edit"></i>
    	                    </span>
	                    </form>    
	                </div>
                    <div id="setInfo">
                        <h3></h3>
                        <p></p>
                    </div>
                </div>
                <div id="setitems">
                    <form>
                        <div class="item">
                            <label>Self-Introduction</label>
                            <textarea></textarea>
                        </div>
                        <div class="item" id="myClass">
                            <label>Class</label>
                            
                        </div>
                        <div class="item">
                            <label>Name</label>
                            <input type="text" name="name" />
                        </div>
                        <div class="item">
                            <label>Phone Number</label>
                            <input type="text" name="tel" />
                        </div>
                        <div class="item">
                            <label>Birthday</label>
                            <input type="date" name="birth" />
                        </div>
                        
                        <button type="submit" id="modiBtn">Upload</button>
                    </form>
                </div>
            </div>
        </div>
        <!--컨텐츠 끝-->
        
        <!-- footer.jsp include -->
	    <jsp:include page="/viewFooter.jsp"></jsp:include>
        
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
						$("#cir").attr("style", "background-image:url("+ img_html +")");
					}
					reader.readAsDataURL(f);
				});
			}
		</script>
    </body>
</html>
