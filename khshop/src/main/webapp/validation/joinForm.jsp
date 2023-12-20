<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 페이지</title>
<link rel="stylesheet" href="/validation/css/style.css">
<script src="/validation/js/validation.js"></script>
</head>
<body>
	<form action="joinProcess.jsp" method="post" name="member">
		<fieldset>
			<legend>회원 가입</legend>
			<ul>
				<li><label for="uid">아이디</label> <input type="text" id="uid"
					name="uid" placeholder="아이디는 5~12자까지 입력해주세요." required autofocus></li>
				<li><label for="passwd">비밀번호</label> <input type="password"
					id="passwd" name="passwd" placeholder="영문자, 숫자, 특수문자 포함 7자 이상 입력" required></li>
				<li><label for="passwd2">비밀번호 확인</label> <input type="password"
					id="passwd2" name="passwd2" placeholder="비밀번호를 동일하게 입력해주세요."></li>
				<li><label for="name">이름</label> <input type="text" id="name"
					name="name" placeholder="이름은 숫자로 시작할 수 없습니다."></li>
				<li>
					<button type="button" onclick="checkForm()">가입</button>
					<button type="reset">취소</button>
				</li>
			</ul>
		</fieldset>
	</form>
</body>
</html>