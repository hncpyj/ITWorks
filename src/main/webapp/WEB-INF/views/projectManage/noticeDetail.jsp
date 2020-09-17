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
    }
    #asideBack ul li:last-child {
        font-weight: bold;
    }

    button {
        cursor: pointer;
    }
    /*메뉴 타이틀 관련 css 설정 종료*/

    /* 공지사항 내용 */
    article:nth-child(2), article:nth-child(3) {
        margin-top: 40px;
    }
    article:nth-child(2)>table, article:nth-child(3)>form>table {
        width: 1030px;
        border-top: 2px solid #929292;
        border-bottom: 2px solid #929292;
        margin: auto;
        border-collapse: collapse;
    }
    th {
        width: 100px;
        height: 30px;
        background: #f4f4f4;
        border-bottom: 1px solid #929292;
        font-size: 13px;
    }
    td {
        background: white;
        border-bottom: 1px solid #929292;
        padding-left: 10px;
        font-size: 13px;
    }
    button, article:last-child>form>input[type="submit"] {
        width: 62px;
        height: 25px;
        border: none;
        background: #004771;
        color: white;
        font-size: 13px;
    }
    button:nth-child(-n+2) {
        margin-bottom: 10px;
    }
    button:last-child {
        margin-top: 10px;
        margin-left: 88.5%;
    }
    button:first-child, article:last-child>form>button {
        margin-left: 82%;
        margin-right: 5px;
    }
    tr:nth-child(3)>th, tr:nth-child(3)>td, tr:nth-child(4)>td {
        border-bottom: 2px solid #929292;
    }
    /* 공지사항 내용 종료 */

    /* 공지사항 수정 폼 */
    article:last-child>form>button, article:last-child>form>input[type="submit"] {
        margin-top: 10px;
    }
    button, input[type="submit"] {
        cursor: pointer;
    }
    /* 공지사항 수정 폼 종료 */
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
                <span>프로젝트 공지사항</span>
                <hr style="width: 95%; margin-top: 10px; color: #929292;">
            </div>
        </article>
        <!--메뉴 타이틀 종료-->

        <!-- 공지사항 폼 -->
        <article>
        	<c:if test="${ noticeInfo.notice.writerMno eq loginUser.mno}">
            	<button onclick="modifyNotice();">수정하기</button>
	            <button onclick="deleteNotice();">삭제하기</button>
            </c:if>
            <table>
                <tr>
                    <th>제목</th>
                    <td style="width: 650px;"><c:out value="${ noticeInfo.notice.pnoticeName }"/></td>
                    <th>조회수</th>
                    <td style="text-align: center;"><c:out value="${ noticeInfo.notice.count }"/></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td><c:out value="${ noticeInfo.notice.ename }"/></td>
                    <th>작성일</th>
                    <td style="text-align: center; padding-left: 0;">
						<c:out value="${ noticeInfo.notice.pnoticeDate }"/>&nbsp;&nbsp;<c:out value="${ noticeInfo.notice.pnoticeTime }"/>
					</td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 400px;">
                    <textarea name="pnoticeContent" readonly="readonly" cols="125" rows="20" style="resize: none; margin-left: 7px; margin-top: 5px; border: none;">
                    	<c:out value="${ noticeInfo.notice.pnoticeContent }"/>
                    </textarea>
                    </td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td colspan="3" style="padding: 0;">
                    	<div style="width: 900px; height: 70px; margin: auto; overflow: auto;">
	                       	<c:forEach var="f" items="${ noticeInfo.files }">
	                       		<div style="margin-bottom: 5px; margin-top: 5px;">
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
            <button onclick="history.go(-1);">목록으로</button>
        </article>
        <!-- 공지사항 폼 종료-->
        <article id="modifyNoticeForm" style="display: none;">
            <form action="updatePnotice.pm" method="post" enctype="multipart/form-data" onsubmit="return checkNull();">
                <table>
                    <tr>
                        <th style="width: 100px;">제목</th>
                        <td style="width: 660px;"><input type="text" name="pnoticeName" style="width: 600px;" value="${ noticeInfo.notice.pnoticeName }"><input type="hidden" name="pnoticeNo" value="${ noticeInfo.notice.pnoticeNo }"/></td>
                        <th style="width: 100px;">조회수</th>
                        <td style="text-align: center"><c:out value="${ noticeInfo.notice.count }"/></td>
                    </tr>
                    <tr>
                        <th style="width: 100px;">작성자</th>
                        <td style="width: 660px;"><c:out value="${ noticeInfo.notice.ename }"/></td>
                        <th style="width: 100px;">작성일</th>
                        <td style="text-align: center; padding-left: 0;">
							<c:out value="${ noticeInfo.notice.pnoticeDate }"/>&nbsp;&nbsp;<c:out value="${ noticeInfo.notice.pnoticeTime }"/>
						</td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 400px; padding-left: 0px;">
                            <textarea name="pnoticeContent" id="pnoticeContent" cols="141" rows="20" style="resize: none; margin-top: 5px;">
                            	<c:out value="${ noticeInfo.notice.pnoticeContent }"/>
                            </textarea>
                        </td>
                    </tr>
                    <tr>
                        <th style="width: 100px;">첨부파일</th>
                        <td colspan="3">
	                        <input multiple="multiple" type="file" id="files" name="files" style="width: 480px; border: none; box-shadow: none; margin-top: 5px;">
                            <div id="selectedFileList" style="width: 890px; height: 80px; border: 1px solid #929292; margin: auto; margin-top: 5px; margin-bottom: 5px; padding: 5px; font-size: 12px; overflow: auto;">
                            </div>
                        </td>
                    </tr>
                </table>
                <button onclick="history.go(0);" style="background: lightgray; color: black;">취소하기</button>
                <input type="submit" value="수정하기">
            </form>
        </article>
        <!-- 공지사항 수정 폼 -->
    </section>

    <script>
        function modifyNotice() {
            $('article:nth-child(n+2)').css('display', 'none');
            $('#modifyNoticeForm').css('display', 'block');
            $('#menuTitle>span').text('프로젝트 공지사항 수정');
            $('#menuTitle>button').hide();
        }
        
      //첨부파일 다운로드
        function fileDownload(fileNo) {
        	console.log(fileNo);
        	
        	location.href="projectFileDownload.pm?fileNo=" + fileNo;
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
	    	location.href="projectDetail.pm?pno=" + ${noticeInfo.notice.pno};
	    }
	    function goProjectNotice() {
	    	location.href="projectNoticeList.pm?pno=" + ${noticeInfo.notice.pno};
	    }
	    function checkNull() {
        	var pnoticeName = $("input[name='pnoticeName']").val();
        	
        	if(!pnoticeName) {
        		alert("제목을 입력 해 주세요.");
        		$("input[name='pnoticeName']").focus();
        		return false;
        	} else {
        		return true;
        	}
        }
	    
	    function deleteNotice() {
	    	location.href="deleteNotice.pm?nno=" + ${noticeInfo.notice.pnoticeNo} + "&pno=" + ${noticeInfo.notice.pno};
	    }
    </script>
</body>
</html>