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
    .middleName{
    	color: #004771;
        font-family: Noto Sans KR;
        font-style: normal;
        font-size: 14px;
    }
    #usageStatus{
    	width: 500px;
    }
    .leftTable{
    	width:100%;
        border-collapse: collapse;
    }
    .saveBtn{
    	outline: 0;
    	border : 1px solid #929292;
    	background-color: white;
    	color: #004771;
    	width: 80px;
    	margin-top: 10px;
    	margin-right: 10px;
    	margin-bottom: 10px;
    }
    
    .explain{
    	margin-top: 10px;
    	margin-bottom: 10px;
    	font-family: Noto Sans KR;
		font-style: normal;
		font-weight: normal;
		font-size: 12px;
		line-height: 17px;
		color: #444444;
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
    .dayBox{
    	width: 20px;
    	height: auto;
    }
    .dayTable{
    	width:100%;
        border-collapse: collapse;
    }
    .dayTable td{
    	width: 70px;
    }
    .underline{
    	border-bottom: 0.5px solid #9F9F9F;
    }
    .topline{
    	border-top: 0.5px solid #9F9F9F;
    }
    .line{
    	border-top: 0.5px solid #9F9F9F;
    	border-bottom: 0.5px solid #9F9F9F;
    }
    .vacationKindTable{
    	margin-top: 10px;
    }
    .vacationKindTable{
    	width:100%;
        border-collapse: collapse;
        text-align:center;
    }
    .vacationKindTable tr{
    	border-top: 0.5px solid #9F9F9F;
    	border-bottom: 0.5px solid #9F9F9F;
    }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/atManagement/atManagementAside.jsp"></jsp:include>
	    <section>
        <div class="inner">
            <div id="inner-title">
            <span>휴가 기본 설정</span>
            <br>
            <hr>
            <br>
            </div>
            <form action="">
                <table id="usageStatus" class="leftTable">
                    <tr>
                        <td class="middleName">휴가 사용 여부</td>
                        <td><input type="radio" name="vacationState"></td>
                        <td>사용함</td>
                        <td><input type="radio" name="vacationState"></td>
                        <td>사용 안함</td>
                    </tr>
                    
                    <tr>
                        <td colspan="5"><button class="saveBtn">저장</button></td>
                    </tr>
                </table>
            	</form>
            	<div class="conditionBox">
		            <div class="middleName">휴가 생성 조건</div>
		            <div class="explain">
		            - 설정한 휴가 생성 기준으로 매년 생성일자(회계연도 기준) 또는 사용자 입사일(입사일 기준)에 휴가가 자동 생성됩니다.<br>
					- 조직에 속하지 않거나 입사일이 없는 사용자는 휴가가 생성되지 않습니다.<br>
					- 사용하던 휴가 생성 기준을 변경 적용하는 경우, 기존 휴가 데이터는 초기화됩니다. (기존 휴가 생성분 삭제 및 새 기준에 맞추어 재생성)
		            </div>
		            <form action="">
		            <table>
		            	<tr>
	                        <td><input type="radio" name="standard"></td>
	                        <td>회계연도 기준</td>
	                        <td><input type="radio" name="standard"></td>
	                        <td>입사일 기준</td>
		            	</tr>
		            </table>
		            <table class="dayTable">
		            	<tr class="topline">
		            		<th rowspan="6">휴가 일수</th>
		            		<td>N(입사년도)</td>
		            		<td>N+1</td>
		            		<td>N+2</td>
		            		<td>N+3</td>
		            		<td>N+4</td>
		            		<td>N+5</td>
		            		<td>N+6</td>
		            		<td>N+7</td>
		            		<td>N+8</td>
		            		<td>N+9</td>
		            		<td>N+10</td>
		            		<td>N+11</td>
		            		<td>N+12</td>
		            	</tr>
		            	<tr class="underline">
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            	</tr>
		            	<tr>
		            		<td>N+13</td>
		            		<td>N+14</td>
		            		<td>N+15</td>
		            		<td>N+16</td>
		            		<td>N+17</td>
		            		<td>N+18</td>
		            		<td>N+19</td>
		            		<td>N+20</td>
		            		<td>N+21</td>
		            		<td>N+22</td>
		            		<td>N+23</td>
		            		<td>N+24</td>
		            		<td>N+25</td>
		            	</tr>
		            	<tr class="underline">
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            	</tr>
		            	<tr>
		            		<td>N+26</td>
		            		<td>N+27</td>
		            		<td>N+28</td>
		            		<td>N+29</td>
		            		<td>N+30</td>
		            		<td>N+31</td>
		            		<td>N+32</td>
		            		<td>N+33</td>
		            		<td>N+34</td>
		            		<td>N+35</td>
		            		<td>N+36</td>
		            		<td>N+37</td>
		            		<td>N+38</td>
		            	</tr>
		            	<tr class="underline">
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            		<td><input class="dayBox" type="text">일</td>
		            	</tr>
		            	<tr class="line">
		            		<th>생성일자</th>
		            		<td colspan="13">매년 <input class="dayBox" type="text">월 1일</td>
		            	</tr>
		            </table>
		            <button class="saveBtn">저장</button>
		            </form>
		            <div class="middleName">휴가 종류</div>
		            <form>
		            	<table class="vacationKindTable">
		            			<tr>
			                		<th>휴가명</th>
			                		<th>사용 여부</th>
			                		<th>차감 여부</th>
			                		<th>반차 허용</th>
			                	</tr>
			                	<tr>
			                		<td>연차</td>
			                		<td>
			                			<select>
			                				<option>사용</option>
			                				<option>사용 안 함</option>
			                			</select>
			                		</td>
			                		<td><input type="checkbox">연차에서 차감</td>
			                		<td>
			                			<select>
			                				<option>허용</option>
			                				<option>허용 안 함</option>
			                			</select>
			                		</td>
			                	</tr>
			                	<tr>
			                		<td>반차</td>
			                		<td>
			                			<select>
			                				<option>사용</option>
			                				<option>사용 안 함</option>
			                			</select>
			                		</td>
			                		<td><input type="checkbox">연차에서 차감</td>
			                		<td>
			                			<select>
			                				<option>허용</option>
			                				<option>허용 안 함</option>
			                			</select>
			                		</td>
			                	</tr>
			                	<tr>
			                		<td>교육/훈련</td>
			                		<td>
			                			<select>
			                				<option>사용</option>
			                				<option>사용 안 함</option>
			                			</select>
			                		</td>
			                		<td><input type="checkbox">연차에서 차감</td>
			                		<td>
			                			<select>
			                				<option>허용</option>
			                				<option>허용 안 함</option>
			                			</select>
			                		</td>
			                	</tr>
			                	<tr>
			                		<td>출장</td>
			                		<td>
			                			<select>
			                				<option>사용</option>
			                				<option>사용 안 함</option>
			                			</select>
			                		</td>
			                		<td><input type="checkbox">연차에서 차감</td>
			                		<td>
			                			<select>
			                				<option>허용</option>
			                				<option>허용 안 함</option>
			                			</select>
			                		</td>
			                	</tr>
		            		
		            	</table>
		            	<button class="saveBtn">저장</button><button class="saveBtn">추가</button>
		            </form>
            	</div>
            
		</div>
	</section>
</body>
</html>