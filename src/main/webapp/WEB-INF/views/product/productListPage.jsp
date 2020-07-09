<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<a href="productInsertPage">새 상품 등록하기</a>
	<table border="1">
	
		<thead>
			<tr>
				<td>상품번호</td>
				<td>썸네일</td>
				<td>상품명</td>
				<td>가격</td>
				<td>브랜드</td>
				<td>S사이즈 재고</td>
				<td>M사이즈 재고</td>
				<td>L사이즈 재고</td>
			</tr>
		</thead>
		
		<tbody>
			<c:if test="${empty list}">
				<td colspan="8">
					상품없음
				</td>
			</c:if>
			<c:if test="${not empty list}">
				<c:forEach var="pDTO" items="${list}">
					<tr>
						<td>${pDTO.pNo}</td>
						<!-- alt="${iDTO.iFilename}"  이미지가 아닌 파일이 업로드되면 파일명이 나타난다.  -->
						<%-- <%=request.getContextPath()%>  는 ${pageContext.request.contextPath} 이다. --%>
						<td><a href="productUpdatePage?pNo=${pDTO.pNo }"><img alt="${pDTO.pThumbnail}" src="${pageContext.request.contextPath}/resources/storage/${pDTO.pThumbnail}"></a></td>
						<td>${pDTO.pName}</td>
						<td>${pDTO.pPrice}</td>
						<td>${pDTO.pCompany}</td>
						<td>${pDTO.pStock1}</td>
						<td>${pDTO.pStock2}</td>
						<td>${pDTO.pStock3}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
		
	</table>
</body>
</html>