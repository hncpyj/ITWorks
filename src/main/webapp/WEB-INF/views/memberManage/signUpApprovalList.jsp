<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITWorks!</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="icon" href="${contextPath}/resources/images/favicon.ico" type="image/x-icon">
<style>
	@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css); font-family: 'Noto Sans KR', sans-serif;

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
    /* #asideBack ul li:last-child {
        font-weight: bold;
    } */

    button {
        cursor: pointer;
    }
    /*메뉴 타이틀 관련 css 설정 종료*/

    /* 검색 영역 */
    article:nth-child(2) {
        margin-top: 20px;
        text-align: right;
        font-size: 13px;
        margin-right: 50px;
    }
    article:nth-child(2)>form>select {
        width: 80px;
        border: 1px solid #929292;
        border-radius: 3px 3px 3px 3px;
    }
    article:nth-child(2)>form>input[type="search"] {
        width: 250px;
        border: 1px solid #929292;
        border-radius: 3px 3px 3px 3px;
        margin-left: 10px;
    }
    article:nth-child(2)>form>input[type="submit"] {
        width: 60px;
        height: 25px;
        background: #004771;
        border: none;
        border-radius: 3px 3px 3px 3px;
        color: white;
        font-weight: 550;
        margin-left: 5px;
    }
    /* 검색 영역 종료 */

    /* 가입대기 직원 리스트 */
    article:nth-child(3) {
        margin-top: 40px;
    }
    article:nth-child(3)>table {
        width: 1030px;
        margin: auto;
        border-collapse: collapse;
        border-top: 2px solid #929292;
        border-bottom: 2px solid #929292;
        text-align: center;
    }
    th {
        font-size: 13px;
        background: #f4f4f4;
        height: 35px;
        border-bottom: 2px solid #929292;
    }
    td {
        font-size: 13px;
        background: white;
        height: 30px;
        border-bottom: 1px solid #929292;
    }
    tr>td:nth-child(2) {
        padding-left: 10px;
        text-align: center;
    }
    
    .memberManageBtns {
    	 width: 50px;
    	 height: 20px;
    	 background: #004871;
    	 color: white;
    	 font-size: 11px;
    	 text-align: center;
    	 margin: 5px;
    	 border: 0;
    	 
    }
    
    button, input[type="submit"] {
        cursor: pointer;
    }
    /* 가입대기 직원 리스트 종료 */

</style>
</head>
<body>
<!-- 수정버튼 눌렀을 때 사용자 마이페이지 수정창과 같은데 
	사번,입사일,부서,직급 4가지 항목 추가된 모달창 뜨게 하기 -->

	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<jsp:include page="memberManageAside.jsp"></jsp:include>
	
	<section>
        <!--메뉴 타이틀-->
        <article style="margin-top: 30px;">
            <div id="menuTitle">
                <span>가입된 직원 리스트</span>
                <hr style="width: 95%; margin-top: 10px; color: #929292;">
            </div>
        </article>
        <!--메뉴 타이틀 종료-->

        <!-- 검색 영역 -->
        <article>
            <form action="searchMember.mm">
                <select id="searchCondition" name="searchCondition">
                    <option value="id">아이디</option>
                    <option value="name">이름</option>
                    <option value="dName">부서</option>
                    <option value="jName">직급</option>
                    <option value="phone">전화번호</option>
                    <option value="email">이메일</option>
                </select>
                <input type="search" name="searchMember" placeholder="검색할 내용을 입력하세요.">
                <input type="submit" value="검색">
            </form>
        </article>
        <!-- 검색 영역 종료 -->

        <!-- 가입된 직원 리스트  -->
        <article>
            <table>
                <tr>
                    <th width="30px">아이디</th>
                    <th width="60px">이름</th>
                    <th width="60px">부서</th>
                    <th width="60px">직급</th>
                    <th width="60px">전화번호</th>
                    <th width="50px">이메일</th>
                    <th width="100px">관리</th>
                </tr>
                
                <c:forEach var="mm" items="${ requestScope.list }" varStatus="status">
                
	                <tr>
	                    <td><c:out value="${ mm.eid }"/></td>
	                    <td><c:out value="${ mm.ename }"/></td>
	                    <td><c:out value="${ mm.dName }"/></td>
	                    <td><c:out value="${ mm.jName }"/></td>
	                    <td><c:out value="${ mm.phone }"/></td>
	                    <td><c:out value="${ mm.email }"/></td>
	                    <td>
							<button class="memberManageBtns" onclick="updateJoinList()">수   정</button>
							<button class="memberManageBtns">퇴   사</button>
	                    </td>
	                </tr>
                </c:forEach>
            </table>
        </article>
        <!-- 가입된 직원 리스트  종료 -->
        
        <!-- 수정버튼 개인정보 수정 모달창 -->
		<div class="updateJoinList" style="position: fixed; left: 0; top: 0; width: 100%; height: 100%; z-index: 1000; display: none;">
				<div class="onclickBackground" style="position: absolute; width: 100%; height: 100%; background: black; filter: alpha(opacity=60); opacity: .6;"></div>
				<div class="modal" style="position: relative; top: 3%; width: 670px; height: 670px; background: white; margin: auto; border-radius: 5px; border: 1px solid #929292; filter: none; opacity: 100;">
    			   	<div id="Mainform" style="width: 670px; height: 650px; margin: 0 auto; ">
    			    	<div id="MainText1" style="width: 120px; height: 20px; color: #004771; font-size: 14px; font-weight: bold;
        					margin-left: 30px; margin-top: 10px;">개인정보</div>
	    
	            <form action="insert.me" method="post">
	                 <table align="center" style="margin-top:30px; border-collapse: separate; border-spacing: 0 5px; ">
	                 	<tr>
	                        <td class="label" style="width: 150px; font-size: 12px; font-weight: bold;">
								프로필 이미지<strong style="color: red;">*</strong>
	                        </td>
	                        <td>
	                            <span><input type="text" name="" id="" style="border: 0.5px solid black;"></span>
	                            <span><input type="button" value="추가" style="background: #004771; margin-right:10px; width: 50px; height: 25px; color: white; font-size: 13px; border: none; cursor: pointer;"></span>
	                            <span><input type="button" value="삭제" style="background: #929292; width: 50px; height: 25px; color: white; font-size: 13px; border: none; cursor: pointer;"></span>
	                        </td>
	                    </tr>
	                 	<tr>
	                        <td class="label" style="width: 150px; font-size: 12px; font-weight: bold;">
								사번<strong style="color: red;">*</strong>
	                        </td>
	                        <td>
	                            <span><input type="text" name="eno" id="eno" style="border: 0.5px solid black;"></span>
	                        </td>
	                    </tr>
	                 	<tr>
	                        <td class="label" style="width: 150px; font-size: 12px; font-weight: bold;">
								입사일<strong style="color: red;">*</strong>
	                        </td>
	                        <td>
	                            <span><input type="text" name="hireDate" id="hireDate" style="border: 0.5px solid black;"></span>
	                        </td>
	                    </tr>
	                 	<tr>
	                        <td class="label" style="width: 150px; font-size: 12px; font-weight: bold;">
	                                 	 회사코드<strong style="color: red;">*</strong>
	                        </td> 
	                        <td>
	                           <span><input type="text" style="width:100px; border: 0.5px solid black;" name="corpNo" id="corpNo"></span>
	                           <span></span>
	                        </td>
	                    </tr>
	                    <tr>
	                       <td></td>
	                        <td style="color:#929292; font-size:9px;">회사코드를 정확히 입력하여 주십시오.<br>
	                          	잘못 기재하여 발생된 불이익은 작성자 본인의 책임이며 회사는 책임을 지지 않습니다.</td>
	                    </tr>
	                    <tr>
	                    	<td style="line-height: 200px;"></td>
	                    </tr>
	                    <tr>
	                        <td class="label" style="width: 150px; font-size: 12px; font-weight: bold;">
	                                 	 아이디<strong style="color: red;">*</strong>
	                        </td> 
	                        <td>
	                           <span><input type="text" style="width:100px; border: 0.5px solid black;" name="eid" id="eid"></span>
	                           <!-- 정규표현식 : 사용 가능한 아이디 형식입니다. / 사용할 수 없는 아이디 형식입니다. 
	                           		중복확인 : 이미 사용중인 아이디입니다. / 사용할 수 있는 아이디입니다.-->
	                           <span onclick="duplicationCheck();"><input type="button" value="중복확인" id="duplicationCheck" 
	                           	style="width:60px; height:25px; color: white; font-size:11px; border: none; background:#29A2F7; cursor: pointer; vertical-align:top; margin-left: 5px;"></span>
	                           <span id="idRegExp"></span>
	                        </td>
	                    </tr>
	                    <tr>
	                       <td></td>
	                        <td style="color:#929292; font-size:9px;">특수문자로 시작할 수 없으며, 4~20자리의 영문소문자, 숫자만 가능합니다.</td>
	                    </tr>
	                    <tr>
	                        <td class="label" style="width: 150px; font-size: 12px; font-weight: bold;">
								이름<strong style="color: red;">*</strong>
	                        </td>
	                        <td>
	                            <span><input type="text" name="ename" id="ename" style="border: 0.5px solid black;"></span>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="label" style="width: 150px; font-size: 12px; font-weight: bold;">
	                           	      비밀번호<strong style="color: red;">*</strong>
	                        </td>
	                        <td>
	                            <span><input type="password" name="epwd" id="epwd" style="border: 0.5px solid black;"></span>
	                            <!-- 정규표현식 : 사용 가능한 비밀번호 형식입니다. / 사용할 수 없는 비밀번호 형식입니다. -->
	                            <span id="pwdRegExp"></span>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td></td>
	                        <td style="color:#929292; font-size:9px;">10~16자의 영문소문자, 숫자를  조합하여 설정하세요.</td>
	                    </tr>
	                    <tr>
	                        <td class="label" style="width: 150px; font-size: 12px; font-weight: bold;">
	                              	    비밀번호 확인<strong style="color: red;">*</strong>
	                        </td>
	                        <td>
	                            <span><input type="password" id="pwdCheck" style="border: 0.5px solid black;"></span>
	                            <!-- 비밀번호가 일치하지 않습니다 / 비밀번호가 일치합니다. -->
	                            <span id="pwdEqual"></span>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="label" style="width: 150px; font-size: 12px; font-weight: bold;">
	                        	 휴대전화<strong style="color: red;">*</strong>
	                        </td>
	                        <td>
	                            <span><input type="text" name="phone" id="phone" placeholder="'-' 를 제외한 숫자만 입력" style="border: 0.5px solid black;"></span>
	                           
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="label" style="width: 150px; font-size: 12px; font-weight: bold;">
	                          	     개인 이메일<strong style="color: red;">*</strong>
	                        </td>
	                        <td>
	                            <span><input type="email" name="email" id="email" style="border: 0.5px solid black;"></span>
	                        </td>
	                    </tr>
	                    <tr>
	                       <td class="label" rowspan="3" style="width: 150px; font-size: 12px; font-weight: bold;">
	                           	       자택주소<strong style="color: red;">*</strong>
	                        </td>
	                        <!-- 우편번호, 주소1,2 3칸 합쳐서 자택주소 address -->
	                        <td>
	                        	<input type="hidden" id="address" name="address">
	                            <span><input type="text" style="width:80px; border: 0.5px solid black;" readonly id="zipcode"></span>
	                            <span style="color:#004771; font-size: 10px; font-weight: bold; cursor: pointer" onclick="searchPostcode();">주소찾기</span>
	                        </td>
	                    </tr>
	                    <tr>
	                       <td>
	                       		<span><input type="text" style="width:300px; border: 0.5px solid black;" readonly id="address1"></span>
	                       </td>
	                    </tr>
	                    <tr>
	                       <td>
	                       		<span><input type="text" style="width:300px; border: 0.5px solid black;" id="address2"></span>
	                       </td>
	                    </tr>
	                    <tr>
	                       <td class="label" style="width: 150px; font-size: 12px; font-weight: bold;">
	                         	    생년월일<strong style="color: red;">*</strong>
	                       </td>
	                       <!--년,월,일 3칸 합쳐서 생년월일 birthday -->
	                       <td>
	                          <span>
	                          	 <input type="hidden" name="birthday" id="birthday">
	                             <span style="font-size: 12px"><input type="text" style="width:60px; font-size: 12px; border: 0.5px solid black;" id="year"> 년</span>
	                             <span style="font-size: 12px"><input type="text" style="width:60px; font-size: 12px; border: 0.5px solid black;" id="month"> 월</span>
	                             <span style="font-size: 12px"><input type="text" style="width:60px; font-size: 12px; border: 0.5px solid black;" id="day"> 일</span>
	                          </span>   
	                       </td>
	                    </tr>
	                </table>
	                <div id="MainText1" style="width: 120px; height: 20px; color: #004771; font-size: 14px; font-weight: bold;
        					margin-left: 30px; margin-top: 10px;">부서정보</div>
        			<table>
        				<tr>
	                        <td class="label" style="width: 150px; font-size: 12px; font-weight: bold;">
	                        	 부서<strong style="color: red;">*</strong>
	                        </td>
	                        <td>
	                            <span><input type="text" name="dName" id="dName" style="border: 0.5px solid black;"></span>
	                           
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="label" style="width: 150px; font-size: 12px; font-weight: bold;">
	                        	 직급<strong style="color: red;">*</strong>
	                        </td>
	                        <td>
	                            <span><input type="text" name="jName" id="jName" style="border: 0.5px solid black;"></span>
	                           
	                        </td>
	                    </tr>
        			
        			</table>
	               
	               <div align="center" style="margin-top: 20px; ">
	                  <input type="submit" value="신청" style="background: #29A2F7; margin-right:10px; width: 50px; height: 25px; color: white; font-size: 13px; border: none; cursor: pointer;">
	                  <input type="button" value="취소" style="background: #C4C4C4; width: 50px; height: 25px; color: white; font-size: 13px; border: none; cursor: pointer;"
	                  	onClick="closeUpdateJoinList()">
	               </div>   
	            </form>  
	  
	    			   	
	        
	     				          
				<script>                         
				function updateJoinList() {
					jQuery('.updateJoinList').fadeIn('slow');
				}
					
				function closeUpdateJoinList() {
					jQuery('.updateJoinList').fadeOut('slow');
				} 
				
				</script>
        				
        				
    			   	</div>
    			</div>   	
    	</div>		   	
        	
        	
        
        <!-- 수정버튼 개인정보 수정 모달창 종료 -->
        
        
        <!-- 하단 페이징부분  시작-->
        <br><br><br><br>
        <div id="pagingArea" align="center">
         <c:if test="${ requestScope.pi.currentPage <= 1 }">
            [이전] &nbsp;
         </c:if>
         <c:if test="${ requestScope.pi.currentPage > 1 }">
            <c:url var="blistBack" value="waitingToJoinList.mm">
               <c:param name="currentPage" value="${ requestScope.pi.currentPage - 1 }"/>
            </c:url>
            <a href="${ blistBack }">[이전]</a> &nbsp;
         </c:if>
         
          <c:forEach var="p" begin="${ requestScope.pi.startPage }" end="${ requestScope.pi.endPage }">
             <c:if test="${ p eq requestScope.pi.currentPage }">
                <font color="#004771" size="4">[${ p }]</font>
             </c:if>
             <c:if test="${ p ne requestScope.pi.currentPage }">
                <c:url var="blistCheck" value="waitingToJoinList.mm">
                   <c:param name="currentPage" value="${ p }"/>
                </c:url>
                <a href="${ blistCheck }">${ p }</a>
             </c:if>
          </c:forEach>
          
          <c:if test="${ requestScope.pi.currentPage >= requestScope.pi.maxPage }">
            &nbsp; [다음]
         </c:if>
         <c:if test="${ requestScope.pi.currentPage < requestScope.pi.maxPage }">
            <c:url var="blistEnd" value="waitingToJoinList.mm">
               <c:param name="currentPage" value="${ requestScope.pi.currentPage + 1 }"/>
            </c:url>
            <a href="${ blistEnd }">[다음]</a>
         </c:if>
      </div>
      <!-- 하단 페이징부분 종료 -->
       
       
        
    </section>


</body>
</html>