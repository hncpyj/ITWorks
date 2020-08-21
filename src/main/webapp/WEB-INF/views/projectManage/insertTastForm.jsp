<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
    <jsp:include page="projectDetailAside.jsp"/>
    
    <!--메뉴 타이틀-->
    <article style="margin-top: 30px;">
        <div id="menuTitle">
            <span>신규 프로젝트 등록</span>
            <hr style="width: 95%; margin-top: 10px; color: #929292;">
        </div>
    </article>
    <!--메뉴 타이틀 종료-->
</body>
</html>