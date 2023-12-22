<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
</head>
<body>
	<jsp:include page="../header.jsp"/>
		<div class="container my-5" align="center">
			<div class="col-4" align="center">
				<h3>로그인</h3>
				<form action="/j_security_check" method="post">
					<div class="form-group my-3">
						<input type="text" id="id" name="j_username"
						 class="form-control" placeholder="id" autofocus required>
					</div>
					<div class="form-group my-3">
						<input type="password" id="passwd" name="j_password"
						 class="form-control" placeholder="passwd" required>
					</div>
					
					<div class="d-grid my-3">
						<button type="submit" class="btn btn-success p-2">로그인</button>
					</div>
					<%
						String error = request.getParameter("error");
						if(error != null){
							out.println("<div class='alert alert-danger'>");
							out.println("관리자 전용 메뉴입니다.<br> 일반 로그인 해주세요.");
							out.println("</div>");
						}
					%>
				</form>
			</div>
		</div>
	<jsp:include page="../footer.jsp"/>
</body>
</html>