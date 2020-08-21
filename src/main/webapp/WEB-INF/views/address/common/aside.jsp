<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="${contextPath}/resources/images/favicon.ico"
	type="image/x-icon">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
#modal-title {
	font-size: 18px;
	font-weight: bold;
}

table {
	border-collapse: seperate;
	width: 100%;
}

tr {
	margin-top: 10px;
	margin-bottom: 10px;
}

input {
	height: 30px;
}

#modal-wrapper {
	width: 500px;
	height: 600px;
}

#addAddressModal tr td:first-of-type {
	width: 50px;
}

a.button {
	display: inline-block;
	padding: 10px 20px;
	text-decoration: none;
	color: #fff;
	background: #000;
	margin: 20px;
}

#modal {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.3);
}

.modal-con {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	max-width: 60%;
	min-height: 30%;
	background: #fff;
}

.modal-con .con {
	font-size: 15px;
	line-height: 1.3;
	padding: 30px;
}

* {
	margin: 0px;
	font-family: "Noto Sans KR";
}

body {
	background: #fafafa;
}

header {
	height: 56px;
	background: white;
	float: left;
}

#logoDiv {
	display: inline-block;
	width: 250px;
	height: 56px;
}

#logo {
	margin-top: 11px;
	margin-left: 44px;
}

#asideBack {
	width: 250px;
	height: 900px;
	background: #E4EBF3;
}

nav a {
	text-decoration: none;
	color: #004771;
	font-size: 17px;
}

nav {
	width: 100%;
	height: 56px;
	background: white;
}

nav ul, #asideBack ul {
	list-style: none;
}

nav li {
	display: table-cell;
	width: 120px;
	height: 56px;
	text-align: center;
	vertical-align: middle;
}

.menu:hover {
	background: #004771;
	cursor: pointer;
}

.menu:hover>a {
	color: white;
}

#asideBack ul li {
	padding-left: 25px;
	height: 35px;
	vertical-align: middle;
}

#asideMenuTitle {
	padding-top: 22px;
	padding-left: 36px;
	font-size: 15px;
	color: #004771;
	margin-bottom: 10px;
}

#addAddress {
	padding-top: 20px;
}

.asideMenu {
	text-decoration: none;
	color: #004771;
	font-size: 14px;
}

#asideBack a:hover {
	font-weight: bold;
	color: #004771;
	text-decoration: none;
}

#addAddressBtn, input:focus {
	outline: none;
}

#asideBack a:visited, a:link {
	color: #004771;
	text-decoration: none;
}

#addAddressBtn {
	background: url("./resources/images/addAddressBtn.png" ) no-repeat;
	border: none;
	width: 175px;
	height: 48px;
	cursor: pointer;
}

</style>
</head>
<body>
	<aside>
		<div id="asideBack">
			<div align="center" id="addAddress">
				<button id="addAddressBtn" class="button modal-open"
					onclick="javascript:openModal('modal1');"></button>
			</div>
			<div id="asideMenuTitle">
				<a href="importantAddress.ad">중요 주소록</a>
			</div>
			<div id="asideMenuTitle">개인 주소록</div>
			<ul>
				<li><a href="mainAddress.ad" class="asideMenu">- 전체 주소록</a></li>
				<li><a href="#" class="asideMenu">- 태그명</a></li>
			</ul>
			<div id="asideMenuTitle">
				<a href="shareAddress.ad">공유 주소록</a>
			</div>
		</div>
	</aside>
	<section>
		<!-- 모달창 영역 -->
		<div id="modal"></div>
		<div class="modal-con modal1">
			<p class="title">주소추가</p>
			<hr>
			<div id="con">
				<hr>
				<form>
					<table id="addAddressModal">
						<tr>
							<td colspan="5"><input type="button" value="개인 주소록"><input
								type="button" value="공유 주소록"></td>
						</tr>
						<tr>
							<td style="width: 200px;">이름 *</td>
							<td colspan="3" style="width: 400px;"><input type="text"
								placeholder="이름을 입력하세요"></td>
							<td></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td colspan="3"><input type="email" placeholder="이메일을 입력하세요">
							</td>
							<td><input type="button"></td>
						</tr>
						<tr>
							<td>전화</td>
							<td><select>
									<option>휴대폰</option>
							</select></td>
							<td colspan="2"><input type="text"></td>
							<td><input type="button"></td>
						</tr>
						<tr>
							<td>태그</td>
							<td colspan="3"><select>
									<option>태그</option>
							</select></td>
							<td><input type="button" value="새 태그 만들기"></td>
						</tr>
						<tr>
							<td>회사</td>
							<td><input type="text" placeholder="회사"></td>
							<td><input type="text" placeholder="부서"></td>
							<td><input type="text" placeholder="직급"></td>
							<td></td>
						</tr>
						<tr>
							<td>주소</td>
							<td colspan="3"><input type="text" placeholder="주소를 입력하세요">
							</td>
							<td></td>
						</tr>
						<tr>
							<td>홈페이지</td>
							<td colspan="3"><input type="text"
								placeholder="홈페이지 주소를 입력하세요"></td>
							<td></td>
						</tr>
						<tr>
							<td>생일</td>
							<td colspan="3"><input type="text" placeholder="YYYYMMDD">
							</td>
							<td></td>
						</tr>
						<tr>
							<td>메모</td>
							<td colspan="3"><textarea placeholder="내용을 입력하세요"></textarea>
							</td>
							<td></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</section>
</body>
<script>
	function openModal(modalname) {
		document.get
		$("#modal").fadeIn(300);
		$("." + modalname).fadeIn(300);
	}

	$("#modal, .close").on('click', function() {
		$("#modal").fadeOut(300);
		$(".modal-con").fadeOut(300);
	});
</script>
</html>