<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
<link rel="stylesheet" href="../resources/css/login.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="container">
		<div id="mid">
			<div class="mid_h3">
				<h3>LOG IN</h3>
			</div>
			<div id="login">
				<form action="/j_security_check" id="mid_form" method="post">
					<table class="login_tb">
						<tr class="login_tr">
							<td class="td_text">
								<span onclick="">ID</span>
							</td>
							<td class="td_input">
								<input type="text" name="j_username" class="login_input">
							</td>
							<td rowspan="2" class="td_btn">
								<button type="submit" class="login_btn">Log In</button>
							</td>
						</tr>
						<tr class="login_tr">
							<td class="td_text">
								<span>PW</span>
							</td>
							<td class="td_input">
								<input type="password" name="j_password" class="login_input">
							</td>
						</tr>
						<div class="error">${error}</div>
					</table>
				</form>
				<div id="find_account">
					<p>
						<a href="#" class="find_id">Find ID</a> | <a href="#"
							class="find_pw">Find PW</a>
					</p>
				</div>
				<div class="join_account">
					<p>
						💌 Become a member <br> and Enjoy the benefits!
					</p>
					<a href="#"><button class="join_account_btn">JOIN!</button></a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>