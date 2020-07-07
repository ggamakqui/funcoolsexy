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

	$(document).ready(function(){
		
		//아이디 기억하기
		var savedID = getCookie("savedID");
		$('#mId').val(savedID);
		
		//savedID 가 있으면, 체크박스를 체크 상태로 유지
		if($('#mId').val() != ''){
			$('#saveIDCheck').attr('checked', true);
		}
		
		//체크박스의 상태가 변하면,
		$('#saveIDCheck').change(function(){
			//체크되어 있다
			if($('#saveIDCheck').is(':checked')){
				setCookie( "savedID", $('#mId').val(), 7 );
			}else{ //체크 해제 되어 있다.
				deleteCookie( "savedID" )
			}
		});
		
		//아이디를 입력할 때 
		$('#mId').keyup(function(){
			if ( $('#saveIDCheck').is(':checked') ) {
				setCookie( "savedID", $('#mId').val(), 7 );  // 7일간 쿠키에 보관
			}
		});
		
	});


	//함수
	function fn_login(f){
		//아이디/비밀번호 정규식 체크
		
		f.action = 'login';
		f.submit();
		
	}
	
	// 1. 쿠키 만들기

	function setCookie( cookieName, value, exdays ) {
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	// 2. 쿠키 삭제
	function deleteCookie( cookieName ) {
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	// 3. 쿠키 가져오기
	function getCookie( cookieName ) {
	    cookieName = cookieName + "=";
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = "";
	    if ( start != -1 ){
	        start += cookieName.length;
	        var end = cookieData.indexOf(";", start);
	        if(end == -1) {
	            end = cookieData.length;
	        }
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}

</script>
</head>
<body>
	<div class="login-box">
		<form method="post">
			<table>
				<tbody>
					<tr>
						<td>아이디</td>
						<td><input id="mId" type="text" name="mId" autofocus></td>
					</tr>		
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="mPw" autofocus></td>
					</tr>		
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<input type="button" value="로그인" onclick="fn_login(this.form)">&nbsp;&nbsp;
							<input id="saveIDCheck" type="checkbox" name="saveIDCheck" value="true" checked>아이디 기억하기
							<br><br>
							<a href="findIdPage">아이디 찾기</a>
							&nbsp;&nbsp;
							<a href="findPwPage">비밀번호 찾기</a><br>
							<input type="button" value="메인으로 이동" onclick="location.href='index'" />
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>







</body>

</html>







