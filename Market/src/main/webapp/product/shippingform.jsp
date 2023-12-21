<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송 정보</title>
<script src="../resources/js/validation.js"></script>
</head>
<body>
<jsp:include page="../header.jsp"/>
	<div class="container my-3">
	<h1>배송 정보</h1>
		<div class="row">
			<form action="/shippinginfo.do" method="post">
				<div class="form-group row my-3">
					<label class="col-2">성명</label>				
					<div class="col-3">
						<input type="text" name="sname" class="form-control">
					</div>
				</div>
				<div class="form-group row my-3">
					<label class="col-2">배송일</label>				
					<div class="col-3">
						<input type="text" name="shippingdate" class="form-control">
					</div>
				</div>
				<div class="form-group row my-3">
					<label class="col-2">우편번호</label>				
					<div class="col-3">
						<input type="text" name="zipcode" class="form-control">
					</div>
				</div>
				<div class="form-group row my-3">
					<label class="col-2">주소</label>				
					<div class="col-3">
						<input type="text" name="address" class="form-control">
					</div>
				</div>
				
				<div class="form-group row my-3">
					<div class="col-3">
						<input type="submit" value="등록" class="btn btn-success" onclick="checkProduct()">
					</div>
				</div>
			</form>
		</div>
	</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>