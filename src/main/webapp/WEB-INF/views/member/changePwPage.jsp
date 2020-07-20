<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../template/header.jsp">
   <jsp:param value="회원가입" name="title" />
</jsp:include>
<style type="text/css">
	.inputbox1 {width: 200px; height: 25px; font-size: 18px;}
	.input_group{
		margin:auto;
		paddin:auto;
		text-align:center;
		width:60%;
	}
	td:nth-of-type(1){width:100px;height: 25px; text-align:center;}
	td:nth-of-type(2){width:200px;height: 25px;}
	input[type=button]{
		width:200px;
		height:50px;
		text-align:center;
		margin-top: 10px;
		padding: 0;
	}
</style>
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
<div class="visual"><img src="https://ifh.cc/g/aFF3mM.jpg" alt=""></div>
</header>

  <main>
  <div class="input_group">
	<form id='f' method="POST">
	<table>
		<tr>
			<td>새 비밀번호</td>
			<td>
				<input class="inputbox1" id="mPw" type="password" name="mPw"/><span id="pwCheckResult"></span>
			</td>
			<td rowspan="2">
				<input id="mId" type="hidden" name="mId" value="${mId }">
				<input class="input-btn" id="changePwBtn" type="button" value="패스워드 변경">
			</td>
		</tr>
		<tr>
			<td>새 비밀번호 확인</td>
			<td>
				<input class="inputbox1"id="mPw2" type="password" name="mPw2"/><span id="pwConfirmResult"></span>
			</td>
		</tr>
	</table>
	</form>
  </div>
 <%@ include file="../template/footer.jsp" %>