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
    .files {
    	 color: black;
    	 text-decoration: none;
    }
    .files:hover {
    	cursor: pointer;
    	text-decoration: underline;
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
                <button style="margin-left: 65%; cursor: pointer;" onclick="showModifyForm();">수정</button>
                <button onclick="location.href='selectAllProjectList.pm'">목록으로</button>
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
                    
                    <c:forEach var="task" items="${ projectInfo.task }">
	                    <tr class="task">
	                        <td>
	                            <img src="${ contextPath }/resources/projectManageImages/projectTaskIcon.png" style="margin-right: 7px;" onclick="showSubTask();">
	                            <a href="taskDetail.pm"><c:out value="${ task.pname }"/></a>
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
		                    <tr class="subTask">
		                        <td><c:out value="${ st.pname }"/></td>
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
		            	</c:forEach>
	            	</c:forEach>
                </table>
            </div>
        </article>
        <!--WBS 종료-->

        <!-- 프로젝트 정보 수정 폼 -->
        <article id="modifyProjectForm" style="display: none;">
            <form action="">
                <table>
                    <tr>
                        <th>프로젝트명</th>
                        <td colspan="7"><input type="text" name="projectName" style="width: 850px;" value="${ projectInfo.project.pname }"></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td colspan="3" style="font-size: 13px; padding-left: 13px;">
                        	<c:forEach var="m" items="${ projectInfo.member }">
                    		<c:if test="${ m.prole eq '작성자' }">
                    			<c:out value="${ m.pmName }"/>
                    		</c:if>
                    	</c:forEach>
                        </td>
                        <th>상태</th>
                        <td>
                            <select name="pprogress" id="pprogress" style="width: 179px; height: 25px;">
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
                            <input type="text">
                            <button onclick="" class="selectMemberBtn">조회</button>
                        </td>
                        <th>관리부서</th>
                        <td>
                            <input type="text" style="width: 145px;">
                            <button onclick="" class="selectMemberBtn">조회</button>
                        </td>
                    </tr>
                    <tr>
                        <th>참여자</th>
                        <td colspan="6">
                            <input type="text" style="width: 520px;">
                            <button onclick="" class="selectMemberBtn">조회</button>
                        </td>
                    </tr>
                    <tr>
                        <th>열람 권한</th>
                        <td colspan="6">
                            <input type="text" style="width: 520px;">
                            <button onclick="" class="selectMemberBtn">조회</button>

                        </td>
                    </tr>
                    <tr>
                        <th>계획 시작일</th>
                        <td><input type="date"></td>
                        <th>계획 종료일</th>
                        <td><input type="date"></td>
                        <th>실제 종료일</th>
                        <td><input type="date"></td>
                    </tr>
                    <tr>
                        <th>프로젝트 개요</th>
                        <td colspan="6"><textarea name="" id="" cols="118" rows="5" style="resize: none; margin-top: 5px;"></textarea></td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td colspan="6">
                            <input multiple="multiple"  type="file" name="filename[]" style="width: 480px; border: none; box-shadow: none;"/>
                            <!--file drag and drop 더 알아보기-->
                        </td>
                    </tr>
                </table>
                <input type="button" onclick="history.go(0)" value="취소">
                <input type="submit" value="등록">
            </form>
        </article>
        <!-- 프로젝트 정보 수정 폼 종료 -->
    </section>

    <script>
        function showModifyForm() {
            $('article:nth-child(n+2)').css('display', 'none');
            $('#modifyProjectForm').css('display', 'block');
            $('.menuTitle>span').text('프로젝트 수정');
            $('.menuTitle>button').hide();
            
            console.log('${progress}');
            
        }
        
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
    </script>

</body>
</html>