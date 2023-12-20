<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입폼</title>
<link rel="stylesheet" href="../resources/css/join_pre.css">
<script src="../resources/js/jquery-3.7.1.js"></script>
<script src="../resources/js/validation.js"></script>
</head>
<body>
	<div id="container">
		<div id="top">
			<div class="join_header_wrap">
				<div class="join_header_inner">
					<a href="/main.do" title="홈으로"><img class="logo"
						src="../resources/img/logo/로고_01_logo2.2.jpg"></a>
					<ol>
						<li class="page_on"><span>01</span> 가입방법 <i
							class="fa-solid fa-caret-right"></i></li>
						<li><span>02</span> 약관동의 <i class="fa-solid fa-caret-right"></i></li>
						<li><span>03</span> 정보입력 <i class="fa-solid fa-caret-right"></i></li>
						<li><span>04</span> 가입완료</li>
					</ol>
				</div>
			</div>
		</div>
		<div id="mid">
			<div class="join_main_visual_inner">
				<div class="join_img">
					<a href=""><img class="backimg" src="../resources/img/else/back_img01.jpg"></a>
					<div class="join_text">
						<span class="primary">우리 반려동물도 뭘 먹을지 궁금해야 합니다,<br>
						<b>멍뭉꼬냥에 오신 것을 환영합니다</b></span><br> <span class="summary">지금
							멍뭉꼬냥에 가입하시고 다양한 혜택을 만나보세요</span>
					</div>
					<div class="member_login_shop">
						<a href="/join1.do" id="btnJoin" class="shop_mall_join"><span>멍뭉꼬냥
								회원가입 하기</span></a>
					</div>
					<div class="member_guide_txt">
						<p>
							이미 멍뭉꼬냥 회원이신가요? <a href="/login.do" id="btnLoginMember"><b>로그인</b></a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>