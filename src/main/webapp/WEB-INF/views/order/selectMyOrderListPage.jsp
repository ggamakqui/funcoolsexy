<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>나의 주문 리스트</h2>
	<table border="1">
		<thead>
			<c:forEach var="orderDate" items="${oDatelist}">
				<tr>
					<th rowspan="7">주문일 : ${orderDate }</th>
					<c:forEach var="olist" items="${oList}" >
				</tr>
				<tr>
						<c:if test="${orderDate eq olist.oDate}">
							<td>${olist.oNo }</td> 
							<td>${olist.oName }</td>
							<td>${olist.pName }<br/>${olist.pDescription }</td>
							<td>${olist.pPrice }</td>
							<td>${olist.cSize }</td>
							<td>${olist.cartQuantity }</td>
							<td>${olist.pPrice * olist.cartQuantity }</td>
						</c:if>
					</c:forEach>
				</tr>
		</c:forEach>
		</thead>
		
	</table>
</body>
</html>