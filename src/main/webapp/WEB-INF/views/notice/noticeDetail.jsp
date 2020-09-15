<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ItWorks</title>
<link rel="icon" href="${contextPath}/resources/images/favicon.ico" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
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
    #updateTable{
    	margin-right: auto;
    	margin-left: auto;
    	margin-top: 50px;
    	border-collapse: collapse;
    	border-top:  2px solid #929292;
    }
	#buttonArea{
   		border-bottom: none;
   		background: #f4f4f4;
   		margin-left: 885px;
   	}
    /* 공지사항 수정 폼 종료 */
</style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="noticeAside.jsp"/>
    <section>
        <!--메뉴 타이틀-->
        <article style="margin-top: 30px;">
            <div id="menuTitle">
                <span>공지사항</span>
                <hr style="width: 95%; margin-top: 10px; color: #929292;">
            </div>
        </article>
        <!--메뉴 타이틀 종료-->

        <!-- 공지사항 폼 -->
        <article>
            <button onclick="modifyNotice();">수정하기</button>
            <button onclick="deleteNotice('${notice2.noticeno}');">삭제하기</button>
            <table>
                <tr>
                    <th>No</th>
                    <td width="650px"><p><c:out value="${ notice2.noticeno }"/></p></td>
                    <th>조회수</th>
                    <td><p><c:out value="${ notice2.nviews }"/></p></td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td colspan="3"><p><c:out value="${ notice2.ntitle }"/></p></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td><p><c:out value="${ notice2.ename }"/></p></td>
                    <th>작성일</th>
                    <td style="text-align: center; padding-left: 0;"><p><c:out value="${ notice2.ndate }"/></p></td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 400px;"><pre><c:out value="${ notice2.ncontent }"/></pre></td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td colspan="3"></td>
                </tr>
            </table>
            <input type="hidden" name="mno" value="${ notice2.mno }">
            <input type="hidden" name="noticeno" value="${ notice2.noticeno }">
            <button onclick="history.go(-1);">목록으로</button>
        </article>
        
        <script>
        	function deleteNotice(noticeno) {
        		var confirmTest = confirm('삭제하시겠습니까?');
        		
        		if(confirmTest == true) {
	        		location.href='deleteNo.no?noticeno=' + noticeno;
        		}     
        	}
        </script>
        <!-- 공지사항 폼 종료-->
        
        
        <!-- 공지사항 수정 폼 -->
        <article id="modifyNoticeForm" style="display: none;">
            <form action="updateNo.no" method="post" enctype="multipart/form-data">
                <table id="updateTable">
                    <tr>
                        <th>No</th>
                        <td width="650px"><input type="hidden" name="noticeno" value="${ notice2.noticeno }"><c:out value="${ notice2.noticeno }"/></td>
                        <th>조회수</th>
                        <td><c:out value="${ notice2.nviews }"/></td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td colspan="3"><input type="text" name="ntitle" style="width: 900px; border: none;" value="${ notice2.ntitle }"></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td><c:out value="${ notice2.ename }"/></td>
                        <th>작성일</th>
                        <td style="text-align: center; padding-left: 0;"><c:out value="${ notice2.ndate }"/></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 400px;">
                            <textarea name="ncontent" id="" cols="141" rows="20" style="resize: none; margin-top: 5px; border: none;"><c:out value="${ notice2.ncontent }"/></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td colspan="3"><input type="file"></td>
                    </tr>
                </table>
				<div style=" width: 220px; float: right;">
              		<button onclick="history.go(0);" style="background: lightgray; color: black; margin-left: 0;">취소하기</button>
              		<button onclick="updateNotice('${notice2.noticeno}');" style="background-color: #004771; border-color:#004771; outline:0; color: white; margin-left: 0;">수정하기</button>
				</div>
            </form>
        </article>
        <!-- 공지사항 수정 폼 종료 -->
        
        <script>
        	
        	function updateNotice(noticeno) {
        		
        		var confirmTest = confirm('수정하시겠습니까?');
        		
        		if (confirmTest == true) {
        			location.href='updateNo.no?noticeno=' + noticeno;
        		}
        		
        	}
        
        </script>
        
    </section>
	<script>
        function modifyNotice() {
            $('article:nth-child(n+2)').css('display', 'none');
            $('#modifyNoticeForm').css('display', 'block');
            $('#menuTitle>span').text('프로젝트 공지사항 수정');
            $('#menuTitle>button').hide();
        }
    </script>
</body>
</html>