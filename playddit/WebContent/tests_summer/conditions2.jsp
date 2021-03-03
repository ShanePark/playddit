<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="initial-scale=1, width=device-width" />
		<meta name="author" content="playddit" />
		<meta name="description" content="대덕인재개발원 학생들을 위한 스터디그룹, 소모임, 학급 공지사항, 주변 맛집 검색 등 다양한
                                            커뮤니티 서비스를 제공합니다." />
		<meta name="keywords" content="대덕인재개발원, 대전 중구 대덕인재개발원, 대덕인재, 개발자과정, 프로그래머, 자바" />
		<title>playddit</title>
		<link href="favicon.ico" rel="icon shortcut" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link href="../css/common.css" rel="stylesheet"/>
        <link href="../css/user.css" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="../script/modal.js"></script>
		<script src="../script/terms.js"></script>
		
		<script>
			$(function(){
				showTerm();
				showTerm2();

				$("#condition").on("click",".fas", function(){
					no = $(this).attr('must');
					termsCon(no);
					
				})
			})
		</script>
		
	</head>
	<body class="sky">
	    <div id="wrap" class="cen">
            <div id="header">
                <a href="index.html" id="back">
                    <i class="fas fa-arrow-left"></i>
                </a>
                <img src="images/logo1.png" alt="logo" />
            </div>
            <div id="content">
                <div class="title">
                    <h2>SIGN UP</h2>
                    <p class="subtitle">Terms and conditions</p>
                    <p class="cont">
                        playddit에 오신것을 환영합니다.<br/>
                        좀더 좋은 서비
                        스를 위해 아래의 약관에 동의해주세요.
                    </p>
                </div>
                
                <input type="checkbox" name="agree" id="allchk"/>
                <label for="allchk">
                    <span class="chk"></span>
                    <h5>모두 동의합니다.</h5>
                </label>
                
                <div class="longbar"></div>
                
                <form id="condition" method="get">
                    <div id="condiLeft">
    
                    </div>
                    
                    <div id="condiRight">
                       
                    </div>
                    <div style="clear : both;"></div>
                    <button type="button" id="condiBtn" class="skyBtn">NEXT</button>
                </form>
            </div>
	    </div>
	    
	    <p id="copy">&copy; PLAYDDIT All Rights Reserved</p>
	    
	    <!-- 이용약관 Modal -->
	    <div id="modal">
            <div id="condiModal" class="cen fullModal">
                <div id="closeBox">
                    <button type="button" id="close" style="color : #a8ccfd;">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
                <div style="clear: both;"></div>
                <h2></h2>
                <div class="longbar"></div>
                <div id="condiTxt">
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function(){
                $("#allchk").click(function(){
                    $("input:checkbox").prop( 'checked', this.checked );
                });
            });
        </script>
        
	</body>
</html>





















