<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
<link rel="stylesheet" href="../resources/css/join3.css">
<script src="https://kit.fontawesome.com/9ae9f544ec.js" crossorigin="anonymous"></script>

</head>
<body>
    <div id="container">
        <div id="top">
            <div class="join_header_wrap">
                <div class="join_header_inner">
                    <a href="/main.do" title="홈으로"><img class="logo" src="../resources/img/logo/로고_01_logo2.2.jpg"></a>
                    <ol>
                        <li><span>01</span> 가입방법 <i class="fa-solid fa-caret-right"></i></li>
                        <li><span>02</span> 약관동의 <i class="fa-solid fa-caret-right"></i></li>
                        <li><span>03</span> 정보입력 <i class="fa-solid fa-caret-right"></i></li>
                        <li class="page_on"><span>04</span> 가입완료</li>
                    </ol>
                </div>
            </div>
        </div>
        <div id="mid">
            <div class="member_wrap">
                <div class="member_cont_join_ok">
                    <div class="join_ok_box">
                        <div class="join_ok_tit">
                            <div class="check">
                            <i class="fa-solid fa-check"></i>
                            </div>
                            <p class="complete">회원가입이 <b>완료</b> 되었습니다.</p>
                            <p><span>${sessionName}</span>님의 회원가입을 축하합니다. <br> 알차고 실속있는 서비스로 찾아뵙겠습니다.</p>
                        </div>
                        <div class="btn_member_sec">
                            <ul>
                                <li><button id="btnHome" onclick="goToMain()">홈으로</button></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>  
</body>
	<script type="text/javascript" src="../resources/js/check.js"></script>
</html>