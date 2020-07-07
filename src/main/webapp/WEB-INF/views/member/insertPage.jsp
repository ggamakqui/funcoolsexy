<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
	
	//ajax
	$(document).ready(function(){

		//1. 아이디 (5 ~ 20 사이의 소문자나 숫자를 사용한다. 첫 글자는 소문자이다.)
		var regExpID = /^[a-z][a-z0-9]{4,19}$/;
		$('#mId').keyup(function(){
			$.ajax({
				url: 'idCheck',
				type: 'POST',
				data: 'mId='+ $('#mId').val(),
				dataType: 'JSON',
				success: function(responseObject){
					//정규식 test()
					if(regExpID.test($('#mId').val())){
						//가입된 아이디 인지 여부 확인
						if(responseObject.result=='YES'){
							$('#idCheckResult').text('사용중인 아이디입니다.')
							$('#idCheckResult').css('color','red');
						}else{
							$('#idCheckResult').text('사용가능한 아이디입니다.')
							$('#idCheckResult').css('color','green');							
						}
					}else{
						$('#idCheckResult').text('5~20자, 소문자 시작, 소문자+숫자 가능');
						$('#idCheckResult').css('color','red');
					}
				},
				error:function(){
					alert('AJAX 통신이 실패했습니다.');
				}
			});
		});
		
		
		//2. 비밀번호 (8 ~ 20 사이의 대문자, 소문자, 숫자, 특수문자(~!@#$%^&*)를 사용한다.)
		var regExpPW = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[~!@#$%^&*])[A-Za-z0-9~!@#$%^&*]{4,20}$/;
		$('#mPw').keyup(function(){
			if(regExpPW.test($('#mPw').val())){
				$('#pwCheckResult').text('비밀번호 사용 가능합니다.');
				$('#pwCheckResult').css('color','blue').css('font-weight','bold');
			}else{
				$('#pwCheckResult').text('4~20자, 대문자, 소문자, 숫자, 특수문자(~!@#$%^&*) 포함');				
				$('#pwCheckResult').css('color','red');
			}
		});
		
		
		$('#mPw2').keyup(function(){
			if($('#mPw').val() != $('#mPw2').val()){
				$('#pwConfirmResult').text('비밀번호가 일치하지 않습니다.');
				$('#pwConfirmResult').css('color','red');
			}else{
				$('#pwConfirmResult').text('비밀번호가 일치합니다.');
				$('#pwConfirmResult').css('color','blue').css('font-weight','bold');				
			}
		});
		//3. 이메일
		var regExpEMAIL = /^[a-z][a-z0-9\-\_]+@[A-Za-z0-9]{3,}(\.[A-Za-z]{2,6}){1,2}$/;
		$('#mEmail').keyup(function(){
			$.ajax({
				url: 'emailCheck',
				type: 'POST',
				dataType: 'JSON',
				data: 'mEmail='+$('#mEmail').val(),
				success: function(responseObject){
					//정규식 test()
					if(regExpEMAIL.test($('#mEmail').val())){
						//가입된 이메일 인지 여부 확인
						if(responseObject.result=='YES'){
							$('#emailCheckResult').text('사용중인 아이디입니다.')
							$('#emailCheckResult').css('color','red');
						}else{
							$('#emailCheckResult').text('사용 가능한 이메일 입니다');
							$('#emailCheckResult').css('color','blue').css('font-weight','bold');																	
						}
					}else{
						$('#emailCheckResult').text('올바른 이메일 형식이 입니다');
						$('#emailCheckResult').css('color','red');								
					}
				},
				error:function(){
					alert('AJAX 통신이 실패했습니다.');
				}
			});
		});
		
		//5. 회원가입
		$('#signUpBtn').click(function(){
			$.ajax({
				url: 'signUp',
				type: 'POST',
				dataType: 'JSON',
				data: $('#f').serialize(),
				success: function(responseObject){
					if(responseObject.result == 'SUCCESS'){
						alert('회원가입에 성공했습니다.');
						location.href='loginPage';
					}else{
						alert('가입되지 않았습니다.');
					}
				},
				error:function(){
					alert('AJAX 통신이 실패했습니다.');
				}
			});
		});
		
		//6.입력초기화
		$('#clearBtn').click(function(){
			$('input[type=text], input[type=password]').each(function(){
				//각 요소는 each 문 내부에서 $(this)로 호출한다.
				$(this).val('');
			});
			$('span').each(function(){
				$(this).text('');
			});
			$('#mId').focus()
		});
		
	});
	
	
	//주소 api
	function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('mPost').value = data.zonecode;
                document.getElementById("mAddr1").value = roadAddr;
                document.getElementById("mAddr2").value = data.jibunAddress;
              
            }
        }).open();
    }
	</script>
</head>

<body>

<div class="sign-up-box">
	<form id='f'  method="POST">
		<table>
			<tbody>
				<tr>
					<td>아이디</td>
					<td>
						<input id="mId" type="text" name="mId" autocomplete="off"/>
						<span id="idCheckResult"></span>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input id="mPw" type="password" name="mPw"/>
						<span id="pwCheckResult"></span>
					</td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td>
						<input id="mPw2" type="password" name="mPw2"/>
						<span id="pwConfirmResult"></span>
					</td>
				</tr>
				<tr>
					<td>성명</td>
					<td><input type="text" name="mName"/></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" name="mBirth" placeholder="ex)901111"/></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input id="mEmail" type="text" name="mEmail"/>
						<span id="emailCheckResult"></span>
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>
						<select id="mMobile1" name="mMobile1">
							<option>010</option>
							<option>011</option>
							<option>016</option>
							<option>019</option>
						</select>
						-
						<input id="mMobile2" type="number" name="mMobile2"/>
						-
						<input id="mMobile3" type="number" name="mMobile3"/>			
					</td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input type="text" id="mPost" name="mPost"><input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br></td>
				</tr>
				<tr>
					<td>도로명주소</td>
					<td><input type="text" id="mAddr1" name="mAddr1"  placeholder="도로명주소"></td>
				</tr>
				<tr>
					<td>지번주소</td>
					<td>
						<input type="text" id="mAddr2" name="mAddr2" placeholder="지번주소">
						<span id="guide" style="color:#999;display:none"></span>
					</td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td><input type="text" id="mAddr3" name="mAddr3" placeholder="상세주소"></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input id="signUpBtn" type="button" value="회원가입" />
						<input id="clearBtn" type="reset" value="입력취소" />
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
	<br/><br/>
	<div id="findIdResult"></div>  <!-- AJAX 처리 결과가 나타나는 위치이다. -->
</div>
</body>
</html>