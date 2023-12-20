<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍뭉꼬냥</title>
<link rel="stylesheet" href="resources/css/main.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="navbar.jsp" />
	<div id="mid">
		<div class="mid-top">
			<div class="main-prod-show">
				<!-- 제일 큰 사진으로 주요 제품 등을 보여줌 -->
				<div class="main-prod">
					<a href=""><img id="main-prod-pic1" class="main-prod-pic"
						src="resources/img/main_product/main-pic1.jpg" alt=""></a>
				</div>
				<div class="main-prod">
					<a href=""><img id="main-prod-pic2" class="main-prod-pic"
						src="resources/img/main_product/main-pic2.jpg" alt=""></a>
				</div>
				<div class="main-prod">
					<a href=""><img id="main-prod-pic3" class="main-prod-pic"
						src="resources/img/main_product/main-pic3.jpg" alt=""></a>
				</div>
				<div class="main-prod">
					<a href=""><img id="main-prod-pic4" class="main-prod-pic"
						src="resources/img/main_product/main-pic4.jpg" alt=""></a>
				</div>
				<div class="main-prod">
					<a href=""><img id="main-prod-pic5" class="main-prod-pic"
						src="resources/img/main_product/main-pic5.jpg" alt=""></a>
				</div>
			</div>
			<div class="main-pic-button">
				<!-- 버튼 클릭으로 메인 사진 선택 -->
				<button class="pic1" onclick="selectPic(0)"></button>
				<button class="pic2" onclick="selectPic(1)"></button>
				<button class="pic3" onclick="selectPic(2)"></button>
				<button class="pic4" onclick="selectPic(3)"></button>
				<button class="pic5" onclick="selectPic(4)"></button>
			</div>
		</div>
		<div class="mid-mid"></div>
		<div class="board">
			<div class="notice-board">
				<h3 class="title-notice">
					<a href="">Notice / Event</a>
				</h3>
				<ul class="notice-list">
					<li><a href="">Notice 1</a></li>
					<li><a href="">Notice 2</a></li>
					<li><a href="">Event 2</a></li>
					<li><a href="">Event 1</a></li>
				</ul>
			</div>
			<div class="review-board">
				<h3 class="title-review">
					<a href="">Review Board</a>
				</h3>
				<ul class="review-list">
					<li><a href="">Review 4</a></li>
					<li><a href="">Review 3</a></li>
					<li><a href="">Review 2</a></li>
					<li><a href="">Review 1</a></li>
				</ul>
			</div>
			<div class="QnA-board">
				<h3 class="title-QnA">
					<a href="">Q/A Board</a>
				</h3>
				<ul class="QnA-list">
					<li><a href="">Q/A 4</a></li>
					<li><a href="">Q/A 3</a></li>
					<li><a href="">Q/A 2</a></li>
					<li><a href="">Q/A 1</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="mid-bottom">
		<div class="prod-board">
			<h2>Home Sweet Home</h2>
			<div class="sub-prod-show">
				<!-- 메인 제품 외의 주요 제품 목록 -->
				<a href=""><img class="sub-prod-pic"
					src="resources/img/products/house1.jpg" alt=""></a> <a href=""><img
					class="sub-prod-pic" src="resources/img/products/house2.jpg" alt=""></a> <a
					href=""><img class="sub-prod-pic"
					src="resources/img/products/house3.jpg" alt=""></a> <a href=""><img
					class="sub-prod-pic" src="resources/img/products/house4.jpg" alt=""></a>
			</div>

			<h2>WaGoo WaGoo</h2>
			<div class="sub-prod-show">
				<!-- 메인 제품 외의 주요 제품 목록 -->
				<a href=""><img class="sub-prod-pic"
					src="resources/img/products/food1.jpg" alt=""></a> <a href=""><img
					class="sub-prod-pic" src="resources/img/products/food2.jpg" alt=""></a> <a
					href=""><img class="sub-prod-pic" src="resources/img/products/food3.jpg"
					alt=""></a> <a href=""><img class="sub-prod-pic"
					src="resources/img/products/food4.jpg" alt=""></a>
			</div>

			<h2>Let's Play</h2>
			<div class="sub-prod-show">
				<!-- 메인 제품 외의 주요 제품 목록 -->
				<a href=""><img class="sub-prod-pic"
					src="resources/img/products/toy1.jpg" alt=""></a> <a href=""><img
					class="sub-prod-pic" src="resources/img/products/toy2.jpg" alt=""></a> <a
					href=""><img class="sub-prod-pic" src="resources/img/products/toy3.jpg"
					alt=""></a> <a href=""><img class="sub-prod-pic"
					src="resources/img/products/toy4.jpg" alt=""></a>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>