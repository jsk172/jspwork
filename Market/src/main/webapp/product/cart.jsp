<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	<div class="container my-3">
		<h1>장바구니</h1>
		<div class="row">
			<table>
				<tr>
					<td class="left">
						<a href="/shippingform.do?cartId=${cartId}" class="btn btn-success">주문하기</a>
					</td>
					<td class="right">
						<a href="/deletecart.do" class="btn btn-danger">삭제하기</a>
					</td>
				</tr>
			</table>
			<!-- 장바구니 품목 -->
			<div>
				<table class="table table-hover my-3 px-3">
					<thead>
						<tr>
							<th>상품</th>
							<th>가격</th>
							<th>수령</th>
							<th>소계</th>
							<th>비고</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${cartlist}" var="product">
							<tr>
								<td>${product.pid}-${product.pname}</td>
								<td><fmt:formatNumber value="${product.price}" pattern="#,##0"/></td>
								<td>${product.quantity}</td>
								<td><fmt:formatNumber value="${product.price * product.quantity}" pattern="#,##0"/></td>
								<td><a href="/removecart.do?pid=${product.pid}" class="badge bg-dark">삭제</a></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td></td>
							<td></td>
							<td>총액</td>
							<td><fmt:formatNumber value="${sum}" pattern="#,##0"/></td>
							<td><a href="/shippingform.do" class="btn btn-success">주문하기</a></td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"/>
</body>
</html>