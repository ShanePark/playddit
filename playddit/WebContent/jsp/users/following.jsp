<%@page import="java.util.List"%>
<%@page import="users.vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 저장된 값 가져오기
	@SuppressWarnings("unchecked")
	List<UsersVO> list = (List<UsersVO>)request.getAttribute("following");
%>
[
<% 
	for(int i=0; i<list.size(); i++){
		UsersVO vo = list.get(i);
		if(i>0) out.print(",");

%>
	{
		"id" : "<%= vo.getUser_id() %>",
		"name" : "<%= vo.getUser_name() %>",
		"nickname" : "<%= vo.getUser_nickname() %>"
	}
<%
		}
%>
]
