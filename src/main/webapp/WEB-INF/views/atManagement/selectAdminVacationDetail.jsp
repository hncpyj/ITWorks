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
    #correnctionTable{
    	width:100%;
        border-collapse: collapse;
        
    }
    #correnctionTable tr{
    	border-bottom: 0.5px solid #9F9F9F;
		border-top: 0.5px solid #9F9F9F;
    }
    #correnctionTable th{
    	font-family: Noto Sans KR;
		font-style: normal;
		font-weight: normal;
		font-size: 16px;
		line-height: 23px;
		color: #000000;
		background: white;
		width: 130px;
		height: 40px;
		text-align:center;
    }
    #correnctionTable td{
    	font-family: Noto Sans KR;
		font-style: normal;
		font-weight: normal;
		font-size: 14px;
		line-height: 20px;
		color: #676767;
		height: 40px;
		text-align: left;
		padding-left: 10px;
    }
    .close{
    	outline: 0;
    	border : 0;
    	color: #004771;
    	background-color: #fafafa;
    	margin-top: 20px;
    	margin-left: auto;
    	margin-right: auto;
    }
    .approvalTable{
    	border-collapse: collapse;
        text-align:center;
		margin-bottom: 30px;
    }
    .approvalTable tr {
    	border : 0.5px solid #9F9F9F;
    }
    .approvalTable td {
    	border : 0.5px solid #9F9F9F;
    	height: 70px;
    }
    .approvalTable th{
    	font-family: Noto Sans KR;
		font-style: normal;
		font-weight: normal;
		font-size: 16px;
		line-height: 23px;
		color: #000000;
		background: #ECECEC;
		height: 30px;
		border : 0.5px solid #9F9F9F;
    }
    
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/atManagement/atManagementAside.jsp"></jsp:include>
	<section>
        <div class="inner">
            <div id="inner-title">
            <span>휴가 상세 내역</span>
            <br>
            <hr>
            <br>
            
            <table id="correnctionTable">
                	<tr>
                		<th>신청자</th>
                		<td><c:out value="${vacation.ename }"></c:out></td>
                	</tr>
                	<tr>
                		<th>부서</th>
                		<td><c:out value="${vacation.dname }"></c:out></td>
                	</tr>
                	<tr>
                		<th>신청일시</th>
                		<td><c:out value="${vacation.ldate }"></c:out></td>
                	</tr>
                	<tr>
                		<th>휴가 기간</th>
                		<td><c:out value="${vacation.lstartDay }"></c:out> ~ <c:out value="${vacation.lendDay }"></c:out></td>
                	</tr>
                	<tr>
                		<th>종류</th>
                		<td><c:out value="${vacation.lname }"></c:out></td>
                	</tr>
                	<tr>
                		<th>사유</th>
                		<td><c:out value="${vacation.lreason }"></c:out></td>
                	</tr>
                	<tr>
                		<th>승인 여부</th>
                		<c:if test="${vacation.lstatus eq 'N' }">
	                		<td>미승인</td>
                		</c:if>
                		<c:if test="${vacation.lstatus eq 'Y' }">
	                		<td>승인</td>
                		</c:if>
                	</tr>
                	<tr>
                		<th>첨부파일</th>
                		<td>첨부파일다운로드</td>
                	</tr>
                </table>
                <c:if test="${vacation.lstatus eq 'N' }">
                <button class="close" onclick="approvalBtn();">승인하기</button>
                		</c:if>
                		
            	<button class="close" onclick="location.href='selectVacationList.at'">닫기</button>
		</div>
		</div>
	</section>
	<script type="text/javascript">
		function approvalBtn() {
			var lInfoNo = "${vacation.lInfoNo}";
			confirm("휴가를 승인 하시겠습니까?");
			location.href = "updateVacation.at?no="+lInfoNo;
		}
	</script>
</body>
</html>