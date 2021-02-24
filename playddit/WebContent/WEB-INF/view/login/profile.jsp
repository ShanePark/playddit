<%@page import="login.vo.ProfileVO"%>
<%@page import="users.vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String profile= (String)request.getAttribute("profile");
%>
<%= profile %>