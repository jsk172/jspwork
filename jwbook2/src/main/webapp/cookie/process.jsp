<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	if(id.equals("khit") && pwd.equals("1234")){
		//쿠키 Cookie(쿠키이름, 쿠키값)
		Cookie cookieId = new Cookie("userId", id);
		Cookie cookiePw = new Cookie("uesrPw", pwd);
		
		//브라우저(로컬컴퓨터)에 응답(보내줌)
		response.addCookie(cookieId);
		response.addCookie(cookiePw);
		
		out.println("쿠기 생성에 성공했습니다.");
	}else{
		out.println("쿠기 생성에 실패했습니다.");
	}
%>