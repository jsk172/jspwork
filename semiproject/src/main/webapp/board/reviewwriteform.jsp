<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 글쓰기</title>
<link rel="stylesheet" href="../resources/css/writeform.css">
</head>
<body>
	<c:if test="${empty sessionId}">
		<script type="text/javascript">
			alert("로그인이 필요한 페이지입니다.");
			location.href = "/loginform.do";
		</script>
	</c:if>
	<jsp:include page="../header.jsp" />
	<div id="container">
		<section id="writeform">
			<h2>리뷰 글쓰기</h2>
			<form action="/reviewwrite.do" method="post"
				enctype="multipart/form-data">
				<table>
					<tbody>
						<tr>
							<td><input type="text" name="rtitle" placeholder="글제목"
								required></td>
						</tr>
						<tr>
							<td><textarea rows="7" cols="100" name="rcontent"
									placeholder="글내용"></textarea></td>
						</tr>
						<tr>
							<td><input type="file" name="rfilename"></td>
						</tr>
						<tr>
							<td class="btnbox">
								<button type="submit" class="join_btn">등록</button>
								<button type="reset" class="reset_btn">취소</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</section>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>