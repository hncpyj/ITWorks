<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#rr {
		border-collapse: collapse;
		text-align: center;
		margin:auto;
		border-top: 3px solid #c4c4c4;
		border-bottom: 3px solid #c4c4c4;
	}
	
	#rr td {
		 border-bottom: 1px solid #c4c4c4;
	}
	#menuTitle {
        width: 1240px; 
        margin: 0 auto;
        padding-left: 30px;
        height: 48px;
    }
    
    #menuTitle>span {
        font-size: 24px; 
        color: #004771; 
        padding-left: 20px; 
        font-weight: 400;
    }
    
    #menuTitle>button {
        width: 62px; 
        height: 27px; 
        background: #004771; 
        border: none; 
        color: white;
        margin-left: 75%;
    }
    #search {
    	border-radius:15px;
    	border:1px solid #29A2F7;
    	width:230px;
    	height: 25px;
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
			<td><p style="color:#004771; font-size:30px; width:660px;">참조/열람문서함</p></td>
			<td width="90px">
				<select>
					<option selected disabled hidden>검색조건</option>
					<option>문서번호</option>
					<option>문서제목</option>
					<option>기안자</option>
					<option>기안부서</option>
				</select>
			</td>
			<td width="230px"><input type="text" id="search" placeholder=" 검색내용을 입력하세요"></td>
			<td width="10"><img src="${contextPath}/resources/images/searchBtn.png" onclick="location.href='#'" style="cursor: pointer;"></td>
		</tr>
	</table>
	<br>
	
	<table id="rr">
		<tr height="50px" style="background-color:#ffffff;">
			<td width="170px">문서번호</td>
			<td width="310px">문서제목</td>
			<td width="110px">기안자</td>
			<td width="150px">기안부서</td>
			<td width="170px">기안일</td>
			<td width="110px">유형</td>
		</tr>
		<tr height="40px">
			<td width="170px">20200801-0001</td>
			<td width="310px">2020-07 예산서</td>
			<td width="110px">이호정</td>
			<td width="150px">영업기획팀</td>
			<td width="170px">2020/08/01</td>
			<td width="110px">참조자</td>
		</tr>
		<tr height="40px">
			<td width="170px">20200801-0001</td>
			<td width="310px">2020-07 예산서</td>
			<td width="110px">이호정</td>
			<td width="150px">영업기획팀</td>
			<td width="170px">2020/08/01</td>
			<td width="110px">참조자</td>
		</tr>
		<tr height="40px">
			<td width="170px">20200801-0001</td>
			<td width="310px">2020-07 예산서</td>
			<td width="110px">이호정</td>
			<td width="150px">영업기획팀</td>
			<td width="170px">2020/08/01</td>
			<td width="110px">열람자</td>
		</tr>
		<tr height="40px">
			<td width="170px">20200801-0001</td>
			<td width="310px">2020-07 예산서</td>
			<td width="110px">이호정</td>
			<td width="150px">영업기획팀</td>
			<td width="170px">2020/08/01</td>
			<td width="110px">참조자</td>
		</tr>
		<tr height="40px">
			<td width="170px">20200801-0001</td>
			<td width="310px">2020-07 예산서</td>
			<td width="110px">이호정</td>
			<td width="150px">영업기획팀</td>
			<td width="170px">2020/08/01</td>
			<td width="110px">열람자</td>
		</tr>
		<tr height="40px">
			<td width="170px">20200801-0001</td>
			<td width="310px">2020-07 예산서</td>
			<td width="110px">이호정</td>
			<td width="150px">영업기획팀</td>
			<td width="170px">2020/08/01</td>
			<td width="110px">열람자</td>
		</tr>
		<tr height="40px">
			<td width="170px">20200801-0001</td>
			<td width="310px">2020-07 예산서</td>
			<td width="110px">이호정</td>
			<td width="150px">영업기획팀</td>
			<td width="170px">2020/08/01</td>
			<td width="110px">참조자</td>
		</tr>
		<tr height="40px">
			<td width="170px">20200801-0001</td>
			<td width="310px">2020-07 예산서</td>
			<td width="110px">이호정</td>
			<td width="150px">영업기획팀</td>
			<td width="170px">2020/08/01</td>
			<td width="110px">열람자</td>
		</tr>
		<tr height="40px">
			<td width="170px">20200801-0001</td>
			<td width="310px">2020-07 예산서</td>
			<td width="110px">이호정</td>
			<td width="150px">영업기획팀</td>
			<td width="170px">2020/08/01</td>
			<td width="110px">참조자</td>
		</tr>
	</table>
	
	</section>

</body>
</html>
































