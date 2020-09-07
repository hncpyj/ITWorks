<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ItWorks</title>
<link rel="icon" href="${contextPath}/resources/images/favicon.ico" type="image/x-icon">
<style>
   aside {
        float: left;
    }
    section {
        display:inline-block;
        width:75%;
        margin-left:50px;
        margin-top:30px;
    }
    #middleSection {
        width:100%;
    }
    #addressTable {
        width:100%;
        border-collapse: collapse;
        text-align:center;
        margin-top:30px;
    }
    tr {
	    border-bottom: 0.5px solid #9F9F9F;
	    border-top: 0.5px solid #9F9F9F;
    }
    #checkAddress{
        width:20px;
        height:20px;
        border-radius: 0px;
    }
    #addressTable td,th {
        padding-top: 10px;
        padding-bottom :10px;
    }
    #addressTable th {
        font-size:18px;
        font-weight:normal;
        background-color: white;
    }
    .mainTitleArea {
        display: inline-block;
        width: 100%; 
        margin: 0 auto;
    }
    .mainTitleArea span{
        font-size: 24px; 
        color: #004771; 
        font-weight: 400;
    }
    #addressCount {
        color:#29A2F7;
    }
    #searchBox {
        border-radius: 30px;
        border:1px solid #29A2F7;
        padding:10px;
    }
    #star {
        height:15px;
        width:15px;
       /*visibility: hidden;*/
    }
    #star:hover {
        visibility: visible;
        cursor: pointer;
    }
    .titleTable {
    	width:100%;
    	margin-right:0px;
    }
    #toggleBtn {
    	background: url("./resources/images/toggleBtn.png" ) no-repeat;
    	border: none;
        width:10px;
        height:10px;
        cursor: pointer;
        outline:none;
    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<%@ include file="./common/aside.jsp" %>
		<section>
		<div id="middleSection">
			<div class="mainTitleArea">
				<table class="titleTable">
					<tr>
						<td style="width:130px;"><span>중요 주소록</span></td>
						<td style="width:560px;"></td>
						<td>
							<label>중요 주소록</label>&nbsp;
							<label id="addressCount"><c:out value="${listCount}"/></label>&nbsp;
							<label>개</label>&nbsp;&nbsp;&nbsp;
						</td>
						<td>
							<input type="search" placeholder="이름, 회사명, 전화번호 검색" id="searchBox">
						</td>
					</tr>
				</table>
			</div>
			<table id="addressTable">
				<tr style="width: 100%;">
					<th style="width: 5%;"><input type="checkbox"
						id="checkAddress"></th>
					<th style="width: 5%;"></th>
					<th style="width: 10%;">이름</th>
					<th style="width: 30%;">이메일</th>
					<th style="width: 15%;">전화번호</th>
					<th style="width: 10%;">회사
						<button id="toggleBtn" type="button"></button>
					</th>
					<th style="width:24%;">태그</th>
					<th style="width:1%;"></th>
				</tr>
				<c:forEach var ="important" items="${ list }">
				<tr>
					<td style="width: 5%;"><input type="checkbox" id="checkAddress"></td>
						<td style="width: 5%;" id="importantAdr"><img
							src="./resources/images/star.png" id="star"></td>
						<td style="width: 10%;"><c:out value="${important.conName }"></c:out></td>
						<td style="width: 30%;"><c:out value="${important.email }"></c:out></td>
						<td style="width: 15%;"><c:out value="${important.conPhone }"></c:out></td>
						<td style="width: 10%;"><c:out value="${important.conCorp }"></c:out></td>
						<td style="width: 24%;"><c:out value="${important.tagName }"></c:out></td>
						<td style="width: 1%;"><input type="hidden" value="${important.contactsNo }"></td>
				</tr>
				</c:forEach>				
			</table>
			<!-- 페이징 처리 영역 -->
			<div id="pagingArea" align="center">
				<c:if test="${ pi.currentPage <= 1 }">
            [이전] &nbsp;
         </c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="prvBack" value="importantAddress.ad">
						<c:param name="currnetPage" value="${ pi.currentPage - 1 }"></c:param>
					</c:url>
					<a href="${ prvBack }">[이전]</a> &nbsp;
         </c:if>

				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="red" size="4"><b>[${ p }]</b></font>
					</c:if>
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="prvListCheck" value="importantAddress.ad">
							<c:param name="currentPage" value="${ p }"></c:param>
						</c:url>
						<a href="${prvListCheck }">${ p }</a>
					</c:if>
				</c:forEach>

				<c:if test="${ pi.currentPage >= pi.maxPage }">
            &nbsp; [다음]
         </c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="prvListEnd" value="importantAddress.ad">
						<c:param name="currentPage" value="${ pi.currentPage + 1 }"></c:param>
					</c:url>
            &nbsp; <a href="${ prvListEnd }">[다음]</a>
				</c:if>
			</div>
			<!-- 페이징 영역 끝 -->		
		</div>
	</section>
</body>
<script>
$(function() {
	$("#addressTable td").mouseover(function() {
		$(this).parent().css({
			"background" : "#E4E4E4",
			"cursor" : "pointer"
		});
	}).mouseleave(function() {
		$(this).parent().css({
			"background" : "#fafafa"
		});
	}).click(function() {
		var num = $(this).parent().children().eq(0).text();
	});
});
</script>
</html>