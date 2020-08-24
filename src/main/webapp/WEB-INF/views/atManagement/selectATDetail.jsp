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
		height: 30px;
		text-align:center;
    }
    #correnctionTable td{
    	font-family: Noto Sans KR;
		font-style: normal;
		font-weight: normal;
		font-size: 14px;
		line-height: 20px;
		color: #676767;
		height: 30px;
		text-align: left;
		padding-left: 10px;
    }
    .close{
    	outline: 0;
    	border : 0;
    	color: #004771;
    	background-color: #fafafa;
    	margin-top: 20px;
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
            <span>근태 수정 상세 내역</span>
            <br>
            <hr>
            <br>
            </div>
            <table class="approvalTable">
            	<tr>
            		<th rowspan="2">결재 진행</th>
            		<th rowspan="2">신청</th>
            		<th>누구누구대리</th>
            		<th>누구누구부장</th>
            	</tr>
            	<tr>
            		<td></td>
            		<td></td>
            	</tr>
            </table>
            <table id="correnctionTable">
                	<tr>
                		<th>신청자</th>
                		<td>헤일리최</td>
                	</tr>
                	<tr>
                		<th>부서</th>
                		<td>기술지원팀</td>
                	</tr>
                	<tr>
                		<th>신청일시</th>
                		<td>2020/08/21</td>
                	</tr>
                	<tr>
                		<th>기존 시간</th>
                		<td>9:10</td>
                	</tr>
                	<tr>
                		<th>변경 시간</th>
                		<td>9:00</td>
                	</tr>
                	<tr>
                		<th>종류</th>
                		<td>출근</td>
                	</tr>
                	<tr>
                		<th>사유</th>
                		<td>미등록 반영</td>
                	</tr>
                	<tr>
                		<th>진행 상황</th>
                		<td>결재중</td>
                	</tr>
                	<tr>
                		<th>첨부파일</th>
                		<td>첨부파일다운로드</td>
                	</tr>
                </table>
            	<button class="close">닫기</button>
		</div>
	</section>
</body>
</html>