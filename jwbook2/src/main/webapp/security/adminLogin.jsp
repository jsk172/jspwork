<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<style type="text/css">
	ul li{list-style: none; margin: 10px;}
</style>
</head>
<body>
	<form action="j_security_check" method="post">
		<ul>
			<li>
				<label for="uid">아이디</label>
				<input type="text" id="uid" name="j_username">
			</li>
			<li>
				<label for="passwd">비밀번호</label>
				<input type="password" id="passwd" name="j_password">
			</li>
			<li>
				<button type="submit">로그인</button>
				<button type="reset">취소</button>
			</li>
		</ul>
	</form>
</body>
</html>