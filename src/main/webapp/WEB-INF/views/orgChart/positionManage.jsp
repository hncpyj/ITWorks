<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ItWorks</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="icon" href="${contextPath}/resources/images/favicon.ico"
	type="image/x-icon">
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
	font-size: 24px;
	color: #004771;
	font-weight: 400;
}
.manageTable {
	align:center;
	border-collapse: collapse;
}
tr {
	border-bottom: 1px solid #9F9F9F;
	border-top: 1px solid #9F9F9F;
}
.manageTable td {
	padding-top: 5px;
	padding-bottom: 5px;
}
.manageTable td:first-of-type {
	width:100px;
	background-color:#EBEBEB;	
	border-right:1px solid #9F9F9F;
}
.manageTable td:nth-of-type(2) {
	width:500px;
}
.position-name {
	margin-left:10px;
	display:inline-block;
}
.grade {
	margin-left:20px;
	display:inline-block;
}
#saveBtn {
	width:80px;
	height:30px;
	border: 0.5px solid #C8C8C8;
	color:#004871;
	text-align:center;
	font-size:16px;
	background-color:#ffffff;
}
#add-position {
	display:none;
	float:right;
	margin-right:10px;
	font-size:20px;
	font-weight:bolder;
	color:#696969;
	border: none;
 	outline:none;
 	margin-top:0px;
}
#add-duty {
 	background: url( "./resources/images/addPosition.png" ) no-repeat;
 	width:15px;
 	height:15px;
 	float:right;
 	margin-right:20px;
 	border: none;
 	outline:none;
 	margin-top:4px;
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
						<td style="width: 130px;"><span>직위 관리</span></td>
						<td style="width: 560px;"></td>
						<td style="width: 123px;"></td>
						<td></td>
					</tr>
				</table>
			</div>
			<hr style="border: solid 0.5px #C4C4C4;">
			<!-- 본문시작 -->
			<div style="height:50px;"></div>
			<div align="center">
			<form>
			<table class="manageTable">
				<tr>
					<td><p class="grade">1등급</p><button id="add-position">+</button></td>
					<td><p class="position-name">대표</p><button id="add-duty" type="button"></button></td>
				</tr>
								<tr>
					<td><p class="grade">2등급</p><button id="add-position">+</button></td>
					<td><p class="position-name">대표</p><button id="add-duty" type="button"></button></td>
				</tr>				<tr>
					<td><p class="grade">3등급</p><button id="add-position">+</button></td>
					<td><p class="position-name">대표</p><button id="add-duty" type="button"></button></td>
				</tr>				<tr>
					<td><p class="grade">4등급</p><button id="add-position">+</button></td>
					<td><p class="position-name">대표</p><button id="add-duty" type="button"></button></td>
				</tr>				<tr>
					<td><p class="grade">5등급</p><button id="add-position">+</button></td>
					<td><p class="position-name">대표</p><button id="add-duty" type="button"></button></td>
				</tr>				<tr>
					<td><p class="grade">6등급</p><button id="add-position">+</button></td>
					<td><p class="position-name">대표</p><button id="add-duty" type="button"></button></td>
				</tr>				<tr>
					<td><p class="grade">7등급</p><button id="add-position">+</button></td>
					<td><p class="position-name">대표</p><button id="add-duty" type="button"></button></td>
				</tr>				<tr>
					<td><p class="grade">8등급</p><button id="add-position">+</button></td>
					<td><p class="position-name">대표</p><button id="add-duty" type="button"></button></td>
				</tr>				<tr>
					<td><p class="grade">9등급</p><button id="add-position">+</button></td>
					<td><p class="position-name">대표</p><button id="add-duty" type="button"></button></td>
				</tr>
			</table>
			</form>
			</div>
			<div style="height:30px;"></div>
			<button id="saveBtn">저장하기</button>
			
		<!-- wrapper end -->		
		</div>
	</section>
</body>
<script>
	$(document).ready(function() {
		$(".manageTable td:first-of-type").mouseenter(function () {
			$("#add-position").show();
		});
		$(".manageTable td:first-of-type").mouseout(function() {
			$("#add-position").hide();
		});
	})
</script>
</html>


