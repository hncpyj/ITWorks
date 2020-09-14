<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        margin-top: 40px;
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
    	width: 75px;
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
            <form action="updateVacationManagement.at" method="post">
                <table id="usageStatus" class="leftTable">
                    <tr>
                        <td class="middleName">휴가 사용 여부</td>
                        <td><input type="radio" id="leaveFuncY" name="leaveFunc" value="Y"></td>
                        <td>사용함</td>
                        <td><input type="radio" id="leaveFuncN" name="leaveFunc" value="N"></td>
                        <td>사용 안함</td>
                    </tr>
                    
                    
                </table>
            	
            	<div class="conditionBox">
		            <div class="middleName">휴가 생성 조건</div>
		            <div class="explain">
		            - 설정한 휴가 생성 기준으로 매년 생성일자(회계연도 기준) 또는 사용자 입사일(입사일 기준)에 휴가가 자동 생성됩니다.<br>
					- 조직에 속하지 않거나 입사일이 없는 사용자는 휴가가 생성되지 않습니다.<br>
					- 사용하던 휴가 생성 기준을 변경 적용하는 경우, 기존 휴가 데이터는 초기화됩니다. (기존 휴가 생성분 삭제 및 새 기준에 맞추어 재생성)
		            </div>
		            
		            <table>
		            	<tr>
	                        <td><input type="radio" id="accounting" name="lcreationCondition" value="회계"></td>
	                        <td>회계연도 기준</td>
	                        <td><input type="radio" id="hiredate" name="lcreationCondition" value="입사일"></td>
	                        <td>입사일 기준</td>
		            	</tr>
		            </table>
		            <table class="dayTable">
		            	<tr class="topline">
		            		<th class="underline" rowspan="6">휴가 일수</th>
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
		            		<c:forEach end="12" begin="0" var="i" varStatus="no">
		            		<input type="hidden" name="yearAleave" value="${yearAleave.get(i).yearAleave }">
		            		<td><input id="YA${no.count}" value="${ yearAleave.get(i).aleaveCount}" name="aleaveCount" class="dayBox" type="text">일</td>
		            		</c:forEach>

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
		            	<c:forEach end="25" begin="13" var="i" varStatus="no">
		            		<input type="hidden" name="yearAleave" value="${yearAleave.get(i).yearAleave }">
		            		<td><input id="YA${no.count+13}" value="${ yearAleave.get(i).aleaveCount}" name="aleaveCount" class="dayBox" type="text">일</td>
		            		</c:forEach>

		            		
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
		            	<c:forEach end="38" begin="26" var="i" varStatus="no">
		            		<input type="hidden" name="yearAleave" value="${yearAleave.get(i).yearAleave }">
		            		<td><input id="YA${no.count+26}" value="${ yearAleave.get(i).aleaveCount}" name="aleaveCount" class="dayBox" type="text">일</td>
		            		</c:forEach>

		            	</tr>
		            	<tr id="accountingBox" class="line">
		            		<th>생성일자</th>
		            		<td colspan="13">매년 <input name="lcreationDate" class="dayBox" type="text" value="${leaveSetting.lcreationDate }">월 1일</td>
		            	</tr>
		            </table>
		        
		           
		            <div class="middleName">휴가 종류</div>
		            
			                	<input type="hidden" id="size" value="${leave.size() }">
		            	<table class="vacationKindTable">
		            			<tr>
			                		<th>휴가명</th>
			                		<th>사용 여부</th>
			                		<th>차감 여부</th>
			                		<th>반차 허용</th>
			                	</tr>
			                	<c:forEach var="i" begin="0" end="${leave.size()-1 }">
			                	<input type="hidden" id="hiddenluse${i}" value="${leave.get(i).luse }">
			                	<input type="hidden" id="hiddenaleaveDeduction${i}" value="${leave.get(i).aleaveDeduction }">
			                	<input type="hidden" id="hiddenharfLeave${i}" value="${leave.get(i).harfLeave }">
			                	<input type="hidden" name="leaveNo" value="${leave.get(i).leaveNo }">
			                	<tr>
			                		<td><c:out value="${leave.get(i).lname }"></c:out></td>
			                		<td>
			                			<select id="luse${i}" name="luse">
			                				<option value="Y">사용</option>
			                				<option value="N">사용 안 함</option>
			                			</select>
			                		</td>
			                		<td>
			                			<select id="aleaveDeduction${i}" name="aleaveDeduction">
			                				<option value="Y">차감</option>
			                				<option value="N">차감 안 함</option>
			                			</select>
			                		<%-- <input value="${leave.get(i).leaveNo }" id="aleaveDeduction${i}" name="aleaveDeduction" type="checkbox">연차에서 차감 --%>
			                		</td>
			                		<td>
			                			<select id="harfLeave${i}" name="harfLeave">
			                				<option value="Y">허용</option>
			                				<option value="N">허용 안 함</option>
			                			</select>
			                		</td>
			                	</tr>
			                	</c:forEach>
			                	
		            		
		            	</table>
		            	
		            	<button class="saveBtn">저장</button><button type="button" onclick="addBtn();" class="saveBtn">추가</button>
            	</div>
            
		   
		    </form>
		</div>
	</section>
	<script type="text/javascript">
	
	
		            		$(document).ready(function() {
								var leavesize = $("#size").val();
		            			for(var i = 0; i < leavesize; i++){
		            				
		            				$("#luse"+i+" option[value="+$("#hiddenluse"+i).val()+"]").attr('selected', 'ture');
		            				
		            				$("#aleaveDeduction"+i+" option[value="+$("#hiddenaleaveDeduction"+i).val()+"]").attr('selected', 'ture');
		            				/* if($("#hiddenaleaveDeduction"+i).val() == 'Y'){
		            					$("#aleaveDeduction"+i).attr("checked", true);		            					
		            				} */
		            				
		            				$("#harfLeave"+i+" option[value="+$("#hiddenharfLeave"+i).val()+"]").attr('selected', 'ture');
		            			}
		            			
		            			if("${leaveSetting.leaveFunc}" == 'Y'){
		            				$("#leaveFuncY").attr("checked", true);
		            			} else {
		            				$("#leaveFuncN").attr("checked", true);
		            			}
		            			
		            			if("${leaveSetting.lcreationCondition}" == '회계'){
		            				$("#accounting").attr("checked", true);
		            			} else {
		            				$("#hiredate").attr("checked", true);
		            			}
		            			
		            			
		            			if($("#hiredate").is(":checked")){
		            				$("#accountingBox").css("display", "none");
		            			}
		            			if($("#accounting").is(":checked")){
		            				$("#accountingBox").css("display", "");
		            			}
							});
		            			$("input[name=lcreationCondition]").change(function() {
									
		            			if($("#hiredate").is(":checked")){
		            				$("#accountingBox").css("display", "none");
		            			}
		            			if($("#accounting").is(":checked")){
		            				$("#accountingBox").css("display", "");
		            			}
								});
		            			
		            			
		            			function addBtn() {
		            				$(".vacationKindTable").append('<tr><td><input name="insertLname" type="text" placeholder="휴가 종류 입력"></td><td><select name="insertLuse"><option value="Y">사용</option><option value="N">사용 안 함</option></select></td><td><select name="insertAleaveDeduction"><option value="Y">차감</option><option value="N">차감 안 함</option></select></td><td><select name="insertHarfLeave"><option value="Y">허용</option><option value="N">허용 안 함</option></select></td></tr>');
								}
		            	</script>
</body>

</html>