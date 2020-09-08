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
</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="projectDetailAside.jsp"/>
    <section>
        <!--메뉴 타이틀-->
        <article style="margin-top: 30px;">
            <div id="menuTitle">
                <span>프로젝트 세부 업무 정보</span>
                <c:forEach var="m" items="${ taskInfo.member }">
                	<c:if test="${ m.prole eq '담당자'}">
                		<c:set var="chargeMno" value="${ m.mno }"/>
                	</c:if>
                	<c:if test="${ m.prole eq '작성자' }">
                		<c:set var="writerMno" value="${ m.mno }"/>
                	</c:if>
                </c:forEach>
                <c:if test="${ loginUser.mno eq chargeMno || loginUser.mno eq writerMno }">
	                <button style="margin-left: 50%; background: lightgray; color: black;" onclick="deleteTask();">삭제</button>
	                <button onclick="showModifyForm();">수정</button>
                </c:if>
                <c:if test="${ loginUser.mno eq chargeMno || loginUser.mno eq writerMno }">
	                <button onclick="history.go(-1)">이전으로</button>
                </c:if>
                <c:if test="${ loginUser.mno ne chargeMno && loginUser.mno ne writerMno }">
	                <button onclick="history.go(-1)" style="margin-left: 65%;">이전으로</button>
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


        <!-- 업무 수정 폼 -->
        <article id="modifyTaskForm" style="display: none;">
            <form action="">
                <table>
                    <tr>
                        <th>업무명</th>
                        <td colspan="3"><input type="text" name="projectName" style="width: 528px;"></td>
                        <th>작성자</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>담당자</th>
                        <td colspan="3">
                            <input type="text" style="width: 475px;">
                            <button onclick="" class="selectMemberBtn">조회</button>
                        </td>
                        <th>상태</th>
                        <td>
                            <select name="projectStatus" id="" style="width: 192px;">
                                <option value="">예정</option>
                                <option value="">진행</option>
                                <option value="">완료</option>
                                <option value="">보류</option>
                                <option value="">폐기</option>
                            </select>
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
                        <th>업무 개요</th>
                        <td colspan="5"><input type="text" style="width: 850px;"></td>
                    </tr>
                    <tr>
                        <th>특이사항</th>
                        <td colspan="3">
                            <input id="issue" name="issue" type="checkbox">&nbsp;&nbsp;<label for="issue">이슈 발생</label>&nbsp;&nbsp;&nbsp;&nbsp;
                            <input id="urgent" name="urgent" type="checkbox">&nbsp;&nbsp;<label for="urgent">긴급</label>
                        </td>
                        <th>진행률</th>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td colspan="6">
                            <input multiple="multiple"  type="file" name="filename[]" style="width: 480px; border: none; box-shadow: none;"/>
                            <!--file drag and drop 더 알아보기-->
                        </td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td colspan="5"><textarea name="" id="" cols="119" rows="15" style="resize: none; margin-top: 5px;"></textarea></td>
                    </tr>
                </table>
                <input type="button" onclick="history.go(0)" value="취소">
                <input type="submit" value="등록">
            </form>
        </article>
        <!-- 업무 수정 폼 종료 -->
    </section>

    <script>
        function showModifyForm() {
            $('article:nth-child(n+2)').css('display', 'none');
            $('#modifyTaskForm').css('display', 'block');
            $('#menuTitle>span').text('프로젝트 업무 수정');
            $('#menuTitle>button').hide();
        }

        function deleteSubTask() {

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
    </script>
</body>
</html>