<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//한글 인코딩 요청
	request.setCharacterEncoding("utf-8");
	//이름 필드에 입력된 값 서버에 전달함
	String name = request.getParameter("uname");
%>
<p>이름 : <%=name %></p>