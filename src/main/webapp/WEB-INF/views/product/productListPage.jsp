<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp" />

<div class="visual"><img src="resources/images/1.jpg" alt=""></div>
</header>
<body>
<script type="text/javascript">

</script>
	
	<section class="info_box">
		<br/>
		<c:if test="${not empty param.pCategory }">
			<c:if test="${param.pCategory < 21 }">
				<h2>남성 ${cName }</h2>
			</c:if>
			<c:if test="${param.pCategory >= 21 and param.pCategory < 31 }">
				<h2>여성 ${cName }</h2>
			</c:if>
			<c:if test="${param.pCategory >= 31 }">
				<h2>etc ${cName }</h2>
			</c:if>
		</c:if>
		<c:if test="${not empty param.pCompany }">
			<h2>${param.pCompany }</h2>
		</c:if>
		<ul class="clear">
	        <c:forEach var="pDTO" items="${list}">
			<li>
				<a href="productDetailViewPage?pNo=${pDTO.pNo }">
					<em><img src="${pageContext.request.contextPath}/resources/storage/${pDTO.pThumbnail}" alt="${pDTO.pThumbnail}"></em>
					<div>
						<h3>${pDTO.pName}</h3>
						<p>
							${pDTO.pDescription}
							
						</p>
						
						<div>${pDTO.pPrice}원</div>
					</div>
				</a>
				<c:if test="${loginDTO.mId eq 'admin' }">
					<a href="productUpdatePage?pNo=${pDTO.pNo }">수정하기</a>
				</c:if>
			</li>
			</c:forEach>    
			
                
		</ul>
					            
	</section>
		
</body>
<%@ include file="../template/footer.jsp" %>
</html>