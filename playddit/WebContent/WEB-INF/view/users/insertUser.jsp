<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id = (String)request.getAttribute("user_id");
	if(user_id != null){
%>	
	{
		"result" : "회원가입 성공"
	}
<%	
	}else{
%>
	{
		"result" : "회원가입 실패"
	}
<%	
	}
%>