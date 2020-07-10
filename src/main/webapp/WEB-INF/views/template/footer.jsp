<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


</body>
<footer>
		<div class="clear">
			<a href="#header">TOP</a>
			<div class="left">
				<div>
					<a href="#a">개인정보처리방침</a>
					<a href="#a">이용약관</a>
					<a href="#a">이메일무단수집거부</a>
					<a href="#a">사이트맵</a>
				</div>
				<p>
					FCS(주)사업자번호 : 111-22-33333 대표자 : @@@<br>
					서강로 136 아이비타워 2층 FCS 02-1234-5678 Copyright © 2020 NULL Corporation., All rights reserved.
				</p>
			</div>
			<div class="right">
				<select>
				<option>FAMILY SITE</option>
				<option>FAMILY SITE</option>
				<option>FAMILY SITE</option>
				<option>FAMILY SITE</option>
				<option>FAMILY SITE</option>
				<option>FAMILY SITE</option>
				<option>FAMILY SITE</option>
				</select>
			</div>
		</div>
	</footer>



	<c:if test="${empty loginDTO }">
		<c:if test="${login eq 'fail' }">
			<script type="text/javascript">
				alert('일치하는 회원정보가 없습니다.');
			</script>
		</c:if>
		<!-- <a href="loginPage">로그인</a>/<a href="insertPage">회원가입</a>  -->
	</c:if>
	<c:if test="${not empty loginDTO }">
		<c:if test="${loginDTO.mId ne 'admin' }">
			${loginDTO.mName }님 반갑습니다.<br>
			<a href="logout">로그아웃</a><br>
			<a href="myPage">마이페이지</a>
		</c:if>
		<c:if test="${loginDTO.mId eq 'admin' }">
			${loginDTO.mName }님 반갑습니다.<br>
			<a href="logout">로그아웃</a><br>
			<a href="adminPage">관리 페이지</a>
		</c:if>
	</c:if>
</body>
</html>