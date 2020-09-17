<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITWorks!</title>
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
	width: 1150px;
	margin-left: 0px;
	margin-top: 10px;
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
	border-right: 1px solid #C4C4C4;
	margin-left: 0;
	width: 250px;
	height: 800px;
}

.orgMembers {
	display: inline-block;
	border-top: 1px solid #C4C4C4;
	width: 890px;
	margin-right: 0px;
	height: 800px;
}

ol, ul, li {
	list-style: none;
}

#orgMembers>dl {
	float: right;
}

.container {
	width: 210px;
	height: 40px;
	border-bottom: 1px solid #C4C4C4;
	padding-left: 40px;
	padding-top: 10px;
}

.member-wrap {
	padding-left: 40px;
	padding-top: 40px;
	width: 200px;
	height: 110px;
}

.profileCard {
	display: inline-block;
}

.profileName {
	font-size: 16px;
	font-weight: bolder;
}

dd {
	color: gray;
}

.titleContainer {
	padding-left: 20px;
	padding-top: 15px;
	padding-bottom: 10px;
	width: fit;
	border-bottom: 1px solid #C4C4C4;
	height: 30px;
	vertical-align: center;
}

.orglist ul {
	display: table-row;
	width: fit;
}

#corp {
	vertical-align: center;
}

#goDetail {
	cursor: pointer;
}
/*
 모달창 css 
*/
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	box-shadow: 5px 5px 5px 5px gray;
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 500px; /* Could be more or less, depending on screen size */
	height: 550px;
}

#modalCloseBtn {
	border: none;
	outline:none;
	cursor:pointer;
	background: url(./resources/images/closeBtn.png) no-repeat;
	width:30px;
	height:30px;
	float:right;
}
.inner-content {
	padding:10px;
}
#profileImg {
	width:100px;
	height:100px;
	border-radius:75px;
	display:inline-block;
	border: 1px solid gray;
}
#profileTitle {
	display:inline-block;
	padding-left:30px;
	width:450px;
}
.profileContent {
	padding-left:30px;
	padding-top:30px;
}
.profileTable td:first-of-type, #imgTd {
	width:150px;
}
#ename {
	font-size:20px;
	font-weight:bold;
}
.profileTable {
  border-collapse: separate;
  border-spacing: 0 10px;
}
#infor {
	padding-top:5px;
	margin-bottom:15px;
	font-size:20px;
	color:#29A2F7;
	font-weight:normal;
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
				<div class="titleContainer">
					<i onclick=""></i>
					<div id="corp">
						<span>ㅡ</span>&nbsp;&nbsp;
						<c:out value="${ membersList.get(0).corpName }" />
					</div>
				</div>
				<c:forEach var="dept" items="${ dept }">
					<c:choose>
						<c:when test="${ dept.dLevel eq 2 }">
							<ul>
								<li>
									<div class="container">
										<i></i> <span><span> - </span>
										<c:out value="${ dept.dName }"></c:out></span> <span>(<c:out
												value="${ dept.count }" />)
										</span>
									</div>
								</li>
							</ul>
						</c:when>
						<c:when test="${ dept.dLevel eq 3 }">
							<ul>
								<li>
									<div class="container" onclick="">
										<i></i> <span><span> - </span>
										<c:out value="${ dept.dName }"></c:out></span> <span>(<c:out
												value="${ dept.count }" />)
										</span>
									</div>
								</li>
							</ul>
						</c:when>
						<c:when test="${ dept.dLevel eq 4 }">
							<ul>
								<li>
									<div class="container" onclick="">
										<i></i> <span><span> - </span>
										<c:out value="${ dept.dName }"></c:out></span> <span>(<c:out
												value="${ dept.count }" />)
										</span>
									</div>
								</li>
							</ul>
						</c:when>
					</c:choose>
				</c:forEach>
			</div>
		</div>
		<div class="orgMembers">

			<c:forEach var="ml" items="${ membersList }">
				<c:choose>
					<c:when test="${ ml.member.jNo eq 'J1' }">
						<div class="member-wrap">
							<div id="profile-img"
								style="float: left; width: 80px; height: 80px; border: 1px solid gray;"></div>
							<dl title="Itworks 대표 " style="margin-left: 10px;"
								class="profileCard">
								<dt class="profileName">
									<a id="goDetail" onclick="detailProfile();"><c:out value="${ ml.member.ename }" /></a>
								</dt>
								<dd>본부</dd>
								<dd>
									<c:out value="${ ml.member.jname }" />
								</dd>
							</dl>
						</div>
					</c:when>
					<c:when test="${ ml.member.jNo eq 'J4' }">
						<div class="member-wrap">
							<div id="profile-img"
								style="float: left; width: 80px; height: 80px; border: 1px solid gray;"></div>
							<dl style="margin-left: 10px;" class="profileCard">
								<dt class="profileName">
									<a id="goDetail" onclick="detailProfile();"><c:out value="${ ml.member.ename }" /></a>
								</dt>
								<dd>
									<c:out value="${ ml.member.dname }" />
								</dd>
								<dd>
									<c:out value="${ ml.member.jname }" />
								</dd>
							</dl>
						</div>
					</c:when>
					<c:when test="${ ml.member.jNo eq 'J5' }">
						<div class="member-wrap">
							<div id="profile-img"
								style="float: left; width: 80px; height: 80px; border: 1px solid gray;"></div>
							<dl style="margin-left: 10px;" class="profileCard">
								<dt class="profileName">
									<a id="goDetail" onclick="detailProfile();"><c:out value="${ ml.member.ename }" /></a>
								</dt>
								<dd>
									<c:out value="${ ml.member.dname }" />
								</dd>
								<dd>
									<c:out value="${ ml.member.jname }" />
								</dd>
							</dl>
						</div>
					</c:when>
					<c:when test="${ ml.member.jNo eq 'J6' }">
						<div class="member-wrap">
							<div id="profile-img"
								style="float: left; width: 80px; height: 80px; border: 1px solid gray;"></div>
							<dl style="margin-left: 10px;" class="profileCard">
								<dt class="profileName" >
									<a id="goDetail" onclick="detailProfile();"><c:out value="${ ml.member.ename }"/></a>
								</dt>
								<dd>
									<c:out value="${ ml.member.dname }" />
								</dd>
								<dd>
									<c:out value="${ ml.member.jname }" />
								</dd>
							</dl>
						</div>
					</c:when>
					<c:when test="${ ml.member.jNo eq 'J7' }">
						<div class="member-wrap">
							<div id="profile-img"
								style="float: left; width: 80px; height: 80px; border: 1px solid gray;"></div>
							<dl style="margin-left: 10px;" class="profileCard">
								<dt class="profileName">
									<a id="goDetail" onclick="detailProfile();"><c:out value="${ ml.member.ename }" /></a>
								</dt>
								<dd>
									<c:out value="${ ml.member.dname }" />
								</dd>
								<dd>
									<c:out value="${ ml.member.jname }" />
								</dd>
							</dl>
						</div>
					</c:when>
				</c:choose>
			</c:forEach>

		</div>
                        
	<c:forEach var="md" items="${ membersList }">
	<!-- The Modal1 -->
			<div id="myModal" class="modal">

				<!-- Modal content -->
				<div class="modal-content" style="">
					<button id="modalCloseBtn" onClick="close_modal1();"></button>
					<div class="inner-content">
						<p id="infor">직원 정보</p>
						<div id="profileTitle">
						<table class="titleTable">
						<tr>
							<td rowspan="4" id="imgTd">
							<div id="profileImg"></div>
							</td>
						</tr>
						<tr>
							<td><p id="ename">최우아</p></td>
						</tr>
						<tr>
							<td id="teamNcorp">IT WORKS > 기술지원팀</td>
						</tr>
						<tr>
							<td id="jlevel">사원</td>
						</tr>	
						</table>
						</div>
						<div class="profileContent">
						<table class="profileTable"> 
							<tr>
								<td>입사일</td>
								<td>2020-01-01</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td>2020-01-01</td>
							</tr>
							<tr>
								<td>사내 전화</td>
								<td>2020-01-01</td>
							</tr>
							<tr>
								<td>휴대 전화</td>
								<td>2020-01-01</td>
							</tr>
							<tr>
								<td>사번</td>
								<td>2020-01-01</td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td>2020-01-01</td>
							</tr>
							<tr>
								<td>기타 정보</td>
								<td>2020-01-01</td>
							</tr>
						</table>
						</div>
					</div>
				</div>
			</div>
			<!--End Modal-->
	</c:forEach>
	</div>
	
</body>
<script>
var name = "${ membersList }";

	
	function detailProfile() {
        $('#myModal').fadeIn(300);
        console.log(name[2].corpName);
	}
	
    function close_modal1(flag) {
        $('#myModal').fadeOut(300);
    }

</script>
</html>

















