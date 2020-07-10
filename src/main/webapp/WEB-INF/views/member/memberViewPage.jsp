<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn_memberDelete(f){
		if(confirm('탈퇴시키겠습니까?')){		
			f.action = 'deleteByAdmin';
			f.submit();
		}
	}
</script>
</head>
<body>
	<form action="updateByAdmin" method="post">
		아이디 <input type="text" value="${mDTO.mId }" name="mId" readonly><br>
		이름 <input type="text" value="${mDTO.mName }" name="mName"><br>
		이메일 <input type="text" value="${mDTO.mEmail }" name="mEmail" readonly><br>
		<input type="hidden" value="${mDTO.mNo }" name="mNo">
		<input type="submit" value="수정하기">
		<input type="button" value="삭제하기" onclick="fn_memberDelete(this.form)">
		<input type="button" value="전체목록보기" onclick="location.href='userManagementPage'">
	</form>
</body>
</html>