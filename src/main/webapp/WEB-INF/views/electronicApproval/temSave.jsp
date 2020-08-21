<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#save {
		border-collapse: collapse;
		text-align: center;
		margin:auto;
		border-top: 3px solid #c4c4c4;
		border-bottom: 3px solid #c4c4c4;
	}
	
	#save td {
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
			<td><p style="color:#004771; font-size:30px; width:660px;">임시저장함</p></td>
			<td width="90px">
				<select>
					<option selected disabled hidden>검색조건</option>
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
	
	<table id="save">
		<tr height="50px" style="background-color:#ffffff;">
			<td width="150px">NO</td>
			<td width="390px">문서제목</td>
			<td width="120px">기안자</td>
			<td width="190px">기안부서</td>
			<td width="170px">등록일</td>
		</tr>
		<tr height="40px">
			<td>1</td>
			<td>2020-07 예산서</td>
			<td>이호정</td>
			<td>영업기획팀</td>
			<td>2020/08/01</td>
		</tr>
		<tr height="40px">
			<td>2</td>
			<td>2020-07 예산서</td>
			<td>이호정</td>
			<td>영업기획팀</td>
			<td>2020/08/01</td>
		</tr>
		<tr height="40px">
			<td>3</td>
			<td>2020-07 예산서</td>
			<td>이호정</td>
			<td>영업기획팀</td>
			<td>2020/08/01</td>
		</tr>
		<tr height="40px">
			<td>4</td>
			<td>2020-07 예산서</td>
			<td>이호정</td>
			<td>영업기획팀</td>
			<td>2020/08/01</td>
		</tr>
	</table>
	
	</section>

</body>
</html>





























