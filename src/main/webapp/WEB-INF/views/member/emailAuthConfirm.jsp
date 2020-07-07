<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn_emailAuthConfirm(f){
		//인증코드는 ${authKey}
		//사용자 입력 값은 f.authKey.value
		var authKey = '${authKey}';
		if(authKey!=f.authKey.value){
			alert('잘못된 인증코드입니다');
			return;
		}else{
			alert('인증되었습니다. 비밀번호 변경 페이지로 이동합니다.');
			f.action = 'changePwPage';
			f.submit();
		}
		
	}
</script>
</head>
<body>
	<form method="POST">
		여기에 인증 코드를 입력하세요.
		<input type="text" name="authKey">
		<input type="hidden" name="mId" value="${mId }" >
		<input type="button" value="인증하기" onclick="fn_emailAuthConfirm(this.form)">
	</form>
</body>
</html>