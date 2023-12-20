<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
	#content{width: 800px; margin: 0 auto; text-align: center;}
</style>
</head>
<body>
	<div id="content">
		<h2>로그인</h2>
		<hr>
		<form action="selproduct.jsp" method="post">
			<p>이름 : <input type="text" name="username"></p>
			<p><input type="submit" value="로그인"></p>
		</form>
	</div>
</body>
</html>