<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매내역페이지(new)</title>
<link rel="stylesheet" href="../resources/css/purchasehistory.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<jsp:include page="../navbar.jsp" />
	<%-- <jsp:include page="../navbar.jsp" /> --%>
	<div id="mid">
		<h3>구매내역</h3>
		<section id="buyend">
			<div class="history_table_box">
				<table class="history_table">
					<thead>
						<tr class="tr1">
							<td colspan="7">상품 구매내역</td>
						</tr>
						<tr>
							<th class="col1">주문번호</th>
							<th class="col2">주문일자</th>
							<th class="col3">이미지</th>
							<th class="col4">상품정보</th>
							<th class="col6">주문금액</th>
							<th class="col7">처리상태</th>
							<th class="col8">취소/교환/반품</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${purchasehistorylist}" var="purchasehistory">
						<tr>
							<td class="td1">
								${purchasehistory.phno}
							</td>
							<td class="td3">
								<fmt:formatDate value="${purchasehistory.pdate}" pattern="yy-MM-dd HH:mm" />
							</td>
							<td class="img_col">
								<img src="../fileupload/${purchasehistory.pfilename}" alt="">
							</td>
							<td class="td4">
								${purchasehistory.pname }
								<!-- ${be.pname} --> <!-- </td>
                                    <td  class="td5">
                                        ${be.count}
                                    </td> -->
							<td class="td6">
								<!-- ${be.orderPrice} -->
								<p>${purchasehistory.pcnt}(수량)X ${purchasehistory.price}(가격)</p>
								<br>
								<p class="sub_price"></p>
							</td>
							<td class="td7">결제완료</td>
							<td class="td8">
								<select name="ctr" id="ctr">
									<option value="cancel">취소</option>
									<option value="trade">교환</option>
									<option value="recall">반품</option>
								</select>
								<button>확인</button></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div id="page">
				<c:forEach var="i" begin="1" end="${endp}">
					<c:if test="${page == i}">
						<a href="/buyList.do?pageNum=${i}"><b>${i}</b></a>
					</c:if>
					<c:if test="${page != i}">
						<a href="/buyList.do?pageNum=${i}">${i}</a>
					</c:if>
				</c:forEach>
			</div>
		</section>
	</div>
	<jsp:include page="../footer.jsp" />
	<script>
		 let count = ${purchasehistory.pcnt};
		 let price = ${purchasehistory.price};
		 let result = (count * price) + 3000;
		
		 document.querySelector('.sub_price').innerText = result;
    </script>
</body>
</html>