<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 글쓰기</title>
<link rel="stylesheet" href="../resources/css/writeform2.css">
</head>
<body>
	<c:if test="${empty sessionId}">
		<script type="text/javascript">
			alert("로그인이 필요한 페이지입니다.");
			location.href = "/loginform.do";
		</script>
	</c:if>
	<jsp:include page="../header.jsp" />
	<div id="mid">
		<form action="/reviewwrite.do" method="post" enctype="multipart/form-data">
		<div class="board_zone_sec">
			<div class="board_zone_tit">
				<h2>상품후기</h2>
			</div>
			<div class="board_zone_cont">
					<input type="hidden" name="bdId" value="goodsreview">
					<input type="hidden" name="sno" value=""> 
					<input type="hidden" name="mode" value="write"> 
					<input type="hidden" name="returnUrl" value="bdId=goodsreview">

					<div class="board_zone_write">
						<div class="board_write_box">
							<table class="board_write_table">
								<colgroup>
									<col style="width: 15%">
									<col style="width: 85%">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">작성자</th>
									</tr>
									<tr>
										<td><input type="text" name="rtitle" placeholder="글제목" required></td>
										<td>
											<div class="board_goods_select">
												<span class="js_selected_info_text">[비타크래프트]메뉴 바이탈
													햄스터사료 400g</span> <a href="#addOrderLayer" title="찾아보기"
													class="btn_goods_select btn_open_layer"> 주문 내역 </a>
												<div id="selectOrderBox"></div>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">등록일</th>
										<td><span class="view_info_day"><em>2023.12.18
													15:44:05</em></span></td>
									</tr>
									<tr>
										<th scope="row">내용</th>
										<td class="write_editor"><span class="view_info_day"><em>제가
													모르고 먹어봤는데도 맛있어요, 혹시 내가(?)</em></span> <img
											src="img/[비타크래프트]메뉴 바이탈 햄스터사료 400g.png" class="photo">
										</td>
									</tr>
									<tr>
										<th scope="row">첨부파일</th>
										<td id="uploadBox">
											<div class="file_upload_sec">
												<div class="btn_upload_box">
													<input type="file" id="attach1" name="upfiles[]"
														class="file" title="찾아보기">
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="btnbox">
						<button type="submit" class="join_btn">저장</button>
						<button type="reset" class="reset_btn">취소</button>
					</div>
				</form>
			</div>
		</div>
		</form>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>