<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글 수정</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="container">
		<h2>공지사항 게시글 수정</h2>
		<form action="/updateqaboard.do" method="post">
			<!-- ui를 만들지않고 데이터를 숨겨서 보낼때 사용 -->
			<input type="hidden" name="qno" value="${qab.qno}">
			<table>
				<tbody>
					<tr>
						<td><input type="text" name="qtitle" value="${qab.qtitle}"
							readonly></td>
					</tr>
					<tr>
						<td><textarea rows="7" cols="100" name="qcontent"
								placeholder="글내용" readonly>${qab.qcontent}</textarea></td>
					</tr>
					<tr>
						<td><c:if test="${sessionId eq qab.id}">
								<a href="/updateqaboardform.do?qno=${qab.qno}">
									<button type="button">수정</button>
								</a>
								<a href="/deleteqaboard.do?qno=${qab.qno}"
									onclick="return confirm('정말로 삭제하시겠습니까?')">
									<button type="button">삭제</button>
								</a>
							</c:if> <a href="/qaboardlist.do">
								<button type="button">목록</button>
						</a></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>