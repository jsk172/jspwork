<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제곱을 계산하는 프로그램 사용</title>
</head>
<body>
	<!-- 자바 빈즈(자바 클래스를 의미함) 
		1. java.io.Serializable 인터페이스 구현해야함.
		2. 기본생성자로 사용(인수가 없는)
		3. 모든 맴버는 private 접근 제어자 사용
		4. getter/setter 매서드를 사용함
	-->
	<!-- Calculator calc = new Calculator() -->
	<jsp:useBean id="calc" class="bean.Calculator"></jsp:useBean>
	<%
		int num = calc.calculate(5);
		out.println("결과 : " + num);
	%>
</body>
</html>