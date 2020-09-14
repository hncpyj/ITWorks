<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="icon" href="${contextPath}/resources/images/favicon.ico" type="image/x-icon">
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
    .middleTable{
    	width:100%;
        border-collapse: collapse;
        text-align:center;
    }
    .leftTable{
    	width:100%;
        border-collapse: collapse;
        margin-bottom: 10px;
        margin-top: 10px;
    }
    #managerTable tr{
    	border-bottom: 0.5px solid #9F9F9F;
		border-top: 0.5px solid #9F9F9F;
    }
    .middleName{
    	color: #004771;
        font-family: Noto Sans KR;
        font-style: normal;
        font-size: 14px;
        
    }
    #usageStatus{
    	width: 500px;
    }
    td{
    	font-family: Noto Sans KR;
		font-style: normal;
		font-weight: normal;
		font-size: 14px;
		line-height: 20px;
		color: #676767;
		height: 30px;
    }
    th{
    	font-family: Noto Sans KR;
		font-style: normal;
		font-weight: normal;
		font-size: 16px;
		line-height: 23px;
		color: #000000;
		background: white;
		width: 130px;
		height: 30px;
    }
    .line{
    	border-bottom: 0.5px solid #9F9F9F;
		border-top: 0.5px solid #9F9F9F;
    }
    .saveBtn{
    	outline: 0;
    	border : 1px solid #929292;
    	background-color: white;
    	color: #004771;
    	width: 80px;
    	margin-top: 10px;
    	margin-right: 10px;
    }
    .btn{
    	outline: 0;
    	border : 0;
    	color: #004771;
    	background-color: #fafafa;
    }
    .addBtn{
    	outline: 0;
    	border : 0;
    	background-color: #004771;
    	color: white;
    	width: 80px;
    }
    .left{
    	margin-right: 15px;
    	
    }
    .padding{
    	padding-left: 10px;
    }
    #addBtnAt{
    	float: right;
    	margin-bottom: 10px;
    }
    input[type=text]{
    	border-radius: 0;
		border: 1px solid gray;
		outline-style: none;
    }
    select{
	    border-radius: 0;
		border: 1px solid gray;
		outline-style: none;
    }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/atManagement/atManagementAside.jsp"></jsp:include>
	    <section>
        <div class="inner">
            	<form action="updateInsert.at" method="post">
            	<input type="hidden" name="corpNo" value="${sessionScope.atbt.corpNo}">
            	<input type="hidden" name="breakTimeNo" value="${sessionScope.atbt.breakTimeNo}">
            <div id="inner-title">
            <span>근태 기본 설정</span>
            <br>
            <hr>
            <br>
            </div>
            <!-- 근태랑 52시간 근무 적용 여부 시작-->
            <div>
                <table id="usageStatus" class="leftTable">
                    <tr>
                        <td class="middleName">근태 사용 여부</td>
                        <td><input type="radio" name="attendence" value="Y"></td>
                        <td>사용함</td>
                        <td><input type="radio" name="attendence" value="N"></td>
                        <td>사용 안함</td>
                    </tr>
                    <tr>
                        <td class="middleName">52시간 근무 적용 여부</td>
                        <td><input type="radio" name="workTimeLimit" value="Y"></td>
                        <td>사용함</td>
                        <td><input type="radio" name="workTimeLimit" value="N"></td>
                        <td>사용 안함</td>
                    </tr>
                    <!-- <tr>
                        <td colspan="5"><button class="saveBtn">저장</button></td>
                    </tr> -->
                </table>
            	
            </div>
            <br>
            <!-- 근태랑 52시간 근무 적용 여부 끝 -->
            <div>
            	
                <label class="middleName">근태 정책 설정</label>
                <table class="leftTable">
                    <tr class="line">
                        <th>기본 근태</th>
                        <td colspan="15" class="padding">기본 근태</td>
                    </tr>
                    <tr class="line">
                        <th>적용 대상</th>
                        <td colspan="15" class="padding">전사(ALL)</td>
                    </tr>
                    <tr>
                        <th id="rowth" rowspan="${sessionScope.workTimeSet.size() + 3 }">출퇴근 설정</th>
                        <td colspan="15" class="padding">
                        	<input type="radio" id="default" name="workingSetTime" value="기본">
                        	<label class="left" for="default">출근일 및 출퇴근 시간 설정</label>
                        	<input type="radio" name="workingSetTime" id="free" value="자율">
                        	<label class="left" for="free">자율 출퇴근 설정</label></td>
                    </tr>
                    <tr>
                        <td colspan="15" class="padding">
                        	<input type="checkbox" name="dayOfTheWeek" id="mon" value="월">
                        	<label class="left" for="mon">월</label>
                        	<input type="checkbox" name="dayOfTheWeek" id="tue" value="화">
                        	<label class="left" for="tue">화</label>
                        	<input type="checkbox" name="dayOfTheWeek" id="wed" value="수">
                        	<label class="left" for="wed">수</label>
                        	<input type="checkbox" name="dayOfTheWeek" id="thu" value="목">
                        	<label class="left" for="thu">목</label>
                        	<input type="checkbox" name="dayOfTheWeek" id="fri" value="금">
                        	<label class="left" for="fri">금</label>
                        	<input type="checkbox" name="dayOfTheWeek" id="sat" value="토">
                        	<label class="left" for="sat">토</label>
                        	<input type="checkbox" name="dayOfTheWeek" id="sun" value="일">
                        	<label class="left" for="sun">일</label>
                        </td>
                    </tr>
                    <tr id="firstTr">
                        <td colspan="15" class="padding">
                        	<input type="checkbox" name="laborDay" id="laborDay">
                        	<label class="left" for="laborDay">근로자의 날(5/1)</label>
                        	<input type="checkbox" name="holidays" id="holidays">
                        	<label class="left" for="holidays">공휴일</label>
                        	<input type="checkbox" name="alternativeHolidays" id="alternativeHolidays">
                        	<label class="left" for="alternativeHolidays">대체공휴일</label>
                        </td>
                    </tr>
                    
    			<tr id="monTr">
                        <td colspan="15" class="padding">
                        	<span>월 출근</span>
                            <select name="startTime" id="monSelectTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="startMin" id="monSelectMin">
                            	<option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span>
                        	<span>퇴근</span>
                            <select name="endTime" id="monSelectEndTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="endMin" id="monSelectEndMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span>
                        	<span>반차</span>
                            <select name="halfTime" id="monSelectHalfTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="halfMin" id="monSelectHalfMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span></td>
                    </tr>
    			<tr id="tueTr"><td colspan="15" class="padding">
                        	<span>화 출근</span>
                            <select name="startTime" id="tueSelectTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="startMin" id="tueSelectMin">
                            	<option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span>
                        	<span>퇴근</span>
                            <select name="endTime" id="tueSelectEndTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="endMin" id="tueSelectEndMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span>
                        	<span>반차</span>
                            <select name="halfTime" id="tueSelectHalfTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="halfMin" id="tueSelectHalfMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span></td></tr>
                        	<tr id="wedTr"><td colspan="15" class="padding">
                        	<span>수 출근</span>
                            <select name="startTime" id="wedSelectTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="startMin" id="wedSelectMin">
                            	<option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span>
                        	<span>퇴근</span>
                            <select name="endTime" id="wedSelectEndTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="endMin" id="wedSelectEndMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span>
                        	<span>반차</span>
                            <select name="halfTime" id="wedSelectHalfTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="halfMin" id="wedSelectHalfMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span></td></tr>
                        	
                        	<tr id="thuTr"><td colspan="15" class="padding">
                        	<span>목 출근</span>
                            <select name="startTime" id="thuSelectTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="startMin" id="thuSelectMin">
                            	<option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span>
                        	<span>퇴근</span>
                            <select name="endTime" id="thuSelectEndTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="endMin" id="thuSelectEndMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span>
                        	<span>반차</span>
                            <select name="halfTime" id="thuSelectHalfTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="halfMin" id="thuSelectHalfMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span></td></tr>
                        	<tr id="friTr"><td colspan="15" class="padding">
                        	<span>금 출근</span>
                            <select name="startTime" id="friSelectTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="startMin" id="friSelectMin">
                            	<option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span>
                        	<span>퇴근</span>
                            <select name="endTime" id="friSelectEndTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="endMin" id="friSelectEndMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span>
                        	<span>반차</span>
                            <select name="halfTime" id="friSelectHalfTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="halfMin" id="friSelectHalfMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span></td></tr>
                        	<tr id="satTr"><td colspan="15" class="padding">
                        	<span>토 출근</span>
                            <select name="startTime" id="satSelectTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="startMin" id="satSelectMin">
                            	<option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span>
                        	<span>퇴근</span>
                            <select name="endTime" id="satSelectEndTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="endMin" id="satSelectEndMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span>
                        	<span>반차</span>
                            <select name="halfTime" id="satSelectHalfTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="halfMin" id="satSelectHalfMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span></td></tr>
                        	<tr id="sunTr"><td colspan="15" class="padding">
                        	<span>일 출근</span>
                            <select name="startTime" id="sunSelectTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="startMin" id="sunSelectMin">
                            	<option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span>
                        	<span>퇴근</span>
                            <select name="endTime" id="sunSelectEndTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="endMin" id="sunSelectEndMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span>
                        	<span>반차</span>
                            <select name="halfTime" id="sunSelectHalfTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select name="halfMin" id="sunSelectHalfMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span></td></tr>
                        	
                    <c:forEach var="i" begin="0" end="${sessionScope.workTimeSet.size() -1 }">
                    
    	<c:choose>
    		<c:when test="${sessionScope.workTimeSet.get(i).dayOfTheWeek eq '월'}">
    			<script type="text/javascript">
    				var monNo = 0;
    			$(document).ready(function() {
    				$("#mon").attr("checked", true);
    				monNum = 2;
    				var startTime = "${sessionScope.workTimeSet.get(i).workingTime}";
    				var start = startTime.split(":");
    				var endTime = "${sessionScope.workTimeSet.get(i).quittingTime}";
    				var end = endTime.split(":");
    				var halfTime = "${sessionScope.workTimeSet.get(i).harfOff}";
    				var half = halfTime.split(":");

    				$('#monSelectTime option[value='+start[0]+']').attr('selected','ture');
    				$('#monSelectMin option[value='+start[1]+']').attr('selected','ture');
    				$('#monSelectEndTime option[value='+end[0]+']').attr('selected','ture');
    				$('#monSelectEndMin option[value='+end[1]+']').attr('selected','ture');
    				$('#monSelectHalfTime option[value='+half[0]+']').attr('selected','ture');
    				$('#monSelectHalfMin option[value='+half[1]+']').attr('selected','ture');
    				
    				
    				var updateStartTime = $("#monSelectTime option:selected").val();
    				var updateStartMin = $("#monSelectMin option:selected").val();
    				var updateEndTime = $("#monSelectEndTime option:selected").val();
    				var updateEndMin = $("#monSelectEndMin option:selected").val();
    				var updateHalfTime = $("#monSelectHalfTime option:selected").val();
    				var updateHalfMin = $("#monSelectHalfMin option:selected").val();
    				
    				var workingTime = updateStartTime+":"+updateStartMin+":00";
    				var quittingTime = updateEndTime+":"+updateEndMin+":00";
    				var harfOff = updateHalfTime+":"+updateHalfMin+":00";
    				
    				$("#monTr").after('<input id="workingTime${i}" type="hidden" name="workingTime" value="'+workingTime+'">');    						
    				$("#monTr").after('<input id="quittingTime${i}" type="hidden" name="quittingTime" value="'+quittingTime+'">');
    				$("#monTr").after('<input id="harfOff${i}" type="hidden" name="harfOff" value="'+harfOff+'">');
    				var workingSetNo = "${sessionScope.workTimeSet.get(i).workingSetNo }";
    				$("#monTr").after('<input id="workingSetNo${i}" type="hidden" name="workingSetNo" value="'+workingSetNo+'">');
                	
    				$("select[id^='monSelect'], input:checkbox[id=mon]").change(function() {
						
    				if($("input:checkbox[id=mon]").is(":checked")){
    					updateStartTime = $("#monSelectTime option:selected").val();
    					updateStartMin = $("#monSelectMin option:selected").val();
    					updateEndTime = $("#monSelectEndTime option:selected").val();
    					updateEndMin = $("#monSelectEndMin option:selected").val();
    					updateHalfTime = $("#monSelectHalfTime option:selected").val();
    					updateHalfMin = $("#monSelectHalfMin option:selected").val();
    					workingTime = updateStartTime+":"+updateStartMin+":00";
    					quittingTime = updateEndTime+":"+updateEndMin+":00";
    					harfOff = updateHalfTime+":"+updateHalfMin+":00";
    					if(monNo == 1){
    						$("#monTr").after('<input id="workingTime${i}" type="hidden" name="workingTime" value="'+workingTime+'">');
    						$("#monTr").after('<input id="quittingTime${i}" type="hidden" name="quittingTime" value="'+quittingTime+'">');
    	    				$("#monTr").after('<input id="harfOff${i}" type="hidden" name="harfOff" value="'+harfOff+'">');
    	    				$("#monTr").after('<input id="workingSetNo${i}" type="hidden" name="workingSetNo" value="'+workingSetNo+'">');
    	    				monNo = 0;
    					} else{
    						$("#workingTime${i}").val(workingTime);
    						$("#quittingTime${i}").val(quittingTime);
    						$("#harfOff${i}").val(harfOff);
    					}
    				}else{
    					$("#workingTime${i}").detach();
    					$("#quittingTime${i}").detach();
    					$("#harfOff${i}").detach();
    					$("#workingSetNo${i}").detach();
    					monNo = 1;
    				}
    				});

    				$("input:checkbox[id=mon]").change(function() {
                    	
                		if($("input:checkbox[id=mon]").is(":checked") == false){
                    		$("#monTr").after('<input id="delNo${i}" type="hidden" name="deleteWorkTimeSetNo" value="${sessionScope.workTimeSet.get(i).workingSetNo}">');
                    		$("#workingTime${i}").detach();
                		}
                		if($("input:checkbox[id=mon]").is(":checked")){
                			$("#delNo${i}").detach();
                		}
    				});
    				
    				
    				
    				
    			});
    			</script>
    		</c:when>
    		<c:when test="${sessionScope.workTimeSet.get(i).dayOfTheWeek eq '화'}">
    			<script type="text/javascript">
    			var tueNo = 0;
    			$(document).ready(function() {
    				$("#tue").attr("checked", true);
    				tueNum = 2;
    				var startTime = "${sessionScope.workTimeSet.get(i).workingTime}";
    				var start = startTime.split(":");
    				var endTime = "${sessionScope.workTimeSet.get(i).quittingTime}";
    				var end = endTime.split(":");
    				var halfTime = "${sessionScope.workTimeSet.get(i).harfOff}";
    				var half = halfTime.split(":");

    				$('#tueSelectTime option[value='+start[0]+']').attr('selected','ture');
    				$('#tueSelectMin option[value='+start[1]+']').attr('selected','ture');
    				$('#tueSelectEndTime option[value='+end[0]+']').attr('selected','ture');
    				$('#tueSelectEndMin option[value='+end[1]+']').attr('selected','ture');
    				$('#tueSelectHalfTime option[value='+half[0]+']').attr('selected','ture');
    				$('#tueSelectHalfMin option[value='+half[1]+']').attr('selected','ture');
    				
    				var updateStartTime = $("#tueSelectTime option:selected").val();
    				var updateStartMin = $("#tueSelectMin option:selected").val();
    				var updateEndTime = $("#tueSelectEndTime option:selected").val();
    				var updateEndMin = $("#tueSelectEndMin option:selected").val();
    				var updateHalfTime = $("#tueSelectHalfTime option:selected").val();
    				var updateHalfMin = $("#tueSelectHalfMin option:selected").val();
    				
    				var workingTime = updateStartTime+":"+updateStartMin+":00";
    				var quittingTime = updateEndTime+":"+updateEndMin+":00";
    				var harfOff = updateHalfTime+":"+updateHalfMin+":00";
    				
    				$("#tueTr").after('<input id="workingTime${i}" type="hidden" name="workingTime" value="'+workingTime+'">');    						
    				$("#tueTr").after('<input id="quittingTime${i}" type="hidden" name="quittingTime" value="'+quittingTime+'">');
    				$("#tueTr").after('<input id="harfOff${i}" type="hidden" name="harfOff" value="'+harfOff+'">');
    				var workingSetNo = "${sessionScope.workTimeSet.get(i).workingSetNo }";
    				$("#tueTr").after('<input id="workingSetNo${i}" type="hidden" name="workingSetNo" value="'+workingSetNo+'">');
                	
                	$("select[id^='tueSelect'], input:checkbox[id=tue]").change(function() {
						
    				if($("input:checkbox[id=tue]").is(":checked")){
    					updateStartTime = $("#tueSelectTime option:selected").val();
    					updateStartMin = $("#tueSelectMin option:selected").val();
    					updateEndTime = $("#tueSelectEndTime option:selected").val();
    					updateEndMin = $("#tueSelectEndMin option:selected").val();
    					updateHalfTime = $("#tueSelectHalfTime option:selected").val();
    					updateHalfMin = $("#tueSelectHalfMin option:selected").val();
    					workingTime = updateStartTime+":"+updateStartMin+":00";
    					quittingTime = updateEndTime+":"+updateEndMin+":00";
    					harfOff = updateHalfTime+":"+updateHalfMin+":00";
    					if(tueNo == 1){
    						$("#tueTr").after('<input id="workingTime${i}" type="hidden" name="workingTime" value="'+workingTime+'">');
    						$("#tueTr").after('<input id="quittingTime${i}" type="hidden" name="quittingTime" value="'+quittingTime+'">');
    	    				$("#tueTr").after('<input id="harfOff${i}" type="hidden" name="harfOff" value="'+harfOff+'">');
    	    				$("#tueTr").after('<input id="workingSetNo${i}" type="hidden" name="workingSetNo" value="'+workingSetNo+'">');
    	                	
    	    				tueNo = 0;
    					} else{
    						$("#workingTime${i}").val(workingTime);
    						$("#quittingTime${i}").val(quittingTime);
    						$("#harfOff${i}").val(harfOff);
    					}
    				}else{
    					$("#workingTime${i}").detach();
    					$("#quittingTime${i}").detach();
    					$("#harfOff${i}").detach();
    					$("#workingSetNo${i}").detach();
    					tueNo = 1;
    				}
    				
    			});
    			$("input:checkbox[id=tue]").change(function() {
            		if($("input:checkbox[id=tue]").is(":checked") == false){
                		$("#tueTr").after('<input id="delNo${i}" type="hidden" name="deleteWorkTimeSetNo" value="${sessionScope.workTimeSet.get(i).workingSetNo}">');
    				}
            		if($("input:checkbox[id=tue]").is(":checked")){
            			$("#delNo${i}").detach();
            		}
				});
    			});
    			</script>
    		</c:when>
    		<c:when test="${sessionScope.workTimeSet.get(i).dayOfTheWeek eq '수'}">
    		
    			<script type="text/javascript">
    			var wedNo = 0;
    			$(document).ready(function() {
    				$("#wed").attr("checked", true);
    				wedNum = 2;
    				var startTime = "${sessionScope.workTimeSet.get(i).workingTime}";
    				var start = startTime.split(":");
    				var endTime = "${sessionScope.workTimeSet.get(i).quittingTime}";
    				var end = endTime.split(":");
    				var halfTime = "${sessionScope.workTimeSet.get(i).harfOff}";
    				var half = halfTime.split(":");

    				$('#wedSelectTime option[value='+start[0]+']').attr('selected','ture');
    				$('#wedSelectMin option[value='+start[1]+']').attr('selected','ture');
    				$('#wedSelectEndTime option[value='+end[0]+']').attr('selected','ture');
    				$('#wedSelectEndMin option[value='+end[1]+']').attr('selected','ture');
    				$('#wedSelectHalfTime option[value='+half[0]+']').attr('selected','ture');
    				$('#wedSelectHalfMin option[value='+half[1]+']').attr('selected','ture');
    				
    				var updateStartTime = $("#wedSelectTime option:selected").val();
    				var updateStartMin = $("#wedSelectMin option:selected").val();
    				var updateEndTime = $("#wedSelectEndTime option:selected").val();
    				var updateEndMin = $("#wedSelectEndMin option:selected").val();
    				var updateHalfTime = $("#wedSelectHalfTime option:selected").val();
    				var updateHalfMin = $("#wedSelectHalfMin option:selected").val();
    				
    				var workingTime = updateStartTime+":"+updateStartMin+":00";
    				var quittingTime = updateEndTime+":"+updateEndMin+":00";
    				var harfOff = updateHalfTime+":"+updateHalfMin+":00";
    				
    				$("#wedTr").after('<input id="workingTime${i}" type="hidden" name="workingTime" value="'+workingTime+'">');    						
    				$("#wedTr").after('<input id="quittingTime${i}" type="hidden" name="quittingTime" value="'+quittingTime+'">');
    				$("#wedTr").after('<input id="harfOff${i}" type="hidden" name="harfOff" value="'+harfOff+'">');
    				var workingSetNo = "${sessionScope.workTimeSet.get(i).workingSetNo }";
    				$("#wedTr").after('<input id="workingSetNo${i}" type="hidden" name="workingSetNo" value="'+workingSetNo+'">');
                	
                	$("select[id^='wedSelect'], input:checkbox[id=wed]").change(function() {
						
    				if($("input:checkbox[id=wed]").is(":checked")){
    					updateStartTime = $("#wedSelectTime option:selected").val();
    					updateStartMin = $("#wedSelectMin option:selected").val();
    					updateEndTime = $("#wedSelectEndTime option:selected").val();
    					updateEndMin = $("#wedSelectEndMin option:selected").val();
    					updateHalfTime = $("#wedSelectHalfTime option:selected").val();
    					updateHalfMin = $("#wedSelectHalfMin option:selected").val();
    					workingTime = updateStartTime+":"+updateStartMin+":00";
    					quittingTime = updateEndTime+":"+updateEndMin+":00";
    					harfOff = updateHalfTime+":"+updateHalfMin+":00";
    					console.log(wedNo);
    					if(wedNo == 1){
    						$("#wedTr").after('<input id="workingTime${i}" type="hidden" name="workingTime" value="'+workingTime+'">');
    						$("#wedTr").after('<input id="quittingTime${i}" type="hidden" name="quittingTime" value="'+quittingTime+'">');
    	    				$("#wedTr").after('<input id="harfOff${i}" type="hidden" name="harfOff" value="'+harfOff+'">');
    	    				$("#wedTr").after('<input id="workingSetNo${i}" type="hidden" name="workingSetNo" value="'+workingSetNo+'">');
    	    				wedNo = 0;
    					}else{
    						$("#workingTime${i}").val(workingTime);
    						$("#quittingTime${i}").val(quittingTime);
    						$("#harfOff${i}").val(harfOff);
    					}
    				}
    				if($("input:checkbox[id=wed]").is(":checked") == false){
    					$("#workingTime${i}").detach();
    					$("#quittingTime${i}").detach();
    					$("#harfOff${i}").detach();
    					$("#workingSetNo${i}").detach();
    					console.log(num);
    					wedNo = 1;
    				}
    				
    			});
    			$("input:checkbox[id=wed]").change(function() {
            		if($("input:checkbox[id=wed]").is(":checked") == false){
                		$("#wedTr").after('<input id="delNo${i}" type="hidden" name="deleteWorkTimeSetNo" value="${sessionScope.workTimeSet.get(i).workingSetNo}">');
    				}
            		if($("input:checkbox[id=wed]").is(":checked")){
            			$("#delNo${i}").detach();
            		}
				});
    			});
    			</script>
    		</c:when>
    		<c:when test="${sessionScope.workTimeSet.get(i).dayOfTheWeek eq '목'}">
    		
    			<script type="text/javascript">
    			var thuNo = 0;
    			$(document).ready(function() {
    				$("#thu").attr("checked", true);
    				thuNum = 2;
    				var startTime = "${sessionScope.workTimeSet.get(i).workingTime}";
    				var start = startTime.split(":");
    				var endTime = "${sessionScope.workTimeSet.get(i).quittingTime}";
    				var end = endTime.split(":");
    				var halfTime = "${sessionScope.workTimeSet.get(i).harfOff}";
    				var half = halfTime.split(":");

    				$('#thuSelectTime option[value='+start[0]+']').attr('selected','ture');
    				$('#thuSelectMin option[value='+start[1]+']').attr('selected','ture');
    				$('#thuSelectEndTime option[value='+end[0]+']').attr('selected','ture');
    				$('#thuSelectEndMin option[value='+end[1]+']').attr('selected','ture');
    				$('#thuSelectHalfTime option[value='+half[0]+']').attr('selected','ture');
    				$('#thuSelectHalfMin option[value='+half[1]+']').attr('selected','ture');
    				
    				var updateStartTime = $("#thuSelectTime option:selected").val();
    				var updateStartMin = $("#thuSelectMin option:selected").val();
    				var updateEndTime = $("#thuSelectEndTime option:selected").val();
    				var updateEndMin = $("#thuSelectEndMin option:selected").val();
    				var updateHalfTime = $("#thuSelectHalfTime option:selected").val();
    				var updateHalfMin = $("#thuSelectHalfMin option:selected").val();
    				
    				var workingTime = updateStartTime+":"+updateStartMin+":00";
    				var quittingTime = updateEndTime+":"+updateEndMin+":00";
    				var harfOff = updateHalfTime+":"+updateHalfMin+":00";
    				
    				$("#thuTr").after('<input id="workingTime${i}" type="hidden" name="workingTime" value="'+workingTime+'">');    						
    				$("#thuTr").after('<input id="quittingTime${i}" type="hidden" name="quittingTime" value="'+quittingTime+'">');
    				$("#thuTr").after('<input id="harfOff${i}" type="hidden" name="harfOff" value="'+harfOff+'">');
    				var workingSetNo = "${sessionScope.workTimeSet.get(i).workingSetNo }";
    				$("#thuTr").after('<input id="workingSetNo${i}" type="hidden" name="workingSetNo" value="'+workingSetNo+'">');
                	
                	$("select[id^='thuSelect'], input:checkbox[id=thu]").change(function() {
						
    				if($("input:checkbox[id=thu]").is(":checked")){
    					updateStartTime = $("#thuSelectTime option:selected").val();
    					updateStartMin = $("#thuSelectMin option:selected").val();
    					updateEndTime = $("#thuSelectEndTime option:selected").val();
    					updateEndMin = $("#thuSelectEndMin option:selected").val();
    					updateHalfTime = $("#thuSelectHalfTime option:selected").val();
    					updateHalfMin = $("#thuSelectHalfMin option:selected").val();
    					workingTime = updateStartTime+":"+updateStartMin+":00";
    					quittingTime = updateEndTime+":"+updateEndMin+":00";
    					harfOff = updateHalfTime+":"+updateHalfMin+":00";
    					if(thuNo == 1){
    						$("#thuTr").after('<input id="workingTime${i}" type="hidden" name="workingTime" value="'+workingTime+'">');
    						$("#thuTr").after('<input id="quittingTime${i}" type="hidden" name="quittingTime" value="'+quittingTime+'">');
    	    				$("#thuTr").after('<input id="harfOff${i}" type="hidden" name="harfOff" value="'+harfOff+'">');
    	    				$("#thuTr").after('<input id="workingSetNo${i}" type="hidden" name="workingSetNo" value="'+workingSetNo+'">');
    	    				thuNo = 0;
    					} else{
    						$("#workingTime${i}").val(workingTime);
    						$("#quittingTime${i}").val(quittingTime);
    						$("#harfOff${i}").val(harfOff);
    					}
    				}else{
    					$("#workingTime${i}").detach();
    					$("#quittingTime${i}").detach();
    					$("#harfOff${i}").detach();
    					$("#workingSetNo${i}").detach();
    					thuNo = 1;
    				}
    				
    			});
    			$("input:checkbox[id=thu]").change(function() {
            		if($("input:checkbox[id=thu]").is(":checked") == false){
                		$("#thuTr").after('<input id="delNo${i}" type="hidden" name="deleteWorkTimeSetNo" value="${sessionScope.workTimeSet.get(i).workingSetNo}">');
    				}
            		if($("input:checkbox[id=thu]").is(":checked")){
            			$("#delNo${i}").detach();
            		}
				});
    			});
    			</script>
    		</c:when>
    		<c:when test="${sessionScope.workTimeSet.get(i).dayOfTheWeek eq '금'}">
    		
    			<script type="text/javascript">
    			var friNo = 0;
    			$(document).ready(function() {
    				$("#fri").attr("checked", true);
    				friNum = 2;
    				var startTime = "${sessionScope.workTimeSet.get(i).workingTime}";
    				var start = startTime.split(":");
    				var endTime = "${sessionScope.workTimeSet.get(i).quittingTime}";
    				var end = endTime.split(":");
    				var halfTime = "${sessionScope.workTimeSet.get(i).harfOff}";
    				var half = halfTime.split(":");

    				$('#friSelectTime option[value='+start[0]+']').attr('selected','ture');
    				$('#friSelectMin option[value='+start[1]+']').attr('selected','ture');
    				$('#friSelectEndTime option[value='+end[0]+']').attr('selected','ture');
    				$('#friSelectEndMin option[value='+end[1]+']').attr('selected','ture');
    				$('#friSelectHalfTime option[value='+half[0]+']').attr('selected','ture');
    				$('#friSelectHalfMin option[value='+half[1]+']').attr('selected','ture');
    				
    				var updateStartTime = $("#friSelectTime option:selected").val();
    				var updateStartMin = $("#friSelectMin option:selected").val();
    				var updateEndTime = $("#friSelectEndTime option:selected").val();
    				var updateEndMin = $("#friSelectEndMin option:selected").val();
    				var updateHalfTime = $("#friSelectHalfTime option:selected").val();
    				var updateHalfMin = $("#friSelectHalfMin option:selected").val();
    				
    				var workingTime = updateStartTime+":"+updateStartMin+":00";
    				var quittingTime = updateEndTime+":"+updateEndMin+":00";
    				var harfOff = updateHalfTime+":"+updateHalfMin+":00";
    				
    				$("#friTr").after('<input id="workingTime${i}" type="hidden" name="workingTime" value="'+workingTime+'">');    						
    				$("#friTr").after('<input id="quittingTime${i}" type="hidden" name="quittingTime" value="'+quittingTime+'">');
    				$("#friTr").after('<input id="harfOff${i}" type="hidden" name="harfOff" value="'+harfOff+'">');
    				var workingSetNo = "${sessionScope.workTimeSet.get(i).workingSetNo }";
    				$("#friTr").after('<input id="workingSetNo${i}" type="hidden" name="workingSetNo" value="'+workingSetNo+'">');
                	
                	$("select[id^='friSelect'], input:checkbox[id=fri]").change(function() {
						
    				if($("input:checkbox[id=fri]").is(":checked")){
    					updateStartTime = $("#friSelectTime option:selected").val();
    					updateStartMin = $("#friSelectMin option:selected").val();
    					updateEndTime = $("#friSelectEndTime option:selected").val();
    					updateEndMin = $("#friSelectEndMin option:selected").val();
    					updateHalfTime = $("#friSelectHalfTime option:selected").val();
    					updateHalfMin = $("#friSelectHalfMin option:selected").val();
    					workingTime = updateStartTime+":"+updateStartMin+":00";
    					quittingTime = updateEndTime+":"+updateEndMin+":00";
    					harfOff = updateHalfTime+":"+updateHalfMin+":00";
    					if(friNo == 1){
    						$("#friTr").after('<input id="workingTime${i}" type="hidden" name="workingTime" value="'+workingTime+'">');
    						$("#friTr").after('<input id="quittingTime${i}" type="hidden" name="quittingTime" value="'+quittingTime+'">');
    	    				$("#friTr").after('<input id="harfOff${i}" type="hidden" name="harfOff" value="'+harfOff+'">');
    	    				$("#friTr").after('<input id="workingSetNo${i}" type="hidden" name="workingSetNo" value="'+workingSetNo+'">');
    	    				friNo = 0;
    					} else{
    						$("#workingTime${i}").val(workingTime);
    						$("#quittingTime${i}").val(quittingTime);
    						$("#harfOff${i}").val(harfOff);
    					}
    				}else{
    					$("#workingTime${i}").detach();
    					$("#quittingTime${i}").detach();
    					$("#harfOff${i}").detach();
    					$("#workingSetNo${i}").detach();
    					friNo = 1;
    				}
    				
    			});
    			$("input:checkbox[id=fri]").change(function() {
            		if($("input:checkbox[id=fri]").is(":checked") == false){
                		$("#friTr").after('<input id="delNo${i}" type="hidden" name="deleteWorkTimeSetNo" value="${sessionScope.workTimeSet.get(i).workingSetNo}">');
    				}
            		if($("input:checkbox[id=fri]").is(":checked")){
            			$("#delNo${i}").detach();
            		}
				});
    			});
    			</script>
    		</c:when>
    		<c:when test="${sessionScope.workTimeSet.get(i).dayOfTheWeek eq '토'}">
    		
    			<script type="text/javascript">
    			var satNo = 0;
    			$(document).ready(function() {
    				$("#sat").attr("checked", true);
    				satNum=2;
    				var startTime = "${sessionScope.workTimeSet.get(i).workingTime}";
    				var start = startTime.split(":");
    				var endTime = "${sessionScope.workTimeSet.get(i).quittingTime}";
    				var end = endTime.split(":");
    				var halfTime = "${sessionScope.workTimeSet.get(i).harfOff}";
    				var half = halfTime.split(":");

    				$('#satSelectTime option[value='+start[0]+']').attr('selected','ture');
    				$('#satSelectMin option[value='+start[1]+']').attr('selected','ture');
    				$('#satSelectEndTime option[value='+end[0]+']').attr('selected','ture');
    				$('#satSelectEndMin option[value='+end[1]+']').attr('selected','ture');
    				$('#satSelectHalfTime option[value='+half[0]+']').attr('selected','ture');
    				$('#satSelectHalfMin option[value='+half[1]+']').attr('selected','ture');
    				
    				var updateStartTime = $("#satSelectTime option:selected").val();
    				var updateStartMin = $("#satSelectMin option:selected").val();
    				var updateEndTime = $("#satSelectEndTime option:selected").val();
    				var updateEndMin = $("#satSelectEndMin option:selected").val();
    				var updateHalfTime = $("#satSelectHalfTime option:selected").val();
    				var updateHalfMin = $("#satSelectHalfMin option:selected").val();
    				
    				var workingTime = updateStartTime+":"+updateStartMin+":00";
    				var quittingTime = updateEndTime+":"+updateEndMin+":00";
    				var harfOff = updateHalfTime+":"+updateHalfMin+":00";
    				
    				$("#satTr").after('<input id="workingTime${i}" type="hidden" name="workingTime" value="'+workingTime+'">');    						
    				$("#satTr").after('<input id="quittingTime${i}" type="hidden" name="quittingTime" value="'+quittingTime+'">');
    				$("#satTr").after('<input id="harfOff${i}" type="hidden" name="harfOff" value="'+harfOff+'">');
    				var workingSetNo = "${sessionScope.workTimeSet.get(i).workingSetNo }";
    				$("#satTr").after('<input id="workingSetNo${i}" type="hidden" name="workingSetNo" value="'+workingSetNo+'">');
                	
    				$("select[id^='satSelect'], input:checkbox[id=sat]").change(function() {
					
    				if($("input:checkbox[id=sat]").is(":checked")){
    					updateStartTime = $("#satSelectTime option:selected").val();
    					updateStartMin = $("#satSelectMin option:selected").val();
    					updateEndTime = $("#satSelectEndTime option:selected").val();
    					updateEndMin = $("#satSelectEndMin option:selected").val();
    					updateHalfTime = $("#satSelectHalfTime option:selected").val();
    					updateHalfMin = $("#satSelectHalfMin option:selected").val();
    					workingTime = updateStartTime+":"+updateStartMin+":00";
    					quittingTime = updateEndTime+":"+updateEndMin+":00";
    					harfOff = updateHalfTime+":"+updateHalfMin+":00";
    					if(satNo == 1){
    						$("#satTr").after('<input id="workingTime${i}" type="hidden" name="workingTime" value="'+workingTime+'">');
    						$("#satTr").after('<input id="quittingTime${i}" type="hidden" name="quittingTime" value="'+quittingTime+'">');
    	    				$("#satTr").after('<input id="harfOff${i}" type="hidden" name="harfOff" value="'+harfOff+'">');
    	    				$("#satTr").after('<input id="workingSetNo${i}" type="hidden" name="workingSetNo" value="'+workingSetNo+'">');
    	    				satNo = 0;
    					} else{
    						$("#workingTime${i}").val(workingTime);
    						$("#quittingTime${i}").val(quittingTime);
    						$("#harfOff${i}").val(harfOff);
    					}
    				}else{
    					$("#workingTime${i}").detach();
    					$("#quittingTime${i}").detach();
    					$("#harfOff${i}").detach();
    					$("#workingSetNo${i}").detach();
    					satNo = 1;
    				}
    				
    			});
    			$("input:checkbox[id=sat]").change(function() {
            		if($("input:checkbox[id=sat]").is(":checked") == false){
                		$("#satTr").after('<input id="delNo${i}" type="hidden" name="deleteWorkTimeSetNo" value="${sessionScope.workTimeSet.get(i).workingSetNo}">');
    				}
            		if($("input:checkbox[id=sat]").is(":checked")){
            			$("#delNo${i}").detach();
            		}
				});
    			});
    			</script>
    		</c:when>
    		<c:when test="${sessionScope.workTimeSet.get(i).dayOfTheWeek eq '일'}">
    		
    			<script type="text/javascript">
    			var sunNo = 0;
    			$(document).ready(function() {
    				$("#sun").attr("checked", true);
    				sunNum=2;
    				var startTime = "${sessionScope.workTimeSet.get(i).workingTime}";
    				var start = startTime.split(":");
    				var endTime = "${sessionScope.workTimeSet.get(i).quittingTime}";
    				var end = endTime.split(":");
    				var halfTime = "${sessionScope.workTimeSet.get(i).harfOff}";
    				var half = halfTime.split(":");

    				$('#sunSelectTime option[value='+start[0]+']').attr('selected','ture');
    				$('#sunSelectMin option[value='+start[1]+']').attr('selected','ture');
    				$('#sunSelectEndTime option[value='+end[0]+']').attr('selected','ture');
    				$('#sunSelectEndMin option[value='+end[1]+']').attr('selected','ture');
    				$('#sunSelectHalfTime option[value='+half[0]+']').attr('selected','ture');
    				$('#sunSelectHalfMin option[value='+half[1]+']').attr('selected','ture');
    				
    				var updateStartTime = $("#sunSelectTime option:selected").val();
    				var updateStartMin = $("#sunSelectMin option:selected").val();
    				var updateEndTime = $("#sunSelectEndTime option:selected").val();
    				var updateEndMin = $("#sunSelectEndMin option:selected").val();
    				var updateHalfTime = $("#sunSelectHalfTime option:selected").val();
    				var updateHalfMin = $("#sunSelectHalfMin option:selected").val();
    				
    				var workingTime = updateStartTime+":"+updateStartMin+":00";
    				var quittingTime = updateEndTime+":"+updateEndMin+":00";
    				var harfOff = updateHalfTime+":"+updateHalfMin+":00";
    				
    				$("#sunTr").after('<input id="workingTime${i}" type="hidden" name="workingTime" value="'+workingTime+'">');    						
    				$("#sunTr").after('<input id="quittingTime${i}" type="hidden" name="quittingTime" value="'+quittingTime+'">');
    				$("#sunTr").after('<input id="harfOff${i}" type="hidden" name="harfOff" value="'+harfOff+'">');
    				var workingSetNo = "${sessionScope.workTimeSet.get(i).workingSetNo }";
    				$("#sunTr").after('<input id="workingSetNo${i}" type="hidden" name="workingSetNo" value="'+workingSetNo+'">');
                	
                	$("select[id^='sunSelect'], input:checkbox[id=sun]").change(function() {
					
    				if($("input:checkbox[id=sun]").is(":checked")){
    					updateStartTime = $("#sunSelectTime option:selected").val();
    					updateStartMin = $("#sunSelectMin option:selected").val();
    					updateEndTime = $("#sunSelectEndTime option:selected").val();
    					updateEndMin = $("#sunSelectEndMin option:selected").val();
    					updateHalfTime = $("#sunSelectHalfTime option:selected").val();
    					updateHalfMin = $("#sunSelectHalfMin option:selected").val();
    					workingTime = updateStartTime+":"+updateStartMin+":00";
    					quittingTime = updateEndTime+":"+updateEndMin+":00";
    					harfOff = updateHalfTime+":"+updateHalfMin+":00";
    					if(sunNo == 1){
    						$("#sunTr").after('<input id="workingTime${i}" type="hidden" name="workingTime" value="'+workingTime+'">');
    						$("#sunTr").after('<input id="quittingTime${i}" type="hidden" name="quittingTime" value="'+quittingTime+'">');
    	    				$("#sunTr").after('<input id="harfOff${i}" type="hidden" name="harfOff" value="'+harfOff+'">');
    	    				$("#sunTr").after('<input id="workingSetNo${i}" type="hidden" name="workingSetNo" value="'+workingSetNo+'">');
    	    				sunNo = 0;
    					} else{
    						$("#workingTime${i}").val(workingTime);
    						$("#quittingTime${i}").val(quittingTime);
    						$("#harfOff${i}").val(harfOff);
    					}
    				}else{
    					$("#workingTime${i}").detach();
    					$("#quittingTime${i}").detach();
    					$("#harfOff${i}").detach();
    					$("#workingSetNo${i}").detach();
    					sunNo = 1;
    				}
    				
    			});
    			$("input:checkbox[id=sun]").change(function() {
            		if($("input:checkbox[id=sun]").is(":checked") == false){
                		$("#sunTr").after('<input id="delNo${i}" type="hidden" name="deleteWorkTimeSetNo" value="${sessionScope.workTimeSet.get(i).workingSetNo}">');
    				}
            		if($("input:checkbox[id=sun]").is(":checked")){
            			$("#delNo${i}").detach();
            		}
				});
    			});
    			</script>
    		</c:when>
    		
    	</c:choose>
    </c:forEach>
                    
                    
                    
                    <tr class="line" id="restTr">
                        <th>휴게 시간</th>
                        <td colspan="15" class="padding">
                            <select id="restStartTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select id="restStartMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span>분 ~ </span>
                            <select id="restEndTime">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                            </select>
                        	<span class="left">시</span>
                            <select id="restEndMin">
                                <option value="00">00</option>
                                <option value="05">05</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                            </select>
                        	<span class="left">분</span> 
                        	<input type="text" name="btType" value="${sessionScope.atbt.btType}">
                        	<!-- <button type="button" class="addBtn" onclick="addRest();">추가하기</button> --></td>
                    </tr>
                    <!-- <tr>
                        <td colspan="16"><button class="saveBtn">저장</button></td>
                    </tr> -->
                </table>
                <script type="text/javascript">
                var num = 0;
                	$(document).ready(function() {
                		var startTime = "${sessionScope.atbt.btStart}";
        				var start = startTime.split(":");
        				var endTime = "${sessionScope.atbt.btEnd}";
        				var end = endTime.split(":");
        				
        				$('#restStartTime option[value='+start[0]+']').attr('selected','ture');
        				$('#restStartMin option[value='+start[1]+']').attr('selected','ture');
        				$('#restEndTime option[value='+end[0]+']').attr('selected','ture');
        				$('#restEndMin option[value='+end[1]+']').attr('selected','ture');
        				
        				var updateStartTime = $("#restStartTime option:selected").val();
        				var updateStartMin = $("#restStartMin option:selected").val();
        				var updateEndTime = $("#restEndTime option:selected").val();
        				var updateEndMin = $("#restEndMin option:selected").val();
        				var btStart = updateStartTime+":"+updateStartMin+":00";
        				var btEnd = updateEndTime+":"+updateEndMin+":00";
        				
        				if(num == 0){
        					$("#restTr").after('<input id="btStart" type="hidden" name="btStart" value="'+btStart+'">');    						
        					$("#restTr").after('<input id="btEnd" type="hidden" name="btEnd" value="'+btEnd+'">');
        					num = 1;
        				}
        					$("select[id^='rest']").change(function() {
        						updateStartTime = $("#restStartTime option:selected").val();
        						updateStartMin = $("#restStartMin option:selected").val();
        						updateEndTime = $("#restEndTime option:selected").val();
        						updateEndMin = $("#restEndMin option:selected").val();
        						btStart = updateStartTime+":"+updateStartMin+":00";
        						btEnd = updateEndTime+":"+updateEndMin+":00";
        						$("#btStart").val(btStart);
        						$("#btEnd").val(btEnd);
							});
        				
        				
        				
					});
                </script>
            </div>
            <br>
            <div>
            	
                <label class="middleName">근무상태 관리</label><button type="button" class="saveBtn" id="addBtnAt" >추가</button>
                <table id="managerTable" class="middleTable">
                	<tr>
                		<th>근무상태</th>
                		<th>근무 시간 포함 여부</th>
                		<th>수정 및 삭제</th>
                	</tr>
                	<c:forEach var="i" begin="0" end="${sessionScope.workingStatus.size()-1 }">
                	<input id="hiddenNo${i}" type="hidden" name="workingStatusNo" value="${sessionScope.workingStatus.get(i).workingStatusNo }">
                	<input id="hiddenType${i}" type="hidden" name="workType" value="${sessionScope.workingStatus.get(i).workType }">
                	<input id="hiddenWork${i}" type="hidden" name="work" value="${sessionScope.workingStatus.get(i).work}">
                	<tr id="workingTr${i}">
                		<td id="type${i}"><c:out value="${sessionScope.workingStatus.get(i).workType }"/></td>
                		<c:if test="${sessionScope.workingStatus.get(i).work eq 'Y' }">
                		<td id="work${i}">포함</td>
                		</c:if>
                		<c:if test="${sessionScope.workingStatus.get(i).work eq 'N' }">
                		<td id="work${i}">미포함</td>
                		</c:if>
                		<td id="but${i}"><button type="button" class="btn" onclick="modify('${i}','${sessionScope.workingStatus.get(i).workType }', '${sessionScope.workingStatus.get(i).workingStatusNo }');">수정</button>/<button type="button" class="btn" onclick="deleteType('${i}','${sessionScope.workingStatus.get(i).workingStatusNo }');">삭제</button></td>
                	</tr>
                	</c:forEach>
                	
                	
                </table>
                <button class="saveBtn">저장</button>
            </div>
            	</form>
        </div>
    </section>
    
    <script type="text/javascript">
    var monNum = 0;
    var tueNum = 0;
    var wedNum = 0;
    var thuNum = 0;
    var friNum = 0;
    var satNum = 0;
    var sunNum = 0;
    	$(document).ready(function() {
			console.log("${sessionScope.atbt.attendence}");
			console.log("${sessionScope.workTimeSet.size()}");

			
			if('${sessionScope.atbt.attendence}' == 'Y'){
				$("input:radio[name=attendence]:input[value='Y']").attr("checked", true);
			} else {
				$("input:radio[name=attendence]:input[value='N']").attr("checked", true);
			}
			
			if('${sessionScope.atbt.workTimeLimit}' == 'Y'){
				$("input:radio[name=workTimeLimit]:input[value='Y']").attr("checked", true);
			} else {
				$("input:radio[name=workTimeLimit]:input[value='N']").attr("checked", true);
			}
			
			if('${sessionScope.workTimeSet.get(0).workingSetTime}' == '기본'){
				$("input:radio[name=workingSetTime]:input[id='default']").attr("checked", true);
			} else {
				$("input:radio[name=workingSetTime]:input[id='free']").attr("checked", true);
			}
			
			if('${sessionScope.atbt.laborDay}' == 'Y'){
				$("input:checkbox[name=laborDay]").attr("checked", true);
				$("input:checkbox[name=laborDay]").attr("value", "Y");
			} else{
				$("input:checkbox[name=laborDay]").attr("value", "N");
			}
			$("input:checkbox[name=laborDay]").change(function() {
				if($("input:checkbox[name=laborDay]").is(":checked")){
					$("input:checkbox[name=laborDay]").val("Y");
				} else {
					$("input:checkbox[name=laborDay]").val("N");
				}
			});
			if('${sessionScope.atbt.holidays}' == 'Y'){
				$("input:checkbox[name=holidays]").attr("checked", true);
				$("input:checkbox[name=holidays]").attr("value", "Y");
			} else{
				$("input:checkbox[name=holidays]").attr("value", "N");
			}
			$("input:checkbox[name=holidays]").change(function() {
				if($("input:checkbox[name=holidays]").is(":checked")){
					$("input:checkbox[name=holidays]").val("Y");
				} else {
					$("input:checkbox[name=holidays]").val("N");
				}
			});
			if('${sessionScope.atbt.alternativeHolidays}' == 'Y'){
				$("input:checkbox[name=alternativeHolidays]").attr("checked", true);
				$("input:checkbox[name=alternativeHolidays]").attr("value", "Y");
			} else{
				$("input:checkbox[name=alternativeHolidays]").attr("value", "N");
			}
			$("input:checkbox[name=alternativeHolidays]").change(function() {
				if($("input:checkbox[name=alternativeHolidays]").is(":checked")){
					$("input:checkbox[name=alternativeHolidays]").val("Y");
				} else {
					$("input:checkbox[name=alternativeHolidays]").val("N");
				}
			});
			if($("input:checkbox[id=mon]").is(":checked")){
				$("#monTr").show();
				
			}
			if($("input:checkbox[id=mon]").is(":checked") == false){
				$("#monTr").hide();
			}
			if($("input:checkbox[id=tue]").is(":checked")){
				$("#tueTr").show();
				
			}
			if($("input:checkbox[id=tue]").is(":checked") == false){
				$("#tueTr").hide();
			}
			if($("input:checkbox[id=wed]").is(":checked")){
				$("#wedTr").show();
				
			}
			if($("input:checkbox[id=wed]").is(":checked") == false){
				$("#wedTr").hide();
			}
			if($("input:checkbox[id=thu]").is(":checked")){
				$("#thuTr").show();
				
			}
			if($("input:checkbox[id=thu]").is(":checked") == false){
				$("#thuTr").hide();
			}
			if($("input:checkbox[id=fri]").is(":checked")){
				$("#friTr").show();
				
			}
			if($("input:checkbox[id=fri]").is(":checked") == false){
				$("#friTr").hide();
			}
			if($("input:checkbox[id=sat]").is(":checked")){
				$("#satTr").show();
				
			}
			if($("input:checkbox[id=sat]").is(":checked") == false){
				$("#satTr").hide();
			}
			if($("input:checkbox[id=sun]").is(":checked")){
				$("#sunTr").show();
				
			}
			if($("input:checkbox[id=sun]").is(":checked") == false){
				$("#sunTr").hide();
			}
			
			$("select[id*='Select'], input:checkbox[name=dayOfTheWeek]").change(function() {
				var rowadd = $("input:checkbox[name=dayOfTheWeek]:checked").length + 3;
				if($("input:checkbox[name=dayOfTheWeek]").is(":checked")){
					$("#rowth").attr("rowspan", rowadd);
				} else {
					$("#rowth").attr("rowspan", rowadd);
				}
				if($("input:checkbox[id=mon]").is(":checked")){
					$("#monTr").show();						
						var updateStartTime = $("#monSelectTime option:selected").val();
	    				var updateStartMin = $("#monSelectMin option:selected").val();
	    				var updateEndTime = $("#monSelectEndTime option:selected").val();
	    				var updateEndMin = $("#monSelectEndMin option:selected").val();
	    				var updateHalfTime = $("#monSelectHalfTime option:selected").val();
	    				var updateHalfMin = $("#monSelectHalfMin option:selected").val();
	    				
	    				var workingTime = updateStartTime+":"+updateStartMin+":00";
	    				var quittingTime = updateEndTime+":"+updateEndMin+":00";
	    				var harfOff = updateHalfTime+":"+updateHalfMin+":00";
					if(monNum == 0){
						$("#monTr").after('<input id="insertWtm" type="hidden" name="insertDayOfTheWeek" value="월">');
	    				
	    				$("#monTr").after('<input id="insertWorkingTimeM" type="hidden" name="insertWorkingTime" value="'+workingTime+'">');    						
	    				$("#monTr").after('<input id="insertQuittingTimeM" type="hidden" name="insertQuittingTime" value="'+quittingTime+'">');
	    				$("#monTr").after('<input id="insertHarfOffM" type="hidden" name="insertHarfOff" value="'+harfOff+'">');
						$("#monTr").after('<input id="insertWorkingSetTimeM" type="hidden" name="insertWorkingSetTime" value="기본">');
						$("#monTr").after('<input id="insertCorpNoM" type="hidden" name="insertCorpNo" value="${sessionScope.atbt.corpNo}">');
	    				monNum = 1;
					}  else{
						$("#insertWorkingTimeM").val(workingTime);
						$("#insertQuittingTimeM").val(quittingTime);
						$("#insertHarfOffM").val(harfOff);
					} 
				}
				if($("input:checkbox[id=mon]").is(":checked") == false){
					$("#monTr").hide();
					$("input:hidden[id$=M]").detach();
					if(monNum==1){
					monNum = 0;
						
					}
				}
				if($("input:checkbox[id=tue]").is(":checked")){
					$("#tueTr").show();						
						var updateStartTime = $("#tueSelectTime option:selected").val();
	    				var updateStartMin = $("#tueSelectMin option:selected").val();
	    				var updateEndTime = $("#tueSelectEndTime option:selected").val();
	    				var updateEndMin = $("#tueSelectEndMin option:selected").val();
	    				var updateHalfTime = $("#tueSelectHalfTime option:selected").val();
	    				var updateHalfMin = $("#tueSelectHalfMin option:selected").val();
	    				
	    				var workingTime = updateStartTime+":"+updateStartMin+":00";
	    				var quittingTime = updateEndTime+":"+updateEndMin+":00";
	    				var harfOff = updateHalfTime+":"+updateHalfMin+":00";
	    				
					if(tueNum == 0){
						$("#tueTr").after('<input id="insertWtT" type="hidden" name="insertDayOfTheWeek" value="화">');
	    				$("#tueTr").after('<input id="insertWorkingTimeT" type="hidden" name="insertWorkingTime" value="'+workingTime+'">');    						
	    				$("#tueTr").after('<input id="insertQuittingTimeT" type="hidden" name="insertQuittingTime" value="'+quittingTime+'">');
	    				$("#tueTr").after('<input id="insertHarfOffT" type="hidden" name="insertHarfOff" value="'+harfOff+'">');
						$("#tueTr").after('<input id="insertWorkingSetTimeT" type="hidden" name="insertWorkingSetTime" value="기본">');
						$("#tueTr").after('<input id="insertCorpNoT" type="hidden" name="insertCorpNo" value="${sessionScope.atbt.corpNo}">');
						tueNum = 1;
					}  else{
						$("#insertWorkingTimeT").val(workingTime);
						$("#insertQuittingTimeT").val(quittingTime);
						$("#insertHarfOffT").val(harfOff);
					} 
				}
				if($("input:checkbox[id=tue]").is(":checked") == false){
					$("#tueTr").hide();
					$("input:hidden[id$=T]").detach();
					if(thuNum==1){
					tueNum = 0;
						
					}
				}
				if($("input:checkbox[id=wed]").is(":checked")){
					$("#wedTr").show();						
						var updateStartTime = $("#wedSelectTime option:selected").val();
	    				var updateStartMin = $("#wedSelectMin option:selected").val();
	    				var updateEndTime = $("#wedSelectEndTime option:selected").val();
	    				var updateEndMin = $("#wedSelectEndMin option:selected").val();
	    				var updateHalfTime = $("#wedSelectHalfTime option:selected").val();
	    				var updateHalfMin = $("#wedSelectHalfMin option:selected").val();
	    				
	    				var workingTime = updateStartTime+":"+updateStartMin+":00";
	    				var quittingTime = updateEndTime+":"+updateEndMin+":00";
	    				var harfOff = updateHalfTime+":"+updateHalfMin+":00";
					if(wedNum == 0){
						$("#wedTr").after('<input id="insertWtW" type="hidden" name="insertDayOfTheWeek" value="수">');
	    				
	    				$("#wedTr").after('<input id="insertWorkingTimeW" type="hidden" name="insertWorkingTime" value="'+workingTime+'">');    						
	    				$("#wedTr").after('<input id="insertQuittingTimeW" type="hidden" name="insertQuittingTime" value="'+quittingTime+'">');
	    				$("#wedTr").after('<input id="insertHarfOffW" type="hidden" name="insertHarfOff" value="'+harfOff+'">');
						$("#wedTr").after('<input id="insertWorkingSetTimeW" type="hidden" name="insertWorkingSetTime" value="기본">');
						$("#wedTr").after('<input id="insertCorpNoW" type="hidden" name="insertCorpNo" value="${sessionScope.atbt.corpNo}">');
						wedNum = 1;
					}  else{
						$("#insertWorkingTimeW").val(workingTime);
						$("#insertQuittingTimeW").val(quittingTime);
						$("#insertHarfOffW").val(harfOff);
					} 
				}
				if($("input:checkbox[id=wed]").is(":checked") == false){
					$("#wedTr").hide();
					$("input:hidden[id$=W]").detach();
					if(wedNum ==1){
					wedNum = 0;
						
					}
				}
				if($("input:checkbox[id=thu]").is(":checked")){
					$("#thuTr").show();						
						var updateStartTime = $("#thuSelectTime option:selected").val();
	    				var updateStartMin = $("#thuSelectMin option:selected").val();
	    				var updateEndTime = $("#thuSelectEndTime option:selected").val();
	    				var updateEndMin = $("#thuSelectEndMin option:selected").val();
	    				var updateHalfTime = $("#thuSelectHalfTime option:selected").val();
	    				var updateHalfMin = $("#thuSelectHalfMin option:selected").val();
	    				
	    				var workingTime = updateStartTime+":"+updateStartMin+":00";
	    				var quittingTime = updateEndTime+":"+updateEndMin+":00";
	    				var harfOff = updateHalfTime+":"+updateHalfMin+":00";
					if(thuNum == 0){
						$("#thuTr").after('<input id="insertWtH" type="hidden" name="insertDayOfTheWeek" value="목">');
	    				
	    				$("#thuTr").after('<input id="insertWorkingTimeH" type="hidden" name="insertWorkingTime" value="'+workingTime+'">');    						
	    				$("#thuTr").after('<input id="insertQuittingTimeH" type="hidden" name="insertQuittingTime" value="'+quittingTime+'">');
	    				$("#thuTr").after('<input id="insertHarfOffH" type="hidden" name="insertHarfOff" value="'+harfOff+'">');
						$("#thuTr").after('<input id="insertWorkingSetTimeH" type="hidden" name="insertWorkingSetTime" value="기본">');
						$("#thuTr").after('<input id="insertCorpNoH" type="hidden" name="insertCorpNo" value="${sessionScope.atbt.corpNo}">');
						thuNum = 1;
					}  else{
						$("#insertWorkingTimeH").val(workingTime);
						$("#insertQuittingTimeH").val(quittingTime);
						$("#insertHarfOffH").val(harfOff);
					} 
				}
				if($("input:checkbox[id=thu]").is(":checked") == false){
					$("#thuTr").hide();
					$("input:hidden[id$=H]").detach();
					if(thuNum == 1){
					thuNum = 0;
						
					}
				}
				if($("input:checkbox[id=fri]").is(":checked")){
					$("#friTr").show();						
						var updateStartTime = $("#friSelectTime option:selected").val();
	    				var updateStartMin = $("#friSelectMin option:selected").val();
	    				var updateEndTime = $("#friSelectEndTime option:selected").val();
	    				var updateEndMin = $("#friSelectEndMin option:selected").val();
	    				var updateHalfTime = $("#friSelectHalfTime option:selected").val();
	    				var updateHalfMin = $("#friSelectHalfMin option:selected").val();
	    				
	    				var workingTime = updateStartTime+":"+updateStartMin+":00";
	    				var quittingTime = updateEndTime+":"+updateEndMin+":00";
	    				var harfOff = updateHalfTime+":"+updateHalfMin+":00";
					if(friNum == 0){
						$("#friTr").after('<input id="insertWtF" type="hidden" name="insertDayOfTheWeek" value="금">');
	    				
	    				$("#friTr").after('<input id="insertWorkingTimeF" type="hidden" name="insertWorkingTime" value="'+workingTime+'">');    						
	    				$("#friTr").after('<input id="insertQuittingTimeF" type="hidden" name="insertQuittingTime" value="'+quittingTime+'">');
	    				$("#friTr").after('<input id="insertHarfOffF" type="hidden" name="insertHarfOff" value="'+harfOff+'">');
						$("#friTr").after('<input id="insertWorkingSetTimeF" type="hidden" name="insertWorkingSetTime" value="기본">');
						$("#friTr").after('<input id="insertCorpNoF" type="hidden" name="insertCorpNo" value="${sessionScope.atbt.corpNo}">');
						friNum = 1;
					} else{
						$("#insertWorkingTimeF").val(workingTime);
						$("#insertQuittingTimeF").val(quittingTime);
						$("#insertHarfOffF").val(harfOff);
					}  
				}
				if($("input:checkbox[id=fri]").is(":checked") == false){
					$("#friTr").hide();
					$("input:hidden[id$=F]").detach();
					if(friNum == 1){
						
					friNum = 0;
					}
				}
				
				if($("input:checkbox[id=sat]").is(":checked")){
					$("#satTr").show();						
						var updateStartTime = $("#satSelectTime option:selected").val();
	    				var updateStartMin = $("#satSelectMin option:selected").val();
	    				var updateEndTime = $("#satSelectEndTime option:selected").val();
	    				var updateEndMin = $("#satSelectEndMin option:selected").val();
	    				var updateHalfTime = $("#satSelectHalfTime option:selected").val();
	    				var updateHalfMin = $("#satSelectHalfMin option:selected").val();
	    				
	    				var workingTime = updateStartTime+":"+updateStartMin+":00";
	    				var quittingTime = updateEndTime+":"+updateEndMin+":00";
	    				var harfOff = updateHalfTime+":"+updateHalfMin+":00";
					if(satNum == 0){
						$("#satTr").after('<input id="insertWtS" type="hidden" name="insertDayOfTheWeek" value="토">');
	    				
	    				$("#satTr").after('<input id="insertWorkingTimeS" type="hidden" name="insertWorkingTime" value="'+workingTime+'">');    						
	    				$("#satTr").after('<input id="insertQuittingTimeS" type="hidden" name="insertQuittingTime" value="'+quittingTime+'">');
	    				$("#satTr").after('<input id="insertHarfOffS" type="hidden" name="insertHarfOff" value="'+harfOff+'">');
						$("#satTr").after('<input id="insertWorkingSetTimeS" type="hidden" name="insertWorkingSetTime" value="기본">');
						$("#satTr").after('<input id="insertCorpNoS" type="hidden" name="insertCorpNo" value="${sessionScope.atbt.corpNo}">');
						satNum = 1;
					} else{
						$("#insertWorkingTimeS").val(workingTime);
						$("#insertQuittingTimeS").val(quittingTime);
						$("#insertHarfOffS").val(harfOff);
					} 
				}
				if($("input:checkbox[id=sat]").is(":checked") == false){
					$("#satTr").hide();
					$("input:hidden[id$=S]").detach();
					if(satNum==1){
					satNum = 0;
						
					}
				}
				if($("input:checkbox[id=sun]").is(":checked")){
					$("#sunTr").show();						
						var updateStartTime = $("#sunSelectTime option:selected").val();
	    				var updateStartMin = $("#sunSelectMin option:selected").val();
	    				var updateEndTime = $("#sunSelectEndTime option:selected").val();
	    				var updateEndMin = $("#sunSelectEndMin option:selected").val();
	    				var updateHalfTime = $("#sunSelectHalfTime option:selected").val();
	    				var updateHalfMin = $("#sunSelectHalfMin option:selected").val();
	    				
	    				var workingTime = updateStartTime+":"+updateStartMin+":00";
	    				var quittingTime = updateEndTime+":"+updateEndMin+":00";
	    				var harfOff = updateHalfTime+":"+updateHalfMin+":00";
					if(sunNum == 0){
						$("#sunTr").after('<input id="insertWtU" type="hidden" name="insertDayOfTheWeek" value="일">');
	    				
	    				$("#sunTr").after('<input id="insertWorkingTimeU" type="hidden" name="insertWorkingTime" value="'+workingTime+'">');    						
	    				$("#sunTr").after('<input id="insertQuittingTimeU" type="hidden" name="insertQuittingTime" value="'+quittingTime+'">');
	    				$("#sunTr").after('<input id="insertHarfOffU" type="hidden" name="insertHarfOff" value="'+harfOff+'">');
						$("#sunTr").after('<input id="insertWorkingSetTimeU" type="hidden" name="insertWorkingSetTime" value="기본">');
						$("#sunTr").after('<input id="insertCorpNoU" type="hidden" name="insertCorpNo" value="${sessionScope.atbt.corpNo}">');
						sunNum = 1;
					} else{
						$("#insertWorkingTimeU").val(workingTime);
						$("#insertQuittingTimeU").val(quittingTime);
						$("#insertHarfOffU").val(harfOff);
					} 
				}
				if($("input:checkbox[id=sun]").is(":checked") == false){
					$("#sunTr").hide();
					$("input:hidden[id$=U]").detach();
					if(sunNum==1){
						sunNum = 0;
					}
				}
			});
			
			
    	});
			
    	/*여기까지가 document 실행끝*/
    	$("#addBtnAt").click(function() {
	    		console.log("들어옴");
				$("#managerTable").append('<tr><td><input name="insertWorkType" type="text" placeholder="상태 이름 입력"></td><td><select name="insertWork"><option value="Y">포함</option><option value="N">미포함</option></select></td><td></td></tr>');
			
		});
			
    	
    	/* 근무 상태 관리 수정 */
    	function modify(num, type, no) {
			 $("#type"+num).detach();
			 $("#work"+num).detach();
			 $("#but"+num).empty();
			 $("#hiddenNo"+num).detach();
			 $("#hiddenType"+num).detach();
			 $("#hiddenWork"+num).detach();
			 $("#workingTr"+num).prepend('<td><select id="updateWork'+num+'" class="updateType" name="updatework"><option value="Y">포함</option><option value="N">미포함</option></select></td>').prepend('<td><input id="updateType'+num+'" class="updateType" name="updateworkType" type="text" value="'+type+'"></td>');
			 $("#workingTr"+num).prepend('<input id="hiddenNo'+num+'" type="hidden" name="updateWorkingStatusNo" value="'+no+'">');
		}
    	
    	
    	function deleteType(num, no) {
			var value = confirm("삭제하시겠습니까?");
			if(value == true){
				$("#managerTable").prepend('<input id="delNo'+num+'" type="hidden" name="deleteWorkingStatusNo" value="'+no+'">');
				$("#workingTr"+num).detach();
				$("#hiddenNo"+num).detach();
				$("#hiddenType"+num).detach();
				$("#hiddenWork"+num).detach();
			}
		}
    	
    	
    </script>
</body>
</html>