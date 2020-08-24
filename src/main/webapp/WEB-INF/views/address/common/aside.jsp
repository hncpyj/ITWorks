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
#addAddressWindow {
	display: none;
	width: 500px;
	height:600px;
	padding: 20px 20px 20px 20px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
}

#addAddressWindow .modal_close_btn {
	
}

a.button {
	display: inline-block;
	padding: 10px 20px;
	text-decoration: none;
	color: #fff;
	background: #000;
	margin: 20px;
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
.modal-title {
	margin-bottom:10px;
}
#add-address-table {
	margin-top:10px;
	margin-bottom:10px;
	border-collapse: separate;
	border-spacing:0 5px;
}
input {
	height:30px;
	radius:0;
}
#dept, #position {
	width:30%;
}
#company {
	width:31%;
}
.firstLabel {
	width:50px;
	font-size:12px;
}
.secondInput {
	margin-left:20px;
	width:350px;
}
#add-address-table select {
	height:35px;
}
#saveBtn {
	float:right;
}
#conSaveBtn {
	float:right;
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
		<div id="addAddressWindow">
		<div class="modal-title"><p>주소 추가</p></div>
		<hr>
			<form>
				<table id="add-address-table">
					<tr>
						<td style="padding-bottom:5px;" colspan="2">
							<button type="button">개인주소록</button><button type="button">공유주소록</button>
						</td>
					</tr>
					<tr>
						<td class="firstLabel"><label>이름 *</label></td>
						<td class="secondInput"><input type="text" placeholder="이름을 입력하세요" style="width:100%;"></td>
					</tr>
					<tr>
						<td class="firstLabel"><label>이메일</label></td>
						<td class="secondInput"><input type="email" placeholder="이메일을 입력하세요" style="width:100%;"></td>
					</tr>
					<tr>
						<td class="firstLabel"><label>전화</label></td>
						<td class="secondInput">
							<select style="float:left; margin-right:5px;">
								<option>휴대폰</option>	
							</select>
							<input type="text" style="display:inline-block; width:78%;">
						</td>
					</tr>
					<tr>
						<td class="firstLabel"><label>태그</label></td>
						<td class="secondInput">
							<select style="width:100%;">
								<option>선택</option>
								<option>선택</option>
							</select>
						</td>
						<td><input type="button" value="새 태그 만들기"></td>
					</tr>
					<tr>
						<td class="firstLabel"><label>회사</label></td>
						<td class="secondInput">
							<input type="text" placeholder="회사" id="company">
							<input type="text" placeholder="부서" id="dept">
							<input type="text" placeholder="직급" id="position">
						</td>
					</tr>
					<tr>
						<td class="firstLabel"><label>주소</label></td>
						<td class="secondInput"><input type="text" placeholder="주소를 입력하세요" style="width:100%;"></td>
					</tr>
					<tr>
						<td class="firstLabel"><label>홈페이지</label></td>
						<td class="secondInput"><input type="text" placeholder="주소를 입력하세요" style="width:100%;"></td>
					</tr>
					<tr>
						<td class="firstLabel"><label>생일</label></td>
						<td class="secondInput"><input type="text" placeholder="YYYYMMDD" style="width:100%;"></td>
					</tr>
					<tr>
						<td class="firstLabel" style="padding-top:0;"><label>메모</label></td>
						<td class="secondInput"><textarea style="resize:none;width:100%; height:80px;" placeholder="내용을 입력하세요"></textarea></td>
					</tr>
				</table>	
				<hr>	
				<div style="height:30px;"></div>	
				<button class="modal_close_btn">취소</button>
				<button id="saveBtn">저장</button>
				<button id="conSaveBtn">저장 후 계속 추가</button>
			</form>

		</div>
	</section>
</body>
<script>

	function modal(id) {
		var zIndex = 9999;
		var modal = document.getElementById(id);

		// 모달 div 뒤에 희끄무레한 레이어
		var bg = document.createElement('div');
		bg.setStyle({
			position : 'fixed',
			zIndex : zIndex,
			left : '0px',
			top : '0px',
			width : '100%',
			height : '100%',
			overflow : 'auto',
			// 레이어 색갈은 여기서 바꾸면 됨
			backgroundColor : 'rgba(0,0,0,0.4)'
		});
		document.body.append(bg);

		// 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
		modal.querySelector('.modal_close_btn').addEventListener('click',
				function() {
					bg.remove();
					modal.style.display = 'none';
				});

		modal
				.setStyle({
					position : 'fixed',
					display : 'block',
					boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

					// 시꺼먼 레이어 보다 한칸 위에 보이기
					zIndex : zIndex + 1,

					// div center 정렬
					top : '50%',
					left : '50%',
					transform : 'translate(-50%, -50%)',
					msTransform : 'translate(-50%, -50%)',
					webkitTransform : 'translate(-50%, -50%)'
				});
	}

	// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
	Element.prototype.setStyle = function(styles) {
		for ( var k in styles)
			this.style[k] = styles[k];
		return this;
	};

	document.getElementById('addAddressBtn').addEventListener('click',
			function() {
				// 모달창 띄우기
				modal('addAddressWindow');
			});
</script>
</html>