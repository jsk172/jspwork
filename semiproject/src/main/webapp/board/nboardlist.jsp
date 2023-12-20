<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 게시판</title>
<link rel="stylesheet" href="../resources/css/boardlist.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="container">
		<div id="mid">
			<h3>Notice</h3>
			<div class="Board">
				<table id="board_tb">
					<thead>
						<tr>
							<th class="board_no">no</th>
							<th class="board_title">title</th>
							<th class="board_writer">writer</th>
							<th class="board_date">date</th>
							<th class="board_hit">hit</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${NboardList}" var="nb">
							<tr>
								<td class="board_no">${nb.bno}</td>
								<td class="board_title"><a href="/boardview.do">${nb.btitle}</a></td>
								<td class="board_writer">${nb.nname}</td>
								<td class="board_date"><fmt:formatDate value="${nb.nDate}"
									 pattern="yyyy-MM-dd HH:mm:ss"/> </td>
								<%-- <td class="board_hit">${nb.hit}</td> --%>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="write">
				<a href="nwriteform.do">
					<button type="button">글쓰기</button>
				</a>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>