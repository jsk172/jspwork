<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 목록</title>
<link rel="stylesheet" href="../resources/css/style.css">
</head>
<body>
	<section id="content">
		<h2>학생 등록</h2>
		<hr>
		<form action="/insertstudent.do" method="post">
			<ul>
				<li>
					<label>이름</label>
					<input type="text" name="username">
				</li>
				<li>
					<label>대학</label>
					<input type="text" name="univ">
				</li>
				<li>
					<label>생일</label>
					<input type="date" name="birth" class="birth">
				</li>
				<li>
					<label>이메일</label>
					<input type="email" name="email">
				</li>
				<div>
					<button type="submit">등록</button>
					<button type="reset">취소</button>
				</div>
			</ul>
		</form>
	</section>
</body>
</html>