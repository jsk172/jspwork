<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
<link rel="stylesheet" href="../resources/css/join2.css">
</head>
<body>
	<div id="container">
		<div id="top">
			<div class="join_header_wrap">
				<div class="join_header_inner">
					<a href="/main.do" title="홈으로"><img class="logo"
						src="../resources/img/logo/로고_01_logo2.2.jpg"></a>
					<ol>
						<li><span>01</span> 가입방법 <i class="fa-solid fa-caret-right"></i></li>
						<li><span>02</span> 약관동의 <i class="fa-solid fa-caret-right"></i></li>
						<li class="page_on"><span>03</span> 정보입력 <i
							class="fa-solid fa-caret-right"></i></li>
						<li><span>04</span> 가입완료</li>
					</ol>
				</div>
			</div>
		</div>
		<div id="mid">
			<form action="/insertmember.do" id="mid_form" method="post">
				<fieldset id="join_info">
					<legend>기본정보</legend>
					<div>
						<table>
						<tbody>
							<tr>
								<th>ID</th>
								<td><input type="text" name="id" id="id">
									<span>(영문 소문자/숫자, 8~14자)</span></td>
							</tr>
							<tr>
								<th>PassWord</th>
								<td>
									<input type="password" name="passwd" id="passwd">
									<span>(영문대소문자/숫자/특수문자 포함 10자이상)</span>
								</td>
							</tr>
							<tr>
								<th>Confirm PW</th>
								<td>
									<input type="password" name="passwd2" id="passwd2">
									<span>(입력하신 비밀번호와 동일하게 입력해주세요)</span>
								</td>
							</tr>
							<tr>
								<th>Name</th>
								<td>
									<input type="text" name="name" id="name">
									<span>(이름은 한글로만 입력해주세요)</span>
								</td>
							</tr>
							<tr>
								<th>Phone</th>
								<td><input type="text" name="phone" id="phone"></td>
							</tr>
							<tr>
								<th>E-mail</th>
								<td><input type="text" name="email" id="email"></td>
							</tr>
							<tr>
								<th>Address</th>
								<td><input type="text" size="10" name="zip_code"><span>우편번호</span></td>
								<td><input type="text" size="50" name="address"><span>주소</span></td>
								<td><input type="text" size="50" name="detailaddress"><span>상세주소</span></td>
							</tr>
						</tbody>
						</table>
					</div>
				</fieldset>
				<div class="btnbox">
					<button type="button" class="reset_btn" onclick="goBack()">이전 단계</button>
					<button type="button" class="join_btn" onclick="registerUser()">회원가입</button>
				</div>
			</form>
		</div>
	</div>
</body>
	<script src="../resources/js/check.js"></script>
</html>