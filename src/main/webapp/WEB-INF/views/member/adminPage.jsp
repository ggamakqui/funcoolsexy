<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../template/header.jsp">
	<jsp:param value="로그인" name="title" />
</jsp:include>
<div class="visual"><img src="resources/images/2.jpg" alt=""></div>

<style>
	
	.text{
		font-size: 30px;
	}
	.content{
		text-align: center;
	}

</style>
</header>


<main>
	<div class="contents">
	 <h2 class="h2">FCS 관리자 페이지</h2>
     <p style="font-size: 35px;">사이트 관리</p>
                
		<div class="content">
			<a class="text" href="categoryListPage">카테고리관리</a><br/><br/>
			<!-- <a class="text" href="">상품관리</a><br/><br/> -->
			<a class="text" href="userManagementPage">회원관리</a>
	
		</div>
	</div>
</main>
<%@ include file="../template/footer.jsp" %>