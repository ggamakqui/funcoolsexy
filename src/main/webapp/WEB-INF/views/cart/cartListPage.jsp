<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../template/header.jsp">
   <jsp:param value="장바구니" name="title" />
</jsp:include>
<style type="text/css">
	

</style>

<div class="visual"><img src="resources/images/1.jpg" alt=""></div>
</header>

	<body>
<script type="text/javascript">
	function fn_delete(f) {
		f.action = 'cartDelete';
		f.submit();
	}
	function fn_quantityDown(f) {
		f.action = 'quantityDown';
		f.submit();
	}
	function fn_quantityUp(f) {
		f.action = 'quantityUp';
		f.submit();
	}
</script>
<div class="content">
	<div id="doc3" class="yui-t4">
		<h1><span id="id">${mId}님의 장바구니</span></h1>
		<div id="bd">
			<div id="yui-main">
				<div class="yui-b">
					<div class="content">
						<table class="dataTable" border="1">
							<thead>
								<tr>
									<td>품목</td>
									<td>상품번호</td>
									<td>상품이름</td>
									<td>제조사</td>
									<td>사이즈</td>
									<td>상품가격</td>
									<td>수량</td>
									<td>총 가격</td>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty list}">
									<tr>
										<td colspan="8">목록이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${not empty list }">
									<c:forEach var="pDTO" items="${list}">
										<c:if test="${pDTO.cValidate eq 0}">
											<tr>
												<td>(이미지)</td>
												<td>
													${pDTO.pNo}<br/>
												</td>
												<td>
													${pDTO.pName}<br/>
												</td>
												<td>
													${pDTO.pCompany}<br/>
												</td>
												<td>
													${pDTO.cSize}<br/>
												</td>
												<td>
													<fmt:formatNumber value="${pDTO.pPrice}" />원<br/>
												</td>
												<td>
													<form>
														<input type="hidden" name="cartNo" value="${pDTO.cartNo}" />
														<input type="hidden" name="mId" value="${mId}" />
														<input type="hidden" name="cSize" value="${pDTO.cSize}" />
														<input type="hidden" name="pStock1" value="${pDTO.pStock1}" />
														<input type="hidden" name="pStock2" value="${pDTO.pStock2}" />
														<input type="hidden" name="pStock3" value="${pDTO.pStock3}" />
														<input type="button" value="-" onclick="fn_quantityDown(this.form)" />
														<input type="text" name="cartQuantity" value="${pDTO.cartQuantity}" readonly />
														<input type="button" value="+" onclick="fn_quantityUp(this.form)" />
													</form>
												</td>			
												<td>
													<form>
														<input type="hidden" name="cartNo" value="${pDTO.cartNo}" />
														<input type="hidden" name="mId" value="${mId}" />
														<fmt:formatNumber value="${pDTO.pPrice * pDTO.cartQuantity}" />원<br/><br/><br/>
														<input type="button" value="제거" onclick="fn_delete(this.form)" />											
													</form>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</c:if>
							</tbody>
					</table>
					</div>
				</div>
			</div>
			<div class="yui-b">
				<div id="secondary">
					<form action="orderPageFromCart" method="POST">		
				<div class="showTotalPrice">
					<div class="total">상품합계(${count} 품목):&nbsp;<fmt:formatNumber value="${total}" />원</div>
				</div>
				<div class="sendOrder">
					<input type="hidden" name="list" value="${list}">
					<input type="hidden" name="total" value="${total}" />
					<input type="hidden" name="mId" value="${mId}" />
					<input type="submit" value="주문하기">
				</div>		
			</form>	
				</div>
			</div>
		</div>
	</div>
	</div>
	</body>
 <%@ include file="../template/footer.jsp" %>
 </html>