<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="../template/header.jsp">
   <jsp:param value="Order" name="title" />
</jsp:include>
<link href="resources/css/orderList.css" media="all" rel="stylesheet" type="text/css"/>
<div class="visual"><img src="resources/images/1.jpg" alt=""></div>
</header>
</head>
<body>

<div class="wrap">
	<div class="head"><h1>${mName }님의 주문 리스트</h1></div>
	<div class="main">
		<div class="contents">		
			<c:forEach var="orderDate" items="${oDatelist}">
					<div id="date" >주문일 : ${orderDate }</div>
					<div class="table">
						<div class="thead">
							<div class="tcell">주문번호</div>
							<div class="tcell">주문자</div>
							<div class="tcell">상품정보</div>
							<div class="tcell">수량</div>
							<div class="tcell">결제금액</div>
						</div>
					</div>
						<div class="table">
					<c:forEach var="olist" items="${oList}" >
						<c:if test="${orderDate eq olist.oDate}">
							<div class="tbody">
								<div class="tbcell">${olist.oNo }</div> 
								<div class="tbcell">${olist.oName }</div> 
								<div class="tbcell">${olist.pName }(사이즈:${olist.cSize })</div> 
								<div class="tbcell">${olist.cartQuantity }</div> 
								<div class="tbcell"><fmt:formatNumber value="${olist.pPrice * olist.cartQuantity }" pattern="#,##0" />원</div>
							</div>
						</c:if>
					</c:forEach>
						</div>
			</c:forEach>
		</div >		
	</div>
</div>
</body>
 <%@ include file="../template/footer.jsp" %>
</html>