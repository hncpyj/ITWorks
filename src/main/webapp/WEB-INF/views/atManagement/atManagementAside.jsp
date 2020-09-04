<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	 #asideBack {
        width: 250px;
        height: 1200px;
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
            <div class="asideMenuTitle">근태 정보</div>
            <ul>
                <li><a href="selectAtStatus.at" class="asideMenu">- 근태 현황</a></li>
                <li><a href="selectCorrectionList.at" class="asideMenu">- 근태 수정 내역</a></li>
                <li><a href="selectOvertimeList.at" class="asideMenu">- 연장 근무 신청 내역</a></li>
            </ul>
        
        <div class="asideMenuTitle">휴가 정보</div>
            <ul>
                <li><a href="selectVacationStatus.at" class="asideMenu">- 휴가 현황</a></li>
                <li><a href="insertVacation.at" class="asideMenu">- 휴가 신청</a></li>
            </ul>
        
        <div class="asideMenuTitle">근태 관리</div>
            <ul>
                <li><a href="selectATManagement.at" class="asideMenu">- 기본 설정</a></li>
                <li><a href="selectTakeTimeOffList.at" class="asideMenu">- 휴직자 관리</a></li>
                <li><a href="selectEmployeeATManagement.at" class="asideMenu">- 직원 근태 관리</a></li>
                <li><a href="employeeWorkManagement.at" class="asideMenu">- 직원 근무 관리</a></li>
            </ul>
        <div class="asideMenuTitle">휴가 관리</div>
            <ul>
                <li><a href="vacationManagement.at" class="asideMenu">- 기본 설정</a></li>
                <li><a href="employeeVacation.at" class="asideMenu">- 휴가 현황 조회</a></li>
                <li><a href="selectVacationList.at" class="asideMenu">- 휴가 신청 관리</a></li>
                <li><a href="insertRewardVacation.at" class="asideMenu">- 포상 휴가 생성</a></li>
            </ul>
        </div>

    </aside>
</body>
</html>