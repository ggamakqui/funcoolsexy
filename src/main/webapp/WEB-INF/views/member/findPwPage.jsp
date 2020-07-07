<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	function findPw(f){
		if(f.mId.value==''){
			alert('아이디를 입력하세요.');
			f.mId.focus();
			return false;
		}
		if(f.mEmail.value==''){
			alert('이메일을 입력하세요.');
			f.mEmail.focus();
			return false;
		}
		f.action="emailAuth";
		f.submit();
	}
	
</script>
</head>
<body>
<div class="find-pw-box">
	<form method="POST">
		<table>
			<tbody>
				<tr>
					<td>아이디</td>
					<td><input id="mId" type="text" name="mId" autofocus /></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input id="mEmail" type="text" name="mEmail" autofocus /></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input id="findPwBtn" type="button" value="비밀번호 찾기" onclick="findPw(this.form)"/>
						&nbsp;&nbsp;
						<input type="button" value="로그인하러 가기" onclick="location.href='loginPage'" />
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