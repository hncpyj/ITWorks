<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        text-align:center;
    }
    #correnctionTable tr{
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
    .long{
    	width: 250px;
    	margin-left: 5px;
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
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/atManagement/atManagementAside.jsp"></jsp:include>
	<section>
        <div class="inner">
            <div id="inner-title">
            <span>근태 수정 내역</span>
            <br>
            <hr>
            <br>
            </div>
            <select>
            	<option>모든 신청 내역 보기</option>
            	<option>결재 완료</option>
            	<option>결재중</option>
            	<option>결재 취소</option>
            	<option>반려</option>
            </select>
            <table id="correnctionTable">
                	<tr>
                		<th>요청 날짜</th>
                		<th>종류</th>
                		<th>기존 시간</th>
                		<th>변경 시간</th>
                		<th class="long">사유</th>
                		<th>승인 여부</th>
                		<th>상세</th>
                	</tr>
                	<c:forEach begin="0" end="${objection.size()-1}" var="i">
                	<tr>
                		<td>${objection.get(i).objDate }</td>
                		<td>${objection.get(i).objType }</td>
                		<c:if test="${objection.get(i).objType eq '출근' }">
                		<td>${objection.get(i).wstart}</td>                		
                		</c:if>
                		<c:if test="${objection.get(i).objType eq '퇴근' }">
                		<td>${objection.get(i).wend}</td>                		
                		</c:if>
                		<td>${objection.get(i).changeDate }</td>
                		<td class="long">${objection.get(i).objReason }</td>
                		<td>${objection.get(i).checkStatus }</td>
                		<td><button class="btn" onclick="location.href='selectATDetail.at?no=${objection.get(i).objNo}'">수정</button></td>
                	</tr>
                	</c:forEach>
                	
                </table>
                
                
                <!-- 페이징 -->
                <div id="pagingArea" align="center">
			<c:if test="${ pi.currentPage <= 1 }">
				[이전] &nbsp;
			</c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="blistBack" value="selectCorrectionList.at">
					<c:param name="currnetPage" value="${ pi.currentPage - 1 }"></c:param>
				</c:url>
				<a href="${ blistBack }">[이전]</a> &nbsp;
			</c:if>
			
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<font color="red" size="4"><b>[${ p }]</b></font>
				</c:if>
				<c:if test="${ p ne pi.currentPage }">
					<c:url var="blistCheck" value="selectCorrectionList.at">
						<c:param name="currentPage" value="${ p }"></c:param>
					</c:url>
					<a href="${blistCheck }">${ p }</a>
				</c:if>
			</c:forEach>
			
			<c:if test="${ pi.currentPage >= pi.maxPage }">
				&nbsp; [다음]
			</c:if>
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="blistEnd" value="selectCorrectionList.at">
					<c:param name="currentPage" value="${ pi.currentPage + 1 }"></c:param>
				</c:url>
				&nbsp; <a href="${ blistEnd }">[다음]</a>
			</c:if>
			
		</div>
		</div>
	</section>
</body>
</html>