<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
    <header>
        <div id="logoDiv" onclick="location.href='#'">
            <img id="logo" src="${ contextPath }/resources/images/ItWorksLogo.png" style="width: 153px; height: 35px; cursor: pointer;">
        </div>
    </header>
    <nav>
        <ul>
            <li class="menu"><a href="mainAddress.ad">주소록</a></li>
            <li class="menu"><a href="approvalIng.ea">전자결재</a></li>
            <li class="menu"><a href="selectAll.ms">메신저</a></li>
            <li class="menu"><a href="selectAllProjectList.pm">프로젝트관리</a></li>
            <li class="menu"><a href="orgChart.org">조직관리</a></li>
            <li class="menu"><a href="selectATManagement.at">근태관리</a></li>
            <li class="menu"><a href="selectFirst.fb">파일보관함</a></li>
            <li class="menu"><a href="noticeList.no">공지사항</a></li>
            <li style="width: 80px;"><img src="${ contextPath }/resources/images/alarm.png" id="alarm" style="cursor: pointer; width: 22px; height: 27px; margin-top: 5px;"></li>
            <li style="width: 40px;">
                <div style="display: inline-block; width: 38px; height: 38px; border-radius: 50%; background: gray; margin-top: 5px;"></div>
            </li>
            <li style="width: 100px; padding-left: 15px;text-align: left;"><a href="myPage.mp" style="color: #606266; font-size: 15px;">temp 님</a></li>
        </ul>
        
    </nav>


</body>
</html>