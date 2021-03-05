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
		<link href="css/style.less" rel="stylesheet/less" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="script/script.js"></script>
		<script src="script/view.js"></script>
        <script src="//cdn.jsdelivr.net/npm/less@3.13" ></script>  
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
						<div class="file">
							<img src="images/back_sky.png"/>
							<div class="deleteBtn">
								<i class="far fa-trash-alt"></i>
							</div>
						</div>
						<div class="file">
							<img src="images/code.png"/>
							<div class="deleteBtn">
								<i class="far fa-trash-alt"></i>
							</div>
						</div>
						<div class="file">
							<img src="images/feed/50.png"/>
							<div class="deleteBtn">
								<i class="far fa-trash-alt"></i>
							</div>
						</div>
					</div>
				</div>
	    
	    		<div id="textup">
	    			<h3>내용을 작성해주세요.</h3>
	    			<span id="bytes">0자 / 최대 700자</span>
	    			<textarea id="content" style="resize: none; text-align: left;">피드 내용이 들어가있어야 합니다.
	    			</textarea>
	    		</div>
	    		
	    		<div id="uploadBtn">
                    <a>
                        <span>Upload Now</span>
                        <svg class="load" version="1.1"x="0px" y="0px" width="30px" height="30px" viewBox="0 0 40 40" enable-background="new 0 0 40 40">
                            <path opacity="0.3" fill="#fff" d="M20.201,5.169c-8.254,0-14.946,6.692-14.946,14.946c0,8.255,6.692,14.946,14.946,14.946
                            s14.946-6.691,14.946-14.946C35.146,11.861,28.455,5.169,20.201,5.169z M20.201,31.749c-6.425,0-11.634-5.208-11.634-11.634
                            c0-6.425,5.209-11.634,11.634-11.634c6.425,0,11.633,5.209,11.633,11.634C31.834,26.541,26.626,31.749,20.201,31.749z"/>
                            <path fill="#fff" d="M26.013,10.047l1.654-2.866c-2.198-1.272-4.743-2.012-7.466-2.012h0v3.312h0
                            C22.32,8.481,24.301,9.057,26.013,10.047z">
                            <animateTransform attributeType="xml"
                            attributeName="transform"
                            type="rotate"
                            from="0 20 20"
                            to="360 20 20"
                            dur="0.5s"
                            repeatCount="indefinite"/>
                            </path>
                        </svg>
                        <svg class="check" xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24">
                            <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/>
                        </svg>
                    </a>
                    <div>
                        <span></span>
                    </div>
                </div>
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
                
                /*uploadBtn*/

                $("#uploadBtn a span").click(function() {
                    var btn = $(this).parent().parent();
                    var loadSVG = btn.children("a").children(".load");
                    var loadBar = btn.children("div").children("span");
                    var checkSVG = btn.children("a").children(".check");
                    
                    btn.children("a").children("span").fadeOut(200, function() {
                      btn.children("a").animate({
                        width: 56 
                      }, 100, function() {
                        loadSVG.fadeIn(300);
                        btn.animate({
                          width: 320  
                        }, 200, function() {
                          btn.children("div").fadeIn(200, function() {
                            loadBar.animate({
                              width: "100%" 
                            }, 1000, function() {
                              loadSVG.fadeOut(200, function() {
                                checkSVG.fadeIn(200, function() {
                                  setTimeout(function() {
                                    btn.children("div").fadeOut(200, function() {
                                      loadBar.width(0);
                                      checkSVG.fadeOut(200, function() {
                                        btn.children("a").animate({
                                          width: 150  
                                        });
                                        btn.animate({
                                          width: 150
                                        }, 300, function() {
                                          btn.children("a").children("span").fadeIn(200);
                                        });
                                      });
                                    });
                                  }, 1000); 
                                });
                              });
                            });
                          });
                        });
                      });
                    });
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
				
				$("#fileBox").on("click", ".deleteBtn", function(){
					$(this).parent(".file").remove();
				});
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
						var img_html = '<div class="file"><img src=\"' + e.target.result + '\" /><div class=\"deleteBtn\"><i class=\"far fa-trash-alt\"></i></div></div>';
						$("#fileBox").append(img_html);
					}
					reader.readAsDataURL(f);
				});
			}
		</script>
    </body>
</html>






















