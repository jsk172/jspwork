<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//이름 필드에 입력된 값 서버에 전달함
	String result = request.getParameter("num");

	if(result == "" || !result.matches("\\d+")){
		out.println("<script>");
		out.println("alert('숫자를 입력해주세요.')");
		out.println("history.back()");
		out.println("</script>");
	}else{
		int num = Integer.parseInt(result);
		if(num%2 == 0){
			result = "짝수";
		}else{
			result = "홀수";
		}
	}
%>
<p>결과 : <%=result %></p>