<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	section{
		width: 75%;
		display: inline-block;
	}
	.inner{
        margin-top: 30px;
        width: 100%; 
        margin: 0 auto;
        padding-left: 30px;
        vertical-align: middle;
    }
    #inner-title{
        color: #004771;
        font-family: Noto Sans KR;
        font-style: normal;
        font-weight: 500;
        font-size: 24px;
        line-height: 35px;
        margin-top: 30px;
    }
    #inner-title span{
    	margin-left: 20;
    }
    .worktime{
    	display: inline-block;
    	width: 220px;
    	height: 120px;
    	background-color: white;
    	border: 1px solid #929292;
    	padding-top: 20px;
    	padding-left: 5px;
    	margin-right: 10px;
    	margin-top: auto;
    	margin-bottom: auto;
    	vertical-align: middle;
    	
    }
    .worktime label{
    	font-family: Noto Sans KR;
		font-size: 12px;
		line-height: 30px;
    }
    .time{
    	display: inline-block;
    	width: 630px;
    	height: 120px;
    	background-color: white;
    	border: 1px solid #929292;
    	padding-top: 20px;
    	padding-left: 5px;
    	font-family: Noto Sans KR;
		font-size: 12px;
		line-height: 30px;
		margin-top: auto;
    	margin-bottom: auto;
    	vertical-align: middle;
    }
    .timeBtn{
    	outline: 0;
    	border : 0;
    	background-color: #004771;
    	color: white;
    	width: 70px;
    	height: 30px;
    }
    .btn{
    	outline: 0;
    	border : 0;
    	color: #004771;
    	background-color: white;
    }
    .timeText{
    	width: 170px;
    	text-align: center;
    }
    input[type=text]{
    	height: 25px;
    	margin-left: 10px;
    	border-radius: 0;
		border: 1px solid gray;
		outline-style: none;
		width: 180px;
    }
    input[type=checkbox] {
		margin-right: 10px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/atManagement/atManagementAside.jsp"></jsp:include>
	<section>
        <div class="inner">
            <div id="inner-title">
            <span>근태 현황</span>
            <br>
            <hr>
            <br>
            </div>
            <div class="centerBox">
            <div class="worktime">
            	<label>총 근무 시간 : </label><br>
            	<label>잔여 근무 시간 : </label><br>
            	<label>총 연장 근무 시간 : </label>
            </div>
            <div class="time">
            	<table>
            		<tr>
            			<td class="timeText">2020년 8월 14일 금요일</td>
            			<td><input type="checkbox"><span>외근 출퇴근 시에는 체크박스를 체크해주세요.</span></td>
            		</tr>
            		<tr>
            			<td class="timeText">10 : 00 : 00</td>
            			<td><button class="timeBtn">출근</button><input type="text"></td>
            			<td><button class="btn">출/퇴근 이의 신청</button></td>
            		</tr>
            		<tr>
            			<td class="timeText">현재 접속 IP : 192.168.30.234</td>
            			<td><button class="timeBtn">퇴근</button><input type="text"></td>
            			<td><button class="btn">연장 근무 신청</button></td>
            		</tr>
            	</table>
            </div>
            </div>
		</div>
	</section>
</body>
</html>