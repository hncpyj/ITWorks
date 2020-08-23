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
            <div id="asideMenuTitle">프로젝트 관리</div>
            <ul>
                <li><a href="selectAllProjectList.pm" class="asideMenu">- 전체 프로젝트</a></li>
                <li><a href="ongoingProjectList.pm" class="asideMenu">- 진행 프로젝트</a></li>
                <li><a href="finishProjectList.pm" class="asideMenu">- 완료 프로젝트</a></li>
            </ul>
        </div>
    </aside>
</body>
</html>