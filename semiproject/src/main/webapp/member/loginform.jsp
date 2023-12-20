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
    <div class="member_warp">
        <div class="member_tit">
            <a href=""><img class="logo" src="../resources/img/logo/로고_01_logo2.2.jpg"></a>
        </div>
        <div>
		    <form action="/login.do" method="post">
		        <div>
		            <input type="text" id="id" name="id" placeholder="아이디">
		            <input type="password" id="passwd" name="passwd" placeholder="비밀번호">
		        </div>
		        <button type="submit">로그인</button>
		    </form>
        </div>
        <p class="agree_box">
            <input type="checkbox" name="saveId" id="saveId">
            <label for="saveId"> 아이디 저장</label>
        </p>
        <div class="btn_login_box">
            <div class="error">${error}</div>
            <ul>
                <li>
                    <a href="/joinform.do"><button id="btnJoinMember" class="btn_member_join">회원가입</button></a>
                    <p>💌 Become a member <br> and Enjoy the benefits!</p>
                </li>
                <li><button id="btnFindId" class="btn_member_white">아이디 찾기</button></li>
                <li><button id="btnFindPwd" class="btn_member_white">비밀번호 찾기</button></li>
            </ul>
        </div>
    </div>
</body>

</html>