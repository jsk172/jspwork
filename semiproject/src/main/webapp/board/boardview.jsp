<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="container">
		<table>
			<tbody>
				<tr>
					<td><input type="text" name="title" value="" readonly></td>
				</tr>
				<tr>
					<td><textarea rows="7" cols="100" name="content"
					 placeholder="글내용" readonly></textarea></td>
				</tr>
			</tbody>
		</table>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>