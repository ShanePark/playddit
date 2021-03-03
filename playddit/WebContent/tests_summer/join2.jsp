<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="initial-scale=1, width=device-width" />
		<meta name="author" content="playddit" />
		<meta name="description" content="ëëì¸ì¬ê°ë°ì íìë¤ì ìí ì¤í°ëê·¸ë£¹, ìëª¨ì, íê¸ ê³µì§ì¬í­, ì£¼ë³ ë§ì§ ê²ì ë± ë¤ìí
                                            ì»¤ë®¤ëí° ìë¹ì¤ë¥¼ ì ê³µí©ëë¤." />
		<meta name="keywords" content="ëëì¸ì¬ê°ë°ì, ëì  ì¤êµ¬ ëëì¸ì¬ê°ë°ì, ëëì¸ì¬, ê°ë°ìê³¼ì , íë¡ê·¸ëë¨¸, ìë°" />
		<title>playddit</title>
		<link href="favicon.ico" rel="icon shortcut" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link href="css/common.css" rel="stylesheet"/>
        <link href="css/user.css" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="script/modal.js"></script>
		<script src="js/signupTest.js"></script>
		<script src="js/badwords.js"></script>
		<script src="js/doubleCheck.js"></script>
		<script src="js/insertUser.js"></script>
		<script src="js/jquery.serializejson.min.js"></script>
	</head>
<%
	int pick0 = request.getParameter("pick0")!=null ? 1 : 0;
	int pick1 = request.getParameter("pick1")!=null ? 1 : 0;
	int pick2 = request.getParameter("pick2")!=null ? 1 : 0;
%>	
	
    <body class="sky over">
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
                    <p class="subtitle">Please enter your registration details</p>
                </div>
                <form action="join.jsp" method="post" id="joinForm">
                	<input type="hidden" name="pick0" value="<%=pick0 %>">
                	<input type="hidden" name="pick1" value="<%=pick1 %>">
                	<input type="hidden" name="pick2" value="<%=pick2 %>">
                
                    <div id="joinLeft" class="joinBox">
                        <div class="box">
                            <p><span class="red">*</span> Email<span class="msg"></span></p>
                            <div class="item">
                                <input type="text" name="mail" id="mail" placeholder="Please enter your email" />
                                <span id="idDbtn" class="double" >ì¤ë³µíì¸</span>
                            </div>
                        </div>
                        
                        <div class="box">
                            <p><span class="red">*</span> Nickname<span class="msg"></span></p>
                            <div class="item">
                                <input type="text" name="nickname" id="nickname" placeholder="Please enter your nickname" />
                                <span id="nickDbtn" class="double">ì¤ë³µíì¸</span>
                            </div>
                        </div>
                        
                        <div class="box">
                            <p><span class="red">*</span> Password<span class="msg"></span></p>
                            <div class="item">
                                <input type="password" name="pass" id="pass" placeholder="Please enter your password" />
                                <svg class="eye" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 80 80">
                                    <path d="M39.5 49.5C31.688 49.5 25 42.258 25 40c0-1.862 6.514-9.5 14.5-9.5S54 38.138 54 40c0 2.661-6.894 9.5-14.5 9.5zm-12.491-9.453c.319 1.366 5.78 7.453 12.491 7.453 6.804 0 12.234-6.101 12.493-7.461-.436-1.315-5.808-7.539-12.493-7.539-6.553 0-12 6.208-12.491 7.547z" />
                                    <path d="M39.5 45.5c-3.033 0-5.5-2.467-5.5-5.5s2.467-5.5 5.5-5.5c3.032 0 5.5 2.467 5.5 5.5s-2.468 5.5-5.5 5.5zm0-9c-1.93 0-3.5 1.57-3.5 3.5s1.57 3.5 3.5 3.5S43 41.93 43 40s-1.57-3.5-3.5-3.5z" />
                                </svg>
                            </div>
                        </div>
                        
                        <div class="box">
                            <p><span class="red">*</span> Confirm Password<span class="msg"></span></p>
                            <div class="item">
                                <input type="password" name="passchk" id="passchk" placeholder="Please enter your password" />
                                <svg class="eye" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 80 80">
                                    <path d="M39.5 49.5C31.688 49.5 25 42.258 25 40c0-1.862 6.514-9.5 14.5-9.5S54 38.138 54 40c0 2.661-6.894 9.5-14.5 9.5zm-12.491-9.453c.319 1.366 5.78 7.453 12.491 7.453 6.804 0 12.234-6.101 12.493-7.461-.436-1.315-5.808-7.539-12.493-7.539-6.553 0-12 6.208-12.491 7.547z" />
                                    <path d="M39.5 45.5c-3.033 0-5.5-2.467-5.5-5.5s2.467-5.5 5.5-5.5c3.032 0 5.5 2.467 5.5 5.5s-2.468 5.5-5.5 5.5zm0-9c-1.93 0-3.5 1.57-3.5 3.5s1.57 3.5 3.5 3.5S43 41.93 43 40s-1.57-3.5-3.5-3.5z" />
                                </svg>
                            </div>
                        </div>
                    </div>

                    <div id="joinRight" class="joinBox">
                        <div class="box">
                            <p>&nbsp;&nbsp;Name<span class="msg"></span></p>
                            <div class="item">
                                <input type="text" name="name" id="name" placeholder="Please enter your name" />
                            </div>
                        </div>
                        
                        <div class="box">
                            <p>&nbsp;&nbsp;Phone number<span class="msg"></span></p>
                            <div class="item">
                                <input type="tel" name="phone" id="phone" placeholder="Please enter your phone number" />
                            </div>
                        </div>
                        
                        <div class="box">
                            <p>&nbsp;&nbsp;Birthday<span class="msg"></span></p>
                            <div class="item">
                                <input type="date" name="birth" id="birth" date-placeholder="Choose your birthday" required aria-required="true"/>
                            </div> 
                        </div>

                        <p>&nbsp;&nbsp;Class<span class="msg"></span></p>
                        <div class="item">
                            <select name="class">
                                <option>Choose your class</option>
                                <option value="íê¸ë²í¸">í-ì¤í ê°ë°ì ìì±ê³¼ì  2ê¸° - 401í¸</option>
                                <option value="íê¸ë²í¸">í-ì¤í ê°ë°ì ìì±ê³¼ì  3ê¸° - 402í¸</option>
                                <option value="íê¸ë²í¸">í-ì¤í ê°ë°ì ìì±ê³¼ì  4ê¸° - 403í¸</option>
                                <option value="íê¸ë²í¸">í-ì¤í ê°ë°ì ìì±ê³¼ì  5ê¸° - 404í¸</option>
                                <option value="íê¸ë²í¸">í-ì¤í ê°ë°ì ìì±ê³¼ì  6ê¸° - 302í¸</option>
                                <option value="íê¸ë²í¸">AI ìíí¸ì¨ì´ ìì§ëì´ë§ 1ê¸° - 405í¸</option>
                                <option value="íê¸ë²í¸">í-ì¤í ê°ë°ì ìì±ê³¼ì  7ê¸° - 406í¸</option>
                            </select>
                        </div>
                    </div>
                    
                    <div style="clear: both;"></div>
                    
                    <button type="submit" id="test" class="skyBtn">SIGN UP</button>
                </form>
            </div>
        </div>
        
        <p id="copy">&copy; PLAYDDIT All Rights Reserved</p>
        
        <!-- code Modal -->
        <div id="modal" class="code">
            <div id="codeModal" class="cen fullModal">
                <div id="closeBox">
                    <button type="button" id="close" style="color : #a8ccfd;">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
                
                <div style="clear: both;"></div>
                
                <div id="codeTop">
                    <img src="images/code.png" alt="ì´ë©ì¼ì¸ì¦" />
                    <div class="title">
                        <h2>Welcome to playddit!</h2>
                        <p class="subtitle">
                            Email authentication is required
                        </p>
                    </div>
                </div>

                <div id="codeBottom">
                    <p class="cont">
                    íìí©ëë¤! íìê°ì ìë£ë¥¼ ìí ì´ë©ì¼ ì¸ì¦ì ì§í í´ ì£¼ì¸ì.<br/><span id="codeMail">chdnjs7610@gmail.com</span> ë©ì¼í¨ì íì¸í´ì£¼ì¸ì!
                    </p>

                    <form action="code.jsp" id="codeCont" method="post">
                        <h2>ì¸ì¦ ì½ë ìë ¥</h2>
                        <input type="text" name="code" />

                        <br/>
                        <button type="reset" id="remail">ì¸ì¦ì½ë ì¬ë°ì¡</button>
                        <button type="submit" id="subCode">ì´ë©ì¼ ì¸ì¦ íì¸</button>
                    </form>
                </div>
            </div>
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
    </body>
</html>
























