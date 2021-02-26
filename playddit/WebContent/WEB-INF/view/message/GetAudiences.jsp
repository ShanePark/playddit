<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="users.vo.UsersVO"%>
<%@page import="java.util.List"%>
<%
	String list = (String)request.getAttribute("list");
	
%>
<%=list%>
