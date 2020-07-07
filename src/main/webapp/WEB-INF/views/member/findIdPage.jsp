<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

//AJAX를 통해 아이디를 찾는다
$(document).ready(function(){
	$('#findIdBtn').click(function(){
		$.ajax({
			url: 'findId',
			type: "POST",
			dataType: "text",
			data: 'mEmail='+$('#mEmail').val(),
			success: function(responseText){
				if(responseText.trim() != "NO"){
					$('#findIdResult').text('회원님의 아이디는'+responseText+'입니다.');
					$('#findIdResult').css('color','blue').css('font-weight','bold');
				}else{
					$('#findIdResult').text('일치하는 회원 정보가 없습니다');
					$('#findIdResult').css('color','red').css('font-weight','bold');
				}
			},
			error: function(){
				alert('AJAX통신이 실패했습니다.')
			}
		});
	});
})
</script>
</head>
<body>
<div class="find-id-box">
	<form method="post">
		<table>
			<tbody>
				<tr>
					<td>가입 당시 이메일</td>
					<td><input id="mEmail" type="text" name="mEmail" autofocus></td>
				</tr>		
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input id="findIdBtn" type="button" value="아이디찾기" >&nbsp;&nbsp;
						<input type="button" value="비밀번호 찾기" onclick="location.href='findPwPage'">
						<input type="button" value="로그인하러 가기" onclick="location.href='loginPage'">
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
	<br><br>
	<div id="findIdResult"></div> <!-- AJAX 처리 결과가 나타나는 위치이다. -->
</div>
</body>

</html>





