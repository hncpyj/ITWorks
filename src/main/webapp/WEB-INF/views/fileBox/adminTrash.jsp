<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--     import="com.kh.itworks.notice.model.vo.Notice" 
<% Notice notice = (Notice) request.getAttribute("notice"); %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="icon" href="${contextPath}/resources/images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>itworks</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css); font-family: 'Noto Sans KR', sans-serif;
   * {
        margin: 0px;
        font-family: "Noto Sans KR";
    }
    #asideBack {
        width: 250px;
        height: 900px;
        background: #E4EBF3;
    }
    
    #asideBack ul li{
        padding-left: 25px;
        height: 35px;
        vertical-align: middle;
    }
    #asideMenuTitle {
        padding-top: 22px; 
        padding-left: 36px; 
        font-size: 15px; 
        font-weight: bold; 
        color: #004771; 
        margin-bottom: 10px;
    }
    .asideMenu {
        text-decoration: none;
        color: #004771;
        font-size: 14px;
    }
    aside {
        float: left;
    }
    section {
        display: inline-block;
        float: left;
    }
    
    #text1 {
        color: #004771;
        margin: 10px;
        font-family: "Noto Sans KR";
        
    }
    
    .tableArea {
		width:60%;
		display: inline-block;
	}
	/* 휴지통 파일 리스트 */
	#fileTableArea {
		width:60%;
		display: inline-block;
	}
	.btn {
		border: 1px solid #29A2F7;
		background: #FFFFFF;
		color: #29A2F7;
	}
	
	
	
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
	
	#fileboxArea {
		border: 1px solid #004771;
		display: inline-block;
        float: left;
	}
	
	
	
	#filebox {
		display: inline-block;
		position: relative;
		width: 305px;
	    height: 608px;
		margin: 20px;
		margin-left: 40px;
		padding: 20px;
		border-top: 10px solid #004771;
	    border-left: 0.5px solid #929292;
	    border-bottom: 0.5px solid #929292;
	    border-right: 0.5px solid #929292;
	    background: #FFFFFF;
		box-shadow: inset 0px 2px 5px rgba(0, 0, 0, 0.1);
		overflow: auto;
	}
	
	#filebox::-webkit-scrollbar-thumb {
    	background-color: #2f3542;
    	border-radius: 10px;
    }
    
    #filebox::-webkit-scrollbar-track {
	    background-color: grey;
	    border-radius: 10px;
	    box-shadow: inset 0px 0px 5px white;
	}
	
	#roleBox {
		display: inline-block;
		position: relative;
		width: 255px;
	    height: 399px;
		margin: 20px;
		margin-left: 40px;
		padding: 20px;
		border-top: 10px solid #29A2F7;
	    border-left: 0.5px solid #929292;
	    border-bottom: 0.5px solid #929292;
	    border-right: 0.5px solid #929292;
	    background: #FFFFFF;
		box-shadow: inset 0px 2px 5px rgba(0, 0, 0, 0.1);
	}
	
	
	#file_title {
	  margin: 0;
	  padding-bottom: 20px;
	  border-bottom: 1px solid #004771;
	  color: #004771;
	  font-size: 1.1em;
	}
	
	#filebox .tree {
	  padding: 20px 0;
	}
	
	#filebox .tree::after {
	  content: '';
	  display: block;
	  clear: left;
	}
	
	#filebox .tree div {
	  clear: left;
	}
	
	#filebox input[type="checkbox"] {
	  position: absolute;
	  left: -9999px;
	}
	
	#filebox label, .a {
	  display: block;
	  float: left;
	  clear: left;
	  position: relative;
	  margin-left: 25px;
	  padding: 5px;
	  border-radius: 5px;
	  color: #004771;
	  text-decoration: none;
	  cursor: pointer;
	}
	
	#filebox label::before, .a::before {
	  display: block;
	  position: absolute;
	  top: 6px;
	  left: -25px;
	  font-family: 'FontAwesome';
	}
	
	#filebox label::before {
	  content: '\f07b'; /* closed folder */
	}
	
	#filebox input:checked + label::before {
	  content: '\f07c'; /* open folder */
	}
	
	#filebox .a::before {
	  content: '-'; /* dash */
	}
	
	#filebox input:focus + label, .a:focus {
	  outline: none;
	  background-color: #e8ebed;
	}
	
	#filebox .sub {
	  display: none;
	  float: left;
	  margin-left: 30px;
	}
	
	#filebox input:checked ~ .sub {
	  display: block;
	}
	
	#filebox input[type="reset"] {
	  display: block;
	  width: 100%;
	  padding: 5px;
	  border: none;
	  border-radius: 10px;
	  color: #e8ebed;
	  background-color: #29A2F7;
	  font-family: inherit;
	  font-size: .9em;
	  cursor: pointer;
	  -webkit-appearance: none;
	  -moz-appearance: none;
	}
	
	#filebox input[type="reset"]:focus {
	  outline: none;
	  box-shadow: 0 0 0 4px #b9c3c9;
	}
	
	
	
	#roleBox .tree {
	  padding: 20px 0;
	}
	
	#roleBox .tree::after {
	  content: '';
	  display: block;
	  clear: left;
	}
	
	#roleBox .tree div {
	  clear: left;
	}
	
 	#roleBox input[type="checkbox"] {
	  position: absolute;
	  left: -9999px;
	}
	
	#roleBox label, .a {
	  display: block;
	  float: left;
	  clear: left;
	  position: relative;
	  margin-left: 25px;
	  padding: 5px;
	  border-radius: 5px;
	  color: #004771;
	  text-decoration: none;
	  cursor: pointer;
	}
	
	#roleBox label::before, .a::before {
	  display: block;
	  position: absolute;
	  top: 6px;
	  left: -25px;
	  font-family: 'FontAwesome';
	}
	
	#roleBox label::before {
	  content: '\f07b'; /* closed folder */
	}
	
	#roleBox input:checked + label::before {
	  content: '\f07c'; /* open folder */
	}
	
	#roleBox .a::before {
	  content: '-'; /* dash */
	}
	
	#roleBox input:focus + label, .a:focus {
	  outline: none;
	  background-color: #e8ebed;
	}
	
	#roleBox .sub {
	  display: none;
	  float: left;
	  margin-left: 30px;
	}
	
	#roleBox input:checked ~ .sub {
	  display: block;
	}
	
	#roleBox input[type="reset"] {
	  display: block;
	  width: 100%;
	  padding: 5px;
	  border: none;
	  border-radius: 10px;
	  color: #e8ebed;
	  background-color: #29A2F7;
	  font-family: inherit;
	  font-size: .9em;
	  cursor: pointer;
	  -webkit-appearance: none;
	  -moz-appearance: none;
	}
	
	#roleBox input[type="reset"]:focus {
	  outline: none;
	  box-shadow: 0 0 0 4px #b9c3c9;
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
	
	.tableTitle {
		width: 100xp;
		background: #f4f4f4;
	}
	
	#fileDetailTable{
		width:100%;
        border-collapse: collapse;
        text-align:center;
	}
	th {
       border-bottom: 0.5px solid #9F9F9F;
       border-top: 0.5px solid #9F9F9F;
       color: #004771;
    }
    tr {
    	font-weight: normal;
       border-bottom: 0.5px solid #9F9F9F;
       border-top: 0.5px solid #9F9F9F;
       color: #474747;
    }
	
	#back {
		background:none;
		 border: none;
		 color: #004771;
		 margin:5px;
		text-align: right;
	}
	#fileOption{
		text-align: right;
	}
	.fileOptionBtn{
		background:none;
		 border: none;
		 color: #004771;
		 margin:5px;
	}
	
	#RoleSetting {
		background-color: #29A2F7;
		padding: 10px;
		color: #ffffff;
		font-size: 1.5em;
	}
	
	#roleSelectArea {
	vartical-align: middle;
		/* border: 1px solid #004771; */
		display: inline-block;
        float: left;
        
	}
	#revoke {
		display: inline-block;
        float: left;
        border: 1px solid #004771;
        background: #ffffff;
        margin-top:70px;
        padding: 20px;
	}
	#roleInfo {
		/* display: inline-block;
		background: #ffffff;
		margin: 20px;
		border: 1px solid #004771;
		height:399px; */
		display: inline-block;
		position: relative;
		width: 255px;
	    height: 399px;
		margin: 20px;
		margin-left: 40px;
		padding: 20px;
		border-top: 10px solid #29A2F7;
	    border-left: 0.5px solid #929292;
	    border-bottom: 0.5px solid #929292;
	    border-right: 0.5px solid #929292;
	    background: #FFFFFF;
		box-shadow: inset 0px 2px 5px rgba(0, 0, 0, 0.1);
	}
	.roleOptionBtn {
		
		background:#ffffff;
		border: 1px solid #004771;
		color: #004771;
	}
	#revokeBtnL {
		width: 30px;
		border-radius: 5px;
		background:#29A2F7;
		border: 1px solid #29A2F7;
		color: #ffffff;
		margin:5px;
	}
	#revokeBtnR {
		width: 30px;
		background:#ffffff;
		border-radius: 5px;
		border: 1px solid #29A2F7;
		color: #29A2F7;
		margin:5px;
	}
	.folderEditBtn {
		
		width: 60px;
		background:#ffffff;
		border: 1px solid #004771;
		color: #004771;
		margin:1px;
	}
	.fileOptionBtn{
		background:none;
		 border: none;
		 color: #004771;
		 margin:0px;
	}
	.treeBtn{
		background:white;
		 border: 0.5px solid #004771;
		 border-radius: 5px;
		 color: #004771;
		 margin:0px;
	}
</style>
</head>
<body>
	<c:if test="${ !empty sessionScope.loginUser }">
    <jsp:include page="../common/menubar.jsp"/>
    
    <aside>
        <div id="asideBack">
            <div id="asideMenuTitle">파일보관함</div>
            <ul>
                <li><a href="selectFirst.fb" class="asideMenu">- 전사문서함</a></li>
                <li><a href="#" class="asideMenu">- 파일보관함 관리자</a></li>
            </ul>
        </div>
    </aside>
        <h1 id="text1">&nbsp;&nbsp;&nbsp;파일보관함</h1>
        <hr>
        <br>
    <section>
        <div id="fileBoxArea" align="center">
        	<!-- <button class="folderEditBtn">위로</button>
	        <button class="folderEditBtn">아래로</button> -->
	        <button class="folderEditBtn" onclick="editFolder();">수정</button>
	       <br>
           
		  <!-- FileBox Area Start -->
		  <form id="filebox">
		    <h1 id="file_title">전사문서함</h1>
		    <div class="tree">
		      <a class="a" href="selectFirst.fb">전사자료</a>
		      <c:forEach var="ft" items="${ jsonList }">
					<c:if test="${fn:length(ft.stgPath) < 3}">
						<div>
					    	<input class="treebox" id="n${ft.stgPath}" type="checkbox"/>
					       	<label class="treelabel" for="n${ft.stgPath}">${ft.stgPath}${ft.stgName}</label>
					       	<button class="treeBtn" id="b${ft.stgPath}" onclick="selectFolder(${ft.stgNo})">선택</button>
					       	<div class="sub" id="${ft.stgPath}"></div>
			    		</div>
					</c:if>
					
			 	</c:forEach>
		      <div id="addFolderArea"></div>
		      
		      <div onclick="selectTrash();">
		        <input class="treebox" id="trash" type="checkbox">
		        <label class="treelabel" for="trash">휴지통</label>
		      </div>
		    </div>
		    <input type="reset" class="treebox" id="collapse" value="Collapse All">
		</form>
		  <!-- Filbox Area End -->
		  <br>
		 
        </div>
        <br>
    </section>
    <article>
        <div class="tableArea">
        	<div id="filePath">
        	용량 <fmt:formatNumber value="${stgSize}" pattern=".00"/> 
        	<c:if test="${stgSize < 1024}">MB</c:if>
        	<c:if test="${stgSize > 1024}">GB</c:if>
        	 / 500 GB</div>
		        <div id="fileSearch">
		        	<form action="" method="get">
		        		<select id="searchSelect">
		        			<option>검색조건</option>
		        			<option>파일명</option>
		        			<option>확장자</option>
		        			<option>문서명</option>
		        			<option>담당자</option>
		        		</select>
		        		<input id="searchText">
		        		<button id="searchBtn"><i class="fas fa-search"></i></button>
		        	</form>
		        </div>
	        <br><br>
	        
	        <div id="adminTrashArea">
	        	<table id="fileTable" style="text-align:center">
                <tr id="thead">
                    <td><input type="checkbox"></td>
                    <td>No.</td>
                    <td>파일명</td>
                    <td>확장자</td>
                    <td>파일크기</td>
                    <td>파일구분</td>
                    <td>등록일</td>
                    <td>영구삭제</td>
                    <td>파일복원</td>
                    
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
						<td><button class="btn" onclick="fileDeleteForever(${fb.fileNo})">삭제</button></td>
						<td><button class="btn" onclick="fileRestore(${fb.fileNo})">파일복원</button></td>
					</tr>
		         </c:forEach> 
		             
            </table>
        </div>
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
	
		
		
		//첨부파일 복구
		function fileRestore(fileNo) {
		      location.href="restore.fb?fileNo=" + fileNo;
		}
		

		//폴더 선택
		function selectFolder(stgNo) {
			var area = document.getElementById(divId);
			
			
		};
	    //파일 수정하는 페이지로 넘어가기
	    function editFolder() {
	    	location.href="admin.fb?";
	    }
	    
	  //첨부파일 삭제
		function fileDeleteForever(fileNo) {
			confirm("영구삭제시 파일을 복구할 수 없습니다. 삭제 하시겠습니까?");
			if(confirm){
		      location.href="deleteForever.fb?fileNo=" + fileNo;
			}
		}
        
	</script>

    
    <script>
    	
	
	$(function(){
		var list = JSON.parse('${jsonList}');
		console.log(list);
		var ctn = 0;
		var divId = null;
		
		for(var key in list){
			console.log(key, list[key]);
			console.log(key, list[key].stgPath);
			console.log(key, list[key].stgPath.substring(0, list[key].stgPath.length-2));
			
			divId = list[key].stgPath.substring(0, list[key].stgPath.length-2);
			console.log("divId 1 : " + divId);
			/* if(list[key].stgPath.length == 2){
				divId = 'addFolderArea';
				console.log("divId 2 : " + divId);
				var area = document.getElementById(divId);
					area.innerHTML += '<div>';
					area.innerHTML += '<input class="treebox" id="n' + list[key].stgPath + '" type="checkbox" onclick="folder()"/>'
					area.innerHTML += '<label class="treelabel" for="n' + list[key].stgPath + '">n' + list[key].stgPath + list[key].stgName + '</label>'
					area.innerHTML += '<div class="sub" id="' + list[key].stgPath + '">';
					area.innerHTML += '</div>';
					area.innerHTML += '</div>';
			} */
			
			for(var i=4; i<=100; i+=2){
				divId = list[key].stgPath.substring(0, list[key].stgPath.length-2);
				console.log("divId 3 : " + divId);
				var area = document.getElementById(divId);
				console.log(area);
				if(list[key].stgPath.length == i){
					console.log("2 성공!!!");
					area.innerHTML += '<div>';
					area.innerHTML += '<input class="treebox" id="n' + list[key].stgPath + '" type="checkbox"/>'
					area.innerHTML += '<label class="treelabel" for="n' + list[key].stgPath + '">n' + list[key].stgPath + list[key].stgName + '</label>'
					area.innerHTML += '<button class="treeBtn" id="b' + list[key].stgPath + '" onclick="selectFolder(' + list[key].stgNo + ')">선택</button>'
					area.innerHTML += '<div class="sub" id="' + list[key].stgPath + '">';
					area.innerHTML += '</div>';
					area.innerHTML += '</div>';
				}
			}
		}
	});
	
    </script>
    <script>
    
    function newFolder() {
    	divId = 'addFolderArea';
		console.log("divId 2 : " + divId);
		var area = document.getElementById(divId);
			area.innerHTML += '<div>';
			area.innerHTML += '<input class="treebox" id="n' + list[key].stgPath + '" type="checkbox" onclick="folder()"/>'
			area.innerHTML += '<label class="treelabel" for="n' + list[key].stgPath + '">n' + list[key].stgPath + list[key].stgName + '</label>'
			area.innerHTML += '<div class="sub" id="' + list[key].stgPath + '">';
			area.innerHTML += '</div>';
			area.innerHTML += '</div>';
    }
    

    
    </script>
    </c:if>
	<c:if test="${ empty sessionScope.loginUser }">
		<c:set var="message" value="로그인이 필요한 서비스입니다." scope="request"/>
		<jsp:forward page="error.fb"/>
	</c:if>
</body>
</html>


