<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>ItWorks</title>
<link rel="icon" href="${contextPath}/resources/images/favicon.ico" type="image/x-icon">
<style>
	* {
        margin: 0px;
        font-family: "Noto Sans KR";
    }
	#appForm {
		border-collapse: collapse;
		text-align: center;
		margin:auto;
		border-top: 3px solid #c4c4c4;
		border-bottom: 3px solid #c4c4c4;
	}
	#appForm td {
		 border-bottom: 1px solid #c4c4c4;
	}
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/menubar.jsp"%>
	<%@ include file="/WEB-INF/views/electronicApproval/common/electronicApprovalAside.jsp" %>

	<section>
	<br>
 	<table style="margin:auto;">
		<tr>
			<td><p style="color:#004771; font-size:30px; width:660px;">양식목록</p></td>
			<td width="90px"></td>
			<td width="230px"></td>
			<td width="10px"></td>
		</tr>
	</table>
	<br>
	
	<table id="appForm">
		<tr height="50px" style="background-color:#ffffff;">
			<td width="170px">NO</td>
			<td width="310px">유형</td>
			<td width="500px">양식명</td>
		</tr>
		<tr height="40px">
			<td>1</td>
			<td>내부결재</td>
			<td onclick="location.href='draft.ea'" style="cursor:pointer;">기안문</td>
		</tr>
		<tr height="40px">
			<td>2</td>
			<td>내부결재</td>
			<td onclick="location.href=''" style="cursor:pointer;">품의서</td>
		</tr>
		<tr height="40px">
			<td>3</td>
			<td>내부결재</td>
			<td onclick="location.href=''" style="cursor:pointer;">회의록</td>
		</tr>
		<tr height="40px">
			<td>4</td>
			<td>내부결재</td>
			<td onclick="location.href=''" style="cursor:pointer;">협조문</td>
		</tr>
		<tr height="40px">
			<td>5</td>
			<td>인사</td>
			<td onclick="location.href=''" style="cursor:pointer;">출근 이의 신청</td>
		</tr>
	</table>
	
	
	</section>

</body>
</html>