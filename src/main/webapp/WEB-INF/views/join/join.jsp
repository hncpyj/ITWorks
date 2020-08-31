<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITWorks!</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="icon" href="${contextPath}/resources/images/favicon.ico" type="image/x-icon">
<style>
    * {
        font-family: "Noto Sans KR";
    }

   body {
      background: #fafafa;
   }
   
   table {
	  border-collapse: separate;
	  border-spacing: 0 5px;
   }
   
    .loginFormArea {
        width: 100%;
        height: auto;
    }

    .loginForm {
        background: white;
        width: 650px;
        height: 630px;
        border: 0.5px solid #929292;
        margin: 0 auto;
        margin-top: 50px;

    }

    #joinMemberText {
        width: 100px;
        height: 20px;
        color: #004771;
        font-size: 14px;
        font-weight: bold;
        margin-left: 20px;
        margin-top: 20px;
        
    }
    
    .label {
       width: 150px;
       font-size: 12px;
       font-weight: bold;
    }

   strong {
       color: red;
   }

	#duplicationCheck {
		width:60px; 
		height:25px; 
		color: white; 
		font-size:11px;
		border: none; 
        background:#29A2F7;
        cursor: pointer;
        vertical-align:top;
        margin-left: 5px;
	}

   input[type="submit"], input[type="reset"] {
       width: 50px;
       height: 25px;
       color: white;
       font-size: 13px;
       border: none;
       cursor: pointer;
   }
   
   input[type="text"], input[type="password"] {
      border: 0.5px solid black;
   }



	/* The Modal (background) */
	.modal {
	  display: none; /* Hidden by default */
	  position: fixed; /* Stay in place */
	  z-index: 1; /* Sit on top */
	  left: 0;
	  top: 0;
	  width: 100%; /* Full width */
	  height: 100%; /* Full height */
	  overflow: auto; /* Enable scroll if needed */
	  background-color: rgb(0,0,0); /* Fallback color */
	  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	  -webkit-animation-name: fadeIn; /* Fade in the background */
	  -webkit-animation-duration: 0.4s;
	  animation-name: fadeIn;
	  animation-duration: 0.4s
	}
	
	/* Modal Content */
	.modal-content {
	  position: fixed;
	  bottom: 0;
	  background-color: #fefefe;
	  width: 100%;
	  -webkit-animation-name: slideIn;
	  -webkit-animation-duration: 0.4s;
	  animation-name: slideIn;
	  animation-duration: 0.4s
	}
	
	/* The Close Button */
	.close {
	  color: white;
	  float: right;
	  font-size: 28px;
	  font-weight: bold;
	}
	
	.close:hover,
	.close:focus {
	  color: #000;
	  text-decoration: none;
	  cursor: pointer;
	}
	
	.modal-header {
	  padding: 2px 16px;
	  background-color: #5cb85c;
	  color: white;
	}
	
	.modal-body {padding: 2px 16px;}
	
	.modal-footer {
	  padding: 2px 16px;
	  background-color: #5cb85c;
	  color: white;
	}
	
	/* Add Animation */
	@-webkit-keyframes slideIn {
	  from {bottom: -300px; opacity: 0} 
	  to {bottom: 0; opacity: 1}
	}
	
	@keyframes slideIn {
	  from {bottom: -300px; opacity: 0}
	  to {bottom: 0; opacity: 1}
	}
	
	@-webkit-keyframes fadeIn {
	  from {opacity: 0} 
	  to {opacity: 1}
	}
	
	@keyframes fadeIn {
	  from {opacity: 0} 
	  to {opacity: 1}
	}









</style>
</head>
<body>
    <div class="loginFormArea">
        <div class="loginForm">
            <div id="joinMemberText">회원가입 신청</div>
            <form action="insert.me" method="post" onSubmit="return check();">
                 <table align="center" style="margin-top:30px;">
                 	<tr>
                        <td class="label">
                                 	 회사코드<strong>*</strong>
                        </td> 
                        <td>
                           <span><input type="text" style="width:100px;" name="corpNo" id="corpNo"></span>
                           <span></span>
                        </td>
                    </tr>
                    <tr>
                       <td></td>
                        <td style="color:#929292; font-size:9px;">회사코드를 정확히 입력하여 주십시오.<br>
                          	잘못 기재하여 발생된 불이익은 작성자 본인의 책임이며 회사는 책임을 지지 않습니다.</td>
                    </tr>
                    <tr >
                    	<td style="line-height: 200px;"></td>
                    </tr>
                    <tr>
                        <td class="label">
                                 	 아이디<strong>*</strong>
                        </td> 
                        <td>
                           <span><input type="text" style="width:100px;" name="eid" id="eid"></span>
                           <!-- 이미 사용중인 아이디입니다. / 사용할 수 있는 아이디입니다.-->
                           <span onclick="duplicationCheck();"><input type="button" value="중복확인" id="duplicationCheck"></span>
                           <span id="idRegExp"></span>
                        </td>
                    </tr>
                    <tr>
                       <td></td>
                        <td style="color:#929292; font-size:9px;">특수문자로 시작할 수 없으며, 4~20자리의 영문소문자, 숫자만 가능합니다.</td>
                    </tr>
                    <tr>
                        <td class="label">
							이름<strong>*</strong>
                        </td>
                        <td>
                            <span><input type="text" name="ename"></span>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">
                           	      비밀번호<strong>*</strong>
                        </td>
                        <td>
                            <span><input type="password" name="epwd" id="epwd"></span>
                             <span id="pwdRegExp"></span>
                        </td>
                    </tr>
                    <tr>
                         <td></td>
                        <td style="color:#929292; font-size:9px;">10~16자의 영문소문자, 숫자, 특수문자를  조합하여 설정하세요.</td>
                    </tr>
                    <tr>
                        <td class="label">
                              	    비밀번호 확인<strong>*</strong>
                        </td>
                        <td>
                            <span><input type="password" id="pwdCheck"></span>
                            <!-- 비밀번호가 일치하지 않습니다 / 비밀번호가 일치합니다. -->
                            <span id="pwdEqual"></span>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">
                        	 휴대전화<strong>*</strong>
                        </td>
                        <td>
                            <span><input type="text" name="phone"></span>
                           
                        </td>
                    </tr>
                    <tr>
                        <td class="label">
                          	     개인 이메일<strong>*</strong>
                        </td>
                        <td>
                            <span><input type="text" name="email"></span>
                        </td>
                    </tr>
                    <tr>
                       <td class="label" rowspan="3">
                           	       자택주소<strong>*</strong>
                        </td>
                        <!-- 우편번호, 주소1,2 3칸 합쳐서 자택주소 address -->
                        <td>
                        	<input type="hidden" id="address" name="address">
                            <span><input type="text" style="width:80px;" readonly id="zipcode"></span>
                            <span style="color:#004771; font-size: 10px; font-weight: bold; cursor: pointer" onclick="searchPostcode();">주소찾기</span>
                        </td>
                    </tr>
                    <tr>
                       <td>
                       		<span><input type="text" style="width:300px;" readonly id="address1"></span>
                       </td>
                    </tr>
                    <tr>
                       <td>
                       		<span><input type="text" style="width:300px;" id="address2"></span>
                       </td>
                    </tr>
                    <tr>
                       <td class="label">
                         	    생년월일<strong>*</strong>
                       </td>
                       <!--년,월,일 3칸 합쳐서 생년월일 birthday -->
                       <td>
                          <span>
                          	 <input type="hidden" id="birthday" name="birthday">
                             <span style="font-size: 12px"><input type="text" style="width:60px; font-size: 12px;" id="year"> 년</span>
                             <span style="font-size: 12px"><input type="text" style="width:60px; font-size: 12px;" id="month"> 월</span>
                             <span style="font-size: 12px"><input type="text" style="width:60px; font-size: 12px;" id="day"> 일</span>
                          </span>   
                       </td>
                    </tr>
                </table>
                
               <div style="font-size:12px; margin-top:15px;" align="center">
                   <div id="ch"><input type="checkbox" id="terms" onclick="return false"><a style="color:#29A2F7; text-decoration: none;" onclick="searchPerson()">서비스 이용약관</a>에 동의합니다.</div>
                   <div style="margin-top: 5px;"><input type="checkbox" id="privacy"><a style="color:#29A2F7; text-decoration: none;" href="PrivacyPolicy.me">개인정보 수집/이용</a>에 동의합니다.</div>
               </div>
               
               <div align="center" style="margin-top: 20px; ">
                  <input type="submit" value="신청" style="background: #29A2F7; margin-right:10px;">
                  <input type="reset" value="취소" style="background: #C4C4C4;">
               </div>   
            </form>
            
            <!-- 모달창 1 -->
            <div class="searchPerson" style="position: fixed; left: 0; top: 0; width: 100%; height: 100%; z-index: 1000; display: none;">
				<div class="onclickBackground" style="position: absolute; width: 100%; height: 100%; background: black; filter: alpha(opacity=60); opacity: .6;"></div>
					<div class="searchBox" style="position: relative; top: 20%; width: 400px; height: 500px; background: white; margin: auto; border-radius: 5px; border: 1px solid #929292; filter: none; opacity: 100;">
				        <div style="background: #004771; border-top-left-radius: 5px; border-top-right-radius: 5px; height: 35px; margin: 0; width: 400px; display: table-cell; vertical-align: middle;">
				        	<span style="color: white; padding-left: 15px; margin-top: 15px; font-size: 14px;">검색</span>
				            <button onclick="closeSearchPerson();" style="background: white; color: black; width: 20px; height: 20px; border: none; border-radius: 5px; margin-left: 323px; font-weight: bold;">X</button>
    			   		</div>
            				<textarea style="resize: none;">okepkfosdgjkdlrpelkwofdplrjgldslnwe</textarea>
            				<button id="okBtn" style="background: #29A2F7; margin-right:10px;" onclick="okBtn();">확     인</button>
        				</div>
     		</div>
     				          
				<script>                         
				function searchPerson() {
					jQuery('.searchPerson').fadeIn('slow');
				}
				
				function closeSearchPerson() {
					jQuery('.searchPerson').fadeOut('slow');
				} 
				
				function okBtn() {
					closeSearchPerson();
					$('#terms').remove();
					$('#ch').prepend('<input type="checkbox" id="terms" onclick="return false" checked>');
					
					
				}
				</script>


        </div>
    </div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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
            }
        }).open();
    }
    
    var isIdCheck = false;
    var isPwdCheck = false;
    var isPwdEqual = false;
    var isDuplicationChcek = false;
    
    function check() {
       
       var address = $("#zipcode").val() + "$$$" + $("#address1").val() + "$$$" + $("#address2").val();
       $("#address").val(address);
       
       var birthday = $("#year").val() + "/" + $("#month").val() + "/" + $("#day").val();
       $("#birthday").val(birthday);
       
    	
       if(isIdCheck === false) {
          return false;
       }

       if(isPwdCheck === false) {
          return false;
       }
       
       if(isPwdEqual === false) {
    	   return false;
       }
       
       if(isDuplicationCheck === false) {
    	   return false;
       }
       
    	
       if(!$("#terms").prop("checked")) {
          return false;
       }
       
       if(!$("#privacy").prop("checked")) {
		return false;
       }
       
       window.alert("회원가입 신청이 완료되었습니다!");
		return true;
    }
    
    $(function() {
       var idCheck = /(^[a-z0-9]{1}[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"a-z0-9]{3,19})$/;
        $("#eid").bind("input", function() {
            if($("#eid").val() === "") {
                isIdCheck = false;
                $("#idRegExp").html("");
            } else if(idCheck.test($("#eid").val())) {
               	isIdCheck = true;
                $("#idRegExp").html("사용 가능한 아이디 형식입니다.").css({"color":"#29A2F7", "fontSize": "10px", "fontWeight": "bold"});
            } else if(!idCheck.test($("#eid").val())) {
            	isIdCheck = false;
                $("#idRegExp").html("사용할 수 없는 아이디 형식입니다.").css({"color":"red", "fontSize": "10px", "fontWeight": "bold"});
            }
        });
        
        var pwdCheck = /[a-z0-9!@#$%^&+=]{10,16}$/;
        $("#epwd").bind("input", function() {
            if($("#epwd").val() === "") {
                isPwdCheck = false;
                $("#pwdRegExp").html("");
            } else if(pwdCheck.test($("#epwd").val())) { 
               	isPwdCheck = true;
               	$("#pwdRegExp").html("사용 가능한 비밀번호 형식입니다.").css({"color":"#29A2F7", "fontSize": "10px", "fontWeight": "bold"});
            } else if(!pwdCheck.test($("#epwd").val())) {
            	isPwdCheck = false;
                $("#pwdRegExp").html("사용할 수 없는 비밀번호 형식입니다.").css({"color":"red", "fontSize": "10px", "fontWeight": "bold"});
            }
        });
        
        
        $("#pwdCheck").bind("input", function() {
        	if($("#pwdCheck").val() === "") {
                isPwdEqual = false;
                $("#pwdEqual").html("");
            } else if($("#pwdCheck").val() === $("#epwd").val()) {
            	isPwdEqual = true;
              	$("#pwdEqual").html("비밀번호가 일치합니다.").css({"color":"#29A2F7", "fontSize": "10px", "fontWeight": "bold"});
            } else if($("#pwdCheck").val() !== $("#epwd").val()) {
            	isPwdEqual = false;
                $("#pwdEqual").html("비밀번호가 일치하지 않습니다.").css({"color":"red", "fontSize": "10px", "fontWeight": "bold"});
            }
        });
        
    });
    
    function duplicationCheck() {
		var userId = $("#eid").val();
    	$.ajax({
			url: "duplicationCheck.me",
			type: "post",
			data: {userId:userId},
			//MemberController에서 중복값이 없을 때 0 인게 여기 data로 넘어온다
    		success: function(data) {
    			if(data === "0") {
    				window.alert("사용가능한 아이디입니다.");
    				isDuplicationCheck = true;
    			} else {
    				window.alert("이미 사용중인 아이디입니다.");
    				isDuplicationCheck = false;
    				
    			}
    			
    		}
		});   	
    	
    }
     
    
    
</script>
</body>
</html>