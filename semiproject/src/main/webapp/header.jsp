<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<link rel="stylesheet" href="../resources/css/header.css">
<header>
	<div id=container>
		<div id="top">
			<div class="top-top">
				<div class="tt-box">
					<div class="mini-shortcut">
						<!-- 상단 좌측 링크 아이콘 -->
					</div>

					<div class="top-top-menu">
						<!-- 상단 미니메뉴 -->
						<c:choose>
							<c:when test="${empty sessionId }">
								<ul class="ttm-list">
									<li><a href="/joinform.do">JOIN</a></li>
									<li><a href="/loginform.do">LOG-IN</a></li>
									<li><a href="/memberview.do">MY-PAGE</a></li>
									<li><a href="/basket.do">BASKET</a></li>
									<li><a href="/purchasehistory.do">ORDER-INQUIRY</a></li>
									<li><a href="/boardlist.do">BOARD</a></li>
									<li><input type="text" id="search"> 🔍</li>
									<!-- 상단 검색창 -->
								</ul>
							</c:when>
							<c:otherwise>
								<ul class="ttm-list">
									<li><a href="#">${sessionId}</a></li>
									<li><a href="/logout.do">LOG-OUT</a></li>
									<li><a href="/memberview.do?id=${sessionId}">MY-PAGE</a></li>
									<li><a href="/basket.do">BASKET</a></li>
									<li><a href="/purchasehistory.do">ORDER-INQUIRY</a></li>
									<li><a href="/boardlist.do">BOARD</a></li>
									<li><input type="text" id="search"> 🔍</li>
									<!-- 상단 검색창 -->
								</ul>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>

			<div class="top-mid">
				<!-- 메인 로고, 사진 -->
				<a href="/main.jsp"> <img class="logo-pic"
					src="../resources/img/logo/01_logo2.2.jpg" alt="">
				</a>
			</div>

			<div id="top-btm">
				<!-- 사이트 내 각종 메뉴 모음 -->
				<nav class="top-btm-menu">
					<ul class="tbm-list">
						<li class="tbm-list-li"><a href="/productlist.do"><i
								class="fa-solid fa-bars"></i>전체 메뉴</a>
							<ul class="sub_all_menu">
								<ul>
									<a href="/categorylist.do?category=강아지 먹거리">강아지 먹거리</a>
									<li><a href="/categorylist.do?category=강아지 사료">사료</a></li>
									<li><a href="/categorylist.do?category=강아지 간식">간식</a></li>
									<li><a href="/categorylist.do?category=강아지 영양제">영양제</a></li>
								</ul>
								<ul>
									<a href="/categorylist.do?category=강아지 용품">강아지 용품</a>
									<li><a href="/categorylist.do?category=강아지 집">강아지 집</a></li>
									<li><a href="/categorylist.do?category=강아지 옷">강아지 옷</a></li>
									<li><a href="/categorylist.do?category=강아지 장난감">강아지 장난감</a></li>
									<li><a href="/categorylist.do?category=강아지 밥그릇">강아지 밥그릇</a></li>
									<li><a href="/categorylist.do?category=강아지 산책용품">강아지 산책용품</a></li>
								</ul>
								<ul>
									<a href="/categorylist.do?category=고양이 먹거리">고양이 먹거리</a>
									<li><a href="/categorylist.do?category=고양이 사료">사료</a></li>
									<li><a href="/categorylist.do?category=고양이 간식">간식</a></li>
									<li><a href="/categorylist.do?category=고양이 영양제">영양제</a></li>
								</ul>
								<ul>
									<a href="/categorylist.do?category=고양이 용품">고양이 용품</a>
									<li><a href="/categorylist.do?category=고양이 집">고양이 집</a></li>
									<li><a href="/categorylist.do?category=고양이 옷">고양이 옷</a></li>
									<li><a href="/categorylist.do?category=고양이 장난감">고양이 장난감</a></li>
									<li><a href="/categorylist.do?category=고양이 밥그릇">고양이 밥그릇</a></li>
									<li><a href="/categorylist.do?category=고양이 방콕용품">고양이 방콕용품</a></li>
								</ul>
								<ul>
									<a href="/categorylist.do?category=햄스터 먹거리">햄스터 먹거리</a>
									<li><a href="/categorylist.do?category=햄스터 사료">사료</a></li>
									<li><a href="/categorylist.do?category=햄스터 간식">간식</a></li>
									<li><a href="/categorylist.do?category=햄스터 영양제">영양제</a></li>
								</ul>
								<ul>
									<a href="/categorylist.do?category=햄스터 용품">햄스터 용품</a>
									<li><a href="/categorylist.do?category=햄스터 집">햄스터 집</a></li>
									<li><a href="/categorylist.do?category=햄스터 장난감">햄스터 장난감</a></li>
									<li><a href="/categorylist.do?category=햄스터 밥그릇">햄스터 밥그릇</a></li>
									<li><a href="/categorylist.do?category=햄스터 챗바퀴">햄스터 챗바퀴</a></li>
									<li><a href="/categorylist.do?category=햄스터 이갈이">햄스터 이갈이</a></li>
								</ul>
								<ul>
									<a href="/categorylist.do?category=이벤트 상품">이벤트 상품</a>
									<li><a href="/categorylist.do?category=기간 할인 상품">기간 할인 상품</a></li>
									<li><a href="/categorylist.do?category=신상품 할인 이벤트">신상품 할인 이벤트</a></li>
									<li><a href="/categorylist.do?category=시즌 한정 상품">시즌 한정 상품</a></li>
								</ul>
							</ul></li>
						<li class="tbm-list-li"><a href="/categorylist.do?category=강아지 먹거리">강아지 먹거리</a>
							<ul class="sub_menu">
								<li><a href="/categorylist.do?category=강아지 사료">사료</a></li>
								<li><a href="/categorylist.do?category=강아지 간식">간식</a></li>
								<li><a href="/categorylist.do?category=강아지 영양제">영양제</a></li>
							</ul></li>
						<li class="tbm-list-li"><a href="/categorylist.do?category=강아지 용품">강아지 용품</a>
							<ul class="sub_menu">
								<li><a href="/categorylist.do?category=강아지 집">강아지 집</a></li>
								<li><a href="/categorylist.do?category=강아지 옷">강아지 옷</a></li>
								<li><a href="/categorylist.do?category=강아지 장난감">강아지 장난감</a></li>
								<li><a href="/categorylist.do?category=강아지 밥그릇">강아지 밥그릇</a></li>
								<li><a href="/categorylist.do?category=강아지 산책용품">강아지 산책용품</a></li>
							</ul></li>
						<li class="tbm-list-li"><a href="/categorylist.do?category=고양이 먹거리">고양이 먹거리</a>
							<ul class="sub_menu">
								<li><a href="/categorylist.do?category=고양이 사료">사료</a></li>
								<li><a href="/categorylist.do?category=고양이 간식">간식</a></li>
								<li><a href="/categorylist.do?category=고양이 영양제">영양제</a></li>
							</ul></li>
						<li class="tbm-list-li"><a href="/categorylist.do?category=고양이 용품">고양이 용품</a>
							<ul class="sub_menu">
								<li><a href="/categorylist.do?category=고양이 집">고양이 집</a></li>
								<li><a href="/categorylist.do?category=고양이 옷">고양이 옷</a></li>
								<li><a href="/categorylist.do?category=고양이 장난감">고양이 장난감</a></li>
								<li><a href="/categorylist.do?category=고양이 밥그릇">고양이 밥그릇</a></li>
								<li><a href="/categorylist.do?category=고양이 방콕용품">고양이 방콕용품</a></li>
							</ul></li>
						<li class="tbm-list-li"><a href="/categorylist.do?category=햄스터 먹거리">햄스터 먹거리</a>
							<ul class="sub_menu">
								<li><a href="/categorylist.do?category=햄스터 사료">사료</a></li>
								<li><a href="/categorylist.do?category=햄스터 간식">간식</a></li>
								<li><a href="/categorylist.do?category=햄스터 영양제">영양제</a></li>
							</ul></li>
						<li class="tbm-list-li"><a href="/categorylist.do?category=햄스터 용품">햄스터 용품</a>
							<ul class="sub_menu">
								<li><a href="/categorylist.do?category=햄스터 집">햄스터 집</a></li>
								<li><a href="/categorylist.do?category=햄스터 장난감">햄스터 장난감</a></li>
								<li><a href="/categorylist.do?category=햄스터 밥그릇">햄스터 밥그릇</a></li>
								<li><a href="/categorylist.do?category=햄스터 챗바퀴">햄스터 챗바퀴</a></li>
								<li><a href="/categorylist.do?category=햄스터 이갈이">햄스터 이갈이</a></li>
							</ul></li>
						<li class="tbm-list-li"><a href="/categorylist.do?category=이벤트 상품">이벤트 상품</a>
							<ul class="sub_menu">
								<li><a href="/categorylist.do?category=기간 할인 상품">기간 할인 상품</a></li>
								<li><a href="/categorylist.do?category=신상품 할인 이벤트">신상품 할인 이벤트</a></li>
								<li><a href="/categorylist.do?category=시즌 한정 상품">시즌 한정 상품</a></li>
							</ul></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</header>