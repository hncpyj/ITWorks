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
        margin-left: 75%;
    }

    #asideBack ul li:first-child {
        font-weight: bold;
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
    label {
        font-size: 13px;
    }
    button, input[type="submit"] {
        cursor: pointer;
    }
    span {
    	color: red;
    	margin-left: 5px;
    }
    
        #personList {
    	border-collapse: collapse;
    }
    #personList tr:hover {
    	background: rgba(0, 71, 113, 0.2);
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
    #selectArea {
    	 border-radius: 7px; 
    	 background: rgb(242, 242, 242); 
    	 width: 325px; 
    	 height: 45px; 
    	 margin: auto; 
    	 text-align: left;
    	 overflow: auto;
    }
    .selectedMember>img {
    	width: 10px; 
    	height: 10px; 
    	margin-right: 7px; 
    	margin-left: 10px;
    }
    .selectedMember>img:hover {
    	cursor: pointer;
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
                <span>프로젝트 업무 등록</span>
                <hr style="width: 95%; margin-top: 10px; color: #929292;">
            </div>
        </article>
        <!--메뉴 타이틀 종료-->

        <!--프로젝트 정보 입력 폼-->
        <article>
            <form action="insertTask.pm" method="post" enctype="multipart/form-data" onsubmit="return checkNull();">
                <table>
                    <tr>
                        <th>
                        	업무명<span>*</span>
                        	<input type="hidden" name="parentPjt" value="${ parentPno }">
                        	<input type="hidden" name="plevel" value="1">
                        	<input type="hidden" name="corpNo" value="${ loginUser.corpNo }">
                        </th>
                        <td colspan="3"><input type="text" name="pname" style="width: 528px;"></td>
                        <th>작성자</th>
                        <td><input type="text" name="pwriter" value="${ loginUser.ename }" readonly="readonly" style="border: none; box-shadow: none;"></td>
                    </tr>
                    <tr>
                        <th>담당자<span>*</span></th>
                        <td colspan="3">
                            <input type="text" style="width: 300px;" name="charge" readonly="readonly"><input type="hidden" name="chargeMno" value="">
                            <button onclick="searchPerson(0);" type="button" class="selectMemberBtn">조회</button>
                        </td>
                        <th>상태</th>
                        <td>
                            <select name="pprogress" id="pprogress" style="width: 192px;">
                                <option value="예정">예정</option>
                                <option value="진행">진행</option>
                                <option value="완료">완료</option>
                                <option value="보류">보류</option>
                                <option value="폐기">폐기</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>계획 시작일<span>*</span></th>
                        <td><input type="date" name="pstartDate"></td>
                        <th>계획 종료일<span>*</span></th>
                        <td><input type="date" name="pendDate"></td>
                        <th>실제 종료일</th>
                        <td><input type="date" name="actualEndDate"></td>
                    </tr>
                    <tr>
                        <th>업무 개요</th>
                        <td colspan="5"><input type="text" style="width: 850px;" name="psummary"></td>
                    </tr>
                    <tr>
                        <th>특이사항</th>
                        <td colspan="5">
                            <input id="issue" name="uniqueness" value="이슈발생" type="checkbox">&nbsp;&nbsp;<label for="issue">이슈 발생</label>&nbsp;&nbsp;&nbsp;&nbsp;
                            <input id="urgent" name="uniqueness" value="긴급" type="checkbox">&nbsp;&nbsp;<label for="urgent">긴급</label>
                        </td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td colspan="6">
                            <input multiple="multiple" type="file" id="files" name="files" style="width: 480px; border: none; box-shadow: none; margin-top: 5px;">
                            <div id="selectedFileList" style="width: 843px; height: 80px;border: 1px solid #929292; margin: auto; margin-top: 5px; margin-bottom: 5px; padding: 5px; font-size: 12px; overflow: auto;">
                            
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td colspan="5"><textarea name="pcontent" id="pcontent" cols="119" rows="15" style="resize: none; margin-top: 5px;"></textarea></td>
                    </tr>
                </table>
                <input type="submit" value="등록">
            </form>
        </article>
        
        <!-- 직원선택창 -->
            <div class="searchModal searchPerson">
            	<div class="onclickBackground" onclick="closeSearchPerson();"></div>
            	<div class="searchBox" align="center" style="width: 400px; height: 500px;">
            		<div style="background: #004771; border-top-left-radius: 5px; border-top-right-radius: 5px; height: 35px; margin: 0; width: 400px; display: table-cell; vertical-align: middle;">
            			<span style="color: white; padding-left: 15px; margin-top: 15px; font-size: 14px;">검색</span>
            			<button onclick="closeSearchPerson();" style="background: white; color: black; width: 20px; height: 20px; border: none; border-radius: 5px; margin-left: 323px; font-weight: bold;">X</button>
            		</div>
            		<div align="center" style="margin-top: 10px; margin-bottom: 15px;">
	            		<input type="text" name="searchName" style="width: 250px; border: 1px solid #929292; margin-left: 5px;" placeholder="검색하고자 하는 이름을 입력하세요.">
	            		<button type="button" style="width: 50px; height: 25px; border-radius: 7px; background: #004771; border: nond; color: white; margin-left: 5px; font-size: 13px; border: none;">검색</button>
            		</div>
            		<div id="selectArea"></div>
            		<div style="width: 325px; height: 290px; border: 1px solid #929292; margin-top: 15px; overflow: auto;" align="center">
            			<table style="width: 100%; font-size: 13px; text-align: center;" id="personList">
            				<c:forEach var="p" items="${ allMemberDept.allMember }">
	            				<c:if test="${ !empty p }">
		            				<tr>
		            					<td><div style="display: inline-block; width: 38px; height: 38px; border-radius: 50%; background: gray; margin-top: 5px;"></div></td>
		            					<td style="padding-left: 10px; width: 80px;"><c:out value="${ p.ename }"/></td>
		            					<td><c:out value="${ p.jname }"/></td>
		            					<td style="color: #929292; width: 100px;"><c:out value="${ p.dname }"/></td>
		            					<td><button class="selectPersonBtn" onclick="goSelectArea(${ p.mno }, '${ p.ename }');">선택</button></td>
		            				</tr>
		            			</c:if>
            				</c:forEach>
            			</table>
            		</div>
            		<button class="selectBtn" onclick="selectPerson();">선택 완료</button>
            	</div>
            </div>
            <!-- 직원 선택창 끝 -->
    </section>

    <script>
        $(function() {
        	console.log($("input[name='parentPno']").val());
        })
        
        //파일 업로드 시  div에 파일명 출력
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
        })
        
        //직원선택 모달창 열기
        function searchPerson(index) {
			tdNum = index;
			
        	$(".selectedMember").remove();
        	jQuery('.searchPerson').fadeIn('slow');
        }
        
        //직원선택 모달창 닫기
        function closeSearchPerson() {
        	jQuery('.searchPerson').fadeOut('slow');
        }
        
      //선택 버튼 누르면 검색창 아래 DIV에 이름 뜨게 하는 코드
        function goSelectArea(mno, ename) {
        	var mno = mno;
        	var ename = ename;
        	
        	console.log(mno + ', ' + ename);
        	
        	if($(".selectedMember").length == 0) {
        		$("#selectArea").wrapInner("<div class='selectedMember'>" + ename + 
        			"<img src='${contextPath}/resources/projectManageImages/closeBtn4.png' onclick='removeMember(this);'><input type='hidden' name='tempMno' value='" + mno +"'></div>");
        	} else {
        		if(tdNum == 0) {
        			alert("담당자는 1명만 선택 가능합니다.");
        			return;
        		} else {
	        		$(".selectedMember:last-child").after("<div class='selectedMember'>" + ename +
	        			"<img src='${contextPath}/resources/projectManageImages/closeBtn4.png' onclick='removeMember(this);'><input type='hidden' name='tempMno' value='" + mno +"'></div>");
        		}
        	}
        	
        	mnoArr = "";
    		for(var i = 0; i < $("input[name=tempMno]").length; i++) {
    			mnoArr += $("input[name=tempMno]")[i].value;
    			if(i < $("input[name=tempMno]").length - 1) {
    					mnoArr += ", ";
    			}
    		}	
        }
        
        //선택된 직원 x 누르면 지우는 코드
        function removeMember(selectedMember) {
        	var selectedMember = selectedMember;
        	$(selectedMember).parent().remove();
        }
        
        //선택된 직원 정보 input 태그 value 값으로 지정하는 코드
        function selectPerson() {
        	console.log(mnoArr);
        	var names = '';
        	
        	for(var i = 0; i < $(".selectedMember").length; i++) {
        		names += $(".selectedMember").eq(i).text();
        		if(i != $(".selectedMember").length - 1) {
        			names += ", ";
        		}
        	}
        	
        	if(tdNum == 0) {
	        	$("input[name='charge']").val(names);
	        	$("input[name='chargeMno']").val(mnoArr);
	        	console.log("담당mnoArr : " + mnoArr);
	        	mnoArr = "";
	        	console.log("담당자 : " + $("input[name='chargeMno']").val());
        	} else if(tdNum == 1) {
        		$("input[name='participant']").val(names);
        		$("input[name='participantMno']").val(mnoArr);
        		console.log("참여mnoArr : " + mnoArr);
        		mnoArr = "";
	        	console.log("초기화 후 : " + mnoArr);
	        	console.log("참여자 : " + $("input[name='participantMno']").val());
        	} else {
        		$("input[name='perusal']").val(names);
        		$("input[name='perusalMno']").val(mnoArr);
        		console.log("열람mnoArr : " + mnoArr);
        		mnoArr = "";
	        	console.log("열람권한 : " + $("input[name='perusalMno']").val());
        	}

        	jQuery('.searchPerson').fadeOut('slow');
        	
        }
        
        function checkNull() {
        	var pname = $("input[name='pname']").val();
        	var charge = $("input[name='charge']").val();
        	var pstartDate = $("input[name='pstartDate']").val();
        	var pendDate = $("input[name='pendDate']").val();
        	
        	if(!pname) {
        		alert("업무명을 입력 해 주세요.");
        		$("input[name='pname']").focus();
        		return false;
        	} else if(!charge) {
        		alert("담당자를 등록 해 주세요.");
        		$("input[name='charge']").focus();
        		return false;
        	} else if(!pstartDate) {
        		alert("계획시작일을 입력 해 주세요.");
        		return false;
        	} else if(!pendDate) {
        		alert("계획종료일을 입력 해 주세요.");
        		return false;
        	} else if(pstartDate > pendDate) {
        		alert("계획종료일은 계획시작일보다 빠를 수 없습니다.");
        		return false;
        	} else {
        		return true;
        	}
        }
    </script>
</body>
</html>