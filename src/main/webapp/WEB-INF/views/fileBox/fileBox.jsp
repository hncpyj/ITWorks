<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="${contextPath}/resources/images/favicon.ico" type="image/x-icon">
<title>itworks</title>
<style>

    #file_title {
	  margin: 0;
	  padding-bottom: 20px;
	  border-bottom: 1px solid #004771;
	  color: #004771;
	  font-size: 1.1em;
	}
    #section {
        display: inline-block;
        float: left;
    }
    #fileBoxTitle {
        color: #004771;
        margin: 20px;
    }
	#filePath{
		display: inline-block;
		font-weight: bold; 
        color: #004771;
	}
	#fileSearch{
		text-align: right;
	}
	#searchSelect{
		border: 1px solid #9F9F9F;
		color: #29A2F7;
	}
	#searchText {
		border: 1px solid #29A2F7;
	  	border-radius: 10px;
	}
	/* 
	#searchBtn {
		content: '\f002';
	} */
	#fileTable {
        width:100%;
        border-collapse: collapse;
        text-align:center;
    }
    #thead {
       border-bottom: 0.5px solid #9F9F9F;
       border-top: 0.5px solid #9F9F9F;
       color: #004771;
    }
    .tbody {
       border-bottom: 0.5px solid #9F9F9F;
       border-top: 0.5px solid #9F9F9F;
       color: #929292;
    }
	#fileTable input {
		font-size: 0em;
		font-weight: lighter;
	}
	#fileOption{
		text-align: right;
	}
	.fileOptionBtn{
		background:none;
		 border: none;
		 color: #004771;
		 margin:0px;
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
	        	<form action="" method="get">
	        		<select id="searchSelect" name="searchSelect">
	        			<option>검색조건</option>
	        			<option>파일명</option>
	        			<option>확장자</option>
	        			<option>문서명</option>
	        			<option>담당자</option>
	        		</select>
	        		<input id="searchText" type="search">
	        		<button id="searchBtn" onclick="searchFile();">검색<i class="fas fa-search"></i></button>
	        	</form>
	        </div>
	        <script>
	        	function searchFile(){
	        		var searchSelect = $("#searchSelect").val();
	        		var searchText = $("#searchValue").val();
	        		
	        		location.href = "search.fb?searchSelect=" + searchSelect +
	        						"&searchText=" + searchText;
	        	}
	        </script>
	        
        <br><br>
       
        <div id="fileOption">
        	<button class="fileOptionBtn"><a href="delete.fb">삭제</a></button>
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
	              <c:forEach var="fb" items="${ list }">
					<tr class="tbody">
						<td><input type="checkbox"></td>
						<td><c:out value="${fb.fileNo}"/></td>
						<td onclick="fileDownload(${fb.fileNo})"><c:out value="${fb.originName}"/></td>
						<td><c:out value="${fb.ext}"/></td>
						<td><c:out value="${fb.fileSize}"/></td>
						<td><c:out value="${fb.fileType}"/></td>
						<td><c:out value="${fb.uploadDate}"/></td>
						<td><button onclick="fileDownload(${fb.fileNo})">Down</button></td>
						<td><button onclick="fileDelete(${fb.fileNo})">Delete</button></td>
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
	
    </c:if>
	<c:if test="${ empty sessionScope.loginUser }">
		<c:set var="message" value="로그인이 필요한 서비스입니다." scope="request"/>
		<jsp:forward page="error.fb"/>
	</c:if>
</body>
</html>


