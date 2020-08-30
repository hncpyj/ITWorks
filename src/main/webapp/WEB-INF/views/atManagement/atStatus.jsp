<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            			<td><a class="btn" href="insertObjectionForm.at">출/퇴근 이의 신청</a></td>
            		</tr>
            		<tr>
            			<td class="timeText">현재 접속 IP : 192.168.30.234</td>
            			<td><button class="timeBtn">퇴근</button><input type="text"></td>
            			<td><a class="btn" href="insertCorrectionForm.at">연장 근무 신청</a></td>
            		</tr>
            	</table>
            </div>
            </div>
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
                setTableHTML+='    <div class="cal-schedule"></div>';
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
    }
    
    //2019-08-27 추가본
    
    //데이터 등록
    function setData(){
        jsonData = 
        {
            "2019":{
                "07":{
                    "17":"제헌절"
                }
                ,"08":{
                    "7":"칠석"
                    ,"15":"광복절"
                    ,"23":"처서"
                }
                ,"09":{
                    "13":"추석"
                    ,"23":"추분"
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