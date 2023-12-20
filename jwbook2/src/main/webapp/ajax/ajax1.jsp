<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax 예제</title>
<script src="../resources/js/jquery-3.7.1.js"></script>
<script>
	$(document).ready(function(){
		//alert("test");
		$("h3").css("color", "blue");
	});
	//전송 버튼을 누르면 메세지를 출력함
	function fnProcess(){
		//ajax로 구현함
		//자바스크립트 객체(key: value)
		//서블릿에 요청(매핑 주소)
		
		$.ajax({
			type: "get",		//전송방식
			dataType: "text",	//데이터 유형
			url:"http://localhost:8080/jwbook2/ajax/ajax1",
			data:{message: "Hello~ Ajax!!"},
			success: function(data){
				//$("#message").append(data);
				$("#message").text(data).css("margin-top", "10px");
			},
			error: function(){
				alert("에러 발생!");
			}
		});
	}
</script>
</head>
<body>
	<h3>ajax(에이잭스) 테스트</h3>
	<button type="button" onclick="fnProcess()">전송</button>
	<div id="message"></div>
</body>
</html>