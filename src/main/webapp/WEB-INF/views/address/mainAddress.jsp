<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.itworks.address.model.vo.AddressVO"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% ArrayList<AddressVO> list = (ArrayList<AddressVO>) request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ItWorks</title>
<link rel="icon" href="${contextPath}/resources/images/favicon.ico" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
aside {
	float: left;
}
section {
	display: inline-block;
	width: 75%;
	margin-left: 50px;
	margin-top: 30px;
}

#middleSection {
	width: 100%;
}

#addressTable {
	width: 100%;
	border-collapse: collapse;
	text-align: center;
	margin-top: 30px;
}

#addressTable tr {
	border-bottom: 0.5px solid #9F9F9F;
	border-top: 0.5px solid #9F9F9F;
}

#checkAddress {
	width: 20px;
	height: 20px;
	border-radius: 0px;
}

#addressTable td, th {
	padding-top: 10px;
	padding-bottom: 10px;
}

#addressTable th {
	font-size: 18px;
	font-weight: normal;
	background-color: white;
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

#addressCount {
	color: #29A2F7;
}

#searchBox {
	border-radius: 30px;
	border: 1px solid #29A2F7;
	padding: 10px;
}

#star {
	height: 15px;
	width: 15px;
	/*visibility: hidden;*/
}

#star:hover {
	visibility: visible;
	cursor: pointer;
}

.titleTable {
	width: 100%;
	margin-right: 0px;
}

#toggleBtn {
	background: url("./resources/images/toggleBtn.png" ) no-repeat;
	border: none;
	width: 10px;
	height: 10px;
	cursor: pointer;
	outline: none;
}
.modal-title {
	margin-bottom: 10px;
}

#add-address-table {
	margin-top: 10px;
	margin-bottom: 10px;
	border-collapse: separate;
	border-spacing: 0 5px;
}

input.modalSection {
	height: 30px;
	radius: 0;
}

#dept, #position {
	width: 30%;
}

#company {
	width: 31%;
}

.firstLabel {
	width: 50px;
	font-size: 12px;
}

.secondInput {
	margin-left: 20px;
	width: 350px;
}

#add-address-table select {
	height: 35px;
}

#saveBtn {
	float: right;
}

#conSaveBtn {
	float: right;
}

#hiddenText {
	display:none;
}
.addressWindow {
	display: none;
	width: 500px;
	height: 600px;
	padding: 20px 20px 20px 20px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;	
}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<%@ include file="./common/aside.jsp"%>
	<section class="main">
		<div id="middleSection">
			<div class="mainTitleArea">
				<table class="titleTable">
					<tr>
						<td style="width:130px;"><span>개인 주소록</span></td>
						<td style="width: 560px;"></td>
						<td><label>개인 주소록</label>&nbsp;<label id="addressCount"><c:out value="${listCount}"/></label>&nbsp;
							<label>개</label>&nbsp;&nbsp;&nbsp;</td>
						<td><input type="search" placeholder="이름, 회사명, 전화번호 검색"
							id="searchBox"></td>
					</tr>
				</table>
			</div>
			<div>
			<table id="addressTable">
				<tr style="width: 100%;">
					<th style="width: 5%;"><input type="checkbox" id="checkAddress"></th>
					<th style="width: 5%;"></th>
					<th style="width: 10%;">이름</th>
					<th style="width: 30%;">이메일</th>
					<th style="width: 15%;">전화번호</th>
					<th style="width: 10%;">회사
						<button id="toggleBtn" type="button"></button>
					</th>
					<th style="width:24%;">태그</th>
					<th id="hiddenText" style="width:1%;"></th>
				</tr>
				<c:forEach var ="prv" items="${ list }">
					<tr>
						<td class="${prv.contactsNo }" style="width: 5%;"><input type="checkbox" id="checkAddress"></td>
						<td class="${prv.contactsNo }" style="width: 5%;" id="importantAdr"><img src="./resources/images/star.png" id="star"></td>
						<td class="${prv.contactsNo }" style="width: 10%;"><c:out value="${prv.conName }"></c:out></td>
						<td class="${prv.contactsNo }" style="width: 30%;"><c:out value="${prv.email }"></c:out></td>
						<td class="${prv.contactsNo }" style="width: 15%;"><c:out value="${prv.conPhone }"></c:out></td>
						<td class="${prv.contactsNo }" style="width: 10%;"><c:out value="${prv.conCorp }"></c:out></td>
						<td class="${prv.contactsNo }" style="width: 24%;"><c:out value="${prv.tagName }"></c:out></td>
						<td class="${prv.contactsNo }" id="hiddenText" style="width: 1;"><c:out value="${prv.contactsNo }"/></td>						
					</tr>
				</c:forEach>				
			</table>
			</div>
			<!-- 페이징 처리 영역 -->
			<div id="pagingArea" align="center">
				<c:if test="${ pi.currentPage <= 1 }">
            [이전] &nbsp;
         </c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="prvBack" value="mainAddress.ad">
						<c:param name="currnetPage" value="${ pi.currentPage - 1 }"></c:param>
					</c:url>
					<a href="${ prvBack }">[이전]</a> &nbsp;
         </c:if>

				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="red" size="4"><b>[${ p }]</b></font>
					</c:if>
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="prvListCheck" value="mainAddress.ad">
							<c:param name="currentPage" value="${ p }"></c:param>
						</c:url>
						<a href="${prvListCheck }">${ p }</a>
					</c:if>
				</c:forEach>

				<c:if test="${ pi.currentPage >= pi.maxPage }">
            &nbsp; [다음]
         </c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="prvListEnd" value="mainAddress.ad">
						<c:param name="currentPage" value="${ pi.currentPage + 1 }"></c:param>
					</c:url>
            &nbsp; <a href="${ prvListEnd }">[다음]</a>
				</c:if>
			</div>
			<!-- 페이징 영역 끝 -->	
		</div>
	</section>		
	<section>
	<input type="hidden" id="size" value="${list.size() }">
		<c:forEach var ="address" items="${ list }" varStatus="i">
		<input type="hidden" id="contacts${i.count}" value="${address.contactsNo }">	
		<div id="modal${ address.contactsNo }" class="addressWindow">
			<div class="modal-title">
				<p><c:out value="${ address.conName }"/></p>
			</div>
			<hr>
			<form action="update.ad" method="post">
				<table id="prvAddressDetail">
					<tr>
						<td class="firstLabel"><label>이메일</label></td>
						<td class="secondInput"><c:out value="${ address.email }"/></td>
					</tr>
					<tr>
						<td class="firstLabel"><label>전화</label></td>
						<td class="secondInput"><c:out value="${ address.conPhone }"/></td>
					</tr>
					<tr>
						<td class="firstLabel"><label>태그</label></td>
						<td class="secondInput"><c:out value="${ address.tagName }"/></td>
						<td>태그</td>
					</tr>
					<tr>
						<td class="firstLabel"><label>회사</label></td>
						<td><c:out value="${ address.conCorp }"/></td>
					</tr>
					<tr>
						<td class="firstLabel"><label>부서</label></td>
						<td><c:out value="${ address.deptNo }"/></td>
					</tr>
					<tr>
						<td class="firstLabel"><label>직급</label></td>
						<td><c:out value="${ address.jobNo }"/></td>
					</tr>
					<tr>
						<td class="firstLabel"><label>주소</label></td>
						<td class="secondInput"><c:out value="${ address.realAddress }"/></td>
					</tr>
					<tr>
						<td class="firstLabel"><label>홈페이지</label></td>
						<td class="secondInput"><c:out value="${ address.homePage }"/></td>
					</tr>
					<tr>
						<td class="firstLabel"><label>생일</label></td>
						<td class="secondInput"><c:out value="${ address.conBirthDay }"/></td>
					</tr>
					<tr>
						<td class="firstLabel" style="padding-top: 0;"><label>메모</label></td>
						<td class="secondInput"><c:out value="${ address.conContent }"/></td>
					</tr>
				</table>
				<hr>
				<div style="height: 30px;"></div>
				<button class="realmodal_close_btn${ address.contactsNo }" type="button">닫기</button>
				<button id="updateBtn${ address.contactsNo }" type="submit">수정</button>
			</form>
		</div>
		</c:forEach>
	</section>
</body>
<script>
	//글 셀렉트원
<%-- <% for(AddressVO address : list) {%>
$(function() {
	$("#addressTable td").mouseover(function() {
		$(this).parent().css({
			"background" : "#E4E4E4",
			"cursor" : "pointer"
		});
	}).mouseleave(function() {
		$(this).parent().css({
			"background" : "#fafafa"
		});
	}).click(function() {
		modalAddressWindow('#modal<%= address.getContactsNo() %>');
	});		
});
<%}%> --%>



$(function() {
	$("#addressTable td").mouseover(function() {
		$(this).parent().css({
			"background" : "#E4E4E4",
			"cursor" : "pointer"
		});
	}).mouseleave(function() {
		$(this).parent().css({
			"background" : "#fafafa"
		});
	}).click(function() {
	var modalclass = $(this).attr('class');

		modalAddressWindow('modal'+modalclass);

	});
});

</script>	
<script>
function modalAddressWindow(id) {
	
	var zIndex = 9999;
	var modalAddressWindow = document.getElementById(id);
console.log(modalAddressWindow);
	// 모달 div 뒤에 희끄무레한 레이어
	var bgg = document.createElement('div');
	bgg.setStyle({
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
	document.body.append(bgg);
	console.log(bgg);
	
	
	// 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
	var size = $("#size").val();
	for (var i = 1; i < size+1; i++) {
		
	/* modalAddressWindow.querySelector('.realmodal_close_btn'+$("#contacts"+i).val()).addEventListener('click',
			function() {
				bgg.remove();
				modalAddressWindow.style('display', 'none');
				console.log(modalAddressWindow.style('display', 'none'));
			}); */
	
	$('.realmodal_close_btn'+$("#contacts"+i).val()).click(function() {
		bgg.remove();
		modalAddressWindow.style.display = 'none';
	});
	}
	
	modalAddressWindow.setStyle({
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


</script>

</html>