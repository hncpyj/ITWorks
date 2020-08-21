<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITWorks!</title>
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
    article:nth-child(2)>form>table input, textarea, select {
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
            <form action="">
                <table>
                    <tr>
                        <th>프로젝트명</th>
                        <td colspan="7"><input type="text" name="projectName" style="width: 850px;"></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td colspan="3"></td>
                        <th>상태</th>
                        <td>
                            <select name="projectStatus" id="" style="width: 100px;">
                                <option value="">예정</option>
                                <option value="">진행</option>
                                <option value="">완료</option>
                                <option value="">보류</option>
                                <option value="">폐기</option>
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
                <input type="submit" value="등록">
            </form>
        </article>
    </section>

    <script>
        //file drag and arop
        var dropFile = function(event) {
            event.preventDefault();
        }
    </script>
</body>
</html>