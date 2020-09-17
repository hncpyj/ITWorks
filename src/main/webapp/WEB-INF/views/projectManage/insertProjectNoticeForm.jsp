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

    /* 공지사항 입력 폼 */
    article:nth-child(2) {
        margin-top: 40px;
    }
    article:nth-child(2)>form>table {
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
    input[type="submit"] {
        margin-top: 10px;
        width: 63px;
        height: 25px;
        background: #004771;
        color: white;
        margin-left: 88%;
        border: none;
        font-size: 13px;
    }
    input[type="submit"], button {
        cursor: pointer;
    }
    /* 공지사항 입력 폼 종료 */
</style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="projectDetailAside.jsp"/>
    <section>
        <!--메뉴 타이틀-->
        <article style="margin-top: 30px;">
            <div id="menuTitle">
                <span>프로젝트 공지사항 등록</span>
                <hr style="width: 95%; margin-top: 10px; color: #929292;">
            </div>
        </article>
        <!--메뉴 타이틀 종료-->

        <!-- 공지사항 입력 폼 -->
        <article>
            <form action="insertProjectNotice.pm" method="post" enctype="multipart/form-data" onsubmit="return checkNull();">
                <table>
                    <tr>
                        <th>제목
	                        <input type="hidden" value="${ pno }" name="pno"/>
	                        <input type="hidden" name="writerMno" value="${ loginUser.mno }"/>
                        </th>
                        <td><input type="text" name="pnoticeName" style="width: 900px;"></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td><c:out value="${ loginUser.ename }"/></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td>
                            <textarea name="pnoticeContent" id="" cols="125" rows="20" style="resize: none; margin-left: 7px; margin-top: 5px;"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td>
	                        <input multiple="multiple" type="file" id="files" name="files" style="width: 480px; border: none; box-shadow: none; margin-top: 5px;">
                            <div id="selectedFileList" style="width: 890px; height: 80px; border: 1px solid #929292; margin: auto; margin-top: 5px; margin-bottom: 5px; padding: 5px; font-size: 12px; overflow: auto;">
                            </div>
                        </td>
                    </tr>
                </table>
                <input type="submit" value="등록하기">
            </form>
        </article>
        <!-- 공지사항 입력 폼 종료-->
    </section>
    
    <script>
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
	    	location.href="projectDetail.pm?pno=" + ${pno};
	    }
	    function goProjectNotice() {
	    	location.href="projectNoticeList.pm?pno=" + ${pno};
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
    </script>
</body>
</html>