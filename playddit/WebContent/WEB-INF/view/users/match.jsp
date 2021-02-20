<%@page import="users.vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UsersVO vo = (UsersVO)request.getAttribute("match");
	if(vo != null){
%>
	{
		"id" : "<%= vo.getUser_id() %>",
		"name" : "<%= vo.getUser_name() %>",
		"pw" : "<%= vo.getUser_password() %>",
		"tel" : "<%= vo.getUser_tel() %>",
		"nickname" : "<%= vo.getUser_nickname() %>"
	}
<% }else{
%>
	{
		"id" : "null"
	}

<% }%>
