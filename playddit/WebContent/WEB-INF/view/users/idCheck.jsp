<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = (String)request.getAttribute("resultvalue");
	if(id != null){
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