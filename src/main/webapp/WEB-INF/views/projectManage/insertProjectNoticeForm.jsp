<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
            <form action="">
                <table>
                    <tr>
                        <th>제목</th>
                        <td><input type="text" style="width: 900px;"></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td>
                            <textarea name="" id="" cols="126" rows="20" style="resize: none; margin-top: 5px;"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td><input type="file"></td>
                    </tr>
                </table>
                <input type="submit" value="등록하기">
            </form>
        </article>
        <!-- 공지사항 입력 폼 종료-->
    </section>
</body>
</html>