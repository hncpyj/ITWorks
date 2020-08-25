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
        height: 370px;
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
                <button style="margin-left: 54.7%; background: lightgray; color: black;" onclick="deleteTask();">삭제</button>
                <button onclick="showModifyForm();">수정</button>
                <button onclick="history.go(-1)">이전으로</button>
                <hr style="width: 95%; margin-top: 10px; color: #929292;">
            </div>
        </article>
        <!--메뉴 타이틀 종료-->

        <!-- 업무 정보 -->
        <article>
            <table>
                <tr>
                    <th>업무명</th>
                    <td colspan="3"></td>
                    <th>작성자</th>
                    <td></td>
                </tr>
                <tr>
                    <th>담당자</th>
                    <td colspan="3"></td>
                    <th>상태</th>
                    <td></td>
                </tr>
                <tr>
                    <th>계획 시작일</th>
                    <td></td>
                    <th>계획 종료일</th>
                    <td></td>
                    <th>실제 종료일</th>
                    <td></td>
                </tr>
                <tr>
                    <th>업무 개요</th>
                    <td colspan="5"></td>
                </tr>
                <tr>
                    <th>특이사항</th>
                    <td colspan="3"></td>
                    <th>진행률</th>
                    <td></td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td colspan="6"></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="5"><textarea name="" id="" cols="119" rows="8" style="resize: none; margin-top: 5px; border: none; box-shadow: none;" readonly></textarea></td>
                </tr>
            </table>
        </article>
        <!-- 업무 정보 종료 -->

        <!-- 댓글 영역 -->
        <article>
            <div class="subTitle">댓글()</div>
            <table>
                <tr>
                    <td style="width: 40px;"><div class="commentProfile"></div></td>
                    <th width="80px" style="font-size: 13px;">임직원명</th>
                    <td style="font-size: 13px; word-break:break-all;">덧글내용ggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg<br>gg<br>gg</td>
                    <td style="width: 140px; font-size: 12px; color:#929292; text-align: center;">yyyy/mm/dd hh:mm:ss</td>
                </tr>
                <tr>
                    <td style="width: 40px;"><div class="commentProfile"></div></td>
                    <th width="80px" style="font-size: 13px;">임직원명</th>
                    <td style="font-size: 13px; word-break:break-all;">덧글내용</td>
                    <td style="width: 140px; font-size: 12px; color:#929292; text-align: center;">yyyy/mm/dd hh:mm:ss</td>
                </tr>
                <tr height="10px"></tr>
            </table>
            <div id="insertComment">
                <form action="">
                    <table>
                        <td>
                            <textarea name="" id="" cols="123" rows="4" style="resize: none; border: 1px solid #929292; border-radius: 5px 5px 5px 5px;"></textarea>
                        </td>
                        <td style="padding-bottom: 8px;">
                            <input type="submit" value="등록">
                        </td>
                        
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

        function deleteTask() {

        }
    </script>
</body>
</html>