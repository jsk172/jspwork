<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>welcome</title>
</head>
<body>
	<h2>Hello~ 안녕</h2>
	<%-- jsp 출력 <%= %> --%>
	<p>현재 날짜와 시간은 : <%= new Date() %></p>
</body>
</html>