<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review 게시판</title>
<link rel="stylesheet" href="../resources/css/boardlist.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="container">
		<div id="mid">
			<h3>Review</h3>
			<div class="Board">
				<table id="board_tb">
					<thead>
						<tr>
							<th class="board_no">no</th>
							<th class="board_title">title</th>
							<th class="board_writer">writer</th>
							<th class="board_date">date</th>
							<th class="board_hit">hit</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>notice</td>
							<td>Notice 1 첫번째 공지사항입니다</td>
							<td>Notice team</td>
							<td>2023-11-01</td>
							<td>12</td>
						</tr>
						<tr>
							<td>notice</td>
							<td>Notice2 두번째 공지사항입니다</td>
							<td>Notice team</td>
							<td>2023-11-23</td>
							<td>9</td>
						</tr>
						<tr>
							<td>3</td>
							<td>Event3 리뷰 작성 이벤트!! 리뷰 작성 횟수에 따라 포인트 획득!!</td>
							<td>Event team</td>
							<td>2023-11-30</td>
							<td>21</td>
						</tr>
						<tr>
							<td>2</td>
							<td>Event2 첫 구매고객 이벤트!! 첫 구매시라면~</td>
							<td>Event team</td>
							<td>2023-11-16</td>
							<td>26</td>
						</tr>
						<tr>
							<td>1</td>
							<td>Event1 회원가입 이벤트!!</td>
							<td>Event team</td>
							<td>2023-11-02</td>
							<td>32</td>
						</tr>
					</tbody>

				</table>
			</div>
			<div id="page">
				<a href=""><button class="arrow"><</button></a> <a href=""><button>1</button></a>
				<a href=""><button>2</button></a> <a href=""><button>3</button></a>
				<a href=""><button>4</button></a> <a href=""><button
						class="arrow">></button></a>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>