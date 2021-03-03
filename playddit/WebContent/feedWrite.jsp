<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="initial-scale=1, width=device-width" />
		<meta name="author" content="playddit" />
		<meta name="description" content="대덕인재개발원 학생들을 위한 스터디그룹, 소모임, 학급 공지사항, 주변 맛집 검색 등 다양한커뮤니티 서비스를 제공합니다." />
		<meta name="keywords" content="대덕인재개발원, 대전 중구 대덕인재개발원, 대덕인재, 개발자과정, 프로그래머, 자바" />
		<title>playddit</title>
		<link href="favicon.ico" rel="icon shortcut" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link href="css/common.css" rel="stylesheet" />
        <link href="css/view.css" rel="stylesheet" />
        <link href="css/feed.css" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="script/script.js"></script>
		<script src="script/view.js"></script>
	</head>
    <body>
        <!-- header.jsp include -->
	    <jsp:include page="/viewHeader.jsp"></jsp:include>
        
        <!--컨텐츠 시작-->
		<div class="cen feedWrite" id="wrap">
            <div id="mainTitle">
                <h2>Upload your feed</h2>
                <p class="subtitle">Please write down your story.</p>
            </div>
		    <form>
				<!--반장 또는 선생님만 보이는 체크박스-->
				<div id="moniterCho">
					<h3>업로드할 계정을 선택해주세요.</h3>
					<input type="checkbox" name="user" id="moniterName" value="josh" />
					<label for="moniterName" onclick="checkOnlyOne(this)">
						<span class="chk"></span>
						<span>josh</span>
					</label>
					<input type="checkbox" name="user" id="moniterClass" value="풀스택 개발자과정 6기 - 302호"/>
					<label for="moniterClass" onclick="checkOnlyOne(this)">
						<span class="chk"></span>
						<span>풀스택 개발자과정 6기 - 302호</span>
					</label>
				</div>
				
				<div id="picup">
					<h3>사진업로드(선택)</h3>
					<p>
						적절하지 않은 사진을 업로드 할 경우,
						사전 경고 없이 피드가 삭제될 수 있습니다.
					</p>
					
					<div id="fileBox">
						<input type="file" id="input_imgs" multiple style="display: none;"/>
						<div id="uploadBox" class="file">
							<div id="fileBtn" onclick="onclick=document.all.input_imgs.click()">
								<i class="fas fa-plus"></i>
							</div>
						</div>
					</div>
				</div>
	    
	    		<div id="textup">
	    			<h3>내용을 작성해주세요.</h3>
	    			<span id="bytes">0자 / 최대 700자</span>
	    			<textarea id="content" style="resize: none;"></textarea>
	    		</div>
	    		
	    		<button type="button" id="feedUploadBtn">Upload</button>
		    </form>
		</div>
        <!--컨텐츠 끝-->
        
        <!-- footer.jsp include -->
	    <jsp:include page="/viewFooter.jsp"></jsp:include>
       
        <script>
            $(function(){
				$('#content').on('keyup', function() {
					$('#bytes').html("("+$(this).val().length+"자 / 최대 700자)");

					if($(this).val().length > 700) {
						$(this).val($(this).val().substring(0, 700));
						$('#bytes').html("(700자 / 최대 700자)");
					}
				});
			});
			
			function checkOnlyOne(element) {
				const checkboxes = document.getElementsByName("user");

				checkboxes.forEach((cb) => {
					cb.checked = false;
				});

				element.checked = true;
			}
        </script>
        <script>
			var sel_files = [];
 
			$(document).ready(function() {
				$("#input_imgs").on("change", handleImgsFilesSelect);
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
						var img_html = '<div class="file"><img src=\"' + e.target.result + '\" /></div>';
						$("#fileBox").append(img_html);
					}
					reader.readAsDataURL(f);
				});
			}
		</script>
    </body>
</html>






















