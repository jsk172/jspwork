<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 편집</title>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	<div class="container my-3">
	<h2>상품 편집</h2>
		<div class="row" align="center">
			<c:forEach items="${products}" var="product">
				<div class="col-4">
					<c:if test="${not empty product.pimage}">
						<img src="../upload/${product.pimage}" style="width:100%">
					</c:if>
					<h3>${product.pname}</h3>
					<p>${product.category}</p>
					<p><fmt:formatNumber value="${product.price}" pattern="#,##0"/>원</p>
					<p>
						<!-- edit가 update면 수정 버튼 -->
						<c:if test="${edit eq 'update'}">
							<a href="/updateform.do?pid=${product.pid}" class="btn btn-primary">수정 &raquo;</a>
						</c:if>
						<c:if test="${edit eq 'delete'}">
							<a href="/deleteproduct.do?pid=${product.pid}" class="btn btn-danger" onclick="return confirm('정말로 삭제하시겠습니까?')">삭제 &raquo;</a>
						</c:if>
					</p>
				</div>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="../footer.jsp"/>
</body>
</html>