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
            	<form action="">
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
                        <th rowspan="5">출퇴근 설정</th>
                        <td colspan="15" class="padding">
                        	<input type="radio" id="default" name="workingSetTime">
                        	<label class="left" for="default">출근일 및 출퇴근 시간 설정</label>
                        	<input type="radio" name="workingSetTime" id="free">
                        	<label class="left" for="free">자율 출퇴근 설정</label></td>
                    </tr>
                    <tr>
                        <td colspan="15" class="padding">
                        	<input type="checkbox" name="dayOfTheWeek" id="mon">
                        	<label class="left" for="mon">월</label>
                        	<input type="checkbox" name="dayOfTheWeek" id="tue">
                        	<label class="left" for="tue">화</label>
                        	<input type="checkbox" name="dayOfTheWeek" id="wed">
                        	<label class="left" for="wed">수</label>
                        	<input type="checkbox" name="dayOfTheWeek" id="thu">
                        	<label class="left" for="thu">목</label>
                        	<input type="checkbox" name="dayOfTheWeek" id="fri">
                        	<label class="left" for="fri">금</label>
                        	<input type="checkbox" name="dayOfTheWeek" id="sat">
                        	<label class="left" for="sat">토</label>
                        	<input type="checkbox" name="dayOfTheWeek" id="sun">
                        	<label class="left" for="sun">일</label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="15" class="padding">
                        	<input type="checkbox" name="laborDay" id="laborDay">
                        	<label class="left" for="laborDay">근로자의 날(5/1)</label>
                        	<input type="checkbox" name="holidays" id="holidays">
                        	<label class="left" for="holidays">공휴일</label>
                        	<input type="checkbox" name="alternativeHolidays" id="alternativeHolidays">
                        	<label class="left" for="alternativeHolidays">대체공휴일</label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="15" class="padding">
                        	<span>출근</span>
                            <select name="startTime">
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
                            <select name="startMin">
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
                            <select name="endTime">
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
                            <select name="endMin">
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
                            <select name="halfTime">
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
                            <select name="halfMin">
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
                    <tr>
                        <td colspan="15"><button class="btn">요일별 설정</button></td>
                    </tr>
                    <tr class="line">
                        <th>휴게 시간</th>
                        <td colspan="15" class="padding">
                            <select name="restStartTime">
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
                            <select name="restStartMin">
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
                            <select name="restEndTime">
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
                            <select name="restEndMin">
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
                        	<input type="text" placeholder="기본휴게시간">
                        	<!-- <button type="button" class="addBtn" onclick="addRest();">추가하기</button> --></td>
                    </tr>
                    <!-- <tr>
                        <td colspan="16"><button class="saveBtn">저장</button></td>
                    </tr> -->
                </table>
                
            </div>
            <br>
            <div>
            	
                <label class="middleName">근무상태 관리</label><button class="saveBtn" id="addBtnAt">추가</button>
                <table id="managerTable" class="middleTable">
                	<tr>
                		<th>근무상태</th>
                		<th>근무 시간 포함 여부</th>
                		<th>수정 및 삭제</th>
                	</tr>
                	<c:forEach var="i" begin="0" end="${sessionScope.workingStatus.size()-1 }">
                	<tr>
                		<td><c:out value="${sessionScope.workingStatus.get(i).workType }"/></td>
                		<c:if test="${sessionScope.workingStatus.get(i).work eq 'Y' }">
                		<td>포함</td>
                		</c:if>
                		<c:if test="${sessionScope.workingStatus.get(i).work eq 'N' }">
                		<td>미포함</td>
                		</c:if>
                		<td><button class="btn" id="modify${i}">수정</button>/<button class="btn" id="delBtn${i}">삭제</button></td>
                	</tr>
                	</c:forEach>
                	
                </table>
                <button class="saveBtn">저장</button>
            </div>
            	</form>
        </div>
    </section>
    <c:forEach var="i" begin="0" end="${sessionScope.workTimeSet.size() -1 }">
    	<c:choose>
    		<c:when test="${sessionScope.workTimeSet.get(i).dayOfTheWeek eq '월'}">
    			<script type="text/javascript">
    			$(document).ready(function() {
    				$("#mon").attr("checked", true);
    			});
    			</script>
    		</c:when>
    		<c:when test="${sessionScope.workTimeSet.get(i).dayOfTheWeek eq '화'}">
    			<script type="text/javascript">
    			$(document).ready(function() {
    				$("#tue").attr("checked", true);
    			});
    			</script>
    		</c:when>
    		<c:when test="${sessionScope.workTimeSet.get(i).dayOfTheWeek eq '수'}">
    			<script type="text/javascript">
    			$(document).ready(function() {
    				$("#wed").attr("checked", true);
    			});
    			</script>
    		</c:when>
    		<c:when test="${sessionScope.workTimeSet.get(i).dayOfTheWeek eq '목'}">
    			<script type="text/javascript">
    			$(document).ready(function() {
    				$("#thu").attr("checked", true);
    			});
    			</script>
    		</c:when>
    		<c:when test="${sessionScope.workTimeSet.get(i).dayOfTheWeek eq '금'}">
    			<script type="text/javascript">
    			$(document).ready(function() {
    				$("#fri").attr("checked", true);
    			});
    			</script>
    		</c:when>
    		<c:when test="${sessionScope.workTimeSet.get(i).dayOfTheWeek eq '토'}">
    			<script type="text/javascript">
    			$(document).ready(function() {
    				$("#sat").attr("checked", true);
    			});
    			</script>
    		</c:when>
    		<c:when test="${sessionScope.workTimeSet.get(i).dayOfTheWeek eq '일'}">
    			<script type="text/javascript">
    			$(document).ready(function() {
    				$("#sun").attr("checked", true);
    			});
    			</script>
    		</c:when>
    	</c:choose>
    </c:forEach>
    <script type="text/javascript">
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
			}
			
			if('${sessionScope.atbt.holidays}' == 'Y'){
				$("input:checkbox[name=holidays]").attr("checked", true);
			} 
			
			if('${sessionScope.atbt.alternativeHolidays}' == 'Y'){
				$("input:checkbox[name=alternativeHolidays]").attr("checked", true);
			}
			
    	});
    </script>
</body>
</html>