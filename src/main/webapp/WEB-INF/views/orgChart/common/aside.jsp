<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>ItWorks</title>
<style type="text/css">
    #asideBack {
        width: 250px;
        height: 900px;
        background: #E4EBF3;
    }
    aside{
        float: left;
        display: inline-block;
    }
    #asideBack ul li{
        padding-left: 25px;
        height: 35px;
        vertical-align: middle;
    }
    .asideMenuTitle {
        padding-top: 22px; 
        padding-left: 36px; 
        font-size: 15px; 
        font-weight: bold; 
        color: #004771; 
        margin-bottom: 10px;
        display: inline-block;
    }
    .asideMenu {
        text-decoration: none;
        color: #004771;
        font-size: 14px;
    }
</style>
</head>
<body>
    <aside>
        <div id="asideBack">
            <div class="asideMenuTitle">인사 정보</div>
            <ul>
                <li><a href="orgChart.org" class="asideMenu">- 조직도</a></li>
                <li><a href="orgList.org" class="asideMenu">- 조직 목록</a></li>
            </ul>
       
      		<div class="asideMenuTitle">조직 관리</div>
            <ul>
                <li><a href="orgManage.org" class="asideMenu">- 조직 관리</a></li>
                <li><a href="positionManage.org" class="asideMenu">- 직위 / 직무 관리</a></li>
            </ul>
  		</div>
    </aside>
</body>
</html>