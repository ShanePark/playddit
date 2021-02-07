<%@page import="users.UsersVO"%>
<%@page import="config.SqlMapClientFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.Reader"%>
<%@page import="java.nio.charset.Charset"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Scanner"%>
<%@page import="com.ibatis.common.resources.Resources"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClientBuilder"%>
<%
	/* 클라이언트 요청시 전송되는 데이터를 받는다
 crud 처리를 한다
	 -1. SqlMapClient 객체를 얻어오기 - aa= SqlMapCleintFactory.getClient()
	 -2. sql문을 실행 - mapper 파일의 namespace.id이름
	select -> 
	aa.queryForList(namespace.id이름)
	aa.queryForObject(namespace.id이름)
	
	처리 결과로 응답 데이터를 생성한다 - jason, text, html, xml

*/
%>
<%
	// 1. SqlMapClient 객체 얻어오기
	SqlMapClient aa = SqlMapClientFactory.getCliect();

	// 2. sql 문을 실행
	List<UsersVO> list = aa.queryForList("users.selectAll");
%>

[
<% 	
	// 3. 실행 결과로 json 데이터 생성
	for(int i=0; i<list.size(); i++){
		UsersVO vo = list.get(i);
		if(i>0) out.print(",");	//out = printWriter라는 내장객체(jsp)
		
%>
	{
		"id" : "<%= vo.getUser_id() %>",
		"name" : "<%= vo.getUser_name() %>",
		"password" : "<%= vo.getUser_password() %>"
	}

<%
	}
%>
]