<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>나의 주문 리스트</h3>
	<table>
		<thead>
			<tr>
				<td>주문일</td>
				<td>주문번호</td>
				<td>주문자</td>
				<td>상품정보</td>
				<td>가격</td>
				<td>사이즈</td>
				<td>수량</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${oList eq null }">
				<tr>
					<td colspan="4">
						주문하신 상품이 없습니다.
					</td>
				</tr>
			</c:if>
			<c:if test="${oList ne null }">
				<c:forEach var="oList" items="${oList}">
					<tr>
						<td>${oList.oDate }</td>
						<td>${oList.oNo }</td>
						<td>${oList.oName }</td>
						<td>${oList.pName }<br/>${oList.pDescription }</td>
						<td>${oList.pPrice }</td>
						<td>${oList.cSize }</td>
						<td>${oList.cartQuantity }</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</body>
</html>