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
		<c:if test="${empty cName }">
			<c:if test="${pGender == 1 }">
				<h2>남성 ${value }</h2>
			</c:if>
			<c:if test="${pGender == 2 }">
				<h2>여성 ${value }</h2>
			</c:if>
		</c:if>
		<c:if test="${not empty cName }">
			<c:if test="${pGender == 1 }">
				<h2>남성 ${cName }</h2>
			</c:if>
			<c:if test="${pGender == 2 }">
				<h2>여성 ${cName }</h2>
			</c:if>
			<c:if test="${pGender == 3 }">
				<h2>Accessories ${cName }</h2>
			</c:if>
		</c:if>
		<ul class="clear">
	        <c:forEach var="pDTO" items="${list}">
			<li>
				<a href="productDetailViewPage?pNo=${pDTO.pNo }&var=${var}&pGender=${pDTO.pGender}">
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
	<!-- 페이지 구역 -->
   <div class="page" style="text-align:center">
      <!-- 1. 이전 페이지 버튼 -->
      <c:if test="${pVO.beginBlock <= pVO.pagePerBlock }">
         <span class="disable"><i class="fas fa-chevron-circle-left"></i>&nbsp;</span>
      </c:if>
      <c:if test="${pVO.beginBlock > pVO.pagePerBlock }">
            <a href="selectProductList?page=${pVO.beginBlock - 1 }&var=${var}&pGender=${pGender}"><i class="fas fa-chevron-circle-left"></i>&nbsp;</a>
      </c:if>
      <!-- 2. 페이지 번호 -->
      <c:forEach var="p" begin="${pVO.beginBlock }" end="${pVO.endBlock }" step="1">
         <c:if test="${p == pVO.page }">
            <span class="disable">${p }&nbsp;</span>
         </c:if>
         <c:if test="${p != pVO.page }">
            <a href="selectProductList?page=${p }&var=${var}&pGender=${pGender}">${p }&nbsp;</a>
         </c:if>
      </c:forEach>
      <!-- 3. 다음 페이지 버튼 -->
      <c:if test="${pVO.endBlock >= pVO.totalPage }">
         <span class="disable"><i class="fas fa-chevron-circle-right"></i></span>
      </c:if>
      <c:if test="${pVO.endBlock < pVO.totalPage }">
         <a href="selectProductList?page=${pVO.beginBlock + pVO.pagePerBlock }&var=${var}&pGender=${pGender}"><i class="fas fa-chevron-circle-right"></i></a>
      </c:if>
   </div>
</body>
<%@ include file="../template/footer.jsp" %>
</html>