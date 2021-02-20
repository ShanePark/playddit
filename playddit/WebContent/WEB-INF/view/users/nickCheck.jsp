<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String nickname = (String)request.getAttribute("nickvalue");
	if(nickname != null){
%>
	{
		"result" : "사용 중인 닉네임입니다."
	}

<%
	}else{
%>
	{
		"result" : "사용 가능한 닉네임입니다."
	}
<%
	}
%>