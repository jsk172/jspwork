<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
<style>
	table, td{
		border: 1px solid #ccc;
		border-collapse: collapse;
		padding: 10px;
	}
	table tr:nth-of-type(4){
		text-align: center;
	}
</style>
</head>
<body>
	<form action="/jwbook2/cos" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>설명</td>
				<td><input type="text" name="comment" size="30"></td>
			</tr>
			<tr>
				<td>파일1</td>
				<td><input type="file" name="userFile1"></td>
			</tr>
			<tr>
				<td>파일2</td>
				<td><input type="file" name="userFile2"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="저장">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>