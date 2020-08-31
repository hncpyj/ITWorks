<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITWorks!</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
    /*메뉴 타이틀 관련 css 설정*/
    body {
        width: 1420px;
        height: 900px;
    }
    section {
       width: 1170px; 
       height: 100%; 
       margin-left: 250px;
    }
    #menuTitle {
        width: 100%; 
        margin: 0 auto;
        padding-left: 30px;
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
    /*메뉴 타이틀 관련 css 설정 종료*/

    article:nth-child(2) {
        margin-top: 30px;
        width: auto;
    }
    article:nth-child(2)>form>table {
        width: 983px;
        height: 370px;
        border-top: 2px solid #929292;
        border-bottom: 2px solid #929292;
        background: white;
        border-collapse: collapse;
        margin: auto;
    }
    article:nth-child(2)>form>table input, article:nth-child(2)>form>table textarea, article:nth-child(2)>form>table select {
        margin-left: 10px;
        border: 1px solid #929292;
        box-shadow: 1px 2px 4px lightgray inset;
    }
    article:nth-child(2)>form>table th {
        width: 103px;
        background: #f4f4f4;
        font-size: 14px;
        border-bottom: 1px solid #929292;
    }
    article:nth-child(2)>form>table td {
        height: 30px;
        border-bottom: 1px solid #929292;
    }
    input[type="date"] {
        width: 189px;

    }
    input[type="submit"] {
        border: none;
        width: 62px;
        height: 27px;
        background: #004771;
        color: white;
        font-weight: 550;
        margin-top: 10px;
        margin-left: 1011px;
    }
    .selectMemberBtn {
        width: 45px; 
        background: #004771; 
        color: white; 
        border: none; 
        height: 23px; 
        margin-left: 3px; 
        border-radius: 3px 3px 3px 3px;
    }
    button {
        cursor: pointer;
    }
    #personList {
    	border-collapse: collapse;
    }
    #personList tr:hover {
    	background: rgba(0, 71, 113, 0.2);
    }
    .searchModal {
     	position: fixed; 
     	left: 0; 
     	top: 0; 
     	width: 100%; 
     	height: 100%; 
     	z-index: 1000; 
     	display: none;
    }
    .onclickBackground {
    	 position: absolute; 
    	 width: 100%; 
    	 height: 100%; 
    	 background: black; 
    	 filter: alpha(opacity=60); 
    	 opacity: .6;
    }
    .searchBox {
    	position: relative; 
    	top: 20%; 
    	background: white; 
    	margin: auto; 
    	border-radius: 5px; 
    	border: 1px solid #929292; 
    	filter: none; 
    	opacity: 100;
    }
    .selectBtn {
    	 width: 100px; 
    	 height: 30px; 
    	 border-radius: 7px; 
    	 background: #004771; 
    	 color: white; 
    	 margin-top: 15px; 
    	 border: none;"
    }
    .selectPersonBtn {
    	 background: lightgray; 
    	 border: none; 
    	 border-radius: 7px; 
    	 width: 45px; 
    	 height: 25px;
    }
    .selectedMember {
    	 display: inline-block; 
    	 font-size: 13px; 
    	 width: 70px; 
    	 height: 25px; 
    	 background: rgba(0, 71, 113, 0.3); 
    	 border-radius: 10px;
    	 margin-left: 8px;

    }
    #selectArea {
    	 border-radius: 7px; 
    	 background: rgb(242, 242, 242); 
    	 width: 325px; 
    	 height: 40px; 
    	 margin: auto; 
    	 display: table-cell;
    	 vertical-align: middle;
    	 text-align: left;
    }
</style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="projectListAside.jsp"/>
    <section>
        <!--메뉴 타이틀-->
        <article style="margin-top: 30px;">
            <div id="menuTitle">
                <span>신규 프로젝트 등록</span>
                <hr style="width: 95%; margin-top: 10px; color: #929292;">
            </div>
        </article>
        <!--메뉴 타이틀 종료-->

        <!--프로젝트 정보 입력 폼-->
        <article>
            <form action="insertProject.pm" method="post" enctype="multipart/form-data">
                <table>
                    <tr>
                        <th>프로젝트명<span></span></th>
                        <td colspan="7"><input type="text" name="pname" style="width: 850px;"></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td colspan="3"><input type="text" name="pwriter" value="${ loginUser.ename }" readonly="readonly" style="border: none; box-shadow: none;"></td>
                        <th>상태</th>
                        <td>
                            <select name="pprogress" id="pprogress" style="width: 100px;">
                                <option value="schedule">예정</option>
                                <option value="progress">진행</option>
                                <option value="finish">완료</option>
                                <option value="hold">보류</option>
                                <option value="discard">폐기</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>담당자</th>
                        <td colspan="3">
                            <input type="text" name="charge">
                            <button onclick="searchPerson();" class="selectMemberBtn" type="button">조회</button>
                        </td>
                        <th>관리부서</th>
                        <td>
                            <input type="text" name="chargeDept" style="width: 145px;">
                            <button onclick="searchDept();" class="selectMemberBtn" type="button">조회</button>
                        </td>
                    </tr>
                    <tr>
                        <th>참여자</th>
                        <td colspan="6">
                            <input type="text" name="Participant" style="width: 520px;">
                            <button onclick="searchPerson();" class="selectMemberBtn" type="button">조회</button>
                        </td>
                    </tr>
                    <tr>
                        <th>열람 권한</th>
                        <td colspan="6">
                            <input type="text" name="perusal" style="width: 520px;">
                            <button onclick="searchPerson();" class="selectMemberBtn" type="button">조회</button>

                        </td>
                    </tr>
                    <tr>
                        <th>계획 시작일</th>
                        <td><input type="date" name="pstartDate"></td>
                        <th>계획 종료일</th>
                        <td><input type="date" name="pendDate"></td>
                        <th>실제 종료일</th>
                        <td><input type="date" name="actualEndDate"></td>
                    </tr>
                    <tr>
                        <th>프로젝트 개요</th>
                        <td colspan="6"><textarea name="psummary" id="psummary" cols="118" rows="5" style="resize: none; margin-top: 5px;"></textarea></td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td colspan="6">
                            <input multiple="multiple" type="file" name="filename[]" style="width: 480px; border: none; box-shadow: none;"/>
                            <!--file drag and drop 더 알아보기-->
                        </td>
                    </tr>
                </table>
                <input type="submit" value="등록">
            </form>
            
            <!-- 직원선택창 -->
            <div class="searchModal searchPerson">
            	<div class="onclickBackground" onclick="closeSearchPerson();"></div>
            	<div class="searchBox" align="center" style="width: 400px; height: 500px;">
            		<div style="background: #004771; border-top-left-radius: 5px; border-top-right-radius: 5px; height: 35px; margin: 0; width: 400px; display: table-cell; vertical-align: middle;">
            			<span style="color: white; padding-left: 15px; margin-top: 15px; font-size: 14px;">검색</span>
            			<button onclick="closeSearchPerson();" style="background: white; color: black; width: 20px; height: 20px; border: none; border-radius: 5px; margin-left: 323px; font-weight: bold;">X</button>
            		</div>
            		<div align="center" style="margin-top: 10px; margin-bottom: 15px;">
	            		<form action="searchPerson.pm">
	            			<input type="text" name="searchName" style="width: 250px; border: 1px solid #929292; margin-left: 5px;" placeholder="검색하고자 하는 이름을 입력하세요.">
	            			<button type="button" style="width: 50px; height: 25px; border-radius: 7px; background: #004771; border: nond; color: white; margin-left: 5px; font-size: 13px; border: none;">검색</button>
	            		</form>
            		</div>
            		<div id="selectArea"></div>
            		<div style="width: 325px; height: 290px; border: 1px solid #929292; margin-top: 15px; overflow: auto;" align="center">
            			<table style="width: 100%; font-size: 13px; text-align: center;" id="personList">
            				<c:forEach var="p" items="${ allMemberDept.allMember }">
	            				<c:if test="${ !empty p }">
		            				<tr>
		            					<td><div style="display: inline-block; width: 38px; height: 38px; border-radius: 50%; background: gray; margin-top: 5px;"></div></td>
		            					<td style="padding-left: 10px; width: 100px;"><c:out value="${ p.ename }"/> &nbsp;&nbsp;<c:out value="${ p.jname }"/></td>
		            					<td style="color: #929292; width: 100px;"><c:out value="${ p.dname }"/></td>
		            					<td><button class="selectPersonBtn" onclick="goSelectArea(${ p.mno }, '${ p.ename }');">선택</button></td>
		            				</tr>
		            			</c:if>
		            			<c:if test="${ empty p }">
		            				<tr>
		            					<td style="text-align: center; color: #929292; font-size: 13px;">표시할 내용이 없습니다.</td>
		            				</tr>
		            			</c:if>
            				</c:forEach>
            			</table>
            		</div>
            		<button class="selectBtn" onclick="selectPerson();">선택 완료</button>
            	</div>
            </div>
            <!-- 직원 선택창 끝 -->
            
            <!-- 부서 선택창 -->
            <div class="searchModal searchDept">
            	<div class="onclickBackground" onclick="closeSearchDept();"></div>
            	<div class="searchBox" align="center" style="width: 300px; height: 400px;">
            		<div style="background: #004771; border-top-left-radius: 5px; border-top-right-radius: 5px; height: 35px; margin: 0; width: 300px; display: table-cell; vertical-align: middle;">
            			<span style="color: white; padding-left: 15px; margin-top: 15px; font-size: 14px;">검색</span>
            			<button onclick="closeSearchDept();" style="background: white; color: black; width: 20px; height: 20px; border: none; border-radius: 5px; margin-left: 220px; font-weight: bold;">X</button>
            		</div>
            		<div align="center" style="margin-top: 10px;">
	            		<form action="searchPerson.pm">
	            			<input type="text" name="searchName" style="width: 150px; border: 1px solid #929292; margin-left: 5px;" placeholder="부서명을 입력하세요.">
	            			<button type="button" style="width: 50px; height: 25px; border-radius: 7px; background: #004771; border: nond; color: white; margin-left: 5px; font-size: 13px; border: none;">검색</button>
	            		</form>
            		</div>
            		<div style="width: 230px; height: 280px; border: 1px solid #929292; margin-top: 15px; overflow: auto;" align="center">
            			<table style="width: 100%; font-size: 13px;" id="personList">
            				<c:forEach var="p" items="${ allMemberDept.allDept }">
	            				<c:if test="${ !empty p }">
		            				<tr>
		            					<td><img src="${ contextPath }/resources/projectManageImages/deptIcon.png" style="height: 20px; float: left; padding-left: 15px; margin-right: 10px;">
		            					<c:out value="${ p.dname }"/></td>
		            				</tr>
		            			</c:if>
		            			<c:if test="${ empty p }">
		            				<tr>
		            					<td style="text-align: center; color: #929292; font-size: 13px;">표시할 내용이 없습니다.</td>
		            				</tr>
		            			</c:if>
            				</c:forEach>
            			</table>
            		</div>
            	</div>
            </div>
            <!-- 부서선택창 끝 -->
        </article>
    </section>

    <script>
        /* //file drag and arop
        var dropFile = function(event) {
            event.preventDefault();
        } */
        
        function searchPerson() {
        	$(".selectedMember").remove();
        	jQuery('.searchPerson').fadeIn('slow');
        }
        
        function searchDept() {
        	jQuery('.searchDept').fadeIn('slow');
        }
        
        function closeSearchPerson() {
        	jQuery('.searchPerson').fadeOut('slow');
        }
        function closeSearchDept() {
        	jQuery('.searchDept').fadeOut('slow');
        }
        
        function goSelectArea(mno, ename) {
        	var mno = mno;
        	var ename = ename;
        	
        	console.log(mno + ', ' + ename);
        	
        	if($(".selectedMember").length == 0) {
        		$("#selectArea").wrapInner("<div class='selectedMember' style='text-align: center;'>" + ename + "</div>");
        	} else {
        		
        		$(".selectedMember:last-child").after("<div class='selectedMember' style='text-align: center;'>" + ename + "</div>");
        	}
        }

    </script>
</body>
</html>