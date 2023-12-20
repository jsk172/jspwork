<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 게시글 수정</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="container">
		<h2>리뷰 게시글 수정</h2>
		<form action="/updatereviewboard.do" method="post">
			<!-- ui를 만들지않고 데이터를 숨겨서 보낼때 사용 -->
			<input type="hidden" name="rno" value="${rboardList.rno}">
			<table>
				<tbody>
					<tr>
						<td><input type="text" name="rtitle"
							value="${rboardList.rtitle}"></td>
					</tr>
					<tr>
						<td><textarea rows="7" cols="100" name="rcontent"
								placeholder="글내용">${rboardList.rcontent}</textarea></td>
					</tr>
					<tr>
						<td>
							<button type="submit">저장</button>
							<a href="/reviewboardlist.do">
								<button type="button">취소</button>
							</a>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>