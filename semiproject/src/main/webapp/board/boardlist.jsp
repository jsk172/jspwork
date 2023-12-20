<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<link rel="stylesheet" href="../resources/css/boardlist2.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="container">
		<div id="mid">
			<div class="Board">
				<table id="board_tb">
					<tbody>
						<div class="boardkind">
							<div class="notice-board">
								<h3 class="title-notice">
									<a href="/noticeboardlist.do">Notice</a>
								</h3>
								<c:forEach items="${nboardList}" var="nb">
									<ul class="notice-list">
										<li><a href="/noticeboardview.do?nno=${nb.nno}">${nb.ntitle}</a></li>
									</ul>
								</c:forEach>
							</div>

							<div class="review-board">
								<h3 class="title-review">
									<a href="/reviewboardlist.do">Review Board</a>
								</h3>
								<c:forEach items="${rboardList}" var="rb">
									<ul class="review-list">
										<li><a href="/reviewboardview.do?rno=${rb.rno}">${rb.rtitle}
												조회수: ${rb.rhit}</a></li>
									</ul>
								</c:forEach>
							</div>

							<div class="QnA-board">
								<h3 class="title-QnA">
									<a href="/qaboardlist.do">Q/A Board</a>
								</h3>
								<c:forEach items="${qaboardList}" var="qab">
									<ul class="QnA-list">
										<li><a href="/qaboardview.do?qno=${qab.qno}">${qab.qtitle}
												조회수: ${qab.qhit}</a></li>
									</ul>
								</c:forEach>
							</div>
						 </div>
						</div>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>