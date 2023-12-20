<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	<jsp:include page="../navbar.jsp" />
	<div id="container">
		<section id="">
		<h2>상품 수정</h2>
		<form action="/update.do" method="post" enctype="multipart/form-data">
			<!-- hidden은 UI를 만들지 않고 데이터를 숨겨서 보낼때 사용 -->
			<input type="hidden" name="pno" value="${product.pno}">
			<table>
				<tbody>
					<tr>
						<td><input type="text" name="pname" value="${product.pname}"></td>
					</tr>
					<tr>
						<td><input type="text" name="price" value="${product.price}"></td>
					</tr>
					<tr>
						<td><input type="text" name="category" value="${product.category}"></td>
					</tr>
					<tr>
						<td><textarea rows="7" cols="100" name="pcontent">${product.pcontent}</textarea></td>
					</tr>
					<tr>
					  	<td><input type="file" name="pfilename"></td>
				  	</tr>
					<tr>
						<td>
							<button type="submit">저장</button>
							<a href="/productmanagement.do">
								<button type="button">취소</button>
							</a>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		</section>
	</div>
	<jsp:include page="../footer.jsp"/>
</body>
</html>