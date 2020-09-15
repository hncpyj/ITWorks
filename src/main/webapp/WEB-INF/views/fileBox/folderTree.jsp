<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>jsTree test</title>
  <link rel="icon" href="${contextPath}/resources/images/favicon.ico" type="image/x-icon">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
    #aside {
        float: left;
    }
    #section {
        display: inline-block;
        float: left;
    }
    
    #fileBoxTitle {
        color: #004771;
        margin: 20px;
        
    }
	#fileboxArea {
		border: 1px solid #004771;
		display: inline-block;
        float: left;
	}
	#fileTableArea {
		width:60%;
		display: inline-block;
	}
	#filePath{
		display: inline-block;
		font-weight: bold; 
        color: #004771;
	}
	
	/* 검색 영역 */
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
    
    /* fileBox 시작 */
	#filebox {
		display: inline-block;
		position: relative;
		width: 205px;
	    height: 450px;
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
	
	.tree {
	  padding: 20px 0;
	}
	
	.tree::after {
	  content: '';
	  display: block;
	  clear: left;
	}
	
	.tree div {
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
	/* file 끝 */
	
	
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
	<!-- 파일박스 -->
	<div id="fileBoxArea">
            <form id="filebox">
		    <h1 id="file_title">전사문서함</h1>
		    <div class="tree" id="00">
		      <a class="a" href="selectFirst.fb">전사자료</a>
		      
		      <c:forEach var="ft" items="${ jsonList }">
					<c:if test="${fn:length(ft.stgPath) < 3}">
						<div>
					    	<input class="treebox" id="n${ft.stgPath}" type="checkbox"/>
					       	<label class="treelabel" for="n${ft.stgPath}">${ft.stgPath}${ft.stgName}</label>
					       	<button type="button" class="treeBtn" id="b${ft.stgPath}" onclick="selectFolder('${ft.stgNo}')">이동</button>
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
	</div>
	<p id="p"></p>
	
	
	<script>
	
	
	
		
	$(function(){
		var list = JSON.parse('${jsonList}');
		console.log(list);
		var ctn = 0;
		var divId = null;
		
		for(var key in list){
			divId = list[key].stgPath.substring(0, list[key].stgPath.length-2);
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
				var area = document.getElementById(divId);
				if(list[key].stgPath.length == i){
					area.innerHTML += '<div>';
					area.innerHTML += '<input class="treebox" id="n' + list[key].stgPath + '" type="checkbox"/>'
					area.innerHTML += '<label class="treelabel" for="n' + list[key].stgPath + '">n' + list[key].stgPath + list[key].stgName + '</label>'
					area.innerHTML += '<button type="button" class="treeBtn" id="b' + list[key].stgPath + '" onclick="selectFolder(' + list[key].stgNo + ')">이동</button>'
					area.innerHTML += '<div class="sub" id="' + list[key].stgPath + '">';
					area.innerHTML += '</div>';
					area.innerHTML += '</div>';
				}
			}
		}
	});
	
	//폴더 선택
	function selectFolder(stgNo) {
	    location.href="searchList.fb?stgNo=" + stgNo;
	};
	
	//휴지통으로 이동
	function selectTrash() {
	      location.href="selectTrash.fb";
	};
	</script>
	</c:if>
	<c:if test="${ empty sessionScope.loginUser }">
		<c:set var="message" value="로그인이 필요한 서비스입니다." scope="request"/>
		<jsp:forward page="error.fb"/>
	</c:if>
</body>
</html>