<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 게시판</title>
<link rel="stylesheet" href="../resources/css/boardlist.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<
	<div id="mid">
		<h3>Q&A 게시판</h3>
		<div class="Board">
			<table id="board_tb">
				<thead>
					<tr>
						<th class="board_no">번호</th>
						<th class="board_img">이미지</th>
						<th class="board_title">내용</th>
						<th class="board_writer">작성자</th>
						<th class="board_date">날짜</th>
						<th class="board_hit">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${qaboardList}" var="qab">
						<tr>
							<td class="board_no">${qab.qno}</td>
							<td>
								<div class="td_img">
									<img class="product" src="../upload/${qab.qfilename}">
								</div>
							</td>
							<td class="board_title"><a
								href="/qaboardview.do?qno=${qab.qno}">${qab.qtitle}</a></td>
							<td class="board_writer">${qab.id}</td>
							<td class="board_date"><c:choose>
									<c:when test="${not empty qab.qupdate}">
										<fmt:formatDate value="${qab.qupdate}"
											pattern="yyyy-MM-dd HH:mm:ss" />
									</c:when>
									<c:otherwise>
										<fmt:formatDate value="${qab.qdate}"
											pattern="yyyy-MM-dd HH:mm:ss" />
									</c:otherwise>
								</c:choose></td>
							<td class="board_hit">${qab.qhit}</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
		</div>
		<div class="pagenation">
			<c:choose>
				<c:when test="${startPage > 1}">
					<a href="/qaboardlist.do?pageNum=${startPage - 1}">&laquo;</a>
				</c:when>
				<c:otherwise>
					<a href="">&laquo;</a>
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="1" end="${endPage}">
				<a href="/qaboardlist.do?pageNum=${i}">${i}</a>
			</c:forEach>
			<c:choose>
				<c:when test="${endPage > startPage}">
					<a href="/qaboardlist.do?pageNum=${startPage + 1}">&raquo;</a>
				</c:when>
				<c:otherwise>
					<a href="">&raquo;</a>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="board_box">
			<div class="write">
				<a href="/qawriteform.do">
					<button type="button">글쓰기</button>
				</a>
			</div>
			<div class="board_search_box">
				<form action="" method="get">
				<select name="field" style="display: block">
					<option value="qtitle" ${(field eq "qtitle") ? "selected" : ""}>제목</option>
					<option value="qcontent" ${(field eq "qcontent") ? "selected" : ""}>내용</option>
					<option value="id" ${(field eq "id") ? "selected" : ""}>작성자</option>
				</select> <input type="text" name="kw" value="${kw}">
				<button class="btn_board_search" type="submit">
					<em>검색</em>
				</button>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>