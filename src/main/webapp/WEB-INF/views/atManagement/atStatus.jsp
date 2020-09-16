<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="${contextPath}/resources/images/favicon.ico" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
    .centerBox{
    	width: 100%;
    	text-align: center;
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
    	text-align: left;
    }
    .worktime label{
    	font-family: Noto Sans KR;
		font-size: 12px;
		line-height: 30px;
    }
    .time{
    	display: inline-block;
    	width: 95%;
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
    	text-align: left;
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
    	text-decoration: none;
        color: #004771;
        font-size: 14px;
        
    }
    .timeText{
    	width: 270px;
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
	/*달력*/
	.cal_top{
    text-align: center;
    font-size: 30px;
    margin-top: 20px;
}
.cal{
    text-align: center; 
}
table.calendar{
    border: 1px solid #929292;
    display: inline-table;
    text-align: center;
    background: white;
    border-collapse: collapse;
    width: 95%;
}
table.calendar td{
    vertical-align: top;
    text-align:right;
    border: 1px solid #929292;
    width: 100px;
    padding-right: 5px;
}
.leftArrow{
		width: 15px;
		height: auto;
		transform: rotate(90deg);
	}
	.rightArrow{
		width: 15px;
		height: auto;
		transform: rotate(-90deg);
	}
	#cal_top_year{
		font-family: Noto Sans KR;
		font-style: normal;
		font-weight: normal;
		font-size: 24px;
		line-height: 35px;
		align-items: center;
		color: #004771;
	}
	#cal_top_month{
		font-family: Noto Sans KR;
		font-style: normal;
		font-weight: normal;
		font-size: 24px;
		line-height: 35px;
		align-items: center;
		color: #004771;
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
            <!-- <div class="worktime">
            	<label>총 근무 시간 : </label><br>
            	<label>잔여 근무 시간 : </label><br>
            	<label>총 연장 근무 시간 : </label>
            </div>-->
            <div class="time">
            <form action="insertAtStatus.at" method="post">
            
            	<table id="btnTable">
            		<tr>
            			<td class="timeText" id="todayDay"></td>
            			<td><input name="outsideWork" type="checkbox"><span>외근 출퇴근 시에는 체크박스를 체크해주세요.</span></td>
            			<td rowspan="2"><a class="btn" href="insertObjectionForm.at">출/퇴근 이의 신청</a></td>
            		</tr>
            		<tr>
            			<td class="timeText" id="nowTime"></td>
            			<td width="350px"><button id="startBtn" class="timeBtn">출근</button><input id="startText" type="text" disabled></td>
            			
            		</tr>
            		<tr>
            			<td class="timeText">현재 접속 IP : ${ip }</td>
            			<td><button id="endBtn" class="timeBtn">퇴근</button><input id="endText" type="text" disabled></td>
            			<td><a class="btn" href="insertCorrectionForm.at">연장 근무 신청</a></td>
            		</tr>
            	</table>
            	<input type="hidden" name="ip" value="${ip }">
            	<input type="hidden" name="wstatus" id="wstatus">
            	<input type="hidden" name="status" id="status">
            	<input type="hidden" name="workingSetNo" id="workingSetNo">
            	<input type="hidden" name="mno" value="${myTime.get(0).mno }">
            </form>
            </div>
            </div>
            <script type="text/javascript">
            	
            	
            	$(document).ready(function() {
            		//시계, 날짜
            		clock();
            		setInterval(clock, 1000);
            		
            		
            		
				});
            			$("#endBtn").click(function() {
            		if($("#endText").val() != null){
	            			alert("이미 퇴근이 완료되었습니다.");
							
            			$("#endBtn").attr("disabled", true);
            		} else{
            			prompt("퇴근하시겠습니까?");
            			$("#endBtn").attr("disabled", false);
            		}
						});
            	
            			$("#startBtn").click(function() {
            		if($("#startText").val() != null){
	            			alert("이미 출근이 완료되었습니다.");
							
            			$("#startBtn").attr("disabled", true);
            		} else{
            			prompt("출근하시겠습니까?");
            			$("#startBtn").attr("disabled", false);
            		}
						});
            	function clock() {
            		var now = new Date();
            		
            	    var todayYear= now.getFullYear();
            	    var todayMon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
            	    var todayDay = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
            	    var week = new Array('일', '월', '화', '수', '목', '금', '토');
            	    var chan_val = todayYear + '년 ' + todayMon + '월 ' + todayDay + '일 ' + week[now.getDay()] + '요일';
					$("#todayDay").text(chan_val);
					
					var nowHour = now.getHours();
					var nowMin = now.getMinutes();
					var nowSecond = now.getSeconds();
					if (nowHour < 10){ nowHour = "0" + nowHour; }
					if (nowMin < 10){ nowMin = "0" + nowMin; } 
					if (nowSecond < 10){ nowSecond = "0" + nowSecond; }
					
					var nowTime = nowHour + " : " + nowMin + " : " + nowSecond;
					$("#nowTime").text(nowTime);
				}
            </script>
            
           <c:forEach begin="0" end="${myTime.size() -1}" var="i">
            <input type="hidden" id="wstart${i}" value="${myTime.get(i).wstart }">
            <input type="hidden" id="wend${i}" value="${myTime.get(i).wend }">
            <input type="hidden" id="wdate${i}" value="${myTime.get(i).wdate }">
            <input type="hidden" id="wstatus${i}" value="${myTime.get(i).wstatus }">
            </c:forEach>
            
            		
                       <!-- 요일별 시간 -->
            			
            		<input type="hidden" id="listSize" value="${workTimeList.size()}">
            <c:forEach begin="0" var="i" end="${workTimeList.size()-1 }">
            <input type="hidden" id="dayOfTheWeek${i}" value="${workTimeList.get(i).dayOfTheWeek}">
            <input type="hidden" id="workingTime${i}" value="${workTimeList.get(i).workingTime}">
            <input type="hidden" id="quittingTime${i}" value="${workTimeList.get(i).quittingTime}">
            <input type="hidden" id="workingSetNo${i}" value="${workTimeList.get(i).workingSetNo}">
            	<c:choose>
            		<c:when test="${workTimeList.get(i).workingSetTime eq '기본'}">
            			<c:choose>
            				<c:when test="${workTimeList.get(i).dayOfTheWeek eq '월' }">
            					<script type="text/javascript">
		            				$(document).ready(function() {
		            					var now = new Date();
		            					var week = new Array('일', '월', '화', '수', '목', '금', '토');
		            					
		            					var dayOfTheWeek = "${workTimeList.get(i).dayOfTheWeek}";
		            					var todayYear= now.getFullYear();
		                        	    var todayMon = now.getMonth();
		                        	    var todayDay = now.getDate();
		                        	    
		            					var time = '${workTimeList.get(i).workingTime}'.split(":");

		            					var startHour = time[0];
		            					var startMin = time[1];
		            					var startSec = time[2];
		            					
		            					var time2 = '${workTimeList.get(i).quittingTime}'.split(":");
		            					var leaveHour = time2[0];
		            					var leaveMin = time2[1];
		            					var leaveSec = time2[2];
		            					
		            					var work = new Date(todayYear, todayMon, todayDay, startHour, startMin, startSec);
		            					var leave = new Date(todayYear, todayMon, todayDay, leaveHour, leaveMin, leaveSec); 
										
		            					console.log(work);
		            					console.log(leave);
		            					console.log(dayOfTheWeek);
		            					console.log(week[now.getDay()]);
		            					
		            					if(dayOfTheWeek == week[now.getDay()]){
												$("#startBtn").click(function() {
													$("#workingSetNo").val('${workTimeList.get(i).workingSetNo}');
													$('#status').val('start');
													now = new Date();
													var startTime = now-work;
													var 시 = Math.floor((startTime % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
													var 분 = Math.floor((startTime % (1000 * 60 * 60)) / (1000 * 60));
													var 초 = Math.floor((startTime % (1000 * 60)) / 1000);
													
													if(startTime <= 0){
														$("#wstatus").val("출근");
													} else{
														$("#wstatus").val("지각");
													}
													
													
												}); 
												
												$("#endBtn").click(function() {
													$("#workingSetNo").val('${workTimeList.get(i).workingSetNo}');
													$('#status').val('end');
													now = new Date();
													var leaveTime = now-leave;
													console.log(leaveTime);
													var 시 = Math.floor((leaveTime % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
													var 분= Math.floor((leaveTime % (1000 * 60 * 60)) / (1000 * 60));
													var 초= Math.floor((leaveTime % (1000 * 60)) / 1000);
													if(leaveTime <= 0){
														$("#wstatus").val("조퇴");
													} else{
														$("#wstatus").val("퇴근");
													}
													
												});

											}
									});
            					</script>
            				</c:when>
            				<c:when test="${workTimeList.get(i).dayOfTheWeek eq '화' }">
            					<script type="text/javascript">
		            				$(document).ready(function() {
		            					var now = new Date();
		            					var week = new Array('일', '월', '화', '수', '목', '금', '토');
		            					var dayOfTheWeek = '${workTimeList.get(i).dayOfTheWeek}';
		            					var todayYear= now.getFullYear();
		                        	    var todayMon = now.getMonth();
		                        	    var todayDay = now.getDate();
		                        	    
		            					var time = '${workTimeList.get(i).workingTime}'.split(":");
		            					var startHour = time[0];
		            					var startMin = time[1];
		            					var startSec = time[2];
		            					
		            					var time2 = '${workTimeList.get(i).quittingTime}'.split(":");
		            					var leaveHour = time2[0];
		            					var leaveMin = time2[1];
		            					var leaveSec = time2[2];
		            					
		            					var work = new Date(todayYear, todayMon, todayDay, startHour, startMin, startSec);
		            					var leave = new Date(todayYear, todayMon, todayDay, leaveHour, leaveMin, leaveSec); 
											if(dayOfTheWeek == week[now.getDay()]){
												$("#startBtn").click(function() {
													$("#workingSetNo").val('${workTimeList.get(i).workingSetNo}');
													$('#status').val('start');
													now = new Date();
													var startTime = now-work;
													var 시 = Math.floor((startTime % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
													var 분 = Math.floor((startTime % (1000 * 60 * 60)) / (1000 * 60));
													var 초 = Math.floor((startTime % (1000 * 60)) / 1000);
													
													if(startTime <= 0){
														$("#wstatus").val("출근");
													} else{
														$("#wstatus").val("지각");
													}
													
													
												}); 
												
												$("#endBtn").click(function() {
													$("#workingSetNo").val('${workTimeList.get(i).workingSetNo}');
													$('#status').val('end');
													now = new Date();
													var leaveTime = now-leave;
													console.log(leaveTime);
													var 시 = Math.floor((leaveTime % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
													var 분= Math.floor((leaveTime % (1000 * 60 * 60)) / (1000 * 60));
													var 초= Math.floor((leaveTime % (1000 * 60)) / 1000);
													if(leaveTime <= 0){
														$("#wstatus").val("조퇴");
													} else{
														$("#wstatus").val("퇴근");
													}
													
												});

											}
									});
            					</script>
            				</c:when>
            				<c:when test="${workTimeList.get(i).dayOfTheWeek eq '수' }">
            					<script type="text/javascript">
		            				$(document).ready(function() {
		            					var now = new Date();
		            					var week = new Array('일', '월', '화', '수', '목', '금', '토');
		            					var dayOfTheWeek = '${workTimeList.get(i).dayOfTheWeek}';
		            					var todayYear= now.getFullYear();
		                        	    var todayMon = now.getMonth();
		                        	    var todayDay = now.getDate();
		                        	    
		            					var time = '${workTimeList.get(i).workingTime}'.split(":");
		            					var startHour = time[0];
		            					var startMin = time[1];
		            					var startSec = time[2];
		            					
		            					var time2 = '${workTimeList.get(i).quittingTime}'.split(":");
		            					var leaveHour = time2[0];
		            					var leaveMin = time2[1];
		            					var leaveSec = time2[2];
		            					
		            					var work = new Date(todayYear, todayMon, todayDay, startHour, startMin, startSec);
		            					var leave = new Date(todayYear, todayMon, todayDay, leaveHour, leaveMin, leaveSec); 
											if(dayOfTheWeek == week[now.getDay()]){
												$("#startBtn").click(function() {
													$("#workingSetNo").val('${workTimeList.get(i).workingSetNo}');
													$('#status').val('start');
													now = new Date();
													var startTime = now-work;
													var 시 = Math.floor((startTime % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
													var 분 = Math.floor((startTime % (1000 * 60 * 60)) / (1000 * 60));
													var 초 = Math.floor((startTime % (1000 * 60)) / 1000);
													
													if(startTime <= 0){
														$("#wstatus").val("출근");
													} else{
														$("#wstatus").val("지각");
													}
													
													
												}); 
												
												$("#endBtn").click(function() {
													$("#workingSetNo").val('${workTimeList.get(i).workingSetNo}');
													$('#status').val('end');
													now = new Date();
													var leaveTime = now-leave;
													console.log(leaveTime);
													var 시 = Math.floor((leaveTime % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
													var 분= Math.floor((leaveTime % (1000 * 60 * 60)) / (1000 * 60));
													var 초= Math.floor((leaveTime % (1000 * 60)) / 1000);
													if(leaveTime <= 0){
														$("#wstatus").val("조퇴");
													} else{
														$("#wstatus").val("퇴근");
													}
													
												});

											}
									});
            					</script>
            				</c:when>
            				<c:when test="${workTimeList.get(i).dayOfTheWeek eq '목' }">
            					<script type="text/javascript">
		            				$(document).ready(function() {
		            					var now = new Date();
		            					var week = new Array('일', '월', '화', '수', '목', '금', '토');
		            					var dayOfTheWeek = '${workTimeList.get(i).dayOfTheWeek}';
		            					var todayYear= now.getFullYear();
		                        	    var todayMon = now.getMonth();
		                        	    var todayDay = now.getDate();
		                        	    
		            					var time = '${workTimeList.get(i).workingTime}'.split(":");
		            					var startHour = time[0];
		            					var startMin = time[1];
		            					var startSec = time[2];
		            					
		            					var time2 = '${workTimeList.get(i).quittingTime}'.split(":");
		            					var leaveHour = time2[0];
		            					var leaveMin = time2[1];
		            					var leaveSec = time2[2];
		            					
		            					var work = new Date(todayYear, todayMon, todayDay, startHour, startMin, startSec);
		            					var leave = new Date(todayYear, todayMon, todayDay, leaveHour, leaveMin, leaveSec); 
											if(dayOfTheWeek == week[now.getDay()]){
												$("#startBtn").click(function() {
													$("#workingSetNo").val('${workTimeList.get(i).workingSetNo}');
													$('#status').val('start');
													now = new Date();
													var startTime = now-work;
													var 시 = Math.floor((startTime % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
													var 분 = Math.floor((startTime % (1000 * 60 * 60)) / (1000 * 60));
													var 초 = Math.floor((startTime % (1000 * 60)) / 1000);
													
													if(startTime <= 0){
														$("#wstatus").val("출근");
													} else{
														$("#wstatus").val("지각");
													}
													
													
												}); 
												
												$("#endBtn").click(function() {
													$("#workingSetNo").val('${workTimeList.get(i).workingSetNo}');
													$('#status').val('end');
													now = new Date();
													var leaveTime = now-leave;
													console.log(leaveTime);
													var 시 = Math.floor((leaveTime % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
													var 분= Math.floor((leaveTime % (1000 * 60 * 60)) / (1000 * 60));
													var 초= Math.floor((leaveTime % (1000 * 60)) / 1000);
													if(leaveTime <= 0){
														$("#wstatus").val("조퇴");
													} else{
														$("#wstatus").val("퇴근");
													}
													
												});

											}
									});
            					</script>
            				</c:when>
            				<c:when test="${workTimeList.get(i).dayOfTheWeek eq '금' }">
            					<script type="text/javascript">
		            				$(document).ready(function() {
		            					var now = new Date();
		            					var week = new Array('일', '월', '화', '수', '목', '금', '토');
		            					var dayOfTheWeek = '${workTimeList.get(i).dayOfTheWeek}';
		            					var todayYear= now.getFullYear();
		                        	    var todayMon = now.getMonth();
		                        	    var todayDay = now.getDate();
		                        	    
		            					var time = '${workTimeList.get(i).workingTime}'.split(":");
		            					var startHour = time[0];
		            					var startMin = time[1];
		            					var startSec = time[2];
		            					
		            					var time2 = '${workTimeList.get(i).quittingTime}'.split(":");
		            					var leaveHour = time2[0];
		            					var leaveMin = time2[1];
		            					var leaveSec = time2[2];
		            					
		            					var work = new Date(todayYear, todayMon, todayDay, startHour, startMin, startSec);
		            					var leave = new Date(todayYear, todayMon, todayDay, leaveHour, leaveMin, leaveSec); 
											if(dayOfTheWeek == week[now.getDay()]){
												$("#startBtn").click(function() {
													$("#workingSetNo").val('${workTimeList.get(i).workingSetNo}');
													$('#status').val('start');
													now = new Date();
													var startTime = now-work;
													var 시 = Math.floor((startTime % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
													var 분 = Math.floor((startTime % (1000 * 60 * 60)) / (1000 * 60));
													var 초 = Math.floor((startTime % (1000 * 60)) / 1000);
													
													if(startTime <= 0){
														$("#wstatus").val("출근");
													} else{
														$("#wstatus").val("지각");
													}
													
													
												}); 
												
												$("#endBtn").click(function() {
													$("#workingSetNo").val('${workTimeList.get(i).workingSetNo}');
													$('#status').val('end');
													now = new Date();
													var leaveTime = now-leave;
													console.log(leaveTime);
													var 시 = Math.floor((leaveTime % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
													var 분= Math.floor((leaveTime % (1000 * 60 * 60)) / (1000 * 60));
													var 초= Math.floor((leaveTime % (1000 * 60)) / 1000);
													if(leaveTime <= 0){
														$("#wstatus").val("조퇴");
													} else{
														$("#wstatus").val("퇴근");
													}
													
												});

											}
									});
            					</script>
            				</c:when>
            				<c:when test="${workTimeList.get(i).dayOfTheWeek eq '토' }">
            					<script type="text/javascript">
		            				$(document).ready(function() {
		            					var now = new Date();
		            					var week = new Array('일', '월', '화', '수', '목', '금', '토');
		            					var dayOfTheWeek = '${workTimeList.get(i).dayOfTheWeek}';
		            					var todayYear= now.getFullYear();
		                        	    var todayMon = now.getMonth();
		                        	    var todayDay = now.getDate();
		                        	    
		            					var time = '${workTimeList.get(i).workingTime}'.split(":");
		            					var startHour = time[0];
		            					var startMin = time[1];
		            					var startSec = time[2];
		            					
		            					var time2 = '${workTimeList.get(i).quittingTime}'.split(":");
		            					var leaveHour = time2[0];
		            					var leaveMin = time2[1];
		            					var leaveSec = time2[2];
		            					
		            					var work = new Date(todayYear, todayMon, todayDay, startHour, startMin, startSec);
		            					var leave = new Date(todayYear, todayMon, todayDay, leaveHour, leaveMin, leaveSec); 
											if(dayOfTheWeek == week[now.getDay()]){
												$("#startBtn").click(function() {
													$("#workingSetNo").val('${workTimeList.get(i).workingSetNo}');
													$('#status').val('start');
													now = new Date();
													var startTime = now-work;
													var 시 = Math.floor((startTime % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
													var 분 = Math.floor((startTime % (1000 * 60 * 60)) / (1000 * 60));
													var 초 = Math.floor((startTime % (1000 * 60)) / 1000);
													
													if(startTime <= 0){
														$("#wstatus").val("출근");
													} else{
														$("#wstatus").val("지각");
													}
													
													
												}); 
												
												$("#endBtn").click(function() {
													$("#workingSetNo").val('${workTimeList.get(i).workingSetNo}');
													$('#status').val('end');
													now = new Date();
													var leaveTime = now-leave;
													console.log(leaveTime);
													var 시 = Math.floor((leaveTime % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
													var 분= Math.floor((leaveTime % (1000 * 60 * 60)) / (1000 * 60));
													var 초= Math.floor((leaveTime % (1000 * 60)) / 1000);
													if(leaveTime <= 0){
														$("#wstatus").val("조퇴");
													} else{
														$("#wstatus").val("퇴근");
													}
													
												});

											}
									});
            					</script>
            				</c:when>
            				<c:when test="${workTimeList.get(i).dayOfTheWeek eq '일' }">
            					<script type="text/javascript">
		            				$(document).ready(function() {
		            					var now = new Date();
		            					var week = new Array('일', '월', '화', '수', '목', '금', '토');
		            					var dayOfTheWeek = '${workTimeList.get(i).dayOfTheWeek}';
		            					var todayYear= now.getFullYear();
		                        	    var todayMon = now.getMonth();
		                        	    var todayDay = now.getDate();
		                        	    
		            					var time = '${workTimeList.get(i).workingTime}'.split(":");
		            					var startHour = time[0];
		            					var startMin = time[1];
		            					var startSec = time[2];
		            					
		            					var time2 = '${workTimeList.get(i).quittingTime}'.split(":");
		            					var leaveHour = time2[0];
		            					var leaveMin = time2[1];
		            					var leaveSec = time2[2];
		            					
		            					var work = new Date(todayYear, todayMon, todayDay, startHour, startMin, startSec);
		            					var leave = new Date(todayYear, todayMon, todayDay, leaveHour, leaveMin, leaveSec); 
											if(dayOfTheWeek == week[now.getDay()]){
												$("#startBtn").click(function() {
													$("#workingSetNo").val('${workTimeList.get(i).workingSetNo}');
													$('#status').val('start');
													now = new Date();
													var startTime = now-work;
													var 시 = Math.floor((startTime % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
													var 분 = Math.floor((startTime % (1000 * 60 * 60)) / (1000 * 60));
													var 초 = Math.floor((startTime % (1000 * 60)) / 1000);
													
													if(startTime <= 0){
														$("#wstatus").val("출근");
													} else{
														$("#wstatus").val("지각");
													}
													
													
												}); 
												
												$("#endBtn").click(function() {
													$("#workingSetNo").val('${workTimeList.get(i).workingSetNo}');
													$('#status').val('end');
													now = new Date();
													var leaveTime = now-leave;
													console.log(leaveTime);
													var 시 = Math.floor((leaveTime % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
													var 분= Math.floor((leaveTime % (1000 * 60 * 60)) / (1000 * 60));
													var 초= Math.floor((leaveTime % (1000 * 60)) / 1000);
													if(leaveTime <= 0){
														$("#wstatus").val("조퇴");
													} else{
														$("#wstatus").val("퇴근");
													}
													
												});

											}
									});
            					</script>
            				</c:when>
            			</c:choose>
            		</c:when>
            		<c:when test="${workTimeList.get(i).workingSetTime eq '자율' }">
            		
            		</c:when>
            	</c:choose>
            </c:forEach>

            
            <!-- 달력 -->
                <div class="cal_top">
        <a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit"><img class="leftArrow" src="${ contextPath }/resources/images/arrow.png"></span></a>
        <span id="cal_top_year"></span>
        <span id="cal_top_month"></span>
        <a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit"><img class="rightArrow" src="${ contextPath }/resources/images/arrow.png"></span></a>
    </div>
    <div id="cal_tab" class="cal">
    </div>
 
<script type="text/javascript">
var size = ${myTime.size()};
var start="";
var startdate="";
var sdate = "";
var textdate = "";
var syear = "";
var smon = "";
var sday = "";

var end="";
var enddate="";
var edate="";
var eyear ="";
var emon ="";
var eday = "";
var tdate ="";


var now = new Date();

var todayYear= now.getFullYear();
var todayMon = now.getMonth()+1;
var todayDay = now.getDate();

var todayDate = todayYear+"/"+("0" + todayMon).slice(-2)+"/"+("0" + todayDay).slice(-2);
    var today = null;
    var year = null;
    var month = null;
    var firstDay = null;
    var lastDay = null;
    var $tdDay = null;
    var $tdSche = null;
    var jsonData = null;
    $(document).ready(function() {
        drawCalendar();
        initDate();
        drawDays();
        drawSche();
        
        for(var j = 0; j < size; j++){
			if($("#wstart"+j).val() != ""){
			start = $("#wstart"+j).val();
				
			startdate = $("#wdate"+j).val();
			sdate = startdate.split("/");
			textdate = "20"+startdate;
			
			syear = "20"+sdate[0];
			smon = sdate[1];
			sday = sdate[2] * 1 +"";
			
    	    if(textdate == todayDate){
				$("#startText").val(start);
			}
    	    
    	    inputStartTime();
    	    
			}
	}
        
        
        
        for(var i = 0; i < size; i++){
        	if($("#wend"+i).val() != ""){
        		end = $("#wend"+i).val();
        		enddate = $("#wdate"+i).val();
        		edate = enddate.split("/");
        		textdate2="20"+enddate;
        		
        		eyear = "20"+edate[0];
        		emon = edate[1];
        		eday = edate[2] * 1 +"";
        		
        		if(textdate2 == todayDate){
    				$("#endText").val(end);
    			}

                inputEndTime();
                
        	}
        }
        
        $("#movePrevMonth").on("click", function(){movePrevMonth();});
        $("#moveNextMonth").on("click", function(){moveNextMonth();});
    });
    
    //Calendar 그리기
    function drawCalendar(){
        var setTableHTML = "";
        setTableHTML+='<table class="calendar">';
        setTableHTML+='<tr><th style="color:red;">일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th style="color:blue;">토</th></tr>';
        for(var i=0;i<6;i++){
            setTableHTML+='<tr height="100">';
            for(var j=0;j<7;j++){
                setTableHTML+='<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap">';
                setTableHTML+='    <div class="cal-day"></div>';
                setTableHTML+='    <div class="cal-schedule"><div></div><div></div></div>';
                setTableHTML+='</td>';
            }
            setTableHTML+='</tr>';
        }
        setTableHTML+='</table>';
        $("#cal_tab").html(setTableHTML);
    }
    
    //날짜 초기화
    function initDate(){
        $tdDay = $("td div.cal-day")
        $tdSche = $("td div.cal-schedule")
        dayCount = 0;
        today = new Date();
        year = today.getFullYear();
        month = today.getMonth()+1;
        if(month < 10){month = "0"+month;}
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
        
    }
    
    //calendar 날짜표시
    function drawDays(){
        $("#cal_top_year").text(year);
        $("#cal_top_month").text(month);
        for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
            $tdDay.eq(i).text(++dayCount);
        }
        for(var i=0;i<42;i+=7){
            $tdDay.eq(i).css("color","red");
        }
        for(var i=6;i<42;i+=7){
            $tdDay.eq(i).css("color","blue");
        }
    }
    
    //calendar 월 이동
    function movePrevMonth(){
        month--;
        if(month<=0){
            month=12;
            year--;
        }
        if(month<10){
            month=String("0"+month);
        }
        getNewInfo();
        }
    
    function moveNextMonth(){
        month++;
        if(month>12){
            month=1;
            year++;
        }
        if(month<10){
            month=String("0"+month);
        }
        getNewInfo();
    }
    
    //정보갱신
    function getNewInfo(){
        for(var i=0;i<42;i++){
            $tdDay.eq(i).text("");
            $tdSche.eq(i).text("");
        }
        dayCount=0;
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
        drawDays();
        drawSche();
        inputStartTime();
        inputEndTime();
    }
    
    //2019-08-27 추가본
    
    //데이터 등록
    function setData(){
        jsonData = 
        {
            "2020":{
            	"05":{
            		"31":"바다의 날"
            	}
                ,"07":{
                    "17":"제헌절"
                }
                ,"08":{
                    "7":"칠석"
                    ,"15":"광복절"
                    ,"23":"처서"
                }
                ,"09":{
                    "30":"추석"
                    ,"22":"추분"
                }
                ,"10":{
                	"1":"추석"
                	, "2":"추석"
                }
                ,"11":{
                	"7":"입동"
                }
            }
        	
        }
    }
    //출근시간 넣기
    function inputStartTime(){
        var dateMatch = null;
        for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
            var txt = "";
            txt = syear;
            /* txt =selectDate[year];
            console.log(selectDate[year]); */
            if(txt == year){

                /* txt = selectDate[year][month]; */
                txt = syear + "/" + smon;
                if(txt == year + "/" + month){
                    txt = syear + "/" + smon + "/" + sday;
                    if(txt == year + "/" + month + "/" + i){
                    	txt = start;
	                    dateMatch = firstDay.getDay() + i -1; 
	                    $tdSche.eq(dateMatch).find("div:first").text("출근 : "+txt);
                    }
                }
            }
        }
    }
  	//퇴근시간 넣기
    function inputEndTime(){
        var dateMatch = null;
        for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
            var txt = "";
            txt = eyear
            /* txt =selectDate[year];
            console.log(selectDate[year]); */
            if(txt == year){
                /* txt = selectDate[year][month]; */
                txt = eyear + "/" + emon;
                if(txt == year + "/" + month){
                    txt = eyear + "/" + emon + "/" + eday;
                    if(txt == year + "/" + month + "/" + i){
                    	txt = end;
	                    dateMatch = firstDay.getDay() + i -1; 
	                    $tdSche.eq(dateMatch).find("div:last").text("퇴근 : "+txt);
                    }
                }
            }
        }
    }
    //스케줄 그리기
    function drawSche(){
        setData();
        var dateMatch = null;
        for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
            var txt = "";
            txt =jsonData[year];
            if(txt){
                txt = jsonData[year][month];
                if(txt){
                    txt = jsonData[year][month][i];
                    dateMatch = firstDay.getDay() + i -1; 
                    $tdSche.eq(dateMatch).text(txt);               
                }
            }
        }
    }
 
</script>
		</div>
	</section>
</body>
</html>