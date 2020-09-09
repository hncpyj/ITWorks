<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    }
    #menuTitle>button:first-child {
        margin-left: 58%;
    }

    #asideBack ul li:first-child {
        font-weight: bold;
    }

    button {
        cursor: pointer;
    }
    /*메뉴 타이틀 관련 css 설정 종료*/

    /* 업무 정보 */
    article:nth-child(2) {
        margin-top: 30px;
        width: auto;
    }
    article:nth-child(2)>table {
        width: 983px;
        /* height: 370px; */
        border-top: 2px solid #929292;
        border-bottom: 2px solid #929292;
        background: white;
        border-collapse: collapse;
        margin: auto;
    }
    article:nth-child(2)>table th {
        width: 103px;
        background: #f4f4f4;
        font-size: 14px;
        border-bottom: 1px solid #929292;
        height: 36px;
    }
    article:nth-child(2)>table td {
        height: 30px;
        border-bottom: 1px solid #929292;
    }
    
    /* 업무 정보 종료 */

    /* 덧글 영역 */
    .subTitle {
        padding-left: 65px;
        color: #004771; 
        font-size: 15px; 
        font-weight: 550;
    }
    
    article:nth-child(3) {
        margin-top: 40px;
    }
    article:nth-child(3)>table {
        border: 1px;
        width: 983px;
        margin: auto;
        margin-top: 15px;
        border-spacing: 0 10px;
    }
    article:nth-child(3)>table>tr {
        margin-top: 100px;
    }
    .commentProfile {
        /* min-height: 38px;
        min-width: 38px;  */
        width: 38px; 
        height: 38px; 
        background: lightgray; 
        border-radius: 50% 50% 50% 50%;
    }
    #insertComment {
        width: 983px;
        margin: auto;
        margin-top: 8px;
    }
    #insertComment input[type="submit"] {
        width: 78px;
        height: 83px;
        background: #004771;
        color: white;
        font-weight: 550;
        border: none;
        margin-left: 5px;
        border-radius: 5px 5px 5px 5px;
        cursor: pointer;
    }
    /* 덧글 영역 종료 */

    /* 세부업무 리스트 */
    article:nth-child(4) {
        margin-top: 40px;
    }
    article:nth-child(4)>table {
        width: 983px;
        margin: auto;
        margin-top: 15px;
        border-spacing: 0 10px;
        text-align: center;
        border-collapse: collapse;
        border-top: 2px solid #929292;
        border-bottom: 2px solid #929292;
        table-layout: fixed;
    }
    article:nth-child(4)>table th {
        font-size: 13px;
        background: #f4f4f4;
        height: 30px;
        border-bottom: 1px solid #929292;
        border-right: 1px solid #929292;
    }
    article:nth-child(4)>table td {
        font-size: 13px;
        background: white;
        height: 30px;
        border-bottom: 1px solid #929292;
        border-right: 1px solid #929292;
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
    }
    article:nth-child(4)>table td:last-child, article:nth-child(4)>table th:last-child {
        border-right: none;
    }
    .subTitle:last-child {
        display: inline-block;
    }
    a {
        text-decoration: none;
        color: black;
    }
    .subTitle>button {
        width: 100px; 
        background: #004771; 
        color: white; 
        border: none; 
        height: 25px; 
        margin-left: 850px; 
        cursor: pointer;
    }
    /* 세부 업무 리스트 종료 */

    /* 업무 정보 수정 폼 */
    #modifyTaskForm {
        margin-top: 30px;
        width: auto;
    }
    #modifyTaskForm>form>table {
        width: 983px;
        height: 370px;
        border-top: 2px solid #929292;
        border-bottom: 2px solid #929292;
        background: white;
        border-collapse: collapse;
        margin: auto;
    }
    #modifyTaskForm>form>table input, textarea, select {
        margin-left: 10px;
        border: 1px solid #929292;
        box-shadow: 1px 2px 4px lightgray inset;
    }
    #modifyTaskForm>form>table th {
        width: 103px;
        background: #f4f4f4;
        font-size: 14px;
        border-bottom: 1px solid #929292;
    }
    #modifyTaskForm>form>table td {
        height: 30px;
        border-bottom: 1px solid #929292;
    }
    input[type="date"] {
        width: 189px;

    }
    .selectMemberBtn {
        width: 45px; 
        background: #004771; 
        color: white; 
        border: none; 
        height: 23px; 
        margin-left: 3px; 
        border-radius: 3px 3px 3px 3px;
        cursor: pointer;
    }
    label {
        font-size: 13px;
    }
    #modifyTaskForm>form>input[type="submit"], #modifyTaskForm>form>input[type="button"] {
        border: none;
        width: 62px;
        height: 27px;
        font-weight: 550;
        margin-top: 10px;
        cursor: pointer;
    }
    #modifyTaskForm>form>input[type="submit"] {
        margin-left: 5px;
        background: #004771;
        color: white;
    }
    #modifyTaskForm>form>input[type="button"] {
        background: lightgray;
        cursor: pointer;
        margin-left: 940px;
    }
    /* 업무 정보 수정 폼 종료 */
    
    #taskInfoTable td {
    	font-size: 13px;
    	padding-left: 15px;
    }
    .files, a {
    	color: black;
    	text-decoration: none;
    	cursor: pointer;
    }
    .files:hover {
    	cursor: pointer;
    	text-decoration: underline;
    }
    span {
    	color: red;
    	margin-left: 5px;
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
    	 font-size: 13px; 
    	 width: 80px; 
    	 height: 25px; 
    	 background: #0095ED; 
    	 color: white;
    	 border-radius: 10px;
    	 margin-left: 10px;
    	 border-spacing: 8px;
    	 text-align: right;
		 min-width: 90px;
		 float: left;
		 line-height: 25px;
		 margin-top: 8px;
    }
    #selectArea {
    	 border-radius: 7px; 
    	 background: rgb(242, 242, 242); 
    	 width: 325px; 
    	 height: 45px; 
    	 margin: auto; 
    	 text-align: left;
    	 overflow: auto;
    }
    .selectedMember>img {
    	width: 10px; 
    	height: 10px; 
    	margin-right: 7px; 
    	margin-left: 10px;
    }
    .selectedMember>img:hover {
    	cursor: pointer;
    }
</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="projectDetailAside.jsp"/>
    <section>
        <!--메뉴 타이틀-->
        <article style="margin-top: 30px;">
            <div id="menuTitle">
                <span>프로젝트 업무 정보</span>
                <c:forEach var="m" items="${ taskInfo.member }">
                	<c:if test="${ m.prole eq '담당자'}">
                		<c:set var="chargeMno" value="${ m.mno }"/>
                	</c:if>
                	<c:if test="${ m.prole eq '작성자' }">
                		<c:set var="writerMno" value="${ m.mno }"/>
                	</c:if>
                </c:forEach>
                <c:if test="${ loginUser.mno eq chargeMno || loginUser.mno eq writerMno }">
	                <button style="margin-left: 54.5%; background: lightgray; color: black;" onclick="deleteTask('${taskInfo.task.pno}', '${ taskInfo.task.parentPjt }');">삭제</button>
	                <button onclick="showModifyForm();">수정</button>
                </c:if>
                <c:if test="${ loginUser.mno eq chargeMno || loginUser.mno eq writerMno }">
	                <button onclick="history.go(-1)">이전으로</button>
                </c:if>
                <c:if test="${ loginUser.mno ne chargeMno && loginUser.mno ne writerMno }">
	                <button onclick="history.go(-1)" style="margin-left: 70%;">이전으로</button>
                </c:if>
                <hr style="width: 95%; margin-top: 10px; color: #929292;">
            </div>
        </article>
        <!--메뉴 타이틀 종료-->

        <!-- 업무 정보 -->
        <article>
            <table id="taskInfoTable">
                <tr>
                    <th>업무명</th>
                    <td colspan="3" style="width: 500px; min-width: 500px;"><c:out value="${ taskInfo.task.pname }"/></td>
                    <th>작성자</th>
                    <td style="width: 200px;'">
                    	<c:forEach var="m" items="${ taskInfo.member }">
                    		<c:if test="${ m.prole eq '작성자' }">
                    			<c:out value="${ m.pmName }"/>
                    		</c:if>
                    	</c:forEach>
                    </td>
                </tr>
                <tr>
                    <th>담당자</th>
                    <td colspan="3">
                    	<c:forEach var="m" items="${ taskInfo.member }">
                    		<c:if test="${ m.prole eq '담당자' }">
                    			<c:out value="${ m.pmName }"/>
                    		</c:if>
                    	</c:forEach>
                    </td>
                    <th>상태</th>
                    <td><c:out value="${ taskInfo.task.pprogress }"/></td>
                </tr>
                <tr>
                    <th>계획 시작일</th>
                    <td><c:out value="${ taskInfo.task.pstartDate }"/></td>
                    <th>계획 종료일</th>
                    <td><c:out value="${ taskInfo.task.pendDate }"/></td>
                    <th>실제 종료일</th>
                    <td><c:out value="${ taskInfo.task.actualEndDate }"/></td>
                </tr>
                <tr>
                    <th>업무 개요</th>
                    <td colspan="5">
                    	<c:out value="${ taskInfo.task.psummary }"/>
                    </td>
                </tr>
                <tr>
                    <th>특이사항</th>
                    <td colspan="5" style="color: red; font-weight: bold;">
                    	<c:out value="${ taskInfo.task.uniqueness }"/>
                    </td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td colspan="6" style="padding-top: 5px; padding-left: 5px;">
                    	<div style="width: 850px; height: 70px; margin: auto; overflow: auto;">
	                       	<c:forEach var="f" items="${ taskInfo.files }">
	                       		<div style="margin-bottom: 3px;">
	                       			<img src="${ contextPath }/resources/projectManageImages/projectFileIcon.png">
	                       			<a class="files" onclick="fileDownload(${ f.fileNo });">
	                       				<c:out value="${ f.originName }"/>
	                       			</a>
	                       		</div>
	                       	</c:forEach>
                       	</div>
                    </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="5">
                    	<c:out value="${ taskInfo.task.pcontent }"/>
                    </td>
                </tr>
            </table>
        </article>
        <!-- 업무 정보 종료 -->

        <!-- 댓글 영역 -->
        <article>
            <div class="subTitle">댓글(<c:out value="${ taskInfo.reply.size() }"/>)</div>
            <table id="replyArea">
	            <c:if test="${ !empty taskInfo.reply }">
		            <c:forEach var="r" items="${ taskInfo.reply }">
		                <tr>
		                	<td style="width: 20px;"></td>
		                    <td style="width: 40px;"><div class="commentProfile"></div></td>
		                    <th width="80px" style="font-size: 13px;">
		                    	<c:out value="${ r.ename }"/>
		                    </th>
		                    <td style="font-size: 13px; word-break:break-all;">
		                    	<c:out value="${ r.tcontent }"/>
		                    </td>
		                    <td style="width: 140px; font-size: 12px; color:#929292; text-align: center;">
		                    	<c:out value="${ r.tdate }"/>&nbsp;&nbsp;<c:out value="${ r.ttime }"/>
		                    </td>
		                    <td style="width: 20px;">
			                    <c:if test="${ r.ename eq loginUser.ename }">
			                    	<img src="${ contextPath }/resources/projectManageImages/closeBtn3.png" style="width:10px; height: 10px; cursor: pointer;" onclick="deleteReply('${ r.taskReplyNo }');">
			                    </c:if>
		                    </td>
		                </tr>
		            </c:forEach>
		        </c:if>
		        <c:if test="${ empty taskInfo.reply }">
		        	<tr>
		        		<td colspan="6" style="text-align: center; color: #929292; font-size: 13px;">등록된 댓글이 없습니다.</td>
		        	</tr>
		        </c:if>
                <tr height="5px"></tr>
            </table>
            <div id="insertComment">
                <form action="insertReply.pm" method="post">
                    <table>
                    	<tr>
	                        <td style="padding: 0px;"><input type="hidden" value="${ taskInfo.task.pno }" name="pno"/>
	                            <textarea name="tcontent"cols="122" rows="4" style="resize: none; border: 1px solid #929292; border-radius: 5px 5px 5px 5px;"></textarea>
	                        </td>
	                        <td style="padding: 0px; padding-bottom: 8px;">
	                            <input type="submit" value="등록">
	                        </td>
                        </tr>
                    </table>
                </form>
            </div>
        </article>
        <!-- 댓글 영역 종료 -->

        <!-- 세부업무 리스트 내역 -->
        <article>
            <div class="subTitle">
                세부 업무
                <button onclick="insertSubTaskForm('${taskInfo.task.pno}');">세부 업무 추가</button>
            </div>
            <table>
                <tr>
                    <th width="430px">세부업무명</th>
                    <th width="80px">담당자</th>
                    <th width="70px">상태</th>
                    <th width="100px">특이사항</th>
                    <th>계획 시작일</th>
                    <th>계획 종료일</th>
                    <th>실제 종료일</th>
                </tr>
                
                <c:choose>
	                <c:when test="${ !empty taskInfo.subTask }">
		                <c:forEach var="s" items="${ taskInfo.subTask }">
			                <tr>
			                    <td style="text-align: left; padding-left: 15px;">
			                    	<a onclick="subTaskDetail('${s.pno}');">
			                    		<c:out value="${ s.pname }"/>
			                    	</a>
			                    </td>
			                    <td><c:out value="${ s.pwriter }"/></td>
			                    <td><c:out value="${ s.pprogress }"/></td>
			                    <td style="color: red; font-weight: bold;"><c:out value="${ s.uniqueness }"/></td>
			                    <td><c:out value="${ s.pstartDate }"/></td>
			                    <td><c:out value="${ s.pendDate }"/></td>
			                    <td><c:out value="${ s.actualEndDate }"/></td>
			                </tr>
		                </c:forEach>
	                </c:when>
	                <c:otherwise>
	                	<tr>
	                		<td colspan="7" style="color: #929292; text-align: center;">등록된 세부 업무가 없습니다.</td>
	                	</tr>
	                </c:otherwise>
                </c:choose>
            </table>
        </article>
        <!-- 세부업무 리스트 내역 종료 -->

        <!-- 업무 수정 폼 -->
        <article id="modifyTaskForm" style="display: none;">
            <form action="updateProject.pm" method="post" enctype="multipart/form-data" onsubmit="return checkNull();">
                <table>
                    <tr>
                        <th>
                        	업무명<span>*</span>
                        	<input type="hidden" name="pno" value="${ taskInfo.task.pno }">
                        	<input type="hidden" name="plevel" value="${ taskInfo.task.plevel }">
                        </th>
                        <td colspan="3"><input type="text" name="pname" style="width: 528px;" value="${ taskInfo.task.pname }"></td>
                        <th>작성자</th>
                        <td><input type="text" name="pwriter" value="${ loginUser.ename }" readonly="readonly" style="border: none; box-shadow: none;"></td>
                    </tr>
                    <tr>
                    	<c:forEach var="e" items="${ taskInfo.member }">
                        	<c:if test="${ e.prole eq '담당자' }">
                        		<c:set var="chargeName" value="${ e.pmName }"/>
                        		<c:set var="chargeMnos" value="${ e.mno }"/>
                        	</c:if>
                       	</c:forEach>
                        <th>담당자<span>*</span></th>
                        <td colspan="3">
                            <input type="text" style="width: 300px;" name="charge" readonly="readonly" value="${ chargeName }"><input type="hidden" name="chargeMno" value="${ chargeMnos }">
                            <button onclick="searchPerson(0);" type="button" class="selectMemberBtn">조회</button>
                        </td>
                        <th>상태</th>
                        <td>
                            <select name="pprogress" id="pprogress" style="width: 192px;">
                                <option value="예정">예정</option>
                                <option value="진행">진행</option>
                                <option value="완료">완료</option>
                                <option value="보류">보류</option>
                                <option value="폐기">폐기</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>계획 시작일<span>*</span></th>
                        <td><input type="date" name="pstartDate"></td>
                        <th>계획 종료일<span>*</span></th>
                        <td><input type="date" name="pendDate"></td>
                        <th>실제 종료일</th>
                        <td><input type="date" name="actualEndDate"></td>
                    </tr>
                    <tr>
                        <th>업무 개요</th>
                        <td colspan="5"><input type="text" style="width: 850px;" name="psummary" value="${ taskInfo.task.psummary }"></td>
                    </tr>
                    <tr>
                        <th>특이사항</th>
                        <td colspan="5">
                            <input id="issue" name="uniqueness" value="이슈발생" type="checkbox">&nbsp;&nbsp;<label for="issue">이슈 발생</label>&nbsp;&nbsp;&nbsp;&nbsp;
                            <input id="urgent" name="uniqueness" value="긴급" type="checkbox">&nbsp;&nbsp;<label for="urgent">긴급</label>
                        </td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td colspan="6">
                            <input multiple="multiple" type="file" id="files" name="files" style="width: 480px; border: none; box-shadow: none; margin-top: 5px;">
                            <div id="selectedFileList" style="width: 843px; height: 80px;border: 1px solid #929292; margin: auto; margin-top: 5px; margin-bottom: 5px; padding: 5px; font-size: 12px; overflow: auto;">
                            
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td colspan="5"><textarea name="pcontent" id="pcontent" cols="119" rows="15" style="resize: none; margin-top: 5px;"><c:out value="${ taskInfo.task.pcontent }"/></textarea></td>
                    </tr>
                </table>
                <input type="button" onclick="history.go(0)" value="취소">
                <input type="submit" value="등록">
            </form>
        </article>
        
        <!-- 직원선택창 -->
            <div class="searchModal searchPerson">
            	<div class="onclickBackground" onclick="closeSearchPerson();"></div>
            	<div class="searchBox" align="center" style="width: 400px; height: 500px;">
            		<div style="background: #004771; border-top-left-radius: 5px; border-top-right-radius: 5px; height: 35px; margin: 0; width: 400px; display: table-cell; vertical-align: middle;">
            			<span style="color: white; padding-left: 15px; margin-top: 15px; font-size: 14px;">검색</span>
            			<button onclick="closeSearchPerson();" style="background: white; color: black; width: 20px; height: 20px; border: none; border-radius: 5px; margin-left: 323px; font-weight: bold;">X</button>
            		</div>
            		<div align="center" style="margin-top: 10px; margin-bottom: 15px;">
	            		<input type="text" name="searchName" style="width: 250px; border: 1px solid #929292; margin-left: 5px;" placeholder="검색하고자 하는 이름을 입력하세요.">
	            		<button type="button" style="width: 50px; height: 25px; border-radius: 7px; background: #004771; border: nond; color: white; margin-left: 5px; font-size: 13px; border: none;">검색</button>
            		</div>
            		<div id="selectArea"></div>
            		<div style="width: 325px; height: 290px; border: 1px solid #929292; margin-top: 15px; overflow: auto;" align="center">
            			<table style="width: 100%; font-size: 13px; text-align: center;" id="personList">
            				<c:forEach var="p" items="${ allMemberDept.allMember }">
	            				<c:if test="${ !empty p }">
		            				<tr>
		            					<td><div style="display: inline-block; width: 38px; height: 38px; border-radius: 50%; background: gray; margin-top: 5px;"></div></td>
		            					<td style="padding-left: 10px; width: 80px;"><c:out value="${ p.ename }"/></td>
		            					<td><c:out value="${ p.jname }"/></td>
		            					<td style="color: #929292; width: 100px;"><c:out value="${ p.dname }"/></td>
		            					<td><button class="selectPersonBtn" onclick="goSelectArea(${ p.mno }, '${ p.ename }');">선택</button></td>
		            				</tr>
		            			</c:if>
            				</c:forEach>
            			</table>
            		</div>
            		<button class="selectBtn" onclick="selectPerson();">선택 완료</button>
            	</div>
            </div>
            <!-- 직원 선택창 끝 -->
        <!-- 업무 수정 폼 종료 -->
    </section>

    <script>
        function showModifyForm() {
            $('article:nth-child(n+2)').css('display', 'none');
            $('#modifyTaskForm').css('display', 'block');
            $('#menuTitle>span').text('프로젝트 업무 수정');
            $('#menuTitle>button').hide();
        }

        function deleteTask(pno, parentPjt) {
        	var pno = pno;
        	var parentPjt = parentPjt;
        	
			$.ajax({
        		url: "deleteTask.pm",
        		data: {pno: pno, parentPjt: parentPjt},
        		type: "post",
        		success: function(data) {
        			if(data.result > 0) {
	        			alert("업무 정보가 삭제되었습니다.");
	        			location.href="projectDetail.pm?pno=" + parentPjt;
        			} else {
        				console.log("result 0, 실패");
        			}
        		},
        		error: function(date) {
        			console.log("실패");
        		}
        	});
        }
        
        function fileDownload(fileNo) {
        	location.href="projectFileDownload.pm?fileNo=" + fileNo;
        }
        
        function deleteReply(tno) {
        	var taskNo = tno;
        	
        	$.ajax({
        		url: "deleteReply.pm",
        		data: {taskNo: taskNo},
        		type: "POST",
        		success: function(data) {
        			if(data.result > 0) {
        				alert("댓글이 삭제되었습니다.");
        			} else {
        				alert("!에러 발생! 다시 시도 해 주세요.");
        			}
        			location.href="taskDetail.pm?pno=" + ${taskInfo.task.pno};
        		},
        		error: function(request, error) {
        			//에러 내용 출력 코드
        			console.log("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
        		}
        	});
        }
        
        function insertSubTaskForm(pno) {
        	location.href="insertSubTaskForm.pm?pno=" + pno;
        }
        
        function subTaskDetail(pno) {
        	location.href="taskDetail.pm?pno=" + pno;
        }
        
        $(function() {
        	$("#pprogress>option[value='${taskInfo.task.pprogress}']").attr("selected", "selected");
        	
        	var startDate = '${taskInfo.task.pstartDate}';
        	var endDate = '${taskInfo.task.pendDate}';
        	var actualDate = '${taskInfo.task.actualEndDate}';
        	
        	var pstartDate = startDate.replaceAll('/', '-');
        	var pendDate = endDate.replaceAll('/', '-');
        	var actualEndDate = actualDate.replaceAll('/', '-');
        	
        	$("input[name='pstartDate']").val(pstartDate);
        	$("input[name='pendDate']").val(pendDate);
        	$("input[name='actualEndDate']").val(actualEndDate);
        	
        	var uniqueness = '${ taskInfo.task.uniqueness }';
        	console.log(uniqueness);
        	
        	if(uniqueness.length > 4) {
        		var unique1 = uniqueness.substring(0, 4);
        		var unique2 = uniqueness.substring(6, 8);
        		
        		$("#issue").attr("checked", true);
        		$("#urgent").attr("checked", true);
        	} else if(uniqueness == '이슈발생') {
        		$("#issue").attr("checked", true);
        	} else if(uniqueness == '긴급') {
        		$("#urgent").attr("checked", true);
        	}
        	
        });
        
      //파일 업로드 시  div에 파일명 출력
        $("#files").change(function() {
        	var fileList = $("#files")[0].files;
        	
        	for(var i = 0; i < fileList.length; i++) {
        		$("#selectedFileList").wrapInner().append("<div><img src='${contextPath}/resources/projectManageImages/projectFileIcon.png'>&nbsp;&nbsp;"
        											+ fileList[i].name + "</div>");
        		console.log(fileList[i].name);
        	}
        });
        
        //파일선택 클릭 시 파일명 출력 div 초기화
        $("#files").click(function() {
        	$("#selectedFileList").empty();
        })
        
        //직원선택 모달창 열기
        function searchPerson(index) {
			tdNum = index;
			
        	$(".selectedMember").remove();
        	jQuery('.searchPerson').fadeIn('slow');
        }
        
        //직원선택 모달창 닫기
        function closeSearchPerson() {
        	jQuery('.searchPerson').fadeOut('slow');
        }
        
      //선택 버튼 누르면 검색창 아래 DIV에 이름 뜨게 하는 코드
        function goSelectArea(mno, ename) {
        	var mno = mno;
        	var ename = ename;
        	
        	console.log(mno + ', ' + ename);
        	
        	if($(".selectedMember").length == 0) {
        		$("#selectArea").wrapInner("<div class='selectedMember'>" + ename + 
        			"<img src='${contextPath}/resources/projectManageImages/closeBtn4.png' onclick='removeMember(this);'><input type='hidden' name='tempMno' value='" + mno +"'></div>");
        	} else {
        		if(tdNum == 0) {
        			alert("담당자는 1명만 선택 가능합니다.");
        			return;
        		} else {
	        		$(".selectedMember:last-child").after("<div class='selectedMember'>" + ename +
	        			"<img src='${contextPath}/resources/projectManageImages/closeBtn4.png' onclick='removeMember(this);'><input type='hidden' name='tempMno' value='" + mno +"'></div>");
        		}
        	}
        	
        	mnoArr = "";
    		for(var i = 0; i < $("input[name=tempMno]").length; i++) {
    			mnoArr += $("input[name=tempMno]")[i].value;
    			if(i < $("input[name=tempMno]").length - 1) {
    					mnoArr += ", ";
    			}
    		}	
        }
        
        //선택된 직원 x 누르면 지우는 코드
        function removeMember(selectedMember) {
        	var selectedMember = selectedMember;
        	$(selectedMember).parent().remove();
        }
        
        //선택된 직원 정보 input 태그 value 값으로 지정하는 코드
        function selectPerson() {
        	console.log(mnoArr);
        	var names = '';
        	
        	for(var i = 0; i < $(".selectedMember").length; i++) {
        		names += $(".selectedMember").eq(i).text();
        		if(i != $(".selectedMember").length - 1) {
        			names += ", ";
        		}
        	}
        	
        	if(tdNum == 0) {
	        	$("input[name='charge']").val(names);
	        	$("input[name='chargeMno']").val(mnoArr);
	        	console.log("담당mnoArr : " + mnoArr);
	        	mnoArr = "";
	        	console.log("담당자 : " + $("input[name='chargeMno']").val());
        	}

        	jQuery('.searchPerson').fadeOut('slow');
        	
        }
        
        function checkNull() {
        	var pname = $("input[name='pname']").val();
        	var charge = $("input[name='charge']").val();
        	var pstartDate = $("input[name='pstartDate']").val();
        	var pendDate = $("input[name='pendDate']").val();
        	
        	if(!pname) {
        		alert("업무명을 입력 해 주세요.");
        		$("input[name='pname']").focus();
        		return false;
        	} else if(!charge) {
        		alert("담당자를 등록 해 주세요.");
        		$("input[name='charge']").focus();
        		return false;
        	} else if(!pstartDate) {
        		alert("계획시작일을 입력 해 주세요.");
        		return false;
        	} else if(!pendDate) {
        		alert("계획종료일을 입력 해 주세요.");
        		return false;
        	} else if(pstartDate > pendDate) {
        		alert("계획종료일은 계획시작일보다 빠를 수 없습니다.");
        		return false;
        	} else {
        		return true;
        	}
        }
        
        function goProjectDetail() {
	    	location.href="projectDetail.pm?pno=" + ${ taskInfo.task.parentPjt };
	    }
	    function goProjectNotice() {
	    	location.href="projectNoticeList.pm?pno=" + ${ taskInfo.task.parentPjt };
	    }
    </script>
</body>
</html>