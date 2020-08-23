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
	.dateText{
		font-family: Noto Sans KR;
		font-style: normal;
		font-weight: 500;
		font-size: 21px;
		line-height: 29px;
		color: #004771;
		margin-left: 10px;
		margin-right: 10px;
	}
	#search {
       border-radius:15px;
       border:1px solid #29A2F7;
       width:230px;
       height: 25px;
    }
    #empWorkTable{
    	width:100%;
        border-collapse: collapse;
        text-align:center;
        margin-top: 10px;
    }
    #empWorkTable tr{
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
    .sat{
    	color: blue;
    }
    .sun{
    	color: red;
    }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/atManagement/atManagementAside.jsp"></jsp:include>
	<section>
        <div class="inner">
            <div id="inner-title">
            <span>직원 근무 관리</span>
            <br>
            <hr>
            <br>
            </div>
            <div align="center" style="vertical-align: middle;">
            	<span><img class="leftArrow" src="${ contextPath }/resources/images/arrow.png"></span>
            	<span class="dateText">2020년 8월 10일 ~ 17일</span>
            	<span><img class="rightArrow" src="${ contextPath }/resources/images/arrow.png"></span>
            </div>
            <div align="right">
            <table>
            	<tr>
            		<td width="230px"><input type="text" id="search" placeholder=" 검색내용을 입력하세요"></td>
         			<td width="10"><img src="${contextPath}/resources/images/searchBtn.png" onclick="location.href='#'" style="cursor: pointer;"></td>
            	</tr>
            </table>
            </div>
            <table id="empWorkTable">
            	<tr>
                		<th>이름</th>
                		<th>소속</th>
                		<th>누적시간</th>
                		<th>월</th>
                		<th>화</th>
                		<th>수</th>
                		<th>목</th>
                		<th>금</th>
                		<th class="sat">토</th>
                		<th class="sun">일</th>
                	</tr>
                	<tr>
                		<td rowspan="3">헤일리최</td>
                		<td rowspan="3">기술지원팀</td>
                		<td>총 근무</td>
                		<td>6시간</td>
                		<td>6시간</td>
                		<td>6시간</td>
                		<td>6시간</td>
                		<td>6시간</td>
                		<td class="sat">6시간</td>
                		<td class="sun">0시간</td>
                	</tr>
                	<tr>
                		<td>기본 근무</td>
                		<td>6시간</td>
                		<td>6시간</td>
                		<td>6시간</td>
                		<td>6시간</td>
                		<td>6시간</td>
                		<td class="sat">6시간</td>
                		<td class="sun">0시간</td>
                	</tr>
                	<tr>
                		<td>연장 근무</td>
                		<td>6시간</td>
                		<td>6시간</td>
                		<td>6시간</td>
                		<td>6시간</td>
                		<td>6시간</td>
                		<td class="sat">6시간</td>
                		<td class="sun">0시간</td>
                	</tr>
                	
            </table>
		</div>
	</section>
</body>
</html>