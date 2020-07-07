<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	
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
		
		$('#changePwBtn').click(function(){
			$.ajax({
				url: 'changePw',
				type: 'POST',
				dataType: 'text',
				data: $('#f').serialize(),
				success: function(responseText){
					if(responseText == 'SUCCESS'){
						alert('비밀번호 변경에 성공했습니다.');
						location.href='loginPage';
					}else{
						alert('비밀번호가 변경되지 않았습니다.');
					}
				},
				error:function(){
					alert('AJAX 통신이 실패했습니다.');
				}
			});
		});
	});
</script>
</head>
<body>
	<form id='f' method="POST">
		새 비밀번호<input id="mPw" type="password" name="mPw"/><span id="pwCheckResult"></span><br>
		새 비밀번호 확인<input id="mPw2" type="password" name="mPw2"/><span id="pwConfirmResult"></span>
		<input id="mId" type="hidden" name="mId" value="${mId }">
		<input id="changePwBtn" type="button" value="패스워드 변경">
	</form>
</body>
</html>