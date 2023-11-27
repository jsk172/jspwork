<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유효성 검사</title>
<style type="text/css">
	ul li{list-style: none; margin: 10px;}
</style>
<script type="text/javascript">
	function checkForm(){
		/* 1. 아이디는 문자로 시작해주세요.
		   2. 비밀번호는 숫자만 입력해주세요.
		   3. 이름은 한글만 입력해주세요.
		*/
		let form = document.member;
		let id = form.uid.value;
		let pw = form.passwd.value;
		let name = form.uname.value;
		let phone = form.phone1.value + "-" + form.phone2.value + "-" + form.phone3.value;
		//정규표현식
		let regexId = /^[a-zA-Z가-힣]/ //문자로 시작
		let regexPw = /^[0-9]+$/ //숫자 1개이상(+가 1개이상이라는 표시)
		let regexName = /^[가-힣]+$/ //한글 1자 이상
		//let regexEng = /[a-zA-Z]+/ //영문 1자 이상
		let regexPhone = /\d{2,3}-\d{3,4}-\d{4}/ //전화번호
		
		if(!regexId.test(id)){
			alert("아이디는 문자로 시작해주세요.");
			form.uid.select();
			return false;
		}else if(!regexPw.test(pw)){
			alert("비밀번호는 숫자만 입력해주세요.");
			form.passwd.select();
			return false;
		}else if(!regexName.test(name)){
			alert("이름은 한글만 입력해주세요.");
			form.uname.select();
			return false;
		}else if(!regexPhone.test(phone)){
			alert("연락처 입력을 확인해 주세요.");
			form.phone.select();
			return false;
		}else{
			form.submit();
		}
	}
</script>
</head>
<body>
	<form action="joinProcess.jsp" method="post" name="member">
		<ul>
			<li>
				<label for="uid">아이디</label>
				<input type="text" id="uid" name="uid">
			</li>
			<li>
				<label for="passwd">비밀번호</label>
				<input type="password" id="passwd" name="passwd">
			</li>
			<li>
				<label for="uname">이름</label>
				<input type="text" id="uname" name="uname">
			</li>
			<li>
				<label for="phone">연락처</label>
				<select name="phone1">
					<option value="010">010</option>
					<option value="02">02</option>
					<option value="031">031</option>
				</select>-<input type="text" name="phone2" maxlength=4 size=4>
				-<input type="text" name="phone3" maxlength=4 size=4>
			</li>
			<li>
				<button type="button" onclick="checkForm()">가입</button>
			</li>
		</ul>
	</form>
</body>
</html>