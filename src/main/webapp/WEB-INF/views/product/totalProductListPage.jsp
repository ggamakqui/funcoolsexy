<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="../template/header.jsp">
   <jsp:param value="Order" name="title" />
</jsp:include>
<link href="resources/css/totalProductList.css" media="all" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
<div class="visual"><img src="resources/images/1.jpg" alt=""></div>
</header>

<body>
<script type="text/javascript">
	
</script>
</head>
<body>
	
	<div class="wrap">
		<div class="h-title"><h3>FCS 전체 상품 리스트</h3></div>
		<div class="productList">
			<div class="productTable">
				<table class="pt" border="1">
					<thead>
						<tr>
							<th>상품번호</th>
							<th>상품이름</th>
							<th>제조회사</th>
							<th>가격</th>
							<th>재고(S)</th>
							<th>재고(M)</th>
							<th>재고(L)</th>
							<th>상품등록일</th>
							<th>재고수정</th>
							<th>상품수정</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="prodList" items="${list}">
							<tr>
								<td>${prodList.pNo}</td>
								<td>${prodList.pName}</td>
								<td>${prodList.pCompany}</td>
								<td><fmt:formatNumber value="${prodList.pPrice}" pattern="#,##0" /></td>
								<td>${prodList.pStock1}ea</td>
								<td>${prodList.pStock2}ea</td>
								<td>${prodList.pStock3}ea</td>
								<td>${prodList.pRegdate}</td>
								<td><button onclick="location.href='goUpdateProductQuantityPage?pNo=${prodList.pNo}'">수정</button></td>
								<td><button onclick="location.href='productUpdatePage?pNo=${prodList.pNo }'">수정</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
		</div>
	</div>
	</div>

	
	
</body>
 <%@ include file="../template/footer.jsp" %>
</html>