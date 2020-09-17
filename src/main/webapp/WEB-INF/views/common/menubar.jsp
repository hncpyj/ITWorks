<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITWorks!</title>
<link rel="icon" href="${contextPath}/resources/images/favicon.ico" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
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
        <div id="logoDiv" onclick="location.href='main.me'">
            <img id="logo" src="${ contextPath }/resources/images/ItWorksLogo.png" style="width: 153px; height: 35px; cursor: pointer;">
        </div>
    </header>
    <nav>
        <ul>
            <li class="menu"><a href="mainAddress.ad">주소록</a></li>
            <li class="menu"><a href="selectAllProjectList.pm">프로젝트관리</a></li>
<!--             <li class="menu"><a href="waitingToJoinList.mm">조직관리</a></li> -->
            <li class="menu"><a href="orgChart.org">조직관리</a></li>
            <li class="menu"><a href="selectAtStatus.at">근태관리</a></li>
            <li class="menu"><a href="selectFirst.fb">파일보관함</a></li>
            <li class="menu"><a href="noticeList.no">공지사항</a></li>
            <li style="width: 300px; text-align: right;"><img src="${ contextPath }/resources/images/alarm.png" id="alarm" style="cursor: pointer; width: 22px; height: 27px; margin-top: 5px; margin-right: 20px;"></li>
            <li style="width: 40px; cursor: pointer;" onclick="openPersonalMenu();">
                <div style="display: inline-block; width: 38px; height: 38px; border-radius: 50%; background: gray; margin-top: 5px;">
                	<c:if test="${ !empty profile }">
						<img src="${ contextPath }/resources/uploadFiles/profile/${ profile.changeName }${ profile.ext }" style="width: 100%; height: 100%; border-radius: 50% 50%;">
					</c:if>
					<c:if test="${ empty profile }">
						<img src="${ contextPath }/resources/uploadFiles/profile/naturalProfile.png" style="width: 100%; height: 100%; border-radius: 50% 50%;">
					</c:if>
                </div>
            </li>
            <li style="width: 100px; padding-left: 15px;text-align: left; cursor: pointer;" onclick="openPersonalMenu();"><c:out value="${ sessionScope.loginUser.ename }"/> 님</li>
            
        </ul>
        
        <div id="personalBackground" style="display: none; width: 1420px; height: 1000px; position: absolute; top: 0; left: 0; z-index: 100;">
	        <div id="personalMenu" style="width: 310px; height: 160px; z-index: 1000; position: absolute; left: 1107px; background: white; box-shadow: 3px 3px 3px rgba(0, 0, 0, 25%); border: 2px solid #CCCCCC; margin-top: 56px;">
	        	<div id="profilePhoto" style="display: inline-block; width: 90px; height: 90px; background: #929292; border-radius: 50% 50%; margin-left: 25px; margin-top: 15px; float: left;">
	        		<c:if test="${ !empty profile }">
						<img src="${ contextPath }/resources/uploadFiles/profile/${ profile.changeName }${ profile.ext }" style="width: 100%; height: 100%; border-radius: 50% 50%;">
					</c:if>
					<c:if test="${ empty profile }">
						<img src="${ contextPath }/resources/uploadFiles/profile/naturalProfile.png" style="width: 100%; height: 100%; border-radius: 50% 50%;">
					</c:if>
	        	</div>
	        	<div style="display: inline-block; color: #606266; margin-top: 40px; margin-bottom: 10px;">
	        		<span style="font-size: 17px; margin-left: 20px; letter-spacing: 0.5px;"><c:out value="${ loginUser.ename }님"/></span><br>
	        		<span style="font-size: 14px; margin-left: 20px;"><c:out value="${ loginUser.email }"/></span>
	        	</div>
	        	<hr style="width: 90%; margin: auto; margin-top: 20px; margin-bottom: 5px; border: 1px solid #F2F2F2;">
	        	<span onclick="goMyPage();" style="color: #004771; margin-left: 22px; font-size: 14px; cursor: pointer;">마이페이지</span><button type="button" style="cursor: pointer; margin-left: 141px; background: #EBEBEB; border: 1px solid #BFBFBF; color: #004771; width: 65px;" onclick="location.href='logout.me'">로그아웃</button>
	        </div>
        </div>
    </nav>

	<script>
		function goMyPage() {
			location.href="showMyPageCheckPwd.me";
		}
	
		function openPersonalMenu() {
			jQuery("#personalBackground").fadeIn();
		}
		
		$("#personalBackground").click(function() {
			jQuery("#personalBackground").fadeOut();
		});
	</script>

</body>
</html>