<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    .menuTitle {
        width: 100%; 
        margin: 0 auto;
        padding-left: 30px;
    }
    .menuTitle>span {
        font-size: 24px; 
        color: #004771; 
        padding-left: 20px; 
        font-weight: 400;
    }
    .menuTitle>button {
        width: 62px; 
        height: 27px; 
        background: #004771; 
        border: none; 
        color: white;
        
    }
    #asideBack ul li:first-child {
        font-weight: bold;
    }
    /*메뉴 타이틀 관련 css 설정 종료*/

    /*프로젝트 정보*/
    article:nth-child(2) {
        margin-top: 30px;
        width: auto;
    }
    article:nth-child(2)>table {
        width: 983px;
        /* height: 320px; */
        border-top: 2px solid #929292;
        border-bottom: 2px solid #929292;
        background: white;
        border-collapse: collapse;
        margin: auto;
        box-shadow: 1px 1px 5px lightgray;
    }
    article:nth-child(2)>table th {
        width: 103px;
        background: #f4f4f4;
        font-size: 14px;
        border-bottom: 1px solid #929292;
        height: 35px;
    }
    article:nth-child(2)>table td {
        height: 30px;
        border-bottom: 1px solid #929292;
        padding-left: 15px;
        font-size: 13px;
        height: 35px;
    }
    /*프로젝트 정보 끝*/

    /*프로젝트 전체 일정*/
    article:nth-child(3) {
        margin-top: 40px;
    }
    article:nth-child(3) div:first-child, article:nth-child(4) div:first-child {
        padding-left: 65px;
    }
    #overallSchedule, #wbs {
        text-align: center;
        overflow-x: auto;
        width: 983px; 
        margin: auto; 
        margin-top: 15px;
    }
    #overallSchedule table, #wbs table {
        white-space: nowrap;
        border-collapse: collapse;
        border-top: 2px solid #929292;
        border-bottom: 2px solid #929292;
    }
    #overallSchedule table th, #wbs table th {
        font-size: 14px;
        background: #f4f4f4;
        border-right: 1px solid #929292;
        height: 25px;
    }
    #overallSchedule table td {
        height: 24px;
        font-size: 13px;
        background: rgba(0, 71, 113, 10%);
        border-right: 1px solid #929292;
    }
    #overallSchedule table th:last-child, #overallSchedule table td:last-child {
        border-right: none;
    }
    .week {
        min-width: 210px;
        width: 210px;
        background: #004771;
        border-bottom: 1px solid #929292;
    }
    .date {
        min-width: 25px;
        width: 25px;
        border-bottom: 2px solid #929292;
    }
    #overallSchedule table tr:first-child th:nth-child(-n+4) {
        min-width: 73px;
        width: 73px;
        border-bottom: 2px solid #929292;
    }
    #overallSchedule table tr:nth-child(n+2) th:nth-child(n+4) {
        min-width: 25px;
        width: 25px;
    }
    /* 프로젝트 전체 일정 끝 */

    /* WBS */
    article:nth-child(4) {
        margin-top: 40px;
    }
    .task>td {
        background: rgba(0, 71, 113, 10%);
    }
    .subTask>td {
        background: white;
    }
    .subTask>td, .task>td {
        height: 24px;
        min-height: 24px;
        font-size: 13px;
        border-right: 1px solid #929292;
        border-bottom: 1px solid #929292;
    }
    #wbs table th:last-child, #wbs table td:last-child {
        border-right: none;
    }
    #wbs table tr:first-child th:nth-child(-n+7) {
        min-width: 73px;
        width: 73px;
        border-bottom: 2px solid #929292;
    }
    #wbs table tr:nth-child(n+2) th:nth-child(n+4) {
        min-width: 25px;
        width: 25px;
    }
    article:nth-child(4) div:first-child button {
        width: 75px;
        height: 27px;
        background: #004771;
        color: white;
        border: none;
        font-size: 13px;
        margin-left: 900px;
    }
    #wbs img:hover {
        cursor: pointer;
    }
    .task>td:first-child {
        text-align: left; 
        padding-left: 10px;
    }
    .subTask>td:first-child {
        text-align: left; 
        padding-left: 35px;
    }
    .subTask {
        display: table-row;
    }
    a {
        text-decoration: none;
        color: black;
    }
    /* WBS 끝 */

    /* 프로젝트 수정 폼 */
    #modifyProjectForm {
        margin-top: 30px;
        width: auto;
    }
    #modifyProjectForm>form>table {
        width: 983px;
        height: 370px;
        border-top: 2px solid #929292;
        border-bottom: 2px solid #929292;
        background: white;
        border-collapse: collapse;
        margin: auto;
    }
    #modifyProjectForm>form>table input, textarea, select {
        margin-left: 10px;
        border: 1px solid #929292;
        box-shadow: 1px 2px 4px lightgray inset;
    }
    #modifyProjectForm>form>table th {
        width: 103px;
        background: #f4f4f4;
        font-size: 14px;
        border-bottom: 1px solid #929292;
    }
    #modifyProjectForm>form>table td {
        height: 30px;
        border-bottom: 1px solid #929292;
    }
    #modifyProjectForm>form>input[type="date"] {
        width: 189px;

    }
    #modifyProjectForm>form>input[type="submit"], #modifyProjectForm>form>input[type="button"] {
        border: none;
        width: 62px;
        height: 27px;
        font-weight: 550;
        margin-top: 10px;
    }
    #modifyProjectForm>form>input[type="submit"] {
        margin-left: 5px;
        background: #004771;
        color: white;
    }
    #modifyProjectForm>form>input[type="button"] {
        background: lightgray;
        cursor: pointer;
        margin-left: 940px;
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
    /* 프로젝트 수정 폼 끝 */
    button {
        cursor: pointer;
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
    }
    #personList {
    	border-collapse: collapse;
    }
    #personList tr:hover {
    	background: rgba(0, 71, 113, 0.2);
    }
    #deptList tr:hover {
    	background: rgba(0, 71, 113, 0.2);
    	cursor: pointer;
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
            <div class="menuTitle">
                <span>프로젝트 상세보기</span>
                <c:forEach var="m" items="${ projectInfo.member }">
                	<c:if test="${ m.prole eq '담당자'}">
                		<c:set var="chargeMno" value="${ m.mno }"/>
                	</c:if>
                	<c:if test="${ m.prole eq '작성자' }">
                		<c:set var="writerMno" value="${ m.mno }"/>
                	</c:if>
                </c:forEach>
                <c:if test="${ loginUser.mno eq chargeMno || loginUser.mno eq writerMno }">
                	<button style="margin-left: 60%; cursor: pointer;" onclick="showModifyForm();">수정</button>
                </c:if>
                <c:if test="${ loginUser.mno eq chargeMno || loginUser.mno eq writerMno }">
                	<button onclick="location.href='selectAllProjectList.pm'">목록으로</button>
                </c:if>
                <c:if test="${ loginUser.mno ne chargeMno && loginUser.mno ne writerMno }">
                	<button style="margin-left: 70%;" onclick="location.href='selectAllProjectList.pm'">목록으로</button>
                </c:if>
                <hr style="width: 95%; margin-top: 10px; color: #929292;">
            </div>
        </article>
        <!--메뉴 타이틀 종료-->

        <!--프로젝트정보-->
        <article>
            <table>
                <tr>
                    <th>프로젝트명</th>
                    <td colspan="7"><c:out value="${ projectInfo.project.pname }"/></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td colspan="3">
                    	<c:forEach var="m" items="${ projectInfo.member }">
                    		<c:if test="${ m.prole eq '작성자' }">
                    			<c:out value="${ m.pmName }"/>
                    		</c:if>
                    	</c:forEach>
                    </td>
                    <th>상태</th>
                    <c:set var="progress" value="${ projectInfo.project.pprogress }"/>
                    <td><c:out value="${ projectInfo.project.pprogress }"/></td>
                </tr>
                <tr>
                    <th>담당자</th>
                    <td colspan="3">
                    	<c:forEach var="m" items="${ projectInfo.member }">
                    		<c:if test="${ m.prole eq '담당자' }">
                    			<c:out value="${ m.pmName }"/>
                    		</c:if>
                    	</c:forEach>
                    </td>
                    <th>관리부서</th>
                    <td>
                    	<c:if test="${ !empty projectInfo.project.dname }">
                    		<c:out value="${ projectInfo.project.dname }"/>
                    	</c:if>
                    </td>
                </tr>
                <tr>
                    <th>참여자</th>
                    <td colspan="6" id="participant">
	                    <c:if test="${ !empty projectInfo.member }">
							<c:forEach var="m" items="${ projectInfo.member }" varStatus="status">
	                    		<c:if test="${ m.prole eq '참여자' }">
	                    			<c:out value="${ m.pmName }"/>, 
	                    		</c:if>
	                    	</c:forEach>
	                    </c:if>
					</td>
                </tr>
                <tr>
                    <th>열람 권한</th>
                    <td colspan="6" id="perusal">
                    	<c:forEach var="m" items="${ projectInfo.member }" varStatus="status">
                    		<c:if test="${ m.prole eq '열람권한' }">
                    			<c:out value="${ m.pmName }"/>, 
                    		</c:if>
                    	</c:forEach>
                    </td>
                </tr>
                <tr>
                    <th>계획 시작일</th>
                    <td><c:out value="${ projectInfo.project.pstartDate }"/></td>
                    <th>계획 종료일</th>
                    <td><c:out value="${ projectInfo.project.pendDate }"/></td>
                    <th>실제 종료일</th>
                    <td><c:out value="${ projectInfo.project.actualEndDate }"/></td>
                </tr>
                <tr>
                    <th>프로젝트 개요</th>
                    <td colspan="6"><c:out value="${ projectInfo.project.psummary }"/></td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td colspan="6" style="padding-top: 5px; padding-left: 5px;">
                    	<div style="width: 850px; height: 70px; margin: auto; overflow: auto;">
	                       	<c:forEach var="f" items="${ projectInfo.files }">
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
            </table>
        </article>
        <!--프로젝트 정보 종료-->

        <!--프로젝트 전체일정표-->
        <article>
            <div style="color: #004771; font-size: 15px; font-weight: 550;">프로젝트 전체 일정</div>
            <div id="overallSchedule">
                <table>
                    <tr>
                        <th rowspan="2">계획<br>시작일</th>
                        <th rowspan="2">계획<br>종료일</th>
                        <th rowspan="2">실제<br>종료일</th>
                        <th rowspan="2"><br>상태</th>
                        <th colspan="7" class="week">00/00/00 ~ 00/00/00</th>
                        <th colspan="7" class="week">00/00/00 ~ 00/00/00</th>
                        <th colspan="7" class="week">00/00/00 ~ 00/00/00</th>
                        <th colspan="7" class="week">00/00/00 ~ 00/00/00</th>
                        <th colspan="7" class="week">00/00/00 ~ 00/00/00</th>
                        <th colspan="7" class="week">00/00/00 ~ 00/00/00</th>
                    </tr>
                    <tr>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>

                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>

                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>

                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>

                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                    </tr>
                    <tr>
                        <td><c:out value="${ fn:substring(projectInfo.project.pstartDate, 2,10) }"/></td>
                        <td><c:out value="${ fn:substring(projectInfo.project.pendDate, 2, 10) }"/></td>
                        <td><c:out value="${ fn:substring(projectInfo.project.actualEndDate, 2, 10) }"/></td>
                        <td><c:out value="${ projectInfo.project.pprogress }"/></td>

                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
            </div>
        </article>
        <!--프로젝트 전체일정표 종료-->

        <!--WBS-->
        <article>
            <div style="color: #004771; font-size: 15px; font-weight: 550;">WBS <button style="cursor: pointer;" onclick="insertTask(${projectInfo.project.pno});">업무등록</button></div>

            <div id="wbs">
                <table>
                    <tr>
                        <th rowspan="2" style="min-width: 220px;"><br>업무명</th>
                        <th rowspan="2"><br>담당자</th>
                        <th rowspan="2">계획<br>시작일</th>
                        <th rowspan="2">계획<br>종료일</th>
                        <th rowspan="2">실제<br>종료일</th>
                        <th rowspan="2"><br>상태</th>
                        <th rowspan="2"><br>특이사항</th>
                        <th colspan="7" class="week">00/00/00 ~ 00/00/00</th>
                        <th colspan="7" class="week">00/00/00 ~ 00/00/00</th>
                        <th colspan="7" class="week">00/00/00 ~ 00/00/00</th>
                        <th colspan="7" class="week">00/00/00 ~ 00/00/00</th>
                        <th colspan="7" class="week">00/00/00 ~ 00/00/00</th>
                        <th colspan="7" class="week">00/00/00 ~ 00/00/00</th>
                    </tr>
                    <tr>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>

                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>

                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>

                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>

                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                        <th class="date">0</th>
                    </tr>
                    
                    <c:choose>
	                    <c:when test="${ !empty projectInfo.task }">
		                    <c:forEach var="task" items="${ projectInfo.task }">
			                    <tr class="task">
			                        <td>
			                            <img src="${ contextPath }/resources/projectManageImages/projectTaskIcon.png" style="margin-right: 7px;" onclick="showSubTask();">
			                            <a onclick="goTaskDetail(${task.pno});"><c:out value="${ task.pname }"/></a>
			                        </td>
			                        <td><c:out value="${ task.pwriter }"/></td>
			                        <td><c:out value="${fn:substring(task.pstartDate, 2, 10)}"/></td>
			                        <td><c:out value="${fn:substring(task.pendDate, 2, 10)}"/></td>
			                        <td><c:out value="${fn:substring(task.actualEndDate, 2, 10)}"/></td>
			                        <td><c:out value="${ task.pprogress }"/></td>
			                        <td style="color: red; font-weight: bold;"><c:out value="${ task.uniqueness }"/></td>
			
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                        <td></td>
			                    </tr>
			                    <c:forEach var="st" items="${ projectInfo.subTask }">
			                    	<c:if test="${ task.pno eq st.pjtTaskNo }">
					                    <tr class="subTask">
					                        <td>
					                        	<a onclick="goTaskDetail('${st.pno}');">
			                    					<c:out value="${ st.pname }"/>
			                    				</a>
					                        <%-- <c:out value="${ st.pname }"/> --%></td>
					                        <td><c:out value="${ st.pwriter }"/></td>
					                        <td><c:out value="${ fn:substring(st.pstartDate, 2, 10) }"/></td>
					                        <td><c:out value="${ fn:substring(st.pendDate, 2, 10) }"/></td>
					                        <td><c:out value="${ fn:substring(st.actualEndDate, 2, 10)}"/></td>
					                        <td><c:out value="${ st.pprogress }"/></td>
					                        <td style="color: red; font-weight: bold;"><c:out value="${ st.uniqueness }"/></td>
					
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                        <td></td>
					                    </tr>
					            	</c:if>
				            	</c:forEach>
			            	</c:forEach>
		            	</c:when>
		            	<%-- <c:otherwise>
		            		<tr>
		            			<td></td>
		            		</tr>
		            	</c:otherwise> --%>
	            	</c:choose>
                </table>
            </div>
        </article>
        <!--WBS 종료-->

        <!-- 프로젝트 정보 수정 폼 -->
        <article id="modifyProjectForm" style="display: none;">
            <form action="updateProject.pm" method="post" enctype="multipart/form-data" onsubmit="return checkNull();">
                <table>
                    <tr>
                        <th>
                        	프로젝트명<span>*</span>
                        	<input type="hidden" name="pno" value="${ projectInfo.project.pno }">
                        	<input type="hidden" name="corpNo" value="${ loginUser.corpNo }">
                        </th>
                        <td colspan="7"><input type="text" name="pname" style="width: 850px;" value="${ projectInfo.project.pname }"></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td colspan="3" style="font-size: 13px; padding-left: 5px;">
                        	<input type="text" name="pwriter" value="${ loginUser.ename }" readonly="readonly" style="border: none; box-shadow: none;">
                        </td>
                        <th>상태<span>*</span></th>
                        <td>
                            <select name="pprogress" id="pprogress" style="width: 100px;">
                                <option value="예정">예정</option>
                                <option value="진행">진행</option>
                                <option value="완료">완료</option>
                                <option value="보류">보류</option>
                                <option value="폐기">폐기</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>담당자<span>*</span></th>
                        <td colspan="3" id="chargeTd">
                        <c:forEach var="e" items="${ projectInfo.member }">
                        	<c:if test="${ e.prole eq '담당자' }">
                        		<c:set var="chargeName" value="${ e.pmName }"/>
                        		<c:set var="chargeMnos" value="${ e.mno }"/>
                        	</c:if>
                       	</c:forEach>
                            <input type="text" name="charge" readonly="readonly" value="${ chargeName }"><input type="hidden" name="chargeMno" value="${ chargeMno }">
                            <button onclick="searchPerson(0);" class="selectMemberBtn" type="button">조회</button>
                        </td>
                        <th>관리부서<span>*</span></th>
                        <td id="chrgeDeptTd">
                            <input type="text" name="chargeDept" style="width: 145px;" readonly="readonly" value="${ projectInfo.project.dname }"><input type="hidden" name="pdept" value="${ projectInfo.project.pdept }">
                            <button onclick="searchDept();" class="selectMemberBtn" type="button">조회</button>
                        </td>
                    </tr>
                    <tr>
                        <th>참여자</th>
                        <td colspan="6" id="participantTd">
                            <input type="text" name="participant" style="width: 520px;" readonly="readonly"><input type="hidden" name="participantMno" value="">
                            <button onclick="searchPerson(1);" class="selectMemberBtn" type="button">조회</button>
                        </td>
                    </tr>
                    <tr>
                        <th>열람 권한</th>
                        <td colspan="6" id="perusalTd">
                            <input type="text" name="perusal" style="width: 520px;" readonly="readonly"><input type="hidden" name="perusalMno" value="">
                            <button onclick="searchPerson(2);" class="selectMemberBtn" type="button">조회</button>

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
                        <th>프로젝트 개요</th>
                        <td colspan="6">
	                        <textarea name="psummary" id="psummary" cols="118" rows="5" style="resize: none; margin-top: 5px;"><c:out value="${ projectInfo.project.psummary }"/></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td colspan="6">
                            <input multiple="multiple" type="file" id="files" name="files" style="width: 480px; border: none; box-shadow: none;">
                            <div id="selectedFileList" style="width: 850px; height: 80px;border: 1px solid #929292; margin: auto; margin-top: 5px; margin-bottom: 5px; padding: 5px; font-size: 12px; overflow: auto;">
                            	
                            </div>
                        </td>
                    </tr>
                </table>
                <input type="button" onclick="history.go(0)" value="취소">
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
            
            <!-- 부서 선택창 -->
            <div class="searchModal searchDept">
            	<div class="onclickBackground" onclick="closeSearchDept();"></div>
            	<div class="searchBox" align="center" style="width: 300px; height: 400px;">
            		<div style="background: #004771; border-top-left-radius: 5px; border-top-right-radius: 5px; height: 35px; margin: 0; width: 300px; display: table-cell; vertical-align: middle;">
            			<span style="color: white; padding-left: 15px; margin-top: 15px; font-size: 14px;">검색</span>
            			<button onclick="closeSearchDept();" type="button" style="background: white; color: black; width: 20px; height: 20px; border: none; border-radius: 5px; margin-left: 220px; font-weight: bold;">X</button>
            		</div>
            		<div align="center" style="margin-top: 10px;">
	            		<form action="searchPerson.pm">
	            			<input type="text" name="searchName" style="width: 150px; border: 1px solid #929292; margin-left: 5px;" placeholder="부서명을 입력하세요.">
	            			<button type="button" style="width: 50px; height: 25px; border-radius: 7px; background: #004771; border: nond; color: white; margin-left: 5px; font-size: 13px; border: none;">검색</button>
	            		</form>
            		</div>
            		<div style="width: 230px; height: 280px; border: 1px solid #929292; margin-top: 15px; overflow: auto;" align="center">
            			<table style="width: 100%; font-size: 13px;" id="deptList">
            				<c:forEach var="p" items="${ allMemberDept.allDept }">
	            				<c:if test="${ !empty p }">
		            				<tr onclick="selectDept(${ p.did }, '${ p.dname }');">
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
        <!-- 프로젝트 정보 수정 폼 종료 -->
    </section>

    <script>
        function showModifyForm() {
            $('article:nth-child(n+2)').css('display', 'none');
            $('#modifyProjectForm').css('display', 'block');
            $('.menuTitle>span').text('프로젝트 수정');
            $('.menuTitle>button').hide();
        }
        
        $(function() {
        	$("#pprogress>option[value='${projectInfo.project.pprogress}']").attr("selected", "selected");
        	
        	var startDate = '${projectInfo.project.pstartDate}';
        	var endDate = '${projectInfo.project.pendDate}';
        	var actualDate = '${projectInfo.project.actualEndDate}';
        	
        	var pstartDate = startDate.replaceAll('/', '-');
        	var pendDate = endDate.replaceAll('/', '-');
        	var actualEndDate = actualDate.replaceAll('/', '-');
        	
        	$("input[name='pstartDate']").val(pstartDate);
        	$("input[name='pendDate']").val(pendDate);
        	$("input[name='actualEndDate']").val(actualEndDate);
        	
        	var participantMnos = "";
        	var perusalMnos = "";

        	<c:forEach var="m" items="${projectInfo.member}" varStatus="status">
        		<c:if test="${m.prole eq '참여자'}">
	        		participantMnos += '${m.mno}';
	        		participantMnos += ', ';
        		</c:if>
        		<c:if test="${m.prole eq '열람권한'}">
        			perusalMnos += '${m.mno}';
        			perusalMnos += ', ';
        		</c:if>
        	</c:forEach>
        	
        	var partiResult = participantMnos.slice(0, participantMnos.length - 2);
        	var peruResult = perusalMnos.slice(0, perusalMnos.length - 2);
        	
        	$("input[name='participantMno']").val(partiResult);
        	$("input[name='perusalMno']").val(peruResult);
        	
        });
        
/*         function showSubTask() {
            if($('.subTask').css('display') == 'none') {
                $('.subTask').css('display', '');
            } else {
                $('.subTask').css('display', 'none');
            }
        } */
        
        //프로젝트 참여자, 열람권한 이름 사이에 쉼표 처리
        $(function() {
        	var str = $("#participant").text().trim();
        	var result = str.slice(0, str.length - 1);
        	
        	$("#participant").text(result);
        	
        	var str2 = $("#perusal").text().trim();
        	var result2 = str2.slice(0, str2.length - 1);
        	
        	$("#perusal").text(result2);
        	$("input[name='participant']").val(result.replace(/(\s*)/g,""));
        	$("input[name='perusal']").val(result2.replace(/(\s*)/g,""));
        	
        });
        
        //첨부파일 다운로드
        function fileDownload(fileNo) {
        	console.log(fileNo);
        	
        	location.href="projectFileDownload.pm?fileNo=" + fileNo;
        }
        
        function insertTask(pno) {
        	console.log(pno);
        	
        	location.href="insertTaskForm.pm?pno=" + pno;
        }
        
        function goTaskDetail(pno) {
        	console.log(pno);
        	
        	location.href="taskDetail.pm?pno=" + pno;
        }
        
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
        
        
        function searchDept() {
        	jQuery('.searchDept').fadeIn('slow');
        }
        
        function closeSearchDept() {
        	jQuery('.searchDept').fadeOut('slow');
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
        	} else if(tdNum == 1) {
        		$("input[name='participant']").val(names);
        		$("input[name='participantMno']").val(mnoArr);
        		console.log("참여mnoArr : " + mnoArr);
        		mnoArr = "";
	        	console.log("초기화 후 : " + mnoArr);
	        	console.log("참여자 : " + $("input[name='participantMno']").val());
        	} else {
        		$("input[name='perusal']").val(names);
        		$("input[name='perusalMno']").val(mnoArr);
        		console.log("열람mnoArr : " + mnoArr);
        		mnoArr = "";
	        	console.log("열람권한 : " + $("input[name='perusalMno']").val());
        	}

        	jQuery('.searchPerson').fadeOut('slow');
        	
        }
        
/*         function searchPersonAjax() {
        	var searchName = $("input[name='searchName']").val();
       	
        	$.ajax({
        		url: "searchPerson.pm",
        		type: "get",
        		data: {searchName: searchName},
        		success: function(data) {
        			console.log('${requestScope.allMemberDept.allMember}');
        		},
        		error: function(data) {
        			console.log("실패");
        		}
        	});    
        } */
        
        function selectDept(did, dname) {
        	console.log(did + ", " + dname);
        	
        	$("input[name='chargeDept']").val(dname);
        	$("input[name='pdept']").val(did);
        	console.log("담당부서명 : " + $("input[name=chargeDept]").val());
        	console.log("담당부서코드 : " + $("input[name=pdept]").val());
        	
        	jQuery('.searchDept').fadeOut('slow');
        }
        
        function checkNull() {
        	var pname = $("input[name='pname']").val();
        	var charge = $("input[name='charge']").val();
        	var pstartDate = $("input[name='pstartDate']").val();
        	var pendDate = $("input[name='pendDate']").val();
        	var chargeDept = $("input[name='chargeDept']").val();
        	
        	if(!pname) {
        		alert("프로젝트명을 입력 해 주세요.");
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
        	} else if(!chargeDept) {
        		alert("관리 부서를 입력하세요.");
        		return false;
        	} else {
        		return true;
        	}
        }
        
        //파일 선택 시 div에 파일 제목 목록 출력
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
        });
      
        function goProjectDetail() {
	    	location.href="projectDetail.pm?pno=" + ${ projectInfo.project.pno };
	    }
	    function goProjectNotice() {
	    	location.href="projectNoticeList.pm?pno=" + ${ projectInfo.project.pno };
	    }
    </script>

</body>
</html>