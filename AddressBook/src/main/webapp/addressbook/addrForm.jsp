<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 등록 폼</title>
<link rel="stylesheet" href="../resources/css/style.css">
</head>
<body>
	<div id="container">
		<h2>주소록 등록</h2>
		<hr>
		<form action="addrAdd.jsp" method="post">
			<table id="tbl_reg">
				<tr>
					<td><label>이름</label></td>
					<td><input type="text" name="username" required></td>				
				</tr>
				<tr>
					<td><label>전화번호</label></td>
					<td><input type="text" name="tel" required></td>				
				</tr>
				<tr>
					<td><label>이메일</label></td>
					<td><input type="text" name="email" required></td>				
				</tr>
				<tr>
					<td><label>성별</label></td>
					<td>
						<select name="gender">
							<option>남자</option>
							<option>여자</option>
						</select>
					</td>				
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="확인">
						<input type="reset" value="취소">	
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>