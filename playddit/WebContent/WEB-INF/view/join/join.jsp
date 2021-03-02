<%@page import="users.vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int result = (int)request.getAttribute("insert");
	if(result != 0){
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