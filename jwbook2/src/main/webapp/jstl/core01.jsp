<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<!-- 짝수/홀수 판별하는 프로그램 -->
	<%
		int num = 11;
		if(num % 2 == 0){
			out.println("짝수");
		}else{
			out.println("홀수");
		}
	%>
	<br>
	
	<!-- EL로 표현 -->
	<!-- 변수 선언 c:set var=변수 value="값"-->
	<!-- 출력문 c:out value="" -->
	<!-- 조건문 c:if는 else문이 없음 value="" -->
	
	<c:set var="num" value="11"></c:set>
	<c:if test="${num%2 == 0}">
		<c:out value="${'짝수입니다.' }"></c:out>
	</c:if>
	<c:if test="${num%2 != 0}">
		${'홀수입니다.'} <!-- c:out은 생략가능 -->
	</c:if>

	<br>	
	<!-- 다중 조건문 -->
	<!-- c:choose ~ c:when ~ c:otherwise -->
	<c:choose>
		<c:when test="${num%2 == 0}">
			${'짝수입니다.'}
		</c:when>
		<c:otherwise>
			${'홀수입니다.'}
		</c:otherwise>
	</c:choose>
	
</body>
</html>