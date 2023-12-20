<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기</title>
<link rel="stylesheet" href="../resources/css/productview.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<jsp:include page="../navbar.jsp" />
	<div id="container">
		<div id="mid">
			<div class="mid-top">
				<div class="view_pic">
					<img src="../fileupload/${productlist.pfilename}" alt="" class="view_picture">
				</div>
				<div class="view_order">
					<div class="view_explan">
						<div class="view_title">
							${productlist.pname}
							<p class="new_icon">NEW</p>
						</div>
						<table>
							<tbody>
								<tr>
									<th>원산지</th>
									<td>한국</td>
								</tr>
								<tr class="product_price">
									<th>판매가</th>
									<td>${productlist.price}원</td>
								</tr>
								<tr>
									<th>배송비</th>
									<td>3000원 (30,000만원 이상 구매시 무료)</td>
								</tr>
								<tr>
									<th>혜택</th>
									<td>선착순 100명 10% 할인</td>
								</tr>
								<tr>
									<th>평점</th>
									<td>${productlist.p_score}점</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="quantity">
						<span class="select_count">! 수량을 선택해주세요</span>
						<table>
							<tr>
								<td>이츠독 플로라 가든 프레임 하우스 옐로우</td>
								<td>수량
									<button>-</button>
									<span> 1 </span>
								<button>+</button>
								</td>
								<td>${productlist.price}원</td>
							</tr>
						</table>
					</div>
					<div class="confirm_price">
						<span class="price_text">총 상품금액(수량)</span>
						<h3>${productlist.price}원</h3>
						<span class="count">(1개)</span>
					</div>
					<div class="select_buy">
						<a href="/cart.do?pno=${productlist.pno}&cnt=1"><button type="button">장바구니 담기</button></a>
						<a href="/orders.do?pno=${productlist.pno}"><button type="button">바로구매</button></a>
					</div>
				</div>
			</div>

			<div class="mid-mid">
				${productlist.pcontent}
			</div>

			<div class="mid-btm">
				<div class="item_review">
					<p>ITEM REVIEW</p>
					<table>
						<thead>
							<tr>
								<th>no</th>
								<th>subject</th>
								<th>name</th>
								<th>date</th>
								<th>stars</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>4</td>
								<td>너무 좋아요!</td>
								<td>댕댕사랑</td>
								<td>2023-11-11</td>
								<td>★★★★☆</td>
							</tr>
							<tr>
								<td>3</td>
								<td>너무 좋아요!</td>
								<td>댕댕사랑</td>
								<td>2023-11-09</td>
								<td>★★★★☆</td>
							</tr>
							<tr>
								<td>2</td>
								<td>너무 좋아요!</td>
								<td>댕댕사랑</td>
								<td>2023-09-21</td>
								<td>★★★★☆</td>
							</tr>
							<tr>
								<td>1</td>
								<td>너무 좋아요!</td>
								<td>댕댕사랑</td>
								<td>2023-08-02</td>
								<td>★★★★☆</td>
							</tr>
						</tbody>
					</table>
					<button>page_number</button>
				</div>

				<div class="item_QnA">
					<p>ITEM QnA</p>
					<table>
						<thead>
							<tr>
								<th>no</th>
								<th>subject</th>
								<th>name</th>
								<th>date</th>
								<th>answer</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Q4</td>
								<td>비밀글입니다</td>
								<td>댕댕사랑</td>
								<td>2023-11-11</td>
								<td>X</td>
							</tr>
							<tr>
								<td>Q3</td>
								<td>너무 좋아요!</td>
								<td>댕댕사랑</td>
								<td>2023-11-09</td>
								<td>X</td>
							</tr>
							<tr>
								<td>Q2</td>
								<td>비밀글입니다</td>
								<td>작성자</td>
								<td>2023-09-21</td>
								<td>O</td>
							</tr>
							<tr>
								<td>A2</td>
								<td>비밀글입니다</td>
								<td>관리자</td>
								<td>2023-09-22</td>
								<td></td>
							</tr>
							<tr>
								<td>Q1</td>
								<td>너무 좋아요!</td>
								<td>댕댕사랑</td>
								<td>2023-08-02</td>
								<td>O</td>
							</tr>
							<tr>
								<td>A1</td>
								<td>너무 좋아요!</td>
								<td>관리자</td>
								<td>2023-08-03</td>
								<td></td>
							</tr>
						</tbody>
					</table>
					<button>page_number</button>
					<div class="QnA_btn">
						<button>문의하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>