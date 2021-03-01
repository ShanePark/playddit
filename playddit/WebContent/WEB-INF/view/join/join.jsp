<%@page import="users.vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UsersVO vo = (UsersVO)request.getAttribute("insert");
	if(vo != null){
%>	
	{
		"result" : "1"
	}
<%	
	}else{
%>
	{
		"result" : "0"
	}
<%	
	}
%>