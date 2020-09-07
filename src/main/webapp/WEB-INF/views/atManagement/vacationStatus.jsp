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
    #overtimeTable{
    	width: 100%;
        border-collapse: collapse;
        text-align:center;
    }
    #overtimeTable tr{
    	border-bottom: 0.5px solid #9F9F9F;
		border-top: 0.5px solid #9F9F9F;
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
    td{
    	font-family: Noto Sans KR;
		font-style: normal;
		font-weight: normal;
		font-size: 14px;
		line-height: 20px;
		color: #676767;
		height: 30px;
    }
    .btn{
    	outline: 0;
    	border : 0;
    	color: #004771;
    	background-color: #fafafa;
    }
    select{
    	border-radius: 0;
		border: 0;
		outline-style: none;
		margin-bottom: 10px;
		background-color: #fafafa;
		color: #004771;
    }
    .worktime{
    	display: inline-block;
    	width: 220px;
    	height: 120px;
    	background-color: white;
    	border: 1px solid #929292;
    	padding-top: 20px;
    	padding-left: 10px;
    	margin-right: 10px;
    	margin-top: auto;
    	margin-bottom: auto;
    	vertical-align: middle;
    	
    }
    .worktime label{
    	font-family: Noto Sans KR;
		font-size: 12px;
		line-height: 25px;
		color: #929292;
    }
    
    .time{
    	display: inline-block;
    	width: 630px;
    	height: 140px;
    	background-color: white;
    	border: 1px solid #929292;
    	font-family: Noto Sans KR;
		font-size: 12px;
		line-height: 30px;
		margin-top: auto;
    	margin-bottom: auto;
    	vertical-align: middle;
    	color: #929292;
    }
    .centerBox{
    	margin-left: auto;
    	margin-right: auto;
    	margin-bottom: 30px;
    }
    .vacationTable{
    	width:100%;
    	height: 100%;
        border-collapse: collapse;
        text-align:center;
        vertical-align: middle;
    }
    .vacationTable tr{
    	border-bottom: 0.5px solid #9F9F9F;
    }
    .vacationTable td{
    	width: 100px;
    }
    .box{
    	display: inline-block;
    	margin-bottom: 20px;
    }
    .boxText{
    	display: block;
    	color: #004771;
    	font-family: Noto Sans KR;
		font-style: normal;
		font-weight: normal;
		font-size: 14px;
		line-height: 20px;
    }
    .long{
    	width: 200px;
    }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/atManagement/atManagementAside.jsp"></jsp:include>
	<section>
        <div class="inner">
            <div id="inner-title">
            <span>휴가 현황</span>
            <br>
            <hr>
            <br>
            </div>
            <div class="centerBox">
            <div class="box">
            <label class="boxText">내 휴가 정보</label>
            <div class="worktime">
            	<label>입사일 : 2018-09-18</label><br>
            	<label>지급된 연차 일수 : 26일</label><br>
            	<label>잔여 연차 일수 : 23일</label><br>
            	<label>사용한 연차 일수 : 3일</label>
            </div>
            </div>
            <!-- 휴가 종류 -->
            <div class="box">
            <label class="boxText">휴가 사용 일수</label>
            <div class="time">
            	<table class="vacationTable">
            		<tr>
            			<td>연차</td>
            			<td>반차</td>
            			<td>휴가</td>
            			<td>교육/훈련</td>
            			<td>조퇴</td>
            			<td>경조사</td>
            			<td>출산</td>
            			<td>병가</td>
            		</tr>
            		<tr height="100px">
            			<td>2일</td>
            			<td>0일</td>
            			<td>0일</td>
            			<td>0일</td>
            			<td>0일</td>
            			<td>0일</td>
            			<td>0일</td>
            			<td>0일</td>
            		</tr>
            	</table>
            </div>
            </div>
            </div>
            <!-- 내 휴가 현황 -->
            <div class="box">
            <label class="boxText">휴가 신청 내역</label>
            <table id="overtimeTable">
                	<tr>
                		<th>신청자</th>
                		<th>소속</th>
                		<th class="long">신청기간</th>
                		<th>종류</th>
                		<th>일수</th>
                		<th>상태</th>
                		<th>상세</th>
                	</tr>
                	<tr>
                		<td>이름</td>
                		<td>기술지원팀</td>
                		<td>2020-08-03 ~ 2020-08-04</td>
                		<td>연차</td>
                		<td>2일</td>
                		<td>결재완료</td>
                		<td><button class="btn">상세</button></td>
                	</tr>
                	<tr>
                		<td>이름</td>
                		<td>기술지원팀</td>
                		<td>2020-08-03 ~ 2020-08-04</td>
                		<td>연차</td>
                		<td>2일</td>
                		<td>결재완료</td>
                		<td><button class="btn">상세</button></td>
                	</tr>
                	<tr>
                		<td>이름</td>
                		<td>기술지원팀</td>
                		<td>2020-08-03 ~ 2020-08-04</td>
                		<td>연차</td>
                		<td>2일</td>
                		<td>결재완료</td>
                		<td><button class="btn">상세</button></td>
                	</tr>
                	<tr>
                		<td>이름</td>
                		<td>기술지원팀</td>
                		<td>2020-08-03 ~ 2020-08-04</td>
                		<td>연차</td>
                		<td>2일</td>
                		<td>결재완료</td>
                		<td><button class="btn">상세</button></td>
                	</tr>
                	<tr>
                		<td>이름</td>
                		<td>기술지원팀</td>
                		<td>2020-08-03 ~ 2020-08-04</td>
                		<td>연차</td>
                		<td>2일</td>
                		<td>결재완료</td>
                		<td><button class="btn">상세</button></td>
                	</tr>
                	<tr>
                		<td>이름</td>
                		<td>기술지원팀</td>
                		<td>2020-08-03 ~ 2020-08-04</td>
                		<td>연차</td>
                		<td>2일</td>
                		<td>결재완료</td>
                		<td><button class="btn">상세</button></td>
                	</tr>
                	<tr>
                		<td>이름</td>
                		<td>기술지원팀</td>
                		<td>2020-08-03 ~ 2020-08-04</td>
                		<td>연차</td>
                		<td>2일</td>
                		<td>결재완료</td>
                		<td><button class="btn">상세</button></td>
                	</tr>
                	<tr>
                		<td>이름</td>
                		<td>기술지원팀</td>
                		<td>2020-08-03 ~ 2020-08-04</td>
                		<td>연차</td>
                		<td>2일</td>
                		<td>결재완료</td>
                		<td><button class="btn">상세</button></td>
                	</tr>
                	<tr>
                		<td>이름</td>
                		<td>기술지원팀</td>
                		<td>2020-08-03 ~ 2020-08-04</td>
                		<td>연차</td>
                		<td>2일</td>
                		<td>결재완료</td>
                		<td><button class="btn">상세</button></td>
                	</tr>
                	<tr>
                		<td>이름</td>
                		<td>기술지원팀</td>
                		<td>2020-08-03 ~ 2020-08-04</td>
                		<td>연차</td>
                		<td>2일</td>
                		<td>결재완료</td>
                		<td><button class="btn">상세</button></td>
                	</tr>
                </table>
                </div>
		</div>
	</section>
</body>
</html>