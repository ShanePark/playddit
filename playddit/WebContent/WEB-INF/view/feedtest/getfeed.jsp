<%@page import="feedtest.vo.FeedTestVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
 	FeedTestVO vo = (FeedTestVO)request.getAttribute("getfeed");
  	if(vo != null){
 %>
 	{
 		"feed_no" : "<%=vo.getFeed_no() %>",
 		"user_id" : "<%=vo.getUser_id() %>",
 		"feed_cont" : "<%=vo.getFeed_cont() %>""
 	
 	
 	}
 	
<%
  	}
%>