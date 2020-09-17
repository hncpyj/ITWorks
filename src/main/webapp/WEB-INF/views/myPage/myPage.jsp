<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>                                                                                                                                                                                                              
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITWorks!</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	#menuTitle {
        width: 100%; 
        margin: 0 auto;
    }
    #menuTitle>span {
        font-size: 24px; 
        color: #004771; 
        padding-left: 90px; 
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
    
    th {
    	width: 130px;
    	height: 40px;
    	text-align: left;
    	font-size: 13px;
    }
    td {
    	font-size: 13px;
    }
    
    table {
    	width: 450px;
    	margin: auto;
    }
    
    span {
    	color: #004771;
    	font-size: 18px;
    	text-align: left;
    	font-weight: bold;
    }
    
    article:nth-child(2) span, article:nth-child(3) span {
		margin-left: 100px;
		font-size: 15px;
	}
	
	.profileBtn {
		margin-top: 65px;
		width: 65px;
		height: 30px;
		border: none;
		margin-left: 10px;
		cursor: pointer;
		box-shadow: 1px 1px 1px #929292;
	}
	.modifyBtn {
		cursor: pointer;
		width: 70px;
		height: 30px;
		border: none;
		box-shadow: 1px 1px 1px #929292;
	}
	.star {
		color: red;
		margin-left: 5px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<section>
		<article style="margin-top: 30px;">
			<div id="menuTitle">
				<span>마이페이지</span>
				<button type="button" style="width: 70px; height: 35px; background: #004771; color: white;" onclick="modifyUserInfo();">수정하기</button>
				<div style="margin-top: 10px;">
					<hr style="width: 90%; margin-top: 30px; margin: auto; color: #929292;">
				</div>
			</div>
		</article>	
		
		<article style="margin-top: 50px;">
			<div style="width: 750px; height: 800px; border: 1px solid #929292; margin: auto; box-shadow: 2px 2px 10px #929292;">
				<div style="margin-top: 30px;">
					<span>개인정보</span>
					<table>
						<tr>
							<th style="height: 200px;">프로필 사진</th>
							<td>
							<%-- background-image: url("${ contextPath }/resources/uploadFiles/profile/${ profile.changeName }${ profile.ext }"); --%>
								<div id="profilePhoto" style="display: inline-block; width: 150px; height: 150px; background: #929292; border-radius: 50% 50%; float: left;">
									<c:if test="${ !empty profile }">
										<img src="${ contextPath }/resources/uploadFiles/profile/${ profile.changeName }${ profile.ext }" style="width: 100%; height: 100%; border-radius: 50% 50%;">
									</c:if>
									<c:if test="${ empty profile }">
										<img src="${ contextPath }/resources/uploadFiles/profile/naturalProfile.png" style="width: 100%; height: 100%; border-radius: 50% 50%;">
									</c:if>
								</div>
								<!-- <button type="button" class="profileBtn">수정</button><button type="button" class="profileBtn">삭제</button> -->
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<td><c:out value="${ userInfo.ename }"/></td>
						</tr>
						<tr>
							<th>사번</th>
							<td><c:out value="${ userInfo.eno }"/></td>
						</tr>
						<tr>
							<th>입사일</th>
							<td><c:out value="${ userInfo.hireDate }"/>
						</tr>
						<tr>
							<th>아이디</th>
							<td><c:out value="${ userInfo.eid }"/></td>
						</tr>
						<tr>
							<th>휴대전화</th>
							<td>
								<c:out value="${ fn:substring(userInfo.phone, 0, 3) } - "/>
								<c:out value="${ fn:substring(userInfo.phone, 3, 7) } - "/>
								<c:out value="${ fn:substring(userInfo.phone, 7, 12) }"/>
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><c:out value="${ userInfo.email }"/></td>
						</tr>
						<tr>
							<th>자택 주소</th>
							<td id="userAddress"></td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td><c:out value="${ userInfo.birthday }"/></td>
						</tr>
					</table>
					<div style="height: 30px;"></div>
					<span>부서정보</span>
					<table>
						<tr>
							<th>부서</th>
							<td><c:out value="${ userInfo.dname }"/></td>
						</tr>
						<tr>
							<th>직급</th>
							<td><c:out value="${ userInfo.jname }"/></td>
						</tr>
					</table>
				</div>
			</div>
		</article>
		
		
		<!-- 개인정보 수정 -->
		<article style="margin-top: 50px; display: none;">
			<div style="width: 750px; height: 1080px; border: 1px solid #929292; margin: auto; box-shadow: 2px 2px 10px #929292;">
					<div style="margin-top: 30px;">
						<span>개인정보</span>
						<form id="uploadProfileForm" action="uploadProfile.me" method="post" enctype="multipart/form-data">
							<table>
								<tr>
									<th style="height: 200px;">프로필 사진</th>
									<td>
										<div id="profilePhoto" style="display: inline-block; width: 150px; height: 150px; background: #929292; border-radius: 50% 50%; float: left;">
								<c:if test="${ !empty profile }">
									<img src="${ contextPath }/resources/uploadFiles/profile/${ profile.changeName }${ profile.ext }" style="width: 100%; height: 100%; border-radius: 50% 50%;">
								</c:if>
								<c:if test="${ empty profile }">
									<img src="${ contextPath }/resources/uploadFiles/profile/naturalProfile.png" style="width: 100%; height: 100%; border-radius: 50% 50%;">
								</c:if>
								</div>
										<input type="file" id="profile" name="file" style="margin-top:10px;" accept=".jpg, .png">
										<button type="button" class="profileBtn" style="background: #004771; color:white; margin: 0; margin-top: 5px;">수정</button><!-- <button type="button" class="profileBtn">삭제</button> -->
									</td>
								</tr>
							</table>
						</form>
						
						<form action="modifyUserInfo.me" method="post" enctype="multipart/form-data" onsubmit="return checkNull();">
							<table>
								<tr>
									<th>이름<input type="hidden" name="mno" value="${ userInfo.mno }"/></th>
									<td><c:out value="${ userInfo.ename }"/></td>
								</tr>
								<tr>
									<th>사번</th>
									<td><c:out value="${ userInfo.eno }"/></td>
								</tr>
								<tr>
									<th>입사일</th>
									<td><c:out value="${ userInfo.hireDate }"/>
								</tr>
								<tr>
									<th>아이디</th>
									<td><c:out value="${ userInfo.eid }"/></td>
								</tr>
								<tr>
									<th>새 비밀번호<b class="star">*</b></th>
									<td><input type="password" name="epwd"></td>
								</tr>
								<tr>
									<th>비밀번호 확인<b class="star">*</b></th>
									<td><input type="password" name="epwd2"></td>
								</tr>
								<tr>
									<th>휴대전화<b class="star">*</b></th>
									<td>
										<input type="text" name="phone" placeholder="'-'를 제외하고 입력 해 주세요.">
									</td>
								</tr>
								<tr>
									<th style="height: 15px;"></th>
									<td style="color: #929292;">
										'-'를 제외하고 입력 해 주세요.
									</td>
								</tr>
								<tr>
									<th>이메일<b class="star">*</b></th>
									<td><input type="email" name="email"></td>
								</tr>
								<tr>
									<th>자택 주소<b class="star">*</b></th>
									<td>
			                        	<input type="hidden" id="address" name="address">
			                            <input type="text" style="width:80px;" readonly id="zipcode">
			                            <span style="color:#004771; font-size: 10px; font-weight: bold; cursor: pointer; margin-left: 0;" onclick="searchPostcode();">주소찾기</span>
			                        </td>
			                    </tr>
			                    <tr>
			                    	<th></th>
			                       <td>
			                       		<input type="text" style="width:300px;" readonly id="address1">
			                       </td>
			                    </tr>
			                    <tr>
			                    	<th></th>
			                       <td>
			                       		<input type="text" style="width:300px;" id="address2">
			                       </td>
			                    </tr>
								<tr>
									<th>생년월일<b class="star">*</b></th>
									 <td>
			                          	 <input type="hidden" name="birthday" id="birthday">
			                             <span style="margin-left: 0; font-size: 12px"><input type="text" style="width:60px; font-size: 12px;" id="year"> 년</span>
			                             <span style="margin-left: 0; font-size: 12px"><input type="text" style="width:60px; font-size: 12px;" id="month"> 월</span>
			                             <span style="margin-left: 0; font-size: 12px"><input type="text" style="width:60px; font-size: 12px;" id="day"> 일</span>
			                       </td>
								</tr>
							</table>
							<div style="height: 30px;"></div>
							<span>부서정보</span>
							<table>
								<tr>
									<th>부서</th>
									<td><c:out value="${ userInfo.dname }"/></td>
								</tr>
								<tr>
									<th>직급</th>
									<td><c:out value="${ userInfo.jname }"/></td>
								</tr>
								<tr>
									<td colspan="2">
										<div style="margin-top: 20px;" align="center">
											<button class="modifyBtn" type="submit" style="background: #004771; color: white;">수정</button>
											<button class="modifyBtn" type="button" style="margin-left: 15px;" onclick="location.reload();">취소</button>
										</div>
									</td>
								</tr>
							</table>
						</form>
					</div>
			</div>
		</article>
		
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
			$(document).on("click", ".profileBtn", function() {
				var formData = $('#uploadProfileForm')[0];
				var data = new FormData(formData);
				 
				$.ajax({
					url: "uploadProfile.me",
					data: data,
					type: "post",
					processData: false,
			        contentType: false,
					success: function(data) {
						console.log("됐다");
						location.href="goMyPage.me";
					},
					error: function(data) {
						console.log("안됨");
					}
				});
			});
		
			$(function() {
				var address = '${ userInfo.address }'.split('$$$');
				
				$("#userAddress").append("우 ) " + address[0] + "<br>" + address[1] + " " + address[2]);
	        	
				$("input[name='phone']").val('${userInfo.phone}');
				$("input[name='email']").val('${userInfo.email}');
				$("input[name='address']").val('${userInfo.address}');

				for(var i = 0; i < address.length; i++) {
					switch(i) {
						case 0 : $("#zipcode").val(address[i]); break;
						case 1 : $("#address1").val(address[i]); break;
						case 2 : $("#address2").val(address[i]); break;
					}
				}
				
				$("input[name='address']").val($("#zipcode").val() + "$$$" + $("#address1").val() + "$$$" + $("#address2").val());

				var birthdayArr = '${userInfo.birthday}'.split('/');
				for(var i = 0; i < birthdayArr.length; i++) {
					switch(i) {
						case 0 : $("#year").val(birthdayArr[i]); break;
						case 1 : $("#month").val(birthdayArr[i]); break;
						case 2 : $("#day").val(birthdayArr[i]); break;
					}
				}
				
				$("input[name='birthday']").val($("#year").val()+"/"+$("#month").val()+"/"+$("#day").val());
				
			
			});
			
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
			
			function modifyUserInfo() {
				$("article:nth-child(2)").css("display", "none");
				$("article:nth-child(3)").css("display", "");
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
			
			function checkNull() {
	        	var hireDate = $("input[name='hireDate']").val();
	        	var phone = $("input[name='phone']").val();
	        	var email = $("input[name='email']").val();
	        	var address = $("input[name='address']").val();
	        	var pwd = $("input[name='epwd']").val();
	        	var pwd2 = $("input[name='epwd2']").val();
	        	
	        	 if(!phone) {
	        		alert("휴대전화 번호를 입력 해 주세요.");
	        		return false;
	        	} else if(!email) {
	        		alert("이메일을 입력 해 주세요.");
	        		return false;
	        	} else if(!address) {
	        		alert("주소를 입력 해 주세요.");
	        		return false;
	        	} else if(!pwd) {
	        		alert("비밀번호를 입력 해 주세요.");
	        		return false;
	        	} else if(!pwd2) {
	        		alert("비밀번호 확인을 입력 해 주세요.");
	        		return false;
	        	} else if(pwd != pwd2) {
	        		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
	        		return false;
	        	}else {
	        		return true;
	        	}
	        }
			
			$("#zipcode").change(function() {
		        var address = $("#zipcode").val() + "$$$" + $("#address1").val() + "$$$" + $("#address2").val();
		        $("#address").val(address);
			});
			$("#address2").change(function() {
		        var address = $("#zipcode").val() + "$$$" + $("#address1").val() + "$$$" + $("#address2").val();
		        $("#address").val(address);
			});
		</script>
		
	</section>
	<br><br><br><br><br><br><br>
</body>
</html>