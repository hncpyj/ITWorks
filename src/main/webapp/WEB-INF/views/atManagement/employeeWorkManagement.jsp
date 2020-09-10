<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
            	<span><img class="leftArrow" src="${ contextPath }/resources/images/arrow.png" onclick="addDate();"></span>
            	<span class="dateText"></span>
            	<span><img class="rightArrow" src="${ contextPath }/resources/images/arrow.png" onclick="minusDate();"></span>
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
                		<th>근무시간</th>
                		<th>월</th>
                		<th>화</th>
                		<th>수</th>
                		<th>목</th>
                		<th>금</th>
                		<th class="sat">토</th>
                		<th class="sun">일</th>
                	</tr>
                	<c:forEach begin="0" end="${empworklist.size()-1 }" var="i">
                	<input type="hidden" value="${empworklist.get(i).wstart }">
                	<tr>
                		<td rowspan="3"><c:out value="${empworklist.get(i).ename }"></c:out></td>
                		<td rowspan="3"><c:out value="${empworklist.get(i).dname }"></c:out></td>
                		
                		<td>출근 시간</td>
                		<c:if test="${empworklist.get(i).dayOfTheWeek eq '월' }">
	                		<td id="startmon"><c:out value="${empworklist.get(i).wstart }"></c:out></td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek ne '월' }">
	                		<td id="startmon">00:00:00</td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek eq '화' }">
	                		<td id="starttue"><c:out value="${empworklist.get(i).wstart }"></c:out></td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek ne '화' }">
	                		<td id="starttue">00:00:00</td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek eq '수' }">
	                		<td id="startwed"><c:out value="${empworklist.get(i).wstart }"></c:out></td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek ne '수' }">
	                		<td id="startwed">00:00:00</td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek eq '목' }">
	                		<td id="startthu"><c:out value="${empworklist.get(i).wstart }"></c:out></td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek ne '목' }">
	                		<td id="startthu">00:00:00</td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek eq '금' }">
	                		<td id="startfri"><c:out value="${empworklist.get(i).wstart }"></c:out></td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek ne '금' }">
	                		<td id="startfri">00:00:00</td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek eq '토' }">
	                		<td class="sat" id="startsat"><c:out value="${empworklist.get(i).wstart }"></c:out></td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek ne '토' }">
	                		<td class="sat" id="startsat">00:00:00</td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek eq '일' }">
	                		<td class="sun" id="startsun"><c:out value="${empworklist.get(i).wstart }"></c:out></td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek ne '일' }">
	                		<td class="sun" id="startsun">00:00:00</td>                		                			
                		</c:if>
                	</tr>
                	<tr>
                		<td>퇴근 시간</td>

                		<c:if test="${empworklist.get(i).dayOfTheWeek eq '월' }">
	                		<td id="endmon"><c:out value="${empworklist.get(i).wend }"></c:out></td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek ne '월' }">
	                		<td id="endmon">00:00:00</td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek eq '화' }">
	                		<td id="endtue"><c:out value="${empworklist.get(i).wend }"></c:out></td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek ne '화' }">
	                		<td id="endtue">00:00:00</td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek eq '수' }">
	                		<td id="endwed"><c:out value="${empworklist.get(i).wend }"></c:out></td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek ne '수' }">
	                		<td id="endwed">00:00:00</td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek eq '목' }">
	                		<td id="endthu"><c:out value="${empworklist.get(i).wend }"></c:out></td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek ne '목' }">
	                		<td id="endthu">00:00:00</td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek eq '금' }">
	                		<td id="endfri"><c:out value="${empworklist.get(i).wend }"></c:out></td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek ne '금' }">
	                		<td id="endfri">00:00:00</td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek eq '토' }">
	                		<td class="sat" id="endsat"><c:out value="${empworklist.get(i).wend }"></c:out></td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek ne '토' }">
	                		<td class="sat" id="endsat">00:00:00</td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek eq '일' }">
	                		<td class="sun" id="endsun"><c:out value="${empworklist.get(i).wend }"></c:out></td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek ne '일' }">
	                		<td class="sun" id="endsun">00:00:00</td>                		                			
                		</c:if>
                	</tr>
                		
                	
                	<tr>
                		<td>연장 근무</td>
                		<c:if test="${empworklist.get(i).dayOfTheWeek eq '월' }">
	                		<td id="otmon"><c:out value="${fn:split(empworklist.get(i).otEnd, ':')[0]-fn:split(empworklist.get(i).otStart, ':')[0]}"></c:out>시간</td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek ne '월' }">
	                		<td id="otmon">0시간</td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek eq '화' }">
	                		<td id="ottue"><c:out value="${fn:split(empworklist.get(i).otEnd, ':')[0]-fn:split(empworklist.get(i).otStart, ':')[0]}"></c:out>시간</td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek ne '화' }">
	                		<td id="ottue">0시간</td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek eq '수' }">
	                		<td id="otwed"><c:out value="${fn:split(empworklist.get(i).otEnd, ':')[0]-fn:split(empworklist.get(i).otStart, ':')[0]}"></c:out>시간</td>              		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek ne '수' }">
	                		<td id="otwed">0시간</td>         		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek eq '목' }">
	                		<td id="otthu"><c:out value="${fn:split(empworklist.get(i).otEnd, ':')[0]-fn:split(empworklist.get(i).otStart, ':')[0]}"></c:out>시간</td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek ne '목' }">
	                		<td id="otthu">0시간</td>          		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek eq '금' }">
	                		<td id="otfri"><c:out value="${fn:split(empworklist.get(i).otEnd, ':')[0]-fn:split(empworklist.get(i).otStart, ':')[0]}"></c:out>시간</td>		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek ne '금' }">
	                		<td id="otfri">0시간</td>               		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek eq '토' }">
	                		<td class="sat" id="otsat"><c:out value="${fn:split(empworklist.get(i).otEnd, ':')[0]-fn:split(empworklist.get(i).otStart, ':')[0]}"></c:out>시간</td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek ne '토' }">
	                		<td class="sat" id="otsat">0시간</td>                		                			
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek eq '일' }">
	                		<td class="sun" id="otsun"><c:out value="${fn:split(empworklist.get(i).otEnd, ':')[0]-fn:split(empworklist.get(i).otStart, ':')[0]}"></c:out>시간</td>
                		</c:if>
                		<c:if test="${empworklist.get(i).dayOfTheWeek ne '일' }">
	                		<td class="sun" id="otsun">0시간</td>                		                			
                		</c:if>
                	</tr>

                	</c:forEach>
            </table>
		</div>
	</section>
	<script type="text/javascript">
			var currentDay = new Date();  
			var theYear = currentDay.getFullYear();
			var theMonth = currentDay.getMonth();
			var theDate  = currentDay.getDate();
			var theDayOfWeek = currentDay.getDay();
			 
			var thisWeek = [];
			 
			for(var i=0; i<7; i++) {
			  var resultDay = new Date(theYear, theMonth, theDate + (i - theDayOfWeek+1));
			  console.log(resultDay);
			  var yyyy = resultDay.getFullYear();
			  var mm = Number(resultDay.getMonth()) + 1;
			  var dd = resultDay.getDate();
			  yyyy = yyyy.toString().substring(2,4);
			  mm = String(mm).length === 1 ? '0' + mm : mm;
			  dd = String(dd).length === 1 ? '0' + dd : dd;
			 
			  thisWeek[i] = yyyy + '/' + mm + '/' + dd;
			}
		$(document).ready(function() {
			 
			$(".dateText").text(thisWeek[0]+ " ~ " + thisWeek[6]);
			$.ajax({
				url:"selectDateEmpWork.at",
				data:{
					mon: thisWeek[0],
					tue: thisWeek[1],
					wed: thisWeek[2],
					thu: thisWeek[3],
					fri: thisWeek[4],
					sat: thisWeek[5],
					sun: thisWeek[6]},
				method: "get",
				success: function(data) {
					
					console.log(data.empWorklist.length);
					console.log(data.empWorklist[0].wdate);
				},
				error: function() {
					console.log("오류");
				}
			});
			
		});
		
		function addDate() {
			currentDay.setDate(currentDay.getDate()-7);
			theYear = currentDay.getFullYear();
			theMonth = currentDay.getMonth();
			theDate  = currentDay.getDate();
			theDayOfWeek = currentDay.getDay();
			for(var i=0; i<7; i++) {
				  var resultDay = new Date(theYear, theMonth, theDate + (i - theDayOfWeek+1));
				  console.log(resultDay);
				  var yyyy = resultDay.getFullYear();
				  var mm = Number(resultDay.getMonth()) + 1;
				  var dd = resultDay.getDate();
				  yyyy = yyyy.toString().substring(2,4);
				  mm = String(mm).length === 1 ? '0' + mm : mm;
				  dd = String(dd).length === 1 ? '0' + dd : dd;
				 
				  thisWeek[i] = yyyy + '/' + mm + '/' + dd;
				}
			  console.log(thisWeek[0]);
			  $(".dateText").text(thisWeek[0]+ " ~ " + thisWeek[6]);
			$.ajax({
				url:"selectDateEmpWork.at",
				data:{
					mon: thisWeek[0],
					tue: thisWeek[1],
					wed: thisWeek[2],
					thu: thisWeek[3],
					fri: thisWeek[4],
					sat: thisWeek[5],
					sun: thisWeek[6]},
				method: "get",
				success: function(data) {
					console.log(data.empWorklist[0].wdate);
					
				},
				error: function() {
					console.log("오류");
				}
			});
			
		}
		
		function minusDate() {
			currentDay.setDate(currentDay.getDate()+7);
			theYear = currentDay.getFullYear();
			theMonth = currentDay.getMonth();
			theDate  = currentDay.getDate();
			theDayOfWeek = currentDay.getDay();
			for(var i=0; i<7; i++) {
				  var resultDay = new Date(theYear, theMonth, theDate + (i - theDayOfWeek+1));
				  console.log(resultDay);
				  var yyyy = resultDay.getFullYear();
				  var mm = Number(resultDay.getMonth()) + 1;
				  var dd = resultDay.getDate();
				  yyyy = yyyy.toString().substring(2,4);
				  mm = String(mm).length === 1 ? '0' + mm : mm;
				  dd = String(dd).length === 1 ? '0' + dd : dd;
				 
				  thisWeek[i] = yyyy + '/' + mm + '/' + dd;
				}
				console.log(thisWeek[0]);
				$(".dateText").text(thisWeek[0]+ " ~ " + thisWeek[6]);
			$.ajax({
				url:"selectDateEmpWork.at",
				data:{
					mon: thisWeek[0],
					tue: thisWeek[1],
					wed: thisWeek[2],
					thu: thisWeek[3],
					fri: thisWeek[4],
					sat: thisWeek[5],
					sun: thisWeek[6]},
				method: "get",
				success: function(data) {
					console.log(data.empWorklist[0].wdate);
				},
				error: function() {
					console.log("오류");
				}
			});
			
		}
		
	</script>
</body>
</html>