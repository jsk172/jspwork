<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍뭉꼬냥</title>
<link rel="stylesheet" href="../resources/css/orders.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="mid">
		<h3>ORDER</h3>
		<div class="mid-top">
			<div class="member_order_info">
				<table>
					<tbody>
						<tr>
							<td rowspan="2" class="rowspan2">혜택 정보</td>
							<td class="first_td">${member.name}님,환영합니다</td>
						</tr>
						<tr class="second_tr">
							<td class="second_td"><a href="#">사용 가능 쿠폰 : 1개</a></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="prod_order_confirm_table">
				<div class="order_change_decrip">! 상품의 옵션 및 수량 변경은 상품상세 또는
					장바구니에서 가능합니다.</div>
				<table>
					<tbody>
						<tr>
							<td colspan="9">상품 주문내역</td>
						</tr>
						<tr class="table_td_head">
							<td><input type="checkbox"></td>
							<td>이미지</td>
							<td>상품정보</td>
							<td>판매가</td>
							<td>수량</td>
							<td>쿠폰여부</td>
							<td>배송구분</td>
							<td>배송비</td>
							<td>상품합계</td>
						</tr>
						<c:choose>
							<c:when test="${!empty product }">
								<tr class="tr2">
									<td class="td1"><input type="checkbox"></td>
									<td class="td2"><a href="#"><img
											src="../fileupload/${product.pfilename}" alt=""></a></td>
									<td class="td3">${product.pname}
										<p class="new_icon">NEW</p>
									</td>
									<%--  <td><span class="p_price">${product.price}</span></td>
                                <td><span class="p_count">${product.cnt}</span></td> --%>
									<td class="td4"><span class="p_price">${product.price}원</span></td>
									<td class="td5"><span class="p_count">1</span></td>
									<td class="td6">No</td>
									<td class="td7">기본배송</td>
									<td class="td8">3,000원</td>
									<td class="td9"><span class="result"></span></td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${cartlist }" var="cart">
									<tr>
										<td class="td1"><input type="checkbox"></td>
										<td class="td2"><img
											src="../fileupload/${cart.pfilename}" alt=""></td>
										<td class="td3">${cart.pname}
											<p class="new_icon">NEW</p>
										</td>
										<td class="td4"><span class="p_price">${cart.price}</span></td>
										<td class="td5"><span class="p_count">1</span></td>
										<!-- orders 테이블에 수량  -->
										<td class="td6">No</td>
										<td class="td7">기본배송</td>
										<td class="td8">3,000원</td>
										<td class="td9"><span class="result"></span></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>

						<tr class="tr3">
							<td colspan="9"><span class="order_config_small_text">상품구매금액
									<span class="result"></span>원 + 배송비 3,000원 = 합계 :
							</span><span class="order_config_big_text"><span
									class="final_result"></span></span> <span
								class="order_config_small_text">원</span></td>
						</tr>
					</tbody>
				</table>
				<div class="order_change_decrip">! 상품의 옵션 및 수량 변경은 상품상세 또는
					장바구니에서 가능합니다.</div>
				<div class="select_order_cancel">
					<span>선택한 상품 : </span>
					<button>X 삭제하기</button>
				</div>
			</div>
		</div>

		<div class="mid-mid">
			<div class="order_order_info">
				<div class="order_info_span">
					<span class="span_title">주문자 정보</span> <span><span
						class="required">*</span> 필수입력사항</span>
				</div>
				<table>
					<tbody>
						<tr>
							<th>주문하시는 분 <span class="required">*</span></th>
							<td><input type="text" size="10" value="${member.name}"
								readonly></td>
						</tr>
						<tr>
							<th>주소 <span class="required">*</span></th>
							<td>
								<div class="order_address">
									<input type="text" class="copiedad1" size="10"
										value="${member.zip_code}" readonly>
									<button>우편번호 ></button>
									<br> <input type="text" class="copiedad2" size="30"
										value="${member.address}" readonly> 기본주소 <br> <input
										type="text" class="copiedad3" size="30"
										value="${member.detailaddress}" readonly> 나머지주소
								</div>
							</td>
						</tr>
						<tr>
							<th>일반 전화</th>
							<td><select name="telephone1" id="telephone1">
									<option value="02">02</option>
									<option value="031">031</option>
									<option value="032">032</option>
							</select> - <input class="copiedt1" type="text" size="5" maxlength="4"
								readonly> - <input class="copiedt2" type="text" size="5"
								maxlength="4" readonly></td>
						</tr>
						<tr>
							<th>휴대전화 <span class="required">*</span></th>
							<td><select name="mobilephone1" id="mobilephone1">
									<option value="02">010</option>
									<option value="031">011</option>
									<option value="032">019</option>
							</select> - <input class="phoneNo1" type="text" size="5" maxlength=4
								value="${fn:substring(member.phone, 3, 7)}"> - <input
								class="phoneNo2" type="text" size="5" maxlength=4
								value="${fn:substring(member.phone, 7, 11)}"></td>
						</tr>
						<tr>
							<th>이메일 <span class="required">*</span></th>
							<td><input type="text"
								value="${fn:substring(member.email, 0, fn:indexOf(member.email, '@'))}"
								readonly>@ <input type="text"
								value="${fn:substring(member.email, fn:indexOf(member.email, '@') + 1, fn:length(member.email))}"
								readonly> <select name="email" id="email">
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="daum.net">daum.net</option>
							</select>
								<p>- 이메일을 통해 주문처리과정을 보내드립니다</p>
								<p>- 이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해주세요</p></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="deliver_order_info">
				<div class="deliver_info_span">
					<span class="span_title">배송 정보</span> <span><span
						class="required">*</span> 필수입력사항</span>
				</div>
				<table>
					<tbody>
						<tr>
							<th>배송지 선택</th>
							<td><input type="radio" id="order" name="address"
								value="same" onchange="copyAddress()"><label for="order">주문자와
									동일</label> <input type="radio" id="deliver" name="address" value="new"
								onchange="clearAddress()"><label for="deliver">새로운
									배송지</label></td>
						</tr>
						<tr>
							<th>주소 <span class="required">*</span></th>
							<td>
								<div class="deliver_address">
									<input class="copyAddress1" type="text" size="10">
									<button>우편번호 ></button>
									<br> <input class="copyAddress2" type="text" size="30">
									기본주소 <br> <input class="copyAddress3" type="text"
										size="30"> 나머지주소
								</div>
							</td>
						</tr>
						<tr>
							<th>일반 전화</th>
							<td><select name="telephone2" id="telephone2">
									<option value="02">02</option>
									<option value="031">031</option>
									<option value="032">032</option>
							</select> - <input class="copytel1" type="text" size="5" maxlength=4>
								- <input class="copytel2" type="text" size="5" maxlength=4>
							</td>
						</tr>
						<tr>
							<th>휴대전화 <span class="required">*</span></th>
							<td><select name="mobilephone2" id="mobilephone2">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="019">019</option>
							</select> - <input class="copyphone1" type="text" size="5" maxlength=4>
								- <input class="copyphone2" type="text" size="5" maxlength=4>
							</td>
						</tr>
						<tr>
							<th>배송메시지</th>
							<td><textarea name="delive_message" id="delive_message"
									cols="70" rows="5"></textarea></td>
						</tr>
					</tbody>
				</table>
				<div class="deliver_agree">
					<p>배송정보 제공방침</p>
					<p>본 상품의 원활한 배송을 위하여 회원님의 주소를 상품판매업체 및 배송업체에 제공합니다.</p>
					<input type="checkbox">동의
				</div>
			</div>
		</div>

		<div class="mid-btm">
			<div class="expected_order">
				<div class="expected_order_price">
					<span>결제예정 금액</span>
				</div>
				<table>
					<thead>
						<tr>
							<th>총 주문 금액<span>(배송비포함)</span></th>
							<th>총 할인 금액</th>
							<th>총 결제예정 금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><span><span class="final_result"></span></span> 원</td>
							<td>- <span>0 </span> 원
							</td>
							<td>= <span><span class="final_result"></span></span> 원
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="order_method">
				<div class="method_title">
					<span>결제수단</span>
				</div>
				<div class="order_method_container">
					<div class="method_detail">
						<div class="select_method">
							<input type="radio" id="bankbook" name="method_payment"
								value="bankbook" checked><label for="bankbook"> 무통장 입금</label> <input
								type="radio" id="card" name="method_payment" value="card"><label
								for="card"> 카드결제</label> <input type="radio" id="kakao"
								name="method_payment" value="kakao"><label for="kakao">
								카카오 페이</label> <input type="radio" id="payco" name="method_payment"
								value="payco"><label for="payco"> 페이코</label> <input
								type="radio" id="pay_phone" name="method_payment"
								value="pay_phone"><label for="pay_phone"> 휴대폰 결제</label>
							<input type="radio" id="sspay" name="method_payment"
								value="sspay"><label for="sspay"> 삼성페이</label>
						</div>
						<div class="select_method_datail">
							<table class="detail_table">
								<tbody>
									<tr>
										<td class="detail_table_title">입금자명</td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<td class="detail_table_title">입금은행</td>
										<td><select name="bank_select" id="bank_select">
												<option value="농협">농협은행 123-1234-1234-12</option>
												<option value="국민">국민은행 123456-12-123456</option>
										</select></td>
									</tr>
								</tbody>
							</table>
							<div class="cash_bill">
								<div class="bill_yes_no">
									<p>현금 영수증 신청</p>
								</div>
								<div class="bill_yes">
									<input type="radio" id="yes" name="bill" value="yes" checked><label
										for="yes">현금영수증 신청</label> <input type="radio" id="no"
										name="bill" value="no"><label for="no">신청 안함</label>
									<table>
										<tbody>
											<tr>
												<td class="bill_yes_td">구분</td>
												<td><input type="radio" id="personal" name="who"
													value="personal"><label for="personal">개인</label> <input
													type="radio" id="company" name="who" value="company" checked><label
													for="company">사업자</label></td>
											</tr>
											<!-- <tr class="select_personal">
                                            <td>핸드폰 번호</td>
                                            <td><select name="phone" id="phone">
                                                <option value="010">010</option>
                                                <option value="011">011</option>
                                                <option value="016">016</option>
                                                <option value="019">019</option>
                                            </select>-<input type="text">-<input type="text"></td>
                                        </tr> -->
											<tr class="select_company">
												<td class="bill_yes_td">사업자 번호</td>
												<td><input type="text" size="15"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="withdrawal_policy">
								<div class="withdrawal_policy_title">청약철회방침</div>
								<div class="withdrawal_policy_box">
									<div class="policy_textarea">
										<p>①“주식회사 스노우볼 인터내셔널”과 재화등의 구매에 관한 계약을 체결한 이용자는 수신확인의 통지를
											받은 날부터 7일 이내에는 청약의 철회를 할 수 있습니다.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="final_config">
						<div class="final_config_price">
							<p>최종결제 금액</p>
							<p>
								<span><span class="final_result"></span></span>원
							</p>
						</div>
						<p>
							<input type="checkbox"> 결제정보를 확인하였으며, <br> 구매진행에
							동의합니다.
						</p>
						<c:choose>
							<c:when test="${!empty product }">
								<a href="/purchaseconfirm.do?pno=${product.pno }"><button type="button">결제하기</button></a>
							</c:when>
							<c:otherwise>
								<a href="/purchaseconfirm.do"><button type="button">결제하기</button></a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="info_desk_box">
					<div class="interest_free">
						<table>
							<tbody>
								<tr>
									<th>무이자 할부 이용안내</th>
								</tr>
								<tr>
									<td>- 무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 경우 전체 주문
										상품 금액에 대해 무이자할부가 적용되지 않습니다</td>
								</tr>
								<tr>
									<td>- 무이자할부를 원하시는 경우 장바구니에서 무이자할부 상품만 선택하여 주문하여 주시기 바랍니다.</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="using_info">
						<table>
							<tbody>
								<tr>
									<th>이용안내</th>
								</tr>
								<tr>
									<td>
										<div>WindowXP 서비스팩2를 설치하신후 결제가 정상적인 단계로 처리되지 않는경우, 아래의
											절차에 따라 해결하시기 바랍니다.</div>
										<div>아래의 쇼핑몰일 경우에는 모든 브라우저 사용이 가능합니다.</div>
										<div>세금계산서 발행 안내</div>
										<div>부가가치세법 변경에 따른 신용카드매출전표 및 세금계산서 변경안내</div>
										<div>현금영수증 이용안내</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
	<script src="../resources/js/orders.js"></script>
</body>
</html>