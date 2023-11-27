<%@page import="addressbook.AddrBook"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 목록</title>
<link rel="stylesheet" href="../resources/css/style.css">
</head>
<body>
	<jsp:useBean id="abDAO" class="addressbook.AddrBookDAO" scope="application"/>
	<div id="container">
		<h2>주소 목록</h2>
		<hr>
		<p><a href="addrForm.jsp">주소 추가</a></p>
		<table id="tbl_list">
			<tr>
				<th>이름</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>성별</th>
				<th>보기</th>
				<th>삭제</th>
			</tr>
			
			<%
				for(int i=0; i<abDAO.getListAll().size(); i++){
					AddrBook addrBook = abDAO.getListAll().get(i);
			%>
			<tr>
				<td><%=addrBook.getUsername() %></td>
				<td><%=addrBook.getTel() %></td>
				<td><%=addrBook.getEmail() %></td>
				<td><%=addrBook.getGender() %></td>
				<td>
					<a href="addrView.jsp?username=<%=addrBook.getUsername() %>">
						<button type="button">보기</button>
					</a>
				</td>
				<td>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')"
						href="addrDelete.jsp?username=<%=addrBook.getUsername() %>">
						<button type="button">삭제</button>
					</a>
				</td>
			</tr>
			<%
				}
			%>
		</table>
		<p><a href="../index.jsp">메인으로</a></p>
	</div>
</body>
</html>