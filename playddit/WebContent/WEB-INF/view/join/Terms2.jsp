<%@page import="join.vo.TermsVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
[    
<%
	List<TermsVO> list = (List<TermsVO>)request.getAttribute("terms2");
	
	for(int i = 0; i < list.size(); i++){
		TermsVO vo = list.get(i);
		if(i > 0) out.print(',');
%>
	{
		"no" : "<%= vo.getTerms_no() %>",
		"title" : "<%= vo.getTerms_title() %>",
<%-- 	"cont" : "<%= vo.getTerms_cont() %>", --%>
		"must" : "<%= vo.getTerms_essen() %>",
		"seq" : "<%= vo.getTerms_seq() %>",
		"use" : "<%= vo.getTerms_use() %>"
		
	}
<%
}
%>
]