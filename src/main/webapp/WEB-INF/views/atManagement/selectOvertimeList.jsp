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
    #overtimeTable{
    	width:100%;
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
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/atManagement/atManagementAside.jsp"></jsp:include>
	<section>
        <div class="inner">
            <div id="inner-title">
            <span>연장 근무 신청 내역</span>
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
            <table id="overtimeTable">
                	<tr>
                		<th>신청자</th>
                		<th>소속</th>
                		<th>연장근무일</th>
                		<th>시간</th>
                		<th>승인여부</th>
                		<th>상세</th>
                	</tr>
                	<c:forEach begin="0" end="${overTime.size()-1 }" var="i">
                	<tr>
                		<td><c:out value="${loginUser.ename }"></c:out></td>
                		<td><c:out value="${loginUser.dname }"></c:out></td>
                		<td><c:out value="${overTime.get(i).otDate }"/></td>
                		<td><c:out value="${overTime.get(i).otEnd }"/></td>
                		<td><c:out value="${overTime.get(i).otStatus }"/></td>
                		<td><button class="btn" onclick="location.href='selectOvertimeDetail.at?no=${overTime.get(i).otNo}'">상세</button></td>
                	</tr>
                	</c:forEach>
                	
                </table>
                
                
                 <div id="pagingArea" align="center">
            <c:if test="${ pi.currentPage <= 1 }">
            << &nbsp;
                 </c:if>
            <c:if test="${ pi.currentPage > 1 }">
               <c:url var="prvBack" value="selectOvertimeList.at">
                  <c:param name="currnetPage" value="${ pi.currentPage - 1 }"></c:param>
               </c:url>
               <a href="${ prvBack }"><<</a> &nbsp;
         </c:if>

            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
               <c:if test="${ p eq pi.currentPage }">
                  <font color="#29A2F7" size="4"><b>${ p }</b></font>
               </c:if>
               <c:if test="${ p ne pi.currentPage }">
                  <c:url var="prvListCheck" value="selectOvertimeList.at">
                     <c:param name="currentPage" value="${ p }"></c:param>
                  </c:url>
                  <a href="${prvListCheck }">${ p }</a>
               </c:if>
            </c:forEach>

            <c:if test="${ pi.currentPage >= pi.maxPage }">
            &nbsp; >>
         </c:if>
            <c:if test="${ pi.currentPage < pi.maxPage }">
               <c:url var="prvListEnd" value="selectOvertimeList.at">
                  <c:param name="currentPage" value="${ pi.currentPage + 1 }"></c:param>
               </c:url>
            &nbsp; <a href="${ prvListEnd }">>></a>
            </c:if>
         </div>
		</div>
	</section>
</body>
</html>