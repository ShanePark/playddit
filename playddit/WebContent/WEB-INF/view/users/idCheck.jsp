<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = (String)request.getAttribute("resultvalue");
	if(id != null){
%>
	{
		"result" : "사용 불가능한 아이디입니다."
	}

<%	
	}else{
%>
	{
		"result" : "사용 가능한 아이디입니다."
	}
<%		
	}
%>