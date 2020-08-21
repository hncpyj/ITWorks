<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	section{
		width: 75%;
		display: inline-block;
	}
	.inner{
        margin-top: 30px;
        width: 100%; 
        margin: 0 auto;
        padding-left: 30px;
    }
    #inner-title{
        color: #004771;
        font-family: Noto Sans KR;
        font-style: normal;
        font-weight: 500;
        font-size: 24px;
        line-height: 35px;
        margin-top: 30px;
    }
    #inner-title span{
    	margin-left: 20;
    }
    .middleTable{
    	width:100%;
        border-collapse: collapse;
        text-align:center;
    }
    .leftTable{
    	width:100%;
        border-collapse: collapse;
    }
    #managerTable tr{
    	border-bottom: 0.5px solid #9F9F9F;
		border-top: 0.5px solid #9F9F9F;
    }
    .middleName{
    	color: #004771;
        font-family: Noto Sans KR;
        font-style: normal;
        font-size: 14px;
    }
    #usageStatus{
    	width: 500px;
    }
    td{
    	font-family: Noto Sans KR;
		font-style: normal;
		font-weight: normal;
		font-size: 14px;
		line-height: 20px;
		color: #676767;
		height: 30px;
    }
    th{
    	font-family: Noto Sans KR;
		font-style: normal;
		font-weight: normal;
		font-size: 16px;
		line-height: 23px;
		color: #000000;
		background: white;
		width: 130px;
		height: 30px;
    }
    .line{
    	border-bottom: 0.5px solid #9F9F9F;
		border-top: 0.5px solid #9F9F9F;
    }
    .saveBtn{
    	outline: 0;
    	border : 1px solid #929292;
    	background-color: white;
    	color: #004771;
    	width: 80px;
    	margin-top: 10px;
    	margin-right: 10px;
    }
    .btn{
    	outline: 0;
    	border : 0;
    	color: #004771;
    	background-color: #fafafa;
    }
    .addBtn{
    	outline: 0;
    	border : 0;
    	background-color: #004771;
    	color: white;
    	width: 80px;
    }
    .left{
    	margin-right: 15px;
    	
    }
    .padding{
    	padding-left: 10px;
    }
    
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/atManagement/atManagementAside.jsp"></jsp:include>
	    <section>
        <div class="inner">
            <div id="inner-title">
            <span>근태 기본 설정</span>
            <br>
            <hr>
            <br>
            </div>
            <!-- 근태랑 52시간 근무 적용 여부 시작-->
            <div>
            	<form action="">
                <table id="usageStatus" class="leftTable">
                    <tr>
                        <td class="middleName">근태 사용 여부</td>
                        <td><input type="radio" name="workState"></td>
                        <td>사용함</td>
                        <td><input type="radio" name="workState"></td>
                        <td>사용 안함</td>
                    </tr>
                    <tr>
                        <td class="middleName">52시간 근무 적용 여부</td>
                        <td><input type="radio" name="52State"></td>
                        <td>사용함</td>
                        <td><input type="radio" name="52State"></td>
                        <td>사용 안함</td>
                    </tr>
                    <tr>
                        <td colspan="5"><button class="saveBtn">저장</button></td>
                    </tr>
                </table>
            	</form>
            </div>
            <br>
            <!-- 근태랑 52시간 근무 적용 여부 끝 -->
            <div>
            	<form action="">
                <label class="middleName">근태 정책 설정</label>
                <table class="leftTable">
                    <tr class="line">
                        <th>기본 근태</th>
                        <td colspan="15" class="padding">기본 근태</td>
                    </tr>
                    <tr class="line">
                        <th>적용 대상</th>
                        <td colspan="15" class="padding">전사(ALL)</td>
                    </tr>
                    <tr>
                        <th rowspan="5">출퇴근 설정</th>
                        <td colspan="15" class="padding"><input type="radio" name="worktime">
                        	<span class="left">출근일 및 출퇴근 시간 설정</span>
                        	<input type="radio" name="worktime">
                        	<span class="left">자율 출퇴근 설정</span></td>
                    </tr>
                    <tr>
                        <td colspan="15" class="padding"><input type="checkbox">
                        	<span class="left">월</span>
                        	<input type="checkbox">
                        	<span class="left">화</span>
                        	<input type="checkbox">
                        	<span class="left">수</span>
                        	<input type="checkbox">
                        	<span class="left">목</span>
                        	<input type="checkbox">
                        	<span class="left">금</span>
                        	<input type="checkbox">
                        	<span class="left">토</span>
                        	<input type="checkbox">
                        	<span class="left">일</span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="15" class="padding"><input type="checkbox">
                        	<span class="left">근로자의 날(5/1)</span>
                        	<input type="checkbox">
                        	<span class="left">공휴일</span>
                        	<input type="checkbox">
                        	<span class="left">대체공휴일</span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="15" class="padding">
                        	<span>출근</span>
                            <select>
                                <option>01</option>
                                <option>02</option>
                                <option>03</option>
                                <option>04</option>
                                <option>05</option>
                                <option>06</option>
                                <option>07</option>
                                <option>08</option>
                                <option>09</option>
                                <option>10</option>
                                <option>11</option>
                                <option>12</option>
                                <option>13</option>
                                <option>14</option>
                                <option>15</option>
                                <option>16</option>
                                <option>17</option>
                                <option>18</option>
                                <option>19</option>
                                <option>20</option>
                                <option>21</option>
                                <option>22</option>
                                <option>23</option>
                                <option>24</option>
                            </select>
                        	<span class="left">시</span>
                            <select>
                            	<option>00</option>
                                <option>05</option>
                                <option>10</option>
                                <option>15</option>
                                <option>20</option>
                                <option>25</option>
                                <option>30</option>
                                <option>35</option>
                                <option>40</option>
                                <option>45</option>
                                <option>50</option>
                                <option>55</option>
                            </select>
                        	<span class="left">분</span>
                        	<span>퇴근</span>
                            <select>
                                <option>01</option>
                                <option>02</option>
                                <option>03</option>
                                <option>04</option>
                                <option>05</option>
                                <option>06</option>
                                <option>07</option>
                                <option>08</option>
                                <option>09</option>
                                <option>10</option>
                                <option>11</option>
                                <option>12</option>
                                <option>13</option>
                                <option>14</option>
                                <option>15</option>
                                <option>16</option>
                                <option>17</option>
                                <option>18</option>
                                <option>19</option>
                                <option>20</option>
                                <option>21</option>
                                <option>22</option>
                                <option>23</option>
                                <option>24</option>
                            </select>
                        	<span class="left">시</span>
                            <select>
                                <option>00</option>
                                <option>05</option>
                                <option>10</option>
                                <option>15</option>
                                <option>20</option>
                                <option>25</option>
                                <option>30</option>
                                <option>35</option>
                                <option>40</option>
                                <option>45</option>
                                <option>50</option>
                                <option>55</option>
                            </select>
                        	<span class="left">분</span>
                        	<span>반차</span>
                            <select>
                                <option>01</option>
                                <option>02</option>
                                <option>03</option>
                                <option>04</option>
                                <option>05</option>
                                <option>06</option>
                                <option>07</option>
                                <option>08</option>
                                <option>09</option>
                                <option>10</option>
                                <option>11</option>
                                <option>12</option>
                                <option>13</option>
                                <option>14</option>
                                <option>15</option>
                                <option>16</option>
                                <option>17</option>
                                <option>18</option>
                                <option>19</option>
                                <option>20</option>
                                <option>21</option>
                                <option>22</option>
                                <option>23</option>
                                <option>24</option>
                            </select>
                        	<span class="left">시</span>
                            <select>
                                <option>00</option>
                                <option>05</option>
                                <option>10</option>
                                <option>15</option>
                                <option>20</option>
                                <option>25</option>
                                <option>30</option>
                                <option>35</option>
                                <option>40</option>
                                <option>45</option>
                                <option>50</option>
                                <option>55</option>
                            </select>
                        	<span class="left">분</span></td>
                    </tr>
                    <tr>
                        <td colspan="15"><button class="btn">요일별 설정</button></td>
                    </tr>
                    <tr class="line">
                        <th>휴게 시간</th>
                        <td colspan="15" class="padding">
                            <select>
                                <option>01</option>
                                <option>02</option>
                                <option>03</option>
                                <option>04</option>
                                <option>05</option>
                                <option>06</option>
                                <option>07</option>
                                <option>08</option>
                                <option>09</option>
                                <option>10</option>
                                <option>11</option>
                                <option>12</option>
                                <option>13</option>
                                <option>14</option>
                                <option>15</option>
                                <option>16</option>
                                <option>17</option>
                                <option>18</option>
                                <option>19</option>
                                <option>20</option>
                                <option>21</option>
                                <option>22</option>
                                <option>23</option>
                                <option>24</option>
                            </select>
                        	<span class="left">시</span>
                            <select>
                                <option>00</option>
                                <option>05</option>
                                <option>10</option>
                                <option>15</option>
                                <option>20</option>
                                <option>25</option>
                                <option>30</option>
                                <option>35</option>
                                <option>40</option>
                                <option>45</option>
                                <option>50</option>
                                <option>55</option>
                            </select>
                        	<span>분 ~ </span>
                            <select>
                                <option>01</option>
                                <option>02</option>
                                <option>03</option>
                                <option>04</option>
                                <option>05</option>
                                <option>06</option>
                                <option>07</option>
                                <option>08</option>
                                <option>09</option>
                                <option>10</option>
                                <option>11</option>
                                <option>12</option>
                                <option>13</option>
                                <option>14</option>
                                <option>15</option>
                                <option>16</option>
                                <option>17</option>
                                <option>18</option>
                                <option>19</option>
                                <option>20</option>
                                <option>21</option>
                                <option>22</option>
                                <option>23</option>
                                <option>24</option>
                            </select>
                        	<span class="left">시</span>
                            <select>
                                <option>00</option>
                                <option>05</option>
                                <option>10</option>
                                <option>15</option>
                                <option>20</option>
                                <option>25</option>
                                <option>30</option>
                                <option>35</option>
                                <option>40</option>
                                <option>45</option>
                                <option>50</option>
                                <option>55</option>
                            </select>
                        	<span class="left">분</span> 
                        	<input type="text" placeholder="기본휴게시간">
                        	<button class="addBtn">추가하기</button></td>
                    </tr>
                    <tr>
                        <td colspan="16"><button class="saveBtn">저장</button></td>
                    </tr>
                </table>
                </form>
            </div>
            <br>
            <div>
            	<form action="">
                <label class="middleName">근무상태 관리</label>
                <table id="managerTable" class="middleTable">
                	<tr>
                		<th>근무상태</th>
                		<th>근무 시간 포함 여부</th>
                		<th>수정 및 삭제</th>
                	</tr>
                	<tr>
                		<td>업무</td>
                		<td>포함</td>
                		<td><button class="btn">수정</button>/<button class="btn">삭제</button></td>
                	</tr>
                	<tr>
                		<td>외출</td>
                		<td>미포함</td>
                		<td><button class="btn">수정</button>/<button class="btn">삭제</button></td>
                	</tr>
                	<tr>
                		<td>외근</td>
                		<td>포함</td>
                		<td><button class="btn">수정</button>/<button class="btn">삭제</button></td>
                	</tr>
                	<tr>
                		<td>출장</td>
                		<td>포함</td>
                		<td><button class="btn">수정</button>/<button class="btn">삭제</button></td>
                	</tr>
                	<tr>
                		<td>훈련/교육</td>
                		<td>포함</td>
                		<td><button class="btn">수정</button>/<button class="btn">삭제</button></td>
                	</tr>
                	<tr>
                		<td>휴식</td>
                		<td>미포함</td>
                		<td><button class="btn">수정</button>/<button class="btn">삭제</button></td>
                	</tr>
                	<tr>
                		<td>추가근무</td>
                		<td>포함</td>
                		<td><button class="btn">수정</button>/<button class="btn">삭제</button></td>
                	</tr>
                </table>
                <button class="saveBtn">저장</button><button class="saveBtn">추가</button>
            	</form>
            </div>
        </div>
    </section>
</body>
</html>