<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITWorks!</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
    body {
        width: 1420px;
        height: 900px;
    }
    section {
       width: 1170px; 
       height: 100%; 
       margin-left: 250px;
    }
    #menuTitle {
        width: 100%; 
        margin: 0 auto;
        padding-left: 30px;
    }
    #menuTitle>span {
        font-size: 24px; 
        color: #004771; 
        padding-left: 20px; 
        font-weight: 400;
    }
    #menuTitle>button {
        width: 62px; 
        height: 27px; 
        background: #004771; 
        border: none; 
        color: white;
        margin-left: 75%;
    }
    #searchArea {
        width: 1012px; 
        height: 186px; 
        border: 0.5px solid #929292; 
        margin-top: 30px;
        margin: 0 auto; 
        box-shadow: 1px 4px 5px lightgray;
    }
    #searchArea>label {
        display: inline-block;
        margin-top: 13px;
        margin-left: 25px;
        font-size: 13px;
        font-weight: 600;
        width: 100px;
    }
    #searchArea>input {
        width: 171px;
    }
    .memberSearchBtn {
        width: 62px; 
        height: 25px; 
        background: #004771; 
        border: none; 
        color: white;
        margin-left: 10px;
        box-shadow: 1px 1px 5px lightgray;
        border-radius: 3px 3px;
    }
    article:nth-child(2)>form>button {
        width: 65px; 
        height: 30px; 
        background: #004771; 
        border: none; 
        color: white;
        margin-left: 87.5%;
        margin-top: 10px;
    }
    article:last-child table td {
        text-align: center;
        height: 30px;
        max-height: 30px;
    }
    #projectList tr td:nth-child(3) {
        text-align: left;
        padding-left: 20px;
    }
    #projectList {
        margin: 0 auto;
        font-size: 13px;
        border-top: 3px solid #929292;
        border-bottom: 3px solid #929292;
        border-collapse: collapse;
    }
    #projectList th {
        border-bottom: 3px solid #929292;
        background: white;
        height: 30px;
        max-height: 30px;
    }
    #projectList tr {
        border-bottom: 1px solid #929292;
    }
    #projectList tr:nth-child(n+2):hover {
        cursor: pointer;
        background: rgb(221, 221, 221);
    }
    #asideBack ul li:nth-child(2) {
        font-weight: bold;
    }
    button {
        cursor: pointer;
    }
    a {
    	color: black;
    	text-decoration: none;
    }
</style>
</head>
<body>
<c:if test="${ !empty loginUser }">
		<jsp:include page="../common/menubar.jsp"/>
		<jsp:include page="projectListAside.jsp"/>
	
	    <section>
	        <article style="margin-top: 30px;">
	            <div id="menuTitle">
	                <span>진행 프로젝트</span>
	                <button onclick="location.href='insertProjectForm.pm'">신규</button>
	                <hr style="width: 95%; margin-top: 10px; color: #929292;">
	            </div>
	        </article>
	
	        <article style="margin-top: 30px;">
	            <form action="searchOngoing.pm">
		            <div id="searchArea">
		                <label>기간</label><input type="date" name="startDate">&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;<input type="date" name="endDate"><br>
		                <label>프로젝트명</label><input type="text" style="width: 375px;" name="projectName"><br>
		                <label>작성자</label><input type="text" name="writer"><button class="memberSearchBtn">조회</button><br>
		                <label>담당자</label><input type="text" name="charge"><button class="memberSearchBtn">조회</button><br>
		                <label>참여자</label><input type="text" name="join"><button class="memberSearchBtn">조회</button><br>
		            </div>
		            <button type="submit">조회</button>
	            </form>
	        </article>

	        <article style="margin-top: 30px;">
	            <table id="projectList" style="width: 1010px;">
	                <tr>
	                    <th width="60px">No</th>
	                    <th width="100px">상태</th>
	                    <th>프로젝트명</th>
	                    <th width="100px">작성자</th>
	                    <th width="200px">기간</th>
	                </tr>
	                <c:if test="${ listCount == 0 }">
	                		<tr>
	                			<td colspan="5" style="color: lightgray;">조회 결과가 없습니다.</td>
	                		</tr>
	                </c:if>
	                <c:if test="${ !empty projectList }">
		                <c:forEach var="p" items="${ projectList }" varStatus="status">
				        	<tr onclick="showProjectDetail(${p.pno});">
				            	<td><c:out value="${ projectList.size() - status.index }"/></td>
				                <td><c:out value="${ p.pprogress }"/></td>
				                <td><c:out value="${ p.pname }"/></td>
				                <td><c:out value="${ p.pwriter }"/></td>
				                <td><c:out value="${ p.pstartDate } ~ ${ p.pendDate }"/></td>
				            </tr>
		                </c:forEach>
		            </c:if>
	            </table>
	            
	            <div id="pagingArea" align="center" style="font-size: 12px; margin-top: 20px;">
				<c:if test="${ pi.currentPage <= 1 }">
					[이전]&nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="blistBack" value="/selectList.bo">
						<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ blistBack }">[이전]</a>&nbsp;
				</c:if>
				
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font style="color: #004771; font-size: 13px;"><b>[${ p }]</b></font>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="blistCheck" value="selectList.bo">
							<c:param name="currentPage" value="${ p }"/>
						</c:url>
						<a href="${ blistCheck }">${ p }</a>
					</c:if>
				</c:forEach>
				
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					&nbsp;[다음]
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="blistEnd" value="selectList.bo">
						<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
					</c:url>
					&nbsp;<a href="${ blistEnd }">[다음]</a>
				</c:if>
			</div>
	        </article>
	    </section>
	</c:if>
	<c:if test="${ empty loginUser }">
		<c:set var="message" value="로그인이 필요한 서비스입니다." scope="request"/>
			<jsp:forward page="../common/errorPage.jsp"/>
	</c:if>
	
	<script>
			function showProjectDetail(pno) {
				console.log(pno);
				location.href="projectDetail.pm?pno=" + pno;
			}
		</script>
    <br><br><br><br><br><br><br><br><br><br>
</body>
</html>