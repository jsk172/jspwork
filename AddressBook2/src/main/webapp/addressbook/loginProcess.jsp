<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="abDAO" class="addressbook.AddrBookDAO" scope="application"></jsp:useBean>
<%
	String email = request.getParameter("email");
	boolean result = abDAO.checkLogin(email);
	
	if(result){ //이메일이 있으면 세션 발급(세션이름 - sessionId)
		session.setAttribute("sessionId", email);
		response.sendRedirect("addrList.jsp"); //주소 목록으로 이동
	}else{
		out.println("<script>");
		out.println("alert('아이디나 비밀번호가 일치하지 않습니다.')");
		out.println("history.go(-1)"); //이전 페이지로 이동.
		out.println("</script>");
	}
%>