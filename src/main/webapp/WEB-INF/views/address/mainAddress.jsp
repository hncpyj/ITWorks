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

.checkAddress, .allCheckAddress {
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

.star {
	height: 15px;
	width: 15px;
	/*visibility: hidden;*/
}

.star:hover {
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

.firstDetail {
	width: 100px;
	font-size: 16px;
}

.secondPrint {
	margin-left: 20px;
	width: 350px;
	font-size:16px;
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
.addressWindow, .addressWindow2 {
	display: none;
	width: 500px;
	height: auto;
	padding: 20px 20px 20px 20px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;	
	margin-top:10px;
	margin-bottom:10px;
}
#modalBtnArea {
	
}
#searchBtn {
	background: url("./resources/images/glass.png" ) no-repeat;
	width:26px;
	height:20px;
	border: none;
}
#prvAddressDetail {
    border-collapse: separate;
    border-spacing: 10px;
    padding-top:15px;
}
#closeBtn {
	background: url("./resources/images/xBtn.png" ) no-repeat;
	width:57px;
	height:26px;
	border: none;	
}
.updateBtn {
	background: url("./resources/images/updateBtn.png" ) no-repeat;
	width:57px;
	height:26px;
	border: none;	
}
.star {
	cursor:pointer;
}
#deleteBtn { 
	cursor:pointer;
	border:none;
	background:none;
	font-size:18px;
	color:#29A2F7;
}
#deleteBtn:hover {
	background:rgb(239, 239, 239);
}
.modal {
   display: none; /* Hidden by default */
   position: fixed; /* Stay in place */
   z-index: 1; /* Sit on top */
   left: 0;
   top: 0;
   width: 500px; /* Full width */
   height: auto; /* Full height */
   overflow: auto; /* Enable scroll if needed */
   background-color: rgb(0, 0, 0); /* Fallback color */
   background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
   	margin-top:10px;
	margin-bottom:10px;
}
.modal-content {
   background-color: #fefefe;
   border: 1px solid #888;
   	border-radius: 3px;	

		padding: 20px 20px 20px 20px;
	
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
						<td style="width: 540px;"></td>
						<td><label>개인 주소록</label>&nbsp;<label id="addressCount"><c:out value="${listCount}"/></label>&nbsp;
							<label>개</label>&nbsp;&nbsp;&nbsp;</td>
						<td><input type="search" placeholder="이름, 회사명, 전화번호 검색"
							id="searchBox">&nbsp;<button id="searchBtn" onclick="searchMainAddress();"></button></td>
					</tr>
				</table>
			<script>
				function searchMainAddress() {
					var searchValue=$("#searchBox").val();
					location.href="search.ad?searchValue="+ searchValue;
				}
			</script>
			</div>
			<form action="delete.ad" method="post">
			<div id="deleteBtnArea" style="visibility:hidden; height:20px;">
				<div id="countCheck"></div>
				<button id="deleteBtn">삭제</button>
			</div>
			<table id="addressTable">
				<tr style="width: 100%;">
					<th style="width: 5%;"><input name="checkboxs" type="checkbox" class="allCheckAddress" onclick="showMe('deleteBtnArea')"></th>
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
				<c:forEach var="prv" items="${ list }">
					<tr>
						<th class="${prv.contactsNo }" style="width: 5%;">
						<input name="checkboxs" value="${prv.contactsNo }" type="checkbox" class="checkAddress" onclick="showMe('deleteBtnArea')">
						</th>
						<th class="${prv.contactsNo }" style="width: 5%;" id="importantAdr">
						<c:choose>
						<c:when test="${ prv.importCon eq 'N' }">
						<div id="reload">
						<img src="./resources/images/star.png" name="${ prv.importCon }" class="star" id="${prv.contactsNo }" 
								onclick="importantStatus(this.id);">
						</div>
						</c:when>
						<c:otherwise>
						<div id="reload">
						<img src="./resources/images/ystar.png"  name="${ prv.importCon }" class="star" id="${prv.contactsNo }" 
								onclick="importantStatus(this.id);">
						</div>
						</c:otherwise>
						</c:choose>
						</th>
						<td class="${prv.contactsNo }" style="width: 10%;"><c:out value="${prv.conName }"></c:out></td>
						<td class="${prv.contactsNo }" style="width: 30%;"><c:out value="${prv.email }"></c:out></td>
						<td class="${prv.contactsNo }" style="width: 15%;"><c:out value="${prv.conPhone }"></c:out></td>
						<td class="${prv.contactsNo }" style="width: 10%;"><c:out value="${prv.conCorp }"></c:out></td>
						<td class="${prv.contactsNo }" style="width: 24%;"><c:out value="${prv.tagName }"></c:out></td>
						<td class="${prv.contactsNo }" id="hiddenText" style="width: 1;"><c:out value="${prv.contactsNo }"/></td>						
					</tr>
				</c:forEach>				
			</table>
			</form>
			</div>
			<!-- 페이징 처리 영역 -->
			<div style="height:20px;"></div>
			<div id="pagingArea" align="center">
				<c:if test="${ pi.currentPage <= 1 }">
            << &nbsp;
       		    </c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="prvBack" value="mainAddress.ad">
						<c:param name="currnetPage" value="${ pi.currentPage - 1 }"></c:param>
					</c:url>
					<a href="${ prvBack }"><<</a> &nbsp;
         </c:if>

				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="#29A2F7" size="4"><b>${ p }</b></font>
					</c:if>
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="prvListCheck" value="mainAddress.ad">
							<c:param name="currentPage" value="${ p }"></c:param>
						</c:url>
						<a href="${prvListCheck }">${ p }</a>
					</c:if>
				</c:forEach>

				<c:if test="${ pi.currentPage >= pi.maxPage }">
            &nbsp; >>
         </c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="prvListEnd" value="mainAddress.ad">
						<c:param name="currentPage" value="${ pi.currentPage + 1 }"></c:param>
					</c:url>
            &nbsp; <a href="${ prvListEnd }">>></a>
				</c:if>
			</div>
			<!-- 페이징 영역 끝 -->	

	</section>	
	
	<section>
	<input type="hidden" id="size" value="${list.size() }">
		<c:forEach var ="address" items="${ list }" varStatus="i">
		<input type="hidden" id="contacts${i.count}" value="${address.contactsNo }">	
		<div id="modal${ address.contactsNo }" class="modal">
			<div class="modal-content">
			<div class="modal-title">
				&nbsp;&nbsp;
				<c:choose>
				<c:when test="${ address.importCon eq 'N' }">
						<img src="./resources/images/star.png" class="star">
						</c:when>
						<c:otherwise>
						<img src="./resources/images/ystar.png" class="star">
						</c:otherwise>
				</c:choose>
				&nbsp;
				<span><c:out value="${ address.conName }"/></span>
			</div>
			<hr color = "#C4C4C4" size = "0.75">
			<form>
				<table id="prvAddressDetail">
					<c:choose>
					<c:when test="${ not empty address.email}">
					<tr id="email">
						<td class="firstDetail">이메일</td>
						<td class="secondPrint" id="modalEmail"><c:out value="${ address.email }"/></td>
					</tr>
					</c:when>
					<c:otherwise>			
					</c:otherwise>
					</c:choose>
					
					<c:choose>
					<c:when test="${ not empty address.conPhone}">
					<tr id="phone">
						<td class="firstDetail"><label>전화</label></td>
						<td class="secondPrint" id="modalPhone"><c:out value="${ address.conPhone }"/></td>
					</tr>
					</c:when>
					<c:otherwise>			
					</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${ not empty address.tagName}">
					<tr id="tag">
						<td class="firstDetail"><label>태그</label></td>
						<td class="secondPrint" id="modalTag"><c:out value="${ address.tagName }"/></td>
					</tr>
					</c:when>
					<c:otherwise>			
					</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${ not empty address.conCorp}">
					<tr id="corp">
						<td class="firstDetail"><label>회사</label></td>
						<td class="secondPrint" id="modalCorp"><c:out value="${ address.conCorp }"/></td>
					</tr>
					</c:when>
					<c:otherwise>			
					</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${ not empty address.deptNo}">
					<tr id="dept">
						<td class="firstDetail"><label>부서</label></td>
						<td class="secondPrint" id="modalDept"><c:out value="${ address.deptNo }"/></td>
					</tr>
					</c:when>
					<c:otherwise>			
					</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${ not empty address.jobNo}">
					<tr id="job">
						<td class="firstDetail"><label>직급</label></td>
						<td class="secondPrint" id="modalJob"><c:out value="${ address.jobNo }"/></td>
					</tr>
					</c:when>
					<c:otherwise>			
					</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${ not empty address.realAddress}">
					<tr id="address">
						<td class="firstDetail"><label>주소</label></td>
						<td class="secondPrint" id="modalAddress"><c:out value="${ address.realAddress }"/></td>
					</tr>
					</c:when>
					<c:otherwise>			
					</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${ not empty address.homePage}">
					<tr id="homepage">
						<td class="firstDetail"><label>홈페이지</label></td>
						<td class="secondPrint" id="modalHomepage"><c:out value="${ address.homePage }"/></td>
					</tr>
					</c:when>
					<c:otherwise>			
					</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${ not empty address.conBirthDay}">
					<tr id="birth">
						<td class="firstDetail"><label>생일</label></td>
						<td class="secondPrint" id="modalBirth"><c:out value="${ address.conBirthDay }"/></td>
					</tr>
					</c:when>
					<c:otherwise>			
					</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${ not empty address.conContent}">
					<tr id="memo">
						<td class="firstDetail" style="padding-top: 0;"><label>메모</label></td>
						<td class="secondPrint" id="modalMemo"><c:out value="${ address.conContent }"/></td>
					</tr>
					</c:when>
					<c:otherwise>			
					</c:otherwise>
					</c:choose>
				</table>
				<div style="height: 15px;"></div>
				<div id="modalBtnArea" align="center">
				<button id="closeBtn" class="realmodal_close_btn${ address.contactsNo }" type="button"></button>
				&nbsp;
				<button class="updateBtn" id="updateBtn${ address.contactsNo }" onclick="updateAddress()" name="updateBtn" type="button"></button>
				</div>
				<div style="height: 15px;"></div>
			</form>
			</div>
		</div>
		</c:forEach>
	</section>
</body>
<script>
	function updateAddress(clicked_id) {
		$("#email td: nth-child(2)").empty();
		$("#email td: nth-child(2)").append('<input type="text">');
		console.log("123");
	}
</script>
<script>
	function importantStatus(clicked_id) {
		
		var conNo = clicked_id;
		var conStatus = $("#"+conNo).attr("name");
		
		console.log(conNo);
		console.log(conStatus);
		
		$.ajax({
			url:"changeStatus.ad",
			type:"get",
			data: { conNo : conNo, 
					conStatus : conStatus },
			success: function(data) {
					if(data == "Y") {
						document.getElementById(conNo).setAttribute("src","./resources/images/ystar.png");
					} else if(data == "N") { 
						document.getElementById(conNo).setAttribute("src","./resources/images/star.png");
					};
			},
			error: function() {
				}
		})		
	}
</script>
<script>
	function showMe(box) {
		var chboxs = document.getElementsByName("checkboxs");
		var vis = "hidden";
		for (var i = 0; i < chboxs.length; i++) {
			if (chboxs[i].checked) {
				vis = "visible";
				break;
			}
		}
		document.getElementById(box).style.visibility = vis;
	}
</script>
<script>
	function selectChkBox() {

		var sum = 0;
		var result = document.getElementById("#countCheck").innerHTML;
		var count = ('#addressTable').checkbox.length;
		for (var i = 0; i < count; i++) {
			if (('#addressTable').checkbox[i].checked == true) {
				result += 1;
			}
		}
	}
	var email;
	var phone;
	var tag;
	var corp;
	var dept;
	var job;
	var address;
	var homepage;
	var birth;
	var memo;
	var button;

	function updateAddress() {
	//	modalAddressWindow(rootcontext);
	//	modalAddressWindow(rootcontext + "a");
		$("#modal"+modalclass+" #email").find(".secondPrint").empty();
		$("#modal"+modalclass+" #email").find(".secondPrint").append('<input type="text" value="'+email+'">');
		
		$("#modal"+modalclass+" #phone").find(".secondPrint").empty();
		$("#modal"+modalclass+" #phone").find(".secondPrint").append('<input type="text" value="'+phone+'">');
		
		$("#modal"+modalclass+" #tag").find(".secondPrint").empty();
		$("#modal"+modalclass+" #tag").find(".secondPrint").append('<input type="text" value="'+tag+'">');
		
		$("#modal"+modalclass+" #corp").find(".secondPrint").empty();
		$("#modal"+modalclass+" #corp").find(".secondPrint").append('<input type="text" value="'+corp+'">');
		
		$("#modal"+modalclass+" #dept").find(".secondPrint").empty();
		$("#modal"+modalclass+" #dept").find(".secondPrint").append('<input type="text" value="'+dept+'">');
		
		$("#modal"+modalclass+" #job").find(".secondPrint").empty();
		$("#modal"+modalclass+" #job").find(".secondPrint").append('<input type="text" value="'+job+'">');
		
		$("#modal"+modalclass+" #address").find(".secondPrint").empty();
		$("#modal"+modalclass+" #address").find(".secondPrint").append('<input type="text" value="'+address+'">');
		
		$("#modal"+modalclass+" #homepage").find(".secondPrint").empty();
		$("#modal"+modalclass+" #homepage").find(".secondPrint").append('<input type="text" value="'+homepage+'">');
		
		$("#modal"+modalclass+" #birth").find(".secondPrint").empty();
		$("#modal"+modalclass+" #birth").find(".secondPrint").append('<input type="text" value="'+birth+'">');
		
		$("#modal"+modalclass+" #memo").find(".secondPrint").empty();
		$("#modal"+modalclass+" #memo").find(".secondPrint").append('<input type="text" value="'+memo+'">');

	}

	var rootcontext = "";
	//체크박스 한번에 하기 
	$(document).ready(function() {
		$('.allCheckAddress').click(function() {
			$('.checkAddress').prop('checked', this.checked);
		});
	});
var modalclass;
	//글 셀렉트원
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
		}).click(
				function() {
					 modalclass = $(this).attr('class');
					for (var i = 1; i < size + 1; i++) {

						$('.realmodal_close_btn' + $("#contacts" + i).val())
								.click(function() {
						//			bgg.remove();
							//		modalAddressWindow.style.display = 'none';
								
								});
					}
		
					modalAddressWindow('modal' + modalclass);
					$("#modal"+modalclass).fadeIn(300);
					
					<button class="updateBtn" id="updateBtn${ address.contactsNo }" onclick="updateAddress()" name="updateBtn" type="button"></button>
					$( 'p.b' ).find( 'span.ip' ).css( 'font-size', '2em');

					console.log($("#modal"+modalclass+" #email").find(".secondPrint").text());
					email = $("#modal"+modalclass+" #email").find(".secondPrint").text();
					phone = $("#modal"+modalclass+" #phone").find(".secondPrint").text();
					tag = $("#modal"+modalclass+" #tag").find(".secondPrint").text();
					corp = $("#modal"+modalclass+" #corp").find(".secondPrint").text();
					job = $("#modal"+modalclass+" #job").find(".secondPrint").text();
					dept = $("#modal"+modalclass+" #dept").find(".secondPrint").text();
					address = $("#modal"+modalclass+" #address").find(".secondPrint").text();
					homepage = $("#modal"+modalclass+" #homepage").find(".secondPrint").text();
					birth = $("#modal"+modalclass+" #birth").find(".secondPrint").text();
					memo = $("#modal"+modalclass+" #memo").find(".secondPrint").text();
					button = $(".updateBtn").find("").
					
					rootcontext = 'modal' + modalclass;
					console.log(rootcontext);
				});
	});
	$(document).on("click","realmodal_close_btn",function() {
		$("#modal"+modalclass).fadeOut(300);
	})
</script>
<script>
	var bgg;
	function modalAddressWindow(id) {

		var zIndex = 9999;
		var modalAddressWindow = document.getElementById(id);
		// 모달 div 뒤에 희끄무레한 레이어
		bgg = document.createElement('div');
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

		// 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
		var size = $("#size").val();
		for (var i = 1; i < size + 1; i++) {

			$('.realmodal_close_btn' + $("#contacts" + i).val()).click(
					function() {
						bgg.remove();
						modalAddressWindow.style.display = 'none';
					});
		}

		modalAddressWindow
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
</script>
</html>