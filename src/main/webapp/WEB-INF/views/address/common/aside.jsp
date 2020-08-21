<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<style>
* {
	margin: 0px;
	font-family: "Noto Sans KR";
}

body {
	background: #fafafa;
}

header {
	height: 56px;
	background: white;
	float: left;
}

#logoDiv {
	display: inline-block;
	width: 250px;
	height: 56px;
}

#logo {
	margin-top: 11px;
	margin-left: 44px;
}

#asideBack {
	width: 250px;
	height: 900px;
	background: #E4EBF3;
}

nav a {
	text-decoration: none;
	color: #004771;
	font-size: 17px;
}

nav {
	width: 100%;
	height: 56px;
	background: white;
}

nav ul, #asideBack ul {
	list-style: none;
}

nav li {
	display: table-cell;
	width: 120px;
	height: 56px;
	text-align: center;
	vertical-align: middle;
}

.menu:hover {
	background: #004771;
	cursor: pointer;
}

.menu:hover>a {
	color: white;
}

#asideBack ul li {
	padding-left: 25px;
	height: 35px;
	vertical-align: middle;
}

#asideMenuTitle {
	padding-top: 22px;
	padding-left: 36px;
	font-size: 15px;
	color: #004771;
	margin-bottom: 10px;
}

.asideMenu {
	text-decoration: none;
	color: #004771;
	font-size: 14px;
}

#asideBack a:hover {
	font-weight: bold;
	color: #004771;
	text-decoration: none;
}

#asideBack a:visited, a:link {
	color: #004771;
	text-decoration: none;
}
</style>
</head>
<body>
    <aside>
        <div id="asideBack">
            <div align="center" id="addAddress"> 
            <button id="addAddressBtn"></button>
            </div>
            <div id="asideMenuTitle"><a href="importantAddress.ad">중요 주소록</a></div>
            <div id="asideMenuTitle">개인 주소록</div>
            <ul>
                <li><a href="#" class="asideMenu">- 전체 주소록</a></li>
                <li><a href="#" class="asideMenu">- 태그명</a></li>
            </ul>
            <div id="asideMenuTitle"><a href="shareAddress.ad">공유 주소록</a></div>           
        </div>

    </aside>
</body>
</html>