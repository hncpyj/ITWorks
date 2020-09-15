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
    #modifyInfoTable td {
    	border-bottom: none;
    	text-align: left;
    }
    #deptList>tr:hover {
    	background: rgba(0, 71, 113, 0.2);
    	cursor: pointer;
    }
    .searchModal {
     	position: fixed; 
     	left: 0; 
     	top: 0; 
     	width: 100%; 
     	height: 100%; 
     	z-index: 1000; 
     	display: none;
    }
    .onclickBackground {
    	 position: absolute; 
    	 width: 100%; 
    	 height: 100%; 
    	 background: black; 
    	 filter: alpha(opacity=60); 
    	 opacity: .6;
    }
    .searchBox {
    	position: relative; 
    	top: 20%; 
    	background: white; 
    	margin: auto; 
    	border-radius: 5px; 
    	border: 1px solid #929292; 
    	filter: none; 
    	opacity: 100;
    }
    .selectBtn {
    	 width: 100px; 
    	 height: 30px; 
    	 border-radius: 7px; 
    	 background: #004771; 
    	 color: white; 
    	 margin-top: 15px; 
    	 border: none;"
    }
    .selectPersonBtn {
    	 background: lightgray; 
    	 border: none; 
    	 border-radius: 7px; 
    	 width: 45px; 
    	 height: 25px;
    }
    .selectedMember {
    	 font-size: 13px; 
    	 width: 80px; 
    	 height: 25px; 
    	 background: #0095ED; 
    	 color: white;
    	 border-radius: 10px;
    	 margin-left: 10px;
    	 border-spacing: 8px;
    	 text-align: right;
		 min-width: 90px;
		 float: left;
		 line-height: 25px;
		 margin-top: 8px;
    }

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
                <span>가입대기 직원 리스트</span>
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
                    <option value="phone">전화번호</option>
                    <option value="email">이메일</option>
                </select>
                <input type="search" name="searchMember" placeholder="검색할 내용을 입력하세요.">
                <input type="submit" value="검색">
            </form>
        </article>
        <!-- 검색 영역 종료 -->

        <!-- 가입대기 직원 리스트  -->
        <article>
            <table>
                <tr>
                    <th width="30px">아이디</th>
                    <th width="60px">이름</th>
                    <th width="60px">전화번호</th>
                    <th width="50px">이메일</th>
                    <th width="100px">관리</th>
                </tr>
                
                <c:forEach var="mm" items="${ requestScope.list }" varStatus="status">
                
	                <tr>
	                    <td><c:out value="${ mm.eid }"/></td>
	                    <td><c:out value="${ mm.ename }"/></td>
	                    <td><c:out value="${ mm.phone }"/></td>
	                    <td><c:out value="${ mm.email }"/></td>
	                    <td>
							<button class="memberManageBtns" onclick="signUpApproval('${mm.mno}')">승   인</button>
							<button class="memberManageBtns" onclick="showUpdateJoinList('${mm.eno}', '${ mm.hireDate }', ${ mm.corpNo }, '${ mm.eid }', '${ mm.phone }', '${ mm.email }', '${ mm.address }', '${ mm.birthday }', '${ mm.ename }', ${ mm.mno })">수   정</button>
							<button class="memberManageBtns">삭   제</button>
	                    </td>
	                </tr>
                </c:forEach>
            </table>
        </article>
        <!-- 가입대기 직원 리스트  종료 -->
        
        <!-- 수정버튼 개인정보 수정 모달창 -->
		<div class="updateJoinList" style="position: fixed; left: 0; top: 0; width: 100%; height: 100%; z-index: 1000; display: none;">
				<div class="onclickBackground" style="position: absolute; width: 100%; height: 100%; background: black; filter: alpha(opacity=60); opacity: .6;"></div>
				<div class="modal" style="position: relative; top: 3%; width: 670px; height: 670px; background: white; margin: auto; border-radius: 5px; border: 1px solid #929292; filter: none; opacity: 100;">
    			   	<div id="Mainform" style="width: 670px; height: 650px; margin: 0 auto; overflow: auto;">
    			    	<div id="MainText1" style="width: 120px; height: 40px; color: #004771; font-size: 14px; font-weight: bold;
        					margin-left: 30px; margin-top: 10px;">개인정보</div>
	    
	            <form action="modifyMemberInfo.mm" method="post" enctype="multipart/form-data" onsubmit="return checkNull();">
	                 <table id="modifyInfoTable" style="border-collapse: collapse; border-spacing: 0 5px; margin: auto;">
	                 	<tr>
	                        <td class="label" style="width: 150px; font-size: 12px; font-weight: bold;">
								프로필 이미지
	                        </td>
	                    	<td>
	                    		<span><input multiple="multiple" type="file" name="file" id="file" style="border: none;"></span>
	                    	</td>
	                    </tr>
	                 	<tr>
	                        <td class="label" style="width: 150px; font-size: 12px; font-weight: bold;">
	                        <input type="hidden" name="mno" value="">
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
	                            <span><input type="date" name="hireDate" id="hireDate" style="border: 0.5px solid black;"></span>
	                        </td>
	                    </tr>
	                 	<tr>
	                        <td class="label" style="width: 150px; font-size: 12px; font-weight: bold;">
	                                 	 회사코드
	                        </td> 
	                        <td>
	                           <span><input type="text" readonly="readonly" style="width:100px; border: none;" name="corpNo" id="corpNo"></span>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="label" style="width: 150px; font-size: 12px; font-weight: bold;">
	                                 	 아이디
	                        </td> 
	                        <td>
	                           <span><input type="text" style="width:100px; border: 0.5px solid black; border: none;" readonly="readonly" name="eid" id="eid"></span>
	                           <!-- 정규표현식 : 사용 가능한 아이디 형식입니다. / 사용할 수 없는 아이디 형식입니다. 
	                           		중복확인 : 이미 사용중인 아이디입니다. / 사용할 수 있는 아이디입니다.-->
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="label" style="width: 150px; font-size: 12px; font-weight: bold;">
								이름<strong style="color: red;">*</strong>
	                        </td>
	                        <td>
	                            <span><input type="text" name="ename" id="ename" style="border: 0.5px solid black;"></span>
	                        </td>
	                    </tr>
	                    <!-- <tr>
	                        <td class="label" style="width: 150px; font-size: 12px; font-weight: bold;">
	                           	      비밀번호<strong style="color: red;">*</strong>
	                        </td>
	                        <td>
	                            <span><input type="password" name="epwd" id="epwd" style="border: 0.5px solid black;"></span>
	                            정규표현식 : 사용 가능한 비밀번호 형식입니다. / 사용할 수 없는 비밀번호 형식입니다.
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
	                            비밀번호가 일치하지 않습니다 / 비밀번호가 일치합니다.
	                            <span id="pwdEqual"></span>
	                        </td>
	                    </tr> -->
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
	                            <span><input type="text" name="email" id="email" style="border: 0.5px solid black;"></span>
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
	                       <td style="padding-left: 10px;">
	                       		<span><input type="text" style="width:300px; border: 0.5px solid black;" readonly id="address1"></span>
	                       </td>
	                    </tr>
	                    <tr>
	                       <td style="padding-left: 10px;">
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
	                    <tr>
	                    	<td colspan="2">
	                    		<div id="MainText1" style="width: 120px; height: 30px; color: #004771; font-size: 14px; font-weight: bold;
        					 margin-top: 20px;">부서정보</div>
	                    	</td>
	                    </tr>
	                    <tr>
	                        <td class="label" style="width: 150px; font-size: 12px; font-weight: bold;">
	                        	 부서<strong style="color: red;">*</strong>
	                        	 <input type="hidden" name="did" value="">
	                        </td>
	                        <td>
	                            <span><input type="text" name="dname" id="dname" style="border: 0.5px solid black;"></span><button style="margin-left: 5px;" onclick="searchDept();" class="selectMemberBtn" type="button">조회</button>
	                           
	                        </td>
	                    </tr>
	                    
	                    <tr>
	                        <td class="label" style="width: 150px; font-size: 12px; font-weight: bold;">
	                        	 직급<strong style="color: red;">*</strong>
	                        </td>
	                        <td>
	                        	<input type="hidden" name="jid" id="jid">
	                            <span><input type="text" name="jname" id="jname" style="border: 0.5px solid black;"></span><button style="margin-left: 5px;" onclick="searchJob();" class="selectMemberBtn" type="button">조회</button>
	                        </td>
	                    </tr>
	                </table>
	                

	               
	               <div align="center" style="margin-top: 20px; ">
	                  <input type="submit" value="신청" style="background: #29A2F7; margin-right:10px; width: 50px; height: 25px; color: white; font-size: 13px; border: none; cursor: pointer;">
	                  <input type="button" value="취소" style="background: #C4C4C4; width: 50px; height: 25px; color: white; font-size: 13px; border: none; cursor: pointer;"
	                  	onclick="closeUpdateJoinList();">
	               </div>   
	            </form>  
	  
	    		<!-- 부서 선택창 -->
	            <div class="searchModal searchDept">
	            	<div class="onclickBackground" onclick="closeSearchDept();"></div>
	            	<div class="searchBox" align="center" style="width: 300px; height: 400px;">
	            		<div style="background: #004771; border-top-left-radius: 5px; border-top-right-radius: 5px; height: 35px; margin: 0; width: 300px; display: table-cell; vertical-align: middle;">
	            			<span style="color: white; padding-left: 15px; margin-top: 15px; font-size: 14px;">검색</span>
	            			<button onclick="closeSearchDept();" type="button" style="background: white; color: black; width: 20px; height: 20px; border: none; border-radius: 5px; margin-left: 220px; font-weight: bold;">X</button>
	            		</div>
	            		<div align="center" style="margin-top: 10px;">
		            		<form action="searchPerson.pm">
		            			<input type="text" name="searchName" style="width: 150px; border: 1px solid #929292; margin-left: 5px;" placeholder="검색어를 입력하세요.">
		            			<button type="button" style="width: 50px; height: 25px; border-radius: 7px; background: #004771; border: nond; color: white; margin-left: 5px; font-size: 13px; border: none;">검색</button>
		            		</form>
	            		</div>
	            		<div style="width: 230px; height: 280px; border: 1px solid #929292; margin-top: 15px; overflow: auto;" align="center">
	            			<table style="width: 100%; font-size: 13px;" id="deptList">
	            				<c:forEach var="p" items="${ allDeptList }">
		            				<c:if test="${ !empty p }">
			            				<tr style="cursor: pointer;" onclick="selectDept(${ p.DID }, '${ p.DNAME }');">
			            					<td style="border: none;"><img src="${ contextPath }/resources/projectManageImages/deptIcon.png" style="height: 20px; float: left; padding-left: 15px; margin-right: 10px;">
			            					<c:out value="${ p.DNAME }"/></td>
			            				</tr>
			            			</c:if>
			            			<c:if test="${ empty p }">
			            				<tr>
			            					<td style="text-align: center; color: #929292; font-size: 13px;">표시할 내용이 없습니다.</td>
			            				</tr>
			            			</c:if>
	            				</c:forEach>
	            			</table>
	            		</div>
	            	</div>
	            </div>
	            <!-- 부서선택창 끝 -->	   	
	            
	            <!-- 직급선택 선택창 -->
	            <div class="searchModal searchJob">
	            	<div class="onclickBackground" onclick="closeSearchJob();"></div>
	            	<div class="searchBox" align="center" style="width: 300px; height: 400px;">
	            		<div style="background: #004771; border-top-left-radius: 5px; border-top-right-radius: 5px; height: 35px; margin: 0; width: 300px; display: table-cell; vertical-align: middle;">
	            			<span style="color: white; padding-left: 15px; margin-top: 15px; font-size: 14px;">검색</span>
	            			<button onclick="closeSearchJob();" type="button" style="background: white; color: black; width: 20px; height: 20px; border: none; border-radius: 5px; margin-left: 220px; font-weight: bold;">X</button>
	            		</div>
	            		<div align="center" style="margin-top: 10px;">
		            		<form action="searchPerson.pm">
		            			<input type="text" name="searchName" style="width: 150px; border: 1px solid #929292; margin-left: 5px;" placeholder="검색어를 입력하세요.">
		            			<button type="button" style="width: 50px; height: 25px; border-radius: 7px; background: #004771; border: nond; color: white; margin-left: 5px; font-size: 13px; border: none;">검색</button>
		            		</form>
	            		</div>
	            		<div style="width: 230px; height: 280px; border: 1px solid #929292; margin-top: 15px; overflow: auto;" align="center">
	            			<table style="width: 100%; font-size: 13px;" id="jobList">
	            				<c:forEach var="j" items="${ allJobList }">
		            				<c:if test="${ !empty j }">
			            				<tr style="cursor: pointer;" onclick="selectJob(${ j.JID }, '${ j.JNAME }');">
			            					<td style="border: none;"><img src="${ contextPath }/resources/projectManageImages/deptIcon.png" style="height: 20px; float: left; padding-left: 15px; margin-right: 10px;">
			            					<c:out value="${ j.JNAME }"/></td>
			            				</tr>
			            			</c:if>
			            			<c:if test="${ empty j }">
			            				<tr>
			            					<td style="text-align: center; color: #929292; font-size: 13px;">표시할 내용이 없습니다.</td>
			            				</tr>
			            			</c:if>
	            				</c:forEach>
	            			</table>
	            		</div>
	            	</div>
	            </div>
	            <!-- 직급선택창 끝 -->	   	
	        
	     		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>		          
				<script>
				$("#year").change(function() {
					$("input[name='birthday']").val($("#year").val()+"/"+$("#month").val()+"/"+$("#day").val());
					console.log($("input[name='birthday']").val());
				});
				$("#month").change(function() {
					$("input[name='birthday']").val($("#year").val()+"/"+$("#month").val()+"/"+$("#day").val());
					console.log($("input[name='birthday']").val());
				});
				$("#day").change(function() {
					$("input[name='birthday']").val($("#year").val()+"/"+$("#month").val()+"/"+$("#day").val());
					console.log($("input[name='birthday']").val());
				});
				
				function checkNull() {
		        	var eno = $("input[name='eno']").val();
		        	var hireDate = $("input[name='hireDate']").val();
		        	var ename = $("input[name='ename']").val();
		        	var phone = $("input[name='phone']").val();
		        	var email = $("input[name='email']").val();
		        	var dname = $("input[name='dname']").val();
		        	var jname = $("input[name='jname']").val();
		        	
		        	if(!eno) {
		        		alert("사번을 입력 해 주세요.");
		        		$("input[name='eno']").focus();
		        		return false;
		        	} else if(!hireDate) {
		        		alert("입사일을 입력 해 주세요.");
		        		$("input[name='hireDate']").focus();
		        		return false;
		        	} else if(!ename) {
		        		alert("이름을 입력 해 주세요.");
		        		return false;
		        	} else if(!phone) {
		        		alert("휴대전화 번호를 입력 해 주세요.");
		        		return false;
		        	} else if(!email) {
		        		alert("이메일을 입력 해 주세요.");
		        		return false;
		        	} else if(!dname) {
		        		alert("부서를 입력 해 주세요.");
		        		return false;
		        	} else if(!jname) {
		        		alert("직급을 입력 해 주세요.");
		        		return false;
		        	} else {
		        		return true;
		        	}
		        }
				
				function selectJob(jid, jname) {
					console.log(jid + ", " + jname);
		        	
		        	$("input[name='jname']").val(jname);
		        	$("input[name='jid']").val(jid);
		        	console.log("직급명 : " + $("input[name=jname]").val());
		        	console.log("직급코드 : " + $("input[name=jid]").val());
		        	
		        	jQuery('.searchJob').fadeOut('slow');
				}
				
				function searchJob() {
		        	jQuery('.searchJob').fadeIn('slow');
		        }
		        
		        function closeSearchJob() {
		        	jQuery('.searchJob').fadeOut('slow');
		        }
				

				function selectDept(did, dname) {
		        	console.log(did + ", " + dname);
		        	
		        	$("input[name='dname']").val(dname);
		        	$("input[name='did']").val(did);
		        	console.log("담당부서명 : " + $("input[name=dname]").val());
		        	console.log("담당부서코드 : " + $("input[name=did]").val());
		        	
		        	jQuery('.searchDept').fadeOut('slow');
		        }
				
				function searchDept() {
		        	jQuery('.searchDept').fadeIn('slow');
		        }
		        
		        function closeSearchDept() {
		        	jQuery('.searchDept').fadeOut('slow');
		        }
		        
		        
				
				function signUpApproval(mno) {
					
					$.ajax({
						url: "signUpApproval.mm",
						data: {mno: mno},
						type: "post",
						success: function(signUpResult) {
							window.alert('해당 직원의 가입이 승인되었습니다.');
							location.reload();

						},
						error: function(date) {
							console.log("실패");
						}
					});
					
				}
				
				function showUpdateJoinList(eno, hireDate, corpNo, eid, phone, email, address, birthday, ename, mno) {
					jQuery('.updateJoinList').fadeIn('slow');
					
					$("input[name='corpNo']").val(corpNo);
					$("input[name='mno']").val(mno);
					$("input[name='eno']").val(eno);
					$("input[name='hireDate']").val(hireDate.replaceAll('/', '-'));
					$("input[name='eid']").val(eid);
					$("input[name='phone']").val(phone);
					$("input[name='email']").val(email);
					$("input[name='ename']").val(ename);
					$("input[name='address']").val(address);

					var addressArr = address.split('$$$');
					for(var i = 0; i < addressArr.length; i++) {
						switch(i) {
							case 0 : $("#zipcode").val(addressArr[i]); break;
							case 1 : $("#address1").val(addressArr[i]); break;
							case 2 : $("#address2").val(addressArr[i]); break;
						}
					}
					
					$("input[name='address']").val($("#zipcode").val() + "$$$" + $("#address1").val() + "$$$" + $("#address2").val());

					var birthdayArr = birthday.split('/');
					for(var i = 0; i < birthdayArr.length; i++) {
						console.log(birthdayArr[i]);
						console.log(i);
						switch(i) {
							case 0 : $("#year").val(birthdayArr[i]); break;
							case 1 : $("#month").val(birthdayArr[i]); break;
							case 2 : $("#day").val(birthdayArr[i]); break;
						}
					}
					
					$("input[name='birthday']").val($("#year").val()+"/"+$("#month").val()+"/"+$("#day").val());
					
				}
					
				function closeUpdateJoinList() {
					jQuery('.updateJoinList').fadeOut('slow');
				} 
				
				function searchPostcode() {
			        new daum.Postcode({
			            oncomplete: function(data) {
			                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
			                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                var roadAddr = data.roadAddress; // 도로명 주소 변수
			                var extraRoadAddr = ""; // 참고 항목 변수

			                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			                if(data.bname !== "" && /[동|로|가]$/g.test(data.bname)){
			                    extraRoadAddr += data.bname;
			                }
			                
			                // 건물명이 있고, 공동주택일 경우 추가한다.
			                if(data.buildingName !== "" && data.apartment === "Y"){
			                   extraRoadAddr += (extraRoadAddr !== "" ? ", " + data.buildingName : data.buildingName);
			                }
			                
			                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			                if(extraRoadAddr !== ""){
			                    extraRoadAddr = " (" + extraRoadAddr + ")";
			                }

			                // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                document.getElementById("zipcode").value = data.zonecode;
			                document.getElementById("address1").value = roadAddr;
			                
							$("#zipcode").change(function() {
						        var address = $("#zipcode").val() + "$$$" + $("#address1").val() + "$$$" + $("#address2").val();
						        $("#address").val(address);
							});
							$("#address2").change(function() {
						        var address = $("#zipcode").val() + "$$$" + $("#address1").val() + "$$$" + $("#address2").val();
						        $("#address").val(address);
							});
			            }
			        }).open();
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