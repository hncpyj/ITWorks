<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ItWorks</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="icon" href="${contextPath}/resources/images/favicon.ico" type="image/x-icon">
<style>
section {
	display: inline-block;
	width: 75%;
	margin-left: 50px;
	margin-top: 30px;
}

#middleSection {
	width: 100%;
}

.mainTitleArea {
	display: inline-block;
	width: 100%;
	margin: 0 auto;
}

.mainTitleArea span {
	font-size: 30px;
	color: #004771;
	font-weight: 400;
}

.codepenDefault {
	background-color: white;
	padding: 30px 30px 60px 50px;
	border: 1px solid #BFBFBF;
	margin: 120px 120px;
	border-radius: 10px;
	font-size: 14px;
	word-wrap: break-word;
	color: #000000;
	width: 50%;
}

.tree {
	color: #393939;
	font-size: 16px;
}

.tree, .tree ul {
	list-style: none;
	padding-left: 17px;
}

.tree *:before {
	width: 17px;
	height: 17px;
	display: inline-block;
}

.tree label {
	cursor: pointer;
}

.tree label:before {
	content: '\f256';
}

.tree a {
	text-decoration: none;
	color: #393939;
}

.tree a:before {
	content: '\e800';
}

.tree input[type="checkbox"] {
	display: none;
}

.tree input[type="checkbox"]:checked ~ul {
	display: none;
}

.tree input[type="checkbox"]:checked+label:before {
	content: '\f255';
}

.tree ul {
	display: table-row;
	padding: 0px;
	list-style: none;
}

#orgArea li {
	border: solid 1px #EBEBEB;
	background: #EBEBEB;
	list-style-type: none;
	margin: 60px;
	vertical-align: middle;
	height: 30px;
	line-height: 30px;
}

#2-0 li {
	margin-left: 200px;
}

#orgArea ul, li {
	width: 200px;
}

#deptUpdateBtn {
	margin-bottom: 5px;
}

#deptDetail {
	margin-bottom: -2px;
}

.updateDeptModal {
	display: none;
	width: 120px;
	height: 40px;
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -250px 0 0 -250px;
	background: #fafafa;
	z-index: 2;
	border: solid 0.75px #525252;
	font-size: 15px;
}

.updateContent {
	vertical-align: center;
	line-height: 40px;
	margin-left: 10px;
}

.modal_close {
	width: 26px;
	height: 26px;
	position: absolute;
	top: -30px;
	right: 0;
}

.modal_close>a {
	display: block;
	width: 100%;
	height: 100%;
	background: url(https://img.icons8.com/metro/26/000000/close-window.png);
	text-indent: -9999px;
}

.updateContent>a:link {
	text-decoration: none;
}

.updateContent>a:visited {
	color: black;
	text-decoration: none;
}

.updateContent>a:hover {
	text-decoration: none;
}

#inputDept {
	width: 180px;
	background:;
}
#levelUl {
	list-style-type: none;
	display: table-row;
	padding:0px;
	margin:0px;
	margin-left: 100px;
	align:center;
	
}
#levelUl li  {
	list-style-type: none;
	display:inline-block;
	padding:0px;
	text-align:center;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/orgChart/common/aside.jsp"></jsp:include>
	<section>
		<div id="middleSection">
			<div class="mainTitleArea">
				<table class="titleTable">
					<tr>
						<td style="width: 130px;"><span>조직 관리</span></td>
						<td style="width: 560px;"></td>
						<td style="width: 123px;"></td>
						<td></td>
					</tr>
				</table>
			</div>
			<div style="height:20px;"></div>
			<hr style="border: solid 0.5px #C4C4C4;">
			<!-- 본문시작 -->
			<div style="height:40px;"></div>
			
			<div id="levelArea">
				<ul id="levelUl">
					<li>레벨 1</li>
					<li>레벨 2</li>
					<li>레벨 3</li>
					<li>레벨 4</li>
					<li>레벨 5</li>					
				</ul>
			</div>
			
			<div id="orgArea">
				<ul class="tree">
					<li id="1-0-0">
						<input type="checkbox" id="root">
							<label for="root">
								<c:out value="${ dept.get(1).corpName }"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input id="deptUpdateBtn" type="image" src="./resources/images/orgUpdateBtn.png">&nbsp; 
									<input id="deptDetail" type="image" src="./resources/images/employees.png">
					</label>
							<ul id="2-0" class="test">
							<c:forEach var="dept" items="${dept}">
								<c:choose>
									<c:when test="${ dept.dLevel eq 2 }">
										<li id="2-0-0"><a href="#"><input type="checkbox" id="root"><c:out value="${ dept.dName }" />
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input id="deptUpdateBtn" type="image"
							src="./resources/images/orgUpdateBtn.png">&nbsp; <input
							id="deptDetail" type="image"
							src="./resources/images/employees.png">
													</a>
									</c:when>
								</c:choose>
							</c:forEach>
							<c:forEach var="dept" items="${dept}">
								<c:choose>
									<c:when test="${ dept.dLevel eq 3 }">
										<li id="2-2-0"><input type="checkbox" id="node3">
											<label for="node3"><c:out value="${ dept.dName }" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input id="deptUpdateBtn" type="image"
							src="./resources/images/orgUpdateBtn.png">&nbsp; <input
							id="deptDetail" type="image"
							src="./resources/images/employees.png">							
											</label></li>
									</c:when>
								</c:choose>
							</c:forEach>	
						</ul>
					</li>
				</ul>
			</div>
			
			<!-- 본문 끝 -->
		</div>
	</section>
	<section>
		<div class="updateDeptModal">
			<div class="modal_close"><a href="#">close</a></div>
					<div class="updateContent"><a href="#">+ 하위조직 생성</a></div>
		</div>
	</section>
</body>
<script>
var temps = "";
function print(){
	temps = document.getElementById("inputDept").value;
}

 var addDeptWin = true;
$(document).on("click",".updateContent",function(){
	
	if(addDeptWin) {	
	$("#2-0").append('<li><input onchange="print()" type="text" id="inputDept"><button id="updateDeptSendBtn">en</button></li>');	
	addDeptWin = false;
	} 
});
//부서생성ajax
$(document).on("click","#updateDeptSendBtn",function(){
	var deptName = temps; 
	var temp = $(".test").attr('id').split('-');
	var level = temp[0];
	
	console.log(level);
	console.log(deptName);
	
	$.ajax({
		url: "second.org",
		type: "get",
		data: {deptName : deptName,
			   level : level},
		success: function(data) {
			alert(data);
		},
		error: function() {
			console.log("에러");
		}	
});
});
</script>
<script>

window.onload = function() {
		function onClick() {
	        document.querySelector('.updateDeptModal').style.display ='block';
	    }   
	    function offClick() {
	        document.querySelector('.updateDeptModal').style.display ='none';
	    }
	 
	    document.getElementById('deptUpdateBtn').addEventListener('click', onClick);
	    document.querySelector('.modal_close').addEventListener('click', offClick);
	}
</script>
</html>