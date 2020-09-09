<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
    /*메뉴 타이틀 관련 css 설정*/
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
    }
    #asideBack ul li:last-child {
        font-weight: bold;
    }

    button {
        cursor: pointer;
    }
    /*메뉴 타이틀 관련 css 설정 종료*/

    /* 검색 영역 */
    article:nth-child(2) {
        margin-top: 20px;
        text-align: right;
        font-size: 13px;
        margin-right: 50px;
    }
    article:nth-child(2)>form>select {
        width: 80px;
        border: 1px solid #929292;
        border-radius: 3px 3px 3px 3px;
    }
    article:nth-child(2)>form>input[type="search"] {
        width: 250px;
        border: 1px solid #929292;
        border-radius: 3px 3px 3px 3px;
        margin-left: 10px;
    }
    article:nth-child(2)>form>input[type="submit"] {
        width: 60px;
        height: 25px;
        background: #004771;
        border: none;
        border-radius: 3px 3px 3px 3px;
        color: white;
        font-weight: 550;
        margin-left: 5px;
    }
    /* 검색 영역 종료 */

    /* 공지사항 리스트 */
    article:nth-child(3) {
        margin-top: 40px;
    }
    article:nth-child(3)>table {
        width: 950px;
        margin: auto;
        border-collapse: collapse;
        border-top: 2px solid #929292;
        border-bottom: 2px solid #929292;
        text-align: center;
    }
    #noticeList tr:nth-child(n+2):hover {
    	cursor: pointer;
        background: rgb(221, 221, 221);
    }
    th {
        font-size: 13px;
        background: #f4f4f4;
        height: 35px;
        border-bottom: 2px solid #929292;
    }
    td {
        font-size: 13px;
        background: white;
        height: 30px;
        border-bottom: 1px solid #929292;
    }
    tr>td:nth-child(2) {
        padding-left: 10px;
        text-align: left;
    }
    a {
        color: black;
        text-decoration: none;
    }
    button, input[type="submit"] {
        cursor: pointer;
    }
    /* 공지사항 리스트 종료 */
</style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="projectDetailAside.jsp"/>
    <section>
        <!--메뉴 타이틀-->
        <article style="margin-top: 30px;">
            <div id="menuTitle">
                <span>프로젝트 공지사항</span>
                <c:forEach var="m" items="${ member }">
	                <c:if test="${ m.prole eq '담당자'}">
	                	<c:set var="pcharge" value="${ m.mno }"/>
	                </c:if>
                </c:forEach>
                <c:if test="${ loginUser.mno eq pcharge }">
                	<button onclick="insertProjectNotice('${pno}');" style="margin-left: 71%;">작성하기</button>
                </c:if>
                <hr style="width: 95%; margin-top: 10px; color: #929292;">
            </div>
        </article>
        <!--메뉴 타이틀 종료-->

        <!-- 검색 영역 -->
        <article>
            <form action="">
                <select name="" id="">
                    <option value="">제목</option>
                    <option value="">내용</option>
                </select>
                <input type="search" placeholder="검색할 내용을 입력하세요.">
                <input type="submit" value="검색">
            </form>
        </article>
        <!-- 검색 영역 종료 -->

        <!-- 공지사항 리스트 -->
        <article>
            <table id="noticeList">
                <tr>
                    <th width="50px">No</th>
                    <th>제목</th>
                    <th width="100px">작성자</th>
                    <th width="100px">작성일</th>
                    <th width="50px">조회수</th>
                </tr>
                <c:forEach var="n" items="${ notice }" varStatus="status">
	                <tr onclick="noticeDetail(${n.pnoticeNo});">
	                    <td><c:out value="${ notice.size() - status.index }"/></td>
	                    <td><c:out value="${ n.pnoticeName }"/></td>
	                    <td><c:out value="${ n.ename }"/></td>
	                    <td><c:out value="${ n.pnoticeDate }"/></td>
	                    <td><c:out value="${ n.count }"/></td>
	                </tr>
                </c:forEach>
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
        <!-- 공지사항 리스트 종료 -->
    </section>
    
    <script>
	    function goProjectDetail() {
	    	location.href="projectDetail.pm?pno=" + ${pno};
	    }
	    function goProjectNotice() {
	    	location.href="projectNoticeList.pm?pno=" + ${pno};
	    }
	    
	    function noticeDetail(nno) {
	    	location.href="noticeDetail.pm?nno=" + nno;
	    }
	    
	    function insertProjectNotice(pno) {
	    	location.href='insertProjectNoticeForm.pm?pno=' + pno;
	    }
    </script>
</body>
</html>