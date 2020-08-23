<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #asideBack ul li{
        padding-left: 25px;
        height: 35px;
        vertical-align: middle;
    }
    #asideBack {
        width: 250px;
        height: 1200px;
        background: #E4EBF3;
    }
    #asideMenuTitle {
        padding-top: 22px; 
        padding-left: 36px; 
        font-size: 15px; 
        font-weight: bold; 
        color: #004771; 
        margin-bottom: 10px;
    }
    .asideMenu {
        text-decoration: none;
        color: #004771;
        font-size: 14px;
    }
    aside {
        float: left;
    }
</style>
</head>
<body>
    <aside>
        <div id="asideBack">
            <div id="asideMenuTitle">프로젝트 상세보기</div>
            <ul>
                <li><a href="projectInfo.pm" class="asideMenu">- 프로젝트 정보</a></li>
                <li><a href="projectNotice.pm" class="asideMenu">- 프로젝트 공지사항</a></li>
            </ul>
        </div>
    </aside>
</body>
</html>