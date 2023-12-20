<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://kit.fontawesome.com/b56be2ad7d.js"
	crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정/삭제</title>
<link rel="stylesheet" href="../resources/css/productmanagement.css">
</head>
<body>
	<!-- 관리자만 수정/삭제 사용됨 -->
	<%-- <c:if test="${empty sessionAdmin}">
		<script type="text/javascript">
			alert("관리자 로그인이 필요합니다.");
			location.href = "/loginform.do"
		</script>
	</c:if> --%>
	<jsp:include page="../header.jsp" />
	<jsp:include page="../navbar.jsp" />
	<%-- <jsp:include page="../navbar.jsp" /> --%>
	<div class="mid">
		<section id="update_form">
			<h3>상품 수정/삭제</h3>
			<table>
				<tbody>
					<c:forEach items="${productList}" var="product">
						<tr class="tr1">
							<td class="td1">${product.pno}</td>
							<td class="td2">${product.pname}</td>
							<td class="td3">${product.price}</td>
							<td class="td4">${product.pcontent}</td>
							<td class="td5">${product.category}</td>
						</tr>
						<tr class="tr2">
							<td class="td6" colspan="5">
								<div class="td_img">
									<c:if test="${not empty product.pfilename}">
										<img src="../fileupload/${product.pfilename}" alt="">
									</c:if>
								</div>
							</td>
						</tr>
						<tr class="tr3">
							<td colspan="5">
								<a href="/updateform.do?pno=${product.pno}"><button type="button">수정</button></a> 
								<a href="/deleteproduct.do?pno=${product.pno}"><button type="button" onclick="return confirm('삭제하시겠습니까?')">삭제</button></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
					<a href="/product/insertproduct.jsp"><button type="submit">상품등록</button></a>
					<a href="/productlist.do"><button type="submit">목록</button></a>
		</section>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>