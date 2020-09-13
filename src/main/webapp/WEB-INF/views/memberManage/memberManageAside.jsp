<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ItWorks</title>
<link rel="icon" href="${contextPath}/resources/images/favicon.ico" type="image/x-icon">
<style type="text/css">
    #asideBack {
        width: 250px;
        height: 1000px;
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
            <div class="asideMenuTitle">인사정보</div>
            <ul>
                <li><a href="" class="asideMenu">- 조직도</a></li>
                <li><a href="" class="asideMenu">- 직원목록</a></li>
            </ul>
        
         <div class="asideMenuTitle">조직관리</div>
            <ul>
                <li><a href="" class="asideMenu">- 조직관리</a></li>
                <li><a href="" class="asideMenu">- 사용자 관리</a></li>
                <li><a href="" class="asideMenu">- 직위/직무 관리</a></li>
            </ul>
        
        <div class="asideMenuTitle">직원 관리</div>
            <ul>
                <li><a href="waitingToJoinList.mm" class="asideMenu">- 가입대기 직원 리스트</a></li>
                <li><a href="signUpApprovalList.mm" class="asideMenu">- 가입된 직원 리스트</a></li>
                <li><a href="" class="asideMenu">- 퇴사자 리스트</a></li>
            </ul>
        <!-- <div class="asideMenuTitle">휴가 관리</div>
            <ul>
                <li><a href="vacationManagement.at" class="asideMenu">- 기본 설정</a></li>
                <li><a href="employeeVacation.at" class="asideMenu">- 휴가 현황 조회</a></li>
                <li><a href="selectVacationList.at" class="asideMenu">- 휴가 신청 관리</a></li>
                <li><a href="insertRewardVacation.at" class="asideMenu">- 포상 휴가 생성</a></li>
            </ul> -->
             
        </div>

    </aside>
</body>
</html>