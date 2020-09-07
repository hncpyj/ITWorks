<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ItWorks</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="icon" href="${contextPath}/resources/images/favicon.ico"
	type="image/x-icon">
<style>
section {
	display: inline-block;
	width: 75%;
	margin-left: 50px;
	margin-top: 30px;
}
.mSection {
	display: inline-block;
	width: 1190px;
	margin-left:0px;
	margin-top:10px;
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

#searchBox {
	border-radius: 30px;
	border: 1px solid #29A2F7;
	padding: 10px;
}

.orglist {
	float: left;
	border-top: 1px solid #C4C4C4;
	border-right:1px solid #C4C4C4;
	margin-left:0;
	width:250px;
	height:800px;
}

.orgMembers {
	display: inline-block;
	border-top: 1px solid #C4C4C4;
	width:930px;
	margin-right:0px;
	height:800px;
}
ol, ul, li {
	list-style:none;
}
#orgMembers>dl {
	float:right;
} 
.container {
	width:fit;
	height:40px;
	border-bottom: 1px solid #C4C4C4;
	padding-left:0;
	padding-top:10px;
}
.member-wrap {
	padding-left:40px;
	padding-top:40px;
}
.profileCard {
	display:inline-block;
}
.profileName {
	font-size:16px;
	font-weight:bolder;
} 
dd {
	color:gray;
}
.titleContainer {
	padding-left:20px;
	padding-top:10px;
	padding-bottom:10px;
	width:fit;
	border-bottom: 1px solid #C4C4C4;
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
						<td style="width: 130px;"><span>직원 목록</span></td>
						<td style="width: 560px;"></td>
						<td style="width: 123px;"></td>
						<td><input type="search" placeholder="이름, 부서 검색"
							id="searchBox"></td>
					</tr>
				</table>
			</div>
			<!-- 본문시작 -->
		</div>
	</section>
	<div class="mSection">
		<div class="orglist">
			<div class="org-tree-wrap">
				<div class="titleContainer" >
					<i onclick=""></i>
					<span>ItWorks</span>
					<span>(6)</span>
				</div>
			<ul>
				<li>
					<div class="container" onclick="">
						<i></i>
						<span>프로젝트관리부</span>
						<span>(1)</span>
					</div>
				</li>
				<li>
					<div class="container" onclick="">
						<i></i>
						<span>프로젝트관리부</span>
						<span>(1)</span>
					</div>
				</li><li>
					<div class="container" onclick="">
						<i></i>
						<span>프로젝트관리부</span>
						<span>(1)</span>
					</div>
				</li><li>
					<div class="container" onclick="">
						<i></i>
						<span>프로젝트관리부</span>
						<span>(1)</span>
					</div>
				</li><li>
					<div class="container" onclick="">
						<i></i>
						<span>프로젝트관리부</span>
						<span>(1)</span>
					</div>
				</li><li>
					<div class="container" onclick="">
						<i></i>
						<span>프로젝트관리부</span>
						<span>(1)</span>
					</div>
				</li>
			</ul>		
		</div>
		</div>
		<div class="orgMembers">
			<div class="member-wrap">
				<div id="profile-img" style="float:left; width:80px; height:80px; border:1px solid gray;"></div>
				<dl title="Itworks 대표 " style="margin-left:10px;" class="profileCard">
					<dt class="profileName">Itworks</dt>
					<dd>본부</dd>
					<dd>대표</dd>
				</dl>
			</div>
		</div>
	</div>	
</body>
</html>


