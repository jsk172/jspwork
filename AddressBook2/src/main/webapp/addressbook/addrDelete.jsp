<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="abDAO" class="addressbook.AddrBookDAO" scope="application"></jsp:useBean>
<%
	//선택한 번호를 받음
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	//삭제 처리 매서드 호출
	abDAO.deleteAddrBook(bnum);
	
	//삭제후 페이지 이동
	response.sendRedirect("addrList.jsp");
%>