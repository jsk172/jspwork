<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${nboard.ntitle}</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="container">
		<input type="hidden" name="nno" value="${nboard.nno}">
		<table>
			<tbody>
				<tr>
					<td><input type="text" name="ntitle" value="${nboard.ntitle}" readonly></td>
				</tr>
				<tr>
					<td><textarea rows="7" cols="100" name="ncontent" 
							placeholder="글내용" readonly>${nboard.ncontent}</textarea></td>
				</tr>
				<tr>
					<td>
						<a href="/noticeboardlist.do">
							<button type="button">목록</button>
						</a>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>