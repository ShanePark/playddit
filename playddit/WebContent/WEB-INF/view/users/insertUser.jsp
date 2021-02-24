<%@page import="users.vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UsersVO vo = (UsersVO)request.getAttribute("insert");
	if(vo != null){
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