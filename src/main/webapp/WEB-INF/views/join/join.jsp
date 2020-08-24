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
   
    .loginFormArea {
        width: 100%;
        height: auto;
    }

    .loginForm {
        background: white;
        width: 600px;
        height: 500px;
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

   input[type="submit"], input[type="reset"] {
       width: 50px;
       height: 25px;
       color: white;
       font-size: 13px;
       border: none;
   }
   
   
   
   input[type="text"] {
      border: 0.5px solid black;
   }

</style>
</head>
<body>
    <div class="loginFormArea">
        <div class="loginForm">
            <div id="joinMemberText">회원가입 신청</div>
            <form action=" " method="post" onSubmit="return check();">
           

                 <table align="center" style="margin-top:30px;">
                    <tr>
                        <td class="label">
                                  아이디<strong>*</strong>
                        </td> 
                        <td>
                           <span><input type="text" style="width:100px;" name="userId" id="userId"></span>
                           <!-- 이미 사용중인 아이디입니다. / 사용할 수 있는 아이디입니다.-->
                           <span style="color:red; font-size: 10px; font-weight: bold">    중복확인</span>
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
                            <span><input type="text" name="userName"></span>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">
                                 비밀번호<strong>*</strong>
                        </td>
                        <td>
                            <span><input type="text" name="userPwd"></span>
                        </td>
                    </tr>
                    <tr>
                         <td></td>
                        <td style="color:#929292; font-size:9px;">10~16자의 영문소문자, 특수문자 중 최소 2종류를 조합하여 설정하세요.</td>
                    </tr>
                    <tr>
                        <td class="label">
                                  비밀번호 확인<strong>*</strong>
                        </td>
                        <td>
                            <span><input type="text" name="pwdCheck"></span>
                            <!-- 비밀번호가 일치하지 않습니다 / 비밀번호가 일치합니다. -->
                            <span style="color:red; font-size: 10px; font-weight: bold"> 비밀번호가 일치하지 않습니다.  </span>
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
                        <td>
                            <span><input type="text" style="width:80px;" name="zipcode" readonly id="zipcode"></span>
                            <span style="color:#004771; font-size: 10px; font-weight: bold" onclick="searchPostcode();">    주소찾기</span>
                        </td>
                    </tr>
                    <tr>
                       <td><span><input type="text" style="width:300px;" name="address1" readonly id="address1"></span></td>
                    </tr>
                    <tr>
                       <td><span><input type="text" style="width:300px;" name="address2" id="address2"></span></td>
                    </tr>
                    <tr>
                       <td class="label">
                             생년월일<strong>*</strong>
                       </td>
                       <td>
                          <span>
                             <span style="font-size: 12px"><input type="text" style="width:60px; font-size: 12px;" name="year"> 년</span>
                             <span style="font-size: 12px"><input type="text" style="width:60px; font-size: 12px;" name="month"> 월</span>
                             <span style="font-size: 12px"><input type="text" style="width:60px; font-size: 12px;" name="day"> 일</span>
                           </span>   
                       </td>
                    </tr>
                </table>
                
                <div style="font-size:12px; margin-top: 20px;" align="center">
                   <div><input type="checkbox" id="terms"><a style="color:#29A2F7; text-decoration: none;" href="http://www.naver.com">서비스 이용약관</a>에 동의합니다.</div>
                   <div><input type="checkbox" id="privacy"><a style="color:#29A2F7; text-decoration: none;" href="http://www.google.com">개인정보 수집/이용</a>에 동의합니다.</div>
               </div>
               
               <div align="center" style="margin-top: 20px; ">
                  <input type="submit" value="신청" style="background: #29A2F7;">
                  <input type="reset" value="취소" style="background: #C4C4C4;">
               </div>   
            </form>
            


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
    
    function check() {
       
       if(!$("#terms").prop("checked")) {
          return false;
       }
       
       if(!$("#privacy").prop("checked")) {
          return false;
       }
       
       if(isIdCheck === false) {
          return false;
       }
       
       window.alert("회원가입 신청이 완료되었습니다!");
       return true;
    }
    
    $(function() {
       var idCheck = /(^[a-z0-9]{1}[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"a-z0-9]{3,19})$/;
        $("#userId").bind("input", function() {
            if(!idCheck.test($("#userId").val())) {
                isIdCheck = false;
            } else {
               isIdCheck = true;
            }
        });
    });
</script>
</body>
</html>