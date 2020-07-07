<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="categoryListPage">카테고리 리스트</a>
	<form action="productListPage">
		<input type="hidden" name="cNo" value="10"/>
		<input type="submit" value="A카테고리 제품 보기"/>
	</form>
	
	
	<c:if test="${empty loginDTO }">
		<c:if test="${login eq 'fail' }">
			<script type="text/javascript">
				alert('일치하는 회원정보가 없습니다.');
			</script>
		</c:if>
		<a href="loginPage">로그인</a>/<a href="insertPage">회원가입</a>
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
	<h3><a href="qnaList?pNo=10000">상품문의 게시판</a></h3>
</body>
</html>