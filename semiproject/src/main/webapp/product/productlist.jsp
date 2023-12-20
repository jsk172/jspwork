<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품페이지</title>
<link rel="stylesheet" href="../resources/css/product.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<jsp:include page="../navbar.jsp" />
	<div id="mid">
		<div class="mid_container">
			<div class="dog_tap">
				<div class="menu_subject">
					<a href="/categorylist.do?category=강아지">
						<h3>멍뭉</h3>
					</a>
					<div class="sub_taps">
						<a href="/categorylist.do?category=강아지"><span>먹거리</span></a> | <a href="/categorylist.do?category=강아지"><span>용품</span></a>
					</div>
				</div>
				<c:forEach items="${dList}" var="product">
					<div class="products">
						<div class="product">
							<a href="/productview.do?pno=${product.pno}">${product.pno}</a> <img
								src="../fileupload/${product.pfilename}" alt="">
							<div class="descript">
								<p class="product_title">${product.pname}</p>
								<p class="product_price">${product.price}</p>
								<p class="new_icon">NEW</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="cat_tap">
				<div class="menu_subject">
					<a href="/categorylist.do?category=고양이">
						<h3>꼬냥</h3>
					</a>
					<div class="sub_taps">
						<a href="/categorylist.do?category=고양이"><span>먹거리</span></a> | <a href="/categorylist.do?category=고양이"><span>용품</span></a>
					</div>
				</div>
				<c:forEach items="${cList}" var="product">
					<div class="products">
						<div class="product">
							<a href="/productview.do?pno=${product.pno}">${product.pno}</a> <img
								src="../fileupload/${product.pfilename}" alt="">
							<div class="descript">
								<p class="product_title">${product.pname}</p>
								<p class="product_price">${product.price}</p>
								<p class="new_icon">NEW</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="hamster_tap">
				<div class="menu_subject">
					<a href="/categorylist.do?category=햄스터">
						<h3>햄찌</h3>
					</a>
					<div class="sub_taps">
						<a href="/categorylist.do?category=햄스터"><span>먹거리</span></a> | <a href="/categorylist.do?category=햄스터"><span>용품</span></a>
					</div>
				</div>
				<c:forEach items="${hList}" var="product">
					<div class="products">
						<div class="product">
							<a href="/productview.do?pno=${product.pno}">${product.pno}</a> <img
								src="../fileupload/${product.pfilename}" alt="">
							<div class="descript">
								<p class="product_title">${product.pname}</p>
								<p class="product_price">${product.price}</p>
								<p class="new_icon">NEW</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="event_tap">
				<div class="menu_subject">
					<a href="/categorylist.do?category=이벤트">
						<h3>이벤트</h3>
					</a>
					<div class="sub_taps">
						<a href="/categorylist.do?category=이벤트"><span>기간 할인</span></a> | <a href="/categorylist.do?category=이벤트"><span>신상품</span></a>
						| <a href="/categorylist.do?category=이벤트"><span>한정판</span></a> | <a href="/productmanagement.do"><span>등록/수정/삭제</span></a>
					</div>
				</div>
				<c:forEach items="${eList}" var="product">
					<div class="products">
						<div class="product">
							<a href="/productview.do?pno=${product.pno}">${product.pno}</a> <img
								src="../fileupload/${product.pfilename}" alt="">
							<div class="descript">
								<p class="product_title">${product.pname}</p>
								<p class="product_price">${product.price}</p>
								<p class="new_icon">NEW</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>