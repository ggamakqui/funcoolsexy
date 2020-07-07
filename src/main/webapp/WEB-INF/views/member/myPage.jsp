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
	
	function fn_changPw(f){
		f.action='changePwPage';
		f.submit();
	}
	function fn_deleteMember(f){
		f.action='deleteMember';
		f.submit();
	}
	
	$(document).ready(function(){
		
		// 회원정보 수정하기
		$('#updateBtn').click(function(){
			$.ajax({
				url: 'updateMember',
				type: 'POST',
				dateType: 'JSON',
				data: $('#f').serialize(),
				success: function(responseObject){
					if(responseObject.result == 'SUCCESS'){
						alert('회원 정보가 수정되었습니다.');
					}else{
						alert('회원 정보가 수정되지 않았습니다.');
					}
					location.href = 'myPage';
				},
				error: function(){
					alert('AJAX 통신에 실패했습니다.');
				}
			});
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
<div class="my-box">
	<h1>마이페이지</h1>
	<form id='f'  method="POST">
		<table>
			<tbody>
				<tr>
					<td>아이디</td>
					<td>
						<input id="mId" type="text" name="mId" value="${loginDTO.mId }" readonly/>
					</td>
				</tr>
				<tr>
					<td>성명</td>
					<td><input id="mName" type="text" name="mName" value="${loginDTO.mName }"/></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input id="mBirth" type="text" name="mBirth" value="${loginDTO.mBirth }"/></td>
				</tr>
				
				<tr>
					<td>이메일</td>
					<td>
						<input id="mEmail" type="text" name="mEmail" value="${loginDTO.mEmail }"/>
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>
						<input id="mMobile1" type="number" name="mMobile1" value="${loginDTO.mMobile1 }"/>
						-
						<input id="mMobile2" type="number" name="mMobile2" value="${loginDTO.mMobile2 }"/>
						-
						<input id="mMobile3" type="number" name="mMobile3" value="${loginDTO.mMobile3 }"/>
					</td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input type="text" id="mPost" name="mPost" value="${loginDTO.mPost }"><input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br></td>
				</tr>
				<tr>
					<td>도로명주소</td>
					<td><input type="text" id="mAddr1" name="mAddr1"  value="${loginDTO.mAddr1 }"></td>
				</tr>
				<tr>
					<td>지번주소</td>
					<td>
						<input type="text" id="mAddr2" name="mAddr2" value="${loginDTO.mAddr2 }">
						<span id="guide" style="color:#999;display:none"></span>
					</td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td><input type="text" id="mAddr3" name="mAddr3" value="${loginDTO.mAddr3 }"></td>
				</tr>
				<tr>
					<td>가입일</td>
					<td>${loginDTO.mRegdate }</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="hidden" name="mNo" value="${loginDTO.mNo }" >
						<input id="updateBtn" type="button" value="회원정보 수정하기" />
						<input type="button" value="비밀번호 수정하기" onclick="fn_changPw(this.form)" />
						<input type="button" value="탈퇴하기" onclick="fn_deleteMember(this.form)" />
						<input type="button" value="메인으로 이동" onclick="location.href='index'" />
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