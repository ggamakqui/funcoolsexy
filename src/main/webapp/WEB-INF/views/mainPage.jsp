<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	ul {
		list-style-type: none;
		margin: 0;
		padding: 0;
		overflow: hidden;
		background-color: #333;
		}
	
	li {
	  float: left;
	}
	
	li a, .dropbtn {
		display: inline-block;
		color: white;
		text-align: center;
		padding: 14px 16px;
		text-decoration: none;
	}
	
	li a:hover, .dropdown:hover .dropbtn {
		background-color: red;
	}
	
	li.dropdown {
		display: inline-block;
	}
	
	.dropdown-content {
		display: none;
		position: absolute;
		background-color: #f9f9f9;
		min-width: 160px;
		box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
		z-index: 1;
	}
	
	.dropdown-content a {
		color: black;
		padding: 12px 16px;
		text-decoration: none;
		display: block;
		text-align: left;
	}
	
	.dropdown-content a:hover {background-color: #f1f1f1;}
	
	.dropdown:hover .dropdown-content {
		display: block;
	}
		  

</style>

<!--  <link rel="stylesheet" type="text/css" href="resources/assets/styles/category.css"> -->
</head>
<body>
   <ul>
		<li class="dropdown">
		   <a href="javascript:void(0)" class="dropbtn">브랜드별 남성</a>
		  <div class="dropdown-content">
				<c:forEach var="pDTO" items="${list1 }">
				<a href="selectProductByMaleBrand?pCompany=${pDTO.pCompany}" >${pDTO.pCompany }</a>
				</c:forEach>
		  </div>
		</li>
	     <li class="dropdown">
	        <a href="javascript:void(0)" class="dropbtn">브랜드별 여성</a>
	        <div class="dropdown-content">
	           <c:forEach var="pDTO" items="${list2 }">
	               <a href="selectProductByFemaleBrand?pCompany=${pDTO.pCompany}" >${pDTO.pCompany }</a>
	           </c:forEach>
	       </div>
	     </li>
	     <li class="dropdown">
	        <a href="javascript:void(0)" class="dropbtn">남성</a>
	       <div class="dropdown-content">
	          <c:forEach var="cDTO" items="${list3 }">
	              <a href="selectProductByMaleCategory?pCategory=${cDTO.cNo }">${cDTO.cName }</a>
	           </c:forEach>
	       </div>
	     </li>
	     <li class="dropdown">
	        <a href="javascript:void(0)" class="dropbtn">여성</a>
	       <div class="dropdown-content">
	          <c:forEach var="cDTO" items="${list4 }">
	               <a href="selectProductByFemaleCategory?pCategory=${cDTO.cNo }">${cDTO.cName }</a>
	            </c:forEach>
	       </div>
	     </li>
	     	<li class="dropdown">
	       <a href="javascript:void(0)" class="dropbtn">etc</a>
	       <div class="dropdown-content">
	          <c:forEach var="cDTO" items="${list5 }">
	               <a href="selectProductEtc?pCategory=${cDTO.cNo }">${cDTO.cName }</a>
	            </c:forEach>
	       </div>
  		</li>
	</ul>
	
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
	<br/>
	<a href="listPage">공지사항</a>
	<h3><a href="qnaList?pNo=10000">상품문의 게시판</a></h3>
</body>
</html>