<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 글보기</title>
<link rel="stylesheet" href="../resources/css/boardview.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="boadrview">
		<h2>Q&A 글보기</h2>
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
						<td>
							<a href="filedown.do?filename=${qab.qfilename}">[다운로드]</a>
						</td>	
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
			<!-- 댓글 -->
			<h3>댓글</h3>
			<c:forEach items="${qareplyList}" var="qrl">
			<div class="reply">
				<p>${qrl.recontent}</p>
				<p>작성자: ${qrl.replyer} (작성일 : ${qrl.redate})</p>
				<p>
					<c:if test="${sessionId eq qrl.replyer}">
					<a href="/updateqareplyform.do?qno=${qab.qno}&qreno=${qrl.qreno}">수정</a>
					| <a href="/deleteqareply.do?qno=${qab.qno}&qreno=${qrl.qreno}"
						onclick="return confirm('정말로 삭제하시겠습니까?')">삭제</a>
					</c:if>
				</p>
			</div>
			</c:forEach>
			<!-- 댓글 등록 -->
			<form action="/insertqareply.do" method="post" id="qareplyform">
				<input type="hidden" name="qno" value="${qab.qno}"> <input
					type="hidden" name="replyer" value="${sessionId}">
				<p>
				<p>
					<textarea rows="4" cols="50" name="recontent" placeholder="댓글입력"></textarea>
				</p>
				<button type="submit">등록</button>
			</form>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>