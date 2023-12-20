<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 글보기 페이지</title>
<link rel="stylesheet" href="../resources/css/boardview.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="boadrview">
		<table>
			<tbody>
				<tr>
					<td><input type="text" name="rtitle" value="${rboardList.rtitle}" readonly></td>
				</tr>
				<tr>
					<td><textarea rows="7" cols="100" name="rcontent"
							placeholder="글내용" readonly>${rboardList.rcontent}</textarea></td>
				</tr>
				<tr>
					<td>
					<c:if test="${sessionId eq rboardList.id}">
						<a href="/updatereviewboardform.do?rno=${rboardList.rno}">
							<button type="button">수정</button>
						</a>
						<a href="/deletereviewboard.do?rno=${rboardList.rno}"
							onclick="return confirm('정말로 삭제하시겠습니까?')">
							<button type="button">삭제</button>
						</a>
						</c:if>
						<a href="/reviewboardlist.do">
							<button type="button">목록</button>
						</a>
					</td>
				</tr>
			</tbody>
		</table>
		<!-- 댓글 -->
		<h3>댓글</h3>
		<c:forEach items="${rvreplyList}" var="rvrl">
			<div class="reply">
				<p>${rvrl.recontent}</p>
				<p>작성자: ${rvrl.replyer} (작성일 : ${rvrl.redate})</p>
				<p>
					<c:if test="${sessionId eq rvrl.replyer}">
					<a href="/updateqareplyform.do?rno=${rb.rno}&rvrno=${rvrl.rvrno}">수정</a>
					| <a href="/deleteqareply.do?rno=${rb.rno}&rvrno=${rvrl.rvrno}"
						onclick="return confirm('정말로 삭제하시겠습니까?')">삭제</a>
					</c:if>
				</p>
			</div>
			</c:forEach>
		<!-- 댓글 등록 -->
		<form action="/insertreply.do" method="post" id="replyform">
		<input type="hidden" name="rno" value="${rb.rno}"> <input
					type="hidden" name="replyer" value="${sessionId}">
			<p>
				<textarea rows="4" cols="50" name="recontent"
					placeholder="댓글입력"></textarea>
			</p>
			<button type="submit">등록</button>
		</form>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>