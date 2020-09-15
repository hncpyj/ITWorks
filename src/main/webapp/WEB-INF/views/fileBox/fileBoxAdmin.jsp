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
		width:30%;
		display: inline-block;
	}
	
	#fileboxArea {
		border: 1px solid #004771;
		display: inline-block;
        float: left;
	}
	
	
	
	#filebox {
		display: inline-block;
		position: relative;
		width: 500px;
	    height: 458px;
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
	/* #fileEditArea {
		align: right;
		border: 1px solid #29A2F7;
		color: #29A2F7;
		background: #ffffff;
		margin: 13px;
	} */
	#folderEditArea {
		padding:5px;
		text-align:left;
		border:2px solid #c9c9c9;
		height:337px;
		width:400px;
		overflow: auto;
	}
	#folderEditArea::-webkit-scrollbar-thumb {
    	background-color: #2f3542;
    	border-radius: 10px;
    }
    
    #folderEditArea::-webkit-scrollbar-track {
	    background-color: grey;
	    border-radius: 10px;
	    box-shadow: inset 0px 0px 5px white;
	}
	
	#folderSelectBox{
		background-color: #004771;
		height: 50px;
		color: white;
		text-align: center;
	}
	
	.folderEditTable th, tr{
		border-bottom: 0.5px solid #9f9f9f;
		border-top: 0.5px solid #9f9f9f;
		color: #004771;
	}
	
	.folderTitle {
		background-color: #29A2F7;
		width: 30%;
		color: white;
		height: 70px;
		text-align:center;
		
	}
	.folderInfo {
		background-color: white;
		height: 70px;
		width: 90%;
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
	        <div id="filePath">
        	용량 <fmt:formatNumber value="${stgSize}" pattern=".00"/> 
        	<c:if test="${stgSize < 1024}">MB</c:if>
        	<c:if test="${stgSize > 1024}">GB</c:if>
        	 / 500 GB</div>
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
					       	<label class="treelabel" id="l${ft.stgPath}" for="n${ft.stgPath}">${ft.stgName}</label>
					       	<button type="button" class="treeBtn" id="b${ft.stgPath}" onclick="selectFolder('${ft.stgNo}', '${ft.stgName}', '${ft.stgPath}');">선택</button>
					       	<div class="sub" id="${ft.stgPath}"></div>
			    		</div>
					</c:if>
					
			 	</c:forEach>
			      <div id="addFolderArea">
			      	
			      </div>
		      
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
	        <br>
	        <div>
	        	<!-- <div id="folderSelectBox" align="center">선택파일</div> -->
		        
		        	<table id="folderEditArea">
		        		<tr>
		        			<td id="folderSelectBox" colspan="2">선택폴더</td>
		        		</tr>
		        		<tr>
		        			<td class="folderTitle" >폴더 이름</td>
		        			<td class="folderInfo" id="folderNameArea"></td>
		        		</tr>
		        		<tr>
		        			<td class="folderTitle">폴더 경로</td>
		        			<td class="folderInfo" id="folderPathArea"></td>
		        		</tr>
		        	</table>
		        
	        </div>
		</div>
    </article>
    
    <script>
    	
	
	$(function(){
		var list = JSON.parse('${jsonList}');
		var ctn = 0;
		var divId = null;
		
		for(var key in list){
			divId = list[key].stgPath.substring(0, list[key].stgPath.length-2);
			
			for(var i=4; i<=100; i+=2){
				divId = list[key].stgPath.substring(0, list[key].stgPath.length-2);
				var area = document.getElementById(divId);
				if(list[key].stgPath.length == i){
					area.innerHTML += '<div>';
					area.innerHTML += '<input class="treebox" id="n' + list[key].stgPath + '" type="checkbox"/>';
					area.innerHTML += '<label class="treelabel" id="l' + list[key].stgPath +'" for="n' + list[key].stgPath + '">n' + list[key].stgPath + list[key].stgName + '</label>';
					area.innerHTML += '<button type="button" class="treeBtn" id="b' + list[key].stgPath + '" onclick="selectFolder(\'' + list[key].stgNo + '\', \'' + list[key].stgName + '\', \'' +  list[key].stgPath + '\')">선택</button>';
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
			area.innerHTML += '<input class="treebox" id="n' + list[key].stgPath + '" type="checkbox" onclick="folder()"/>';
			area.innerHTML += '<label class="treelabel" for="n' + list[key].stgPath + '">n' + list[key].stgName + '</label>';
			area.innerHTML += '<div class="sub" id="' + list[key].stgPath + '">';
			area.innerHTML += '</div>';
			area.innerHTML += '</div>';
    }
    
	var sno = "";
	var sname = "";
	
	//폴더 선택
	function selectFolder(stgNo, stgName, stgPath) {
		divId = 'fileEditArea';
		
		stgPath1 = stgPath;
		$("#folderNameArea").empty();
		$("#folderPathArea").empty();
		
		var fileNameArea = document.getElementById('folderNameArea');
		var filePathArea = document.getElementById('folderPathArea');
		fileNameArea.append(stgName);
		fileNameArea.innerHTML += '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="folderEditBtn" id="f' + stgPath + '" onclick="renameFolder(\'' + stgNo + '\', \'' + stgName + '\', \'' + stgPath + '\');">변경</button>';
		fileNameArea.innerHTML += '<button class="folderEditBtn" id="d' + stgPath + '" onclick="deleteFolder(\'' + stgNo + '\');">삭제</button>';
		filePathArea.append(stgPath);
		
	};
    
    function deleteFolder(stgNo) {
    	console.log(stgNo);
		confirm("폴더 삭제시 내부의 파일도 함께 삭제되며 복구가 불가능합니다. 삭제하시겠습니까?");
		
		if(confirm){
			$.ajax({
				type : "POST",
				url : "folderDelete.fb",
				data : {
					"stgNo" : stgNo
				},
				success : function(data){
					console.log(123);
					console.log(data);
					$("#n" + stgPath1 + "").remove();
				}
			});
		}
    }
    
    var stgPath1 = "";
    function renameFolder(stgNo, stgName, stgPath) {
    	
    	console.log("*****divId 2 : " + stgNo);
		console.log("*****divId 2 : " + stgName);
		console.log("*****divId 2 : " + stgPath);
		console.log("*****divId 2 : " + divId);
    	var fileNameArea = document.getElementById('folderNameArea');
    	fileNameArea.innerHTML += '<br><input id="changeFolderName" type="text" name="changeFolderName" placeHolder="' + stgName + '">'
    	fileNameArea.innerHTML += '<button class="folderEditBtn" id="f' + stgPath + '" onclick="renameSaveFolder(\'' + stgNo + '\');">완료</button>';
    }
    
    function renameSaveFolder(stgNo) {
    	var changeFolderName = document.getElementById('changeFolderName').value;
    	console.log(changeFolderName);
    	$.ajax({
    		type : "POST",
    		url : "folderRename.fb",
    		data : {
    			"stgNo" : stgNo,
    			"stgName" : changeFolderName
    		},
    		success : function(data){
    			console.log(123);
    			console.log(data);
    			$("#f"+ stgPath1 +"").remove();
    			$("#changeFolderName").remove();
    			

    			$("#folderNameArea").empty();
    			$("#folderPathArea").empty();
    			$("#l" + stgPath1 + "").empty();
    			
    			var fileNameArea = document.getElementById('folderNameArea');
    			var filePathArea = document.getElementById('folderPathArea');
    			fileNameArea.append(changeFolderName);
    			$("#l" + stgPath1 + "").append(changeFolderName);
    			fileNameArea.innerHTML += '<button class="folderEditBtn" id="f' + stgPath1 + '" onclick="renameFolder(\'' + sno + '\', \'' + sname + '\', \'' + stgPath1 + '\');">변경</button>';
    			fileNameArea.innerHTML += '<button class="folderEditBtn" id="d' + stgPath1 + '" onclick="deleteFolder(\'' + sno + '\');">삭제</button>';
    			filePathArea.append(stgPath1);
    			
    		}
    	});
    	
    }
    
  	//첨부파일 영구삭제
	function adminTrash() {
		var confirm = confirm("영구삭제시 파일을 복구할 수 없습니다. 삭제 하시겠습니까?");
		if(confirm){
	      location.href="deleteForever.fb?fileNo=" + fileNo;
		}
	}
  
	//휴지통으로 이동
	function selectTrash() {
	      location.href="selectAdminTrash.fb";
	};
    
    </script>
    </c:if>
	<c:if test="${ empty sessionScope.loginUser }">
		<c:set var="message" value="로그인이 필요한 서비스입니다." scope="request"/>
		<jsp:forward page="error.fb"/>
	</c:if>
</body>
</html>


