<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보</title>
<script>
	let addToCart = function(){
		if(confirm("상품을 주문하시겠습니까?")){ //확인, 취소
			document.addform.submit();
		}else{
			document.addform.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	<div class="container my-3">
		<h1>상품 정보</h1>
		<div class="row">
			<div class="col-5">
				<img src="../upload/${product.pimage}" alt="">
			</div>
			<div class="col-5">
				<p>${product.pname}<p>
				<p>${product.description}</p>
				<p><b>상품코드: </b><span class="badge bg-dark">${product.pid}</span></p>
				<p><b>분류: </b>${product.category}</p>
				<p><b>재고수: </b>${product.pstock}개</p>
				<p><b>가격: </b>${product.price}원<p>
				<form action="/addcart.do?pid=${product.pid}" method="post" name="addform">
					<!-- 주문하기 누르면 form이 전송되어야 함. -->
					<a href="#" onclick="addToCart()" class="btn btn-success">주문하기</a>
					<a href="/productlist.do" class="btn btn-secondary">상품목록</a>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"/>
</body>
</html>