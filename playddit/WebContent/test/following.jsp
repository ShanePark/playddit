<%@page import="users.vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 저장된 값 가져오기
	UsersVO vo = (UsersVO)request.getAttribute("following");

%>


	{
		"id" : "<%= vo.getUser_id() %>",
		"name" : "<%= vo.getUser_name() %>",
		"nickname" : "<%= vo.getUser_nickname() %>"
	}

