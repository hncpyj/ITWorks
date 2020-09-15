<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="${contextPath}/resources/images/favicon.ico" type="image/x-icon">
<script src="https://kit.fontawesome.com/yourcode.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>itworks</title>
<style>
	article a {
		text-decoration: none;
		color: #004771;
	}
	article a:hover {
		text-decoration: none;
		color: #29A2F7;
	}
</style>
</head>
<body>
	<c:if test="${ !empty sessionScope.loginUser }">
    <jsp:include page="../common/menubar.jsp"/>
    
    <aside id="aside">
        <div id="asideBack">
            <div id="asideMenuTitle">파일보관함</div>
            <ul>
                <li><a href="#" class="asideMenu">- 전사문서함</a></li>
                <li><a href="admin.fb" class="asideMenu">- 파일보관함 관리자</a></li>
            </ul>
        </div>
    </aside>
        <h1 id="fileBoxTitle">&nbsp;&nbsp;&nbsp;파일보관함</h1>
        <hr>
        <br>
    <section id="section">
    <jsp:include page="../fileBox/folderTree.jsp"/>
        <br>
    </section>
    <article>
        <div id="fileTableArea">
        	<div id="filePath">전체 문서함/회사 공용 문서/전사자료</div>
        	<%-- <div id="filePath">${top}/${middle}/${bottom}</div> --%>
	        <div id="fileSearch">
        		<select id="searchSelect" name="searchSelect">
        			<option>검색조건</option>
        			<option value="originName">파일명</option>
        			<option value="ext">확장자</option>
        			<option value="uploadDate">날짜</option>
        		</select>
        		<input id="searchText" type="search">
        		<button type="button" id="searchBtn" class="btn" onclick="searchFile('${stgNo}');">검색</button>
	        </div>
	        
	        
        <br>
       
        <div id="fileOption">
        	<!-- <button class="fileOptionBtn"><a href="delete.fb">삭제</a></button> -->
        	<button class="fileOptionBtn"><a href="change.fb">폴더 이동</a></button>
        	<button class="fileOptionBtn"><a href="uploadPage.fb">파일 업로드</a></button>
        </div>
            <table id="fileTable" style="text-align:center">
                <tr id="thead">
                    <td><input type="checkbox"></td>
                    <td>No.</td>
                    <td>파일명</td>
                    <td>확장자</td>
                    <td>파일크기</td>
                    <td>파일구분</td>
                    <td>등록일</td>
                    <td>다운로드</td>
                    <td>삭제</td>
                    
                </tr>
	              <c:forEach var="fb" items="${ list }" varStatus="status">
					<tr class="tbody">
						<td><input type="checkbox"></td>
						<td><c:out value="${status.count}"/></td>
						<td onclick="fileDownload(${fb.fileNo})"><c:out value="${fb.originName}"/></td>
						<td><c:out value="${fb.ext}"/></td>
						<td><c:out value="${fb.fileSize}"/></td>
						<td><c:out value="${fb.fileType}"/></td>
						<td><c:out value="${fb.uploadDate}"/></td>
						<td><button type="button" class="btn" onclick="fileDownload(${fb.fileNo})">Down</button></td>
						<td><button type="button" class="btn" onclick="fileDelete(${fb.fileNo})">Delete</button></td>
					</tr>
		         </c:forEach> 
		             
            </table>
        </div>
    </article>
    
    <!-- 페이징 처리 -->
    <div id="pagingArea" align="center">
		<c:if test="${ pi.currentPage <= 1 }">
			[이전] &nbsp;
		</c:if>
		<c:if test="${ pi.currentPage > 1 }">
			<c:url var="blistBack" value="selectList.fb">
				<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
			</c:url>
			<a href="${ blistBack }">[이전]</a>&nbsp;
		</c:if>
		
		<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			<c:if test="${ p eq pi.currentPage }">
				<font color="red" size="4"><b>[${ p }]</b></font>
			</c:if>
			<c:if test="${ p ne pi.currentPage }">
				<c:url var="blistCheck" value="selectList.fb">
					<c:param name="currentPage" value="${ p }"/>
				</c:url>
				<a href="${ blistCheck }">${ p }</a>
			</c:if>
		</c:forEach>
		
		<c:if test="${ pi.currentPage >= pi.maxPage }">
			&nbsp; [다음]
		</c:if>
		<c:if test="${ pi.currentPage < pi.maxPage }">
			<c:url var="blistEnd" value="selectList.fb">
				<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
			</c:url>
			&nbsp; <a href="${ blistEnd }">[다음]</a>
		</c:if>
		
	</div>
 
	<script>
		$(function(){
			$("#fileTableArea").find("td").mouseenter(function(){
				$(this).parents("tr").css({"background":"lightgray", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parents("tr").css({"background":"white"});
			}).click(function(){
				var bid = $(this).parents().children("td").eq(0).text();
				
				console.log(fileNo);
				
				location.href="selectOne.fb?fileNo=" + fileNo;
			});
		});
	
		
		//첨부파일 다운로드
		function fileDownload(fileNo) {
		      location.href="download.fb?fileNo=" + fileNo;
		}
		
		//첨부파일 삭제
		function fileDelete(fileNo) {
		      location.href="delete.fb?fileNo=" + fileNo;
		}
	</script>
	<script>
       	function searchFile(stgNo){
       		var searchSelect = $("#searchSelect").val();
       		var searchText = $("#searchText").val();
       		
       		console.log(searchSelect);
       		console.log(searchText);
       		console.log(stgNo);
       		
       		location.href = "searchList.fb?stgNo=" + stgNo + "&searchSelect=" + searchSelect +
       						"&searchText=" + searchText;
       	}
    </script>
	
    </c:if>
	<c:if test="${ empty sessionScope.loginUser }">
		<c:set var="message" value="로그인이 필요한 서비스입니다." scope="request"/>
		<jsp:forward page="error.fb"/>
	</c:if>
</body>
</html>


