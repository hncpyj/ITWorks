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
.org_map_header {
	margin-top:30px;
	height:40px;
}
dl, li, ol, ul {
	list-style:none;
}
.org_map_header li {
	display:inline-block;
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
			<hr style="border: solid 0.5px #C4C4C4;">
			<!-- 본문시작 -->
			
			<ol id="orgMapHeader" class="org_map_header">
				<li>레벨1</li>
				<li>레벨2</li>
				<li>레벨3</li>
				<li style="display:none;">레벨4</li>
				<li style="display:none;">레벨5</li>
			</ol>
			
			
			
			</div>
	</section>
</body>
</html>

