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
#orgTable {
	width: 100%;
	border-collapse: collapse;
	text-align: left;
	margin-top: 30px;
}
#inner-title {
	color: #004771;
	font-family: Noto Sans KR;
	font-style: normal;
	font-weight: 500;
	font-size: 24px;
	line-height: 35px;
	margin-top: 30px;
}

#inner-title span {
	margin-left: 20;
}

#searchBox {
	border-radius: 30px;
	border: 1px solid #29A2F7;
	padding: 10px;
}
tr {
	border-bottom: 0.5px solid #9F9F9F;
	border-top: 0.5px solid #9F9F9F;
}
#orgTable td:first-of-type{
	width:400px;
	border-right:0.5px solid #9F9F9F;
}
#orgTable td, th {
	padding-top: 10px;
	padding-bottom: 10px;
}
#orgTable p {
	margin-left:30px;
}
#rowdept {
    display : none;
}
tr.dept {
    display : table-row;
    cursor : pointer;
	background:#EEF3FA;
}
#ortTable a {
	text-decoration: none;
	color: black;
}
a:hover {
	text-decoration: underline;}
}
tr.upper {
	background:#fafafa;
}
.high>p {
	margin-left:100px;
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
						<td style="width: 130px;"><span>조직도</span></td>
						<td style="width: 560px;"></td>
						<td style="width: 123px;"></td>
						<td><input type="search" placeholder="이름, 부서 검색"
							id="searchBox"></td>
					</tr>
				</table>
			</div>			
			<!-- 본문 시작 -->
			<div class="orgChart">
				<table id="orgTable">
					<tr class="dept">
						<td><p><c:out value="${ org.dName }"/></p></td>
						<td></td>
					</tr>
					<tr class="upper">
						<td><p>아래팀(4)</p></td>
						<td><p>이해림, 최우아, 최재영, 임희진, 윤수경, 이호정</p></td>
					</tr>					
					<tr class="high">
						<td><p>아아래팀(1)</p></td>
						<td id="high">여기임,이해림, 최우아, 최재영, 임희진, 윤수경, 이호정</td>
					</tr>					
					<tr  class="dept">
						<td><p>부서1(5)</p></td>
						<td></td>
					</tr>					
					<tr class="upper">
						<td><p>팀(1)</p></td>
						<td>이해림, 최우아, 최재영, 임희진, 윤수경, 이호정</td>
					</tr>					
					<tr class="upper">
						<td><p>파덕이네팀(4)</p></td>
						<td>이해림, 최우아, 최재영, 임희진, 윤수경, 이호정</td>
					</tr>					
					<tr class="dept">
						<td><p>부서1(5)</p></td>
						<td></td>
					</tr>					
					<tr class="upper">
						<td><p>팀팀(1)</p></td>
						<td>이해림, 최우아, 최재영, 임희진, 윤수경, 이호정</td>
					</tr>					
					<tr class="upper">
						<td><p>팀팀팀(4)</p></td>
						<td>이해림, 최우아, 최재영, 임희진, 윤수경, 이호정</td>
					</tr>					
					<tr  class="dept">
						<td><p>부서1(5)</p></td>
						<td></td>
					</tr>					
					<tr  class="dept">
						<td><p>부서1(5)</p></td>
						<td></td>
					</tr>					
					<tr class="upper">
						<td><p>수경팀(5)</p></td>
						<td>이해림, 최우아, 최재영, 임희진, 윤수경, 이호정</td>
					</tr>					
					<tr class="upper">
						<td><p>뚜뚜팀(5)</p></td>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
	</section>
</body>
<script>
$('.dept').click(function(){
	    $(this).nextUntil('tr.dept').slideToggle(100, function(){
	    });
	});
</script>
</html>