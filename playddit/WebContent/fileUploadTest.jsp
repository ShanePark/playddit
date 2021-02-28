<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>play ddit file upload test page</title>
<link href="favicon.ico" rel="icon shortcut" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link href="../css/common.css" rel="stylesheet" />
<link href="../css/style.css" rel="stylesheet" />
<script src="../js/jquery-3.5.1.min.js"></script>
<style>
#buttons{
	padding-top : 50px;
	padding-left : 50px;
}
body{
	margin : 50px;
}
</style>
<script>

</script>
</head>
<body>
	  <form action="<%= application.getContextPath() %>/fileUpload.do"  method="post" enctype="multipart/form-data">
            파일 설명 : <input type="text" name="description"><br>
            파일 : <input type="file" name="file1"><br>
            <input type="submit" value="업로드">
      </form>

</body>
</html>