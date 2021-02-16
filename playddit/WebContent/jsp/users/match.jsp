<%@page import="users.vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UsersVO vo = (UsersVO)request.getAttribute("match");
	
%>

	{
		"id" : "<%= vo.getUser_id() %>",
		"name" : "<%= vo.getUser_name() %>",
		"pw" : "<%= vo.getUser_password() %>",
		"email" : "<%= vo.getUser_email() %>",
		"tel" : "<%= vo.getUser_tel() %>",
		"nickname" : "<%= vo.getUser_nickname() %>"
	}

