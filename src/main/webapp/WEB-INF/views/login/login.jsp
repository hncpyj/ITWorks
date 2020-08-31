<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ItWorks</title>
<link rel="icon" href="${contextPath}/resources/images/favicon.ico" type="image/x-icon">
<style type="text/css">
	.innerBox{
		width: 480px;
		height: 640px;
		background: white;
		margin: 0 auto;
	}
	body{
		background: #fafafa;
	} 
	img{
		width: 270px;
		height: auto;
		margin-top: 80px;
		margin-bottom: 20px;
	}
	input[type=text]{
		width: 400px;
		height: 50px;
		margin-top: 10px;
		margin-bottom: 10px;
		border-radius: 0;
		border: 1px solid #929292;
		outline-style: none;
	}
	.loginBtn{
		outline: 0;
    	border : 0;
    	width: 400px;
		height: 50px;
		margin-top: 10px;
		margin-bottom: 10px;
		background: #29A2F7;
		color: white;
		font-weight: bold;
		font-size: 24px;
	}
	.saveBox{
		width: 400px;
		margin: 0 auto;
	}
	.btnBox{
		margin-top: 40px;
	}
	span{
		color: #929292;
		font-family: Noto Sans KR;
		font-style: normal;
		font-weight: 500;
		font-size: 12px;
		line-height: 17px;
	}
	a{
		color: #929292;
		font-family: Noto Sans KR;
		font-style: normal;
		font-weight: 500;
		font-size: 15px;
		line-height: 22px;
		text-decoration: none;
	}
</style>
</head>
<body>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<div class="innerBox" align="center">

	<img src="${contextPath }/resources/images/ItWorksLogo.png">
	<form action="login.me" method="post">
	<input type="text" placeholder="회사코드 입력" name="corpNo">
	<input type="text" placeholder="아이디 입력" name="eid">
	<input type="password" placeholder="비밀번호 입력" name="epwd">
	<button class="loginBtn">로그인</button>
	<div class="saveBox" align="left">
	<input type="checkbox"><span>아이디 저장</span><br>
	<input type="checkbox"><span>회사 코드 저장</span>
	</div>
	</form>
	<div class="btnBox">
		<a>아이디 찾기</a> |
		<a>비밀번호 찾기</a> |
		<a href="MemberjoinForm.me">회원가입</a>
	</div>
</div>
</body>
</html>