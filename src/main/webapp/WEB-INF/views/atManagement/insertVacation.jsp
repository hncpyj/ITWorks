<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    .btn{
    	outline: 0;
    	border : 0;
    	color: #004771;
    	background-color: #fafafa;
    }
    .tableBox{
        margin-left: 30px;;
        margin-right: auto;
    }
    #vacationTable{
    	width: 95%;
        border-collapse: collapse;
        vertical-align: middle;
    }
    #vacationTable tr{
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
		
    }
    td{
    	font-family: Noto Sans KR;
		font-style: normal;
		font-weight: normal;
		font-size: 14px;
		line-height: 20px;
		color: #676767;
		height: 35px;
		padding-left: 10px;
    }
    .long{
    	height: 120px;
    }
    input[type=text]{
    	border-radius: 0;
		border: 1px solid #929292;
		outline-style: none;
    }
    select{
    	border-radius: 0;
		border: 1px solid #929292;
		outline-style: none;
    }
    textarea{
    	border-radius: 0;
		border: 1px solid #929292;
		outline-style: none;
		resize: none;
    }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/atManagement/atManagementAside.jsp"></jsp:include>
	    <section>
        <div class="inner">
            <div id="inner-title">
            <span>휴가 신청</span>
            <br>
            <hr>
            <br>
            </div>
            <div class="tableBox">
            <form action="insertVacation.at">
            
            <!-- <button class="btn">결재선 설정</button> -->
            <button class="btn">휴가 신청 하기</button>
            <button class="btn">취소하기</button>
            
            <table id="vacationTable">
                	<tr>
                		<th>신청자</th>
                		<td><c:out value="${loginUser.ename }"></c:out></td>
                	</tr>
                	<tr>
                		<th>부서</th>
                		<td><c:out value="${loginUser.dname }"></c:out></td>
                	</tr>
                	<tr>
                		<th>휴가 현황</th>
                		<td>남은 연차 : <c:out value="${aleaveCount }"></c:out>일</td>
                	</tr>
                	<!-- <tr>
                		<th>참조</th>
                		<td><input type="text"></td>
                	</tr> -->
                	<tr>
                		<th>종류</th>
                		<td>
                		<select name="leaveNo">
                		<c:forEach begin="0" end="${leave.size() -1 }" var="i">
                			<option value="${leave.get(i).leaveNo }"><c:out value="${leave.get(i).lname }"></c:out></option>
                		</c:forEach>
                		</select>
                		</td>
                	</tr>
                	<tr>
                		<th>휴가 기간</th>
                		<td>
                			<input type="date" name="startDay">
                			<span> ~ </span>
                			<input type="date" name="endDay">
                		</td>
                	</tr>
                	<tr>
                		<th>사유</th>
                		<td class="long"><textarea name="lreason" cols="100" rows="5"></textarea></td>
                	</tr>
                	<tr>
                		<th>첨부파일</th>
                		<td><input type="file"></td>
                	</tr>
                </table>
                
                	</form>
                </div>
		</div>
		</section>
</body>
</html>