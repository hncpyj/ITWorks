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
    	padding-top: 10px;
    	padding-left: 10px;
    	padding-bottom:10px;
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
    	width: 670px;
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
            	<label>입사일 : <c:out value="${hiredate }"></c:out></label><br>
            	<label>지급된 연차 일수 : <c:out value="${aleaveCount }"/>일</label><br>
            	<label>지급된 포상휴가 일수 : <c:out value="${reward }"/>일</label><br>
            	<label>잔여 연차 일수 : <span id="remain"><c:out value="${aleaveCount }"/></span>일</label><br>
            	<label>사용한 연차 일수 : <span id="using"></span>일</label>
            </div>
            </div>
            <!-- 휴가 종류 -->
            <div class="box">
            <label class="boxText">휴가 사용 일수</label>
            <div class="time">
            	<table class="vacationTable">
            		<tr>
            		<c:forEach begin="0" end="${leave.size()-1 }" var="i">
            			<td><c:out value="${leave.get(i).lname }"/></td>
            		</c:forEach>
            			
            		</tr>
            		<tr height="100px">
            		<c:forEach begin="0" end="${leave.size()-1 }" var="i">
            			<td class="leaveNo${i}" id="${leave.get(i).leaveNo }"><span id="span${i}">0</span>일</td>
            		</c:forEach>
            			
            		</tr>
            	</table>
            </div>
            </div>
            </div>
            <c:forEach begin="0" end="${vacation.size()-1 }" var="i">
            			<input type="hidden" id="leaveNo${i}" value="${vacation.get(i).leaveNo }">
            			<input type="hidden" id="lstartDay${i}" value="${vacation.get(i).lstartDay }">
            			<input type="hidden" id="lendDay${i}" value="${vacation.get(i).lendDay }">
            		</c:forEach>
            		<script type="text/javascript">
            			$(document).ready(function() {
							var leaveSize = ${leave.size()};
							var vacationSize = ${vacation.size()};
							
							for(var j = 0; j < leaveSize; j++){
								var leaveId = $(".leaveNo"+j).attr("id");
								console.log(leaveId);
							
							for(var i = 0 ; i < vacationSize; i++){
								if(leaveId == $("#leaveNo"+i).val()){
								var lendDay = $("#lendDay"+i).val().split("/");
								var lstartDay = $("#lstartDay"+i).val().split("/");
								var vacationDay = lendDay[2]-lstartDay[2];
								$("#span"+j).text($("#span"+j).text()*1+vacationDay*1);
								console.log($("#span"+j).text());
									
								}
								
							}
							}
							
							for(var i = 0 ; i < vacationSize; i++){
								var lendDay = $("#lendDay"+i).val().split("/");
								var lstartDay = $("#lstartDay"+i).val().split("/");
								var vacationDay = lendDay[2]-lstartDay[2];
								
								$("#using").text($("#using").text()*1+vacationDay*1);
								
							}
								
								$("#remain").text($("#remain").text()*1 - $("#using").text()*1)
						});
            		</script>
            <!-- 내 휴가 현황 -->
            <div class="box">
            <label class="boxText">휴가 신청 내역</label>
            <table id="overtimeTable">
                	<tr>
                		<th>신청자</th>
                		<th>소속</th>
                		<th class="long">신청기간</th>
                		<th>종류</th>
                		<th>신청일</th>
                		<th>상태</th>
                		<th>상세</th>
                	</tr>
                	<c:forEach begin="0" end="${vacation.size()-1 }" var="i">
                	<tr>
                		<td><c:out value="${vacation.get(i).ename }"/></td>
                		<td><c:out value="${vacation.get(i).dname }"/></td>
                		<td><c:out value="${vacation.get(i).lstartDay }"/> ~ <c:out value="${vacation.get(i).lendDay }"/></td>
                		<td><c:out value="${vacation.get(i).lname }"/></td>
                		<td><c:out value="${vacation.get(i).ldate }"/></td>
                		<c:if test="${vacation.get(i).lstatus eq 'Y' }">
                		<td>확정</td>                		
                		</c:if>
                		<c:if test="${vacation.get(i).lstatus eq 'N' }">
                		<td>미확정</td>                		
                		</c:if>
                		<td><button type="button" class="btn" onclick="location.href='selectVacationDetail.at?no=${vacation.get(i).lInfoNo}'">상세</button></td>
                	</tr>
                	</c:forEach>
                	
                </table>
                </div>
                <!-- 페이징 -->
                <div id="pagingArea" align="center">
			<c:if test="${ pi.currentPage <= 1 }">
				[이전] &nbsp;
			</c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="blistBack" value="selectVacationStatus.at">
					<c:param name="currnetPage" value="${ pi.currentPage - 1 }"></c:param>
				</c:url>
				<a href="${ blistBack }">[이전]</a> &nbsp;
			</c:if>
			
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<font color="red" size="4"><b>[${ p }]</b></font>
				</c:if>
				<c:if test="${ p ne pi.currentPage }">
					<c:url var="blistCheck" value="selectVacationStatus.at">
						<c:param name="currentPage" value="${ p }"></c:param>
					</c:url>
					<a href="${blistCheck }">${ p }</a>
				</c:if>
			</c:forEach>
			
			<c:if test="${ pi.currentPage >= pi.maxPage }">
				&nbsp; [다음]
			</c:if>
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="blistEnd" value="selectVacationStatus.at">
					<c:param name="currentPage" value="${ pi.currentPage + 1 }"></c:param>
				</c:url>
				&nbsp; <a href="${ blistEnd }">[다음]</a>
			</c:if>
			
		</div>
		</div>
	</section>
</body>
</html>