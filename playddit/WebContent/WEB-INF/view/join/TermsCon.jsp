<%@page import="join.vo.TermsVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	TermsVO vo = (TermsVO)request.getAttribute("termsCon");
	if(vo != null){
%>
	{
		"no" : "<%= vo.getTerms_no() %>",
		"title" : "<%= vo.getTerms_title() %>",
		"cont" : "<%= vo.getTerms_cont().replaceAll("\"", "\\\\\"").replaceAll("\r", "").replaceAll("\n", "<br>") %>",
		"must" : "<%= vo.getTerms_essen() %>",
		"seq" : "<%= vo.getTerms_seq() %>",
		"use" : "<%= vo.getTerms_use() %>"
	}

<%
	}
%>
	