<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 스코프 생략가능하지만 명시적으로 작성하는게 더 좋다. -->
	<h1><c:out value="${ requestScope.message }"/></h1>
</body>
</html>