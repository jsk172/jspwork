<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<title>주소 추가</title>
<link rel="stylesheet" href="../resources/css/style.css">

<!-- AddrBook 클래스의 객체: addrBook(new 한것) -->
<jsp:useBean id="addrBook" class="addressbook.AddrBook"></jsp:useBean>
<!-- property의 username: setUsername()과 같음 -->
<jsp:setProperty property="username" name="addrBook"/>
<jsp:setProperty property="tel" name="addrBook"/>
<jsp:setProperty property="email" name="addrBook"/>
<jsp:setProperty property="gender" name="addrBook"/>
<!-- AddrBookDAO dbDAO = new AddrBookDAO()
	 scope = "application"은 프로그램이 종료될때까지 유지된다. (request, session)이 있음 -->
<jsp:useBean id="abDAO" class="addressbook.AddrBookDAO" scope="application"></jsp:useBean>
<%
	abDAO.addAddrBook(addrBook);
%>
<div id="container">
	<h2>등록 내용</h2>
	<hr>
	<p>이름: <%=addrBook.getUsername() %></p>
	<p>전화번호: <%=addrBook.getTel() %></p>
	<p>email: <%=addrBook.getEmail() %></p>
	<p>성별: <%=addrBook.getGender() %></p>
	<hr>
	<p><a href="addrList.jsp">목록보기</a></p>
</div>