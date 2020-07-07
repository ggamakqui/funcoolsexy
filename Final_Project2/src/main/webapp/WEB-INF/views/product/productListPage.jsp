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
}

.wrap_inner {
	width: 100%;
	display: flex;
}

.box {
	width: 300px;
	border: 1px solid black;
	height: 400px;
	float: left;
	margin: 10px;
}

.prodImg {
	width: 100%;
	height: 270px;
	border: 1px solid black;
}

.disable {
		color: lightgray;
	}
.page {
	text-align: center;
	font-size: 20px;
}
.info {
	text-align: center;
}

</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
<!--  <link rel="stylesheet" type="text/css" href="resources/assets/styles/itemList.css"> -->
</head>
<body>
	
	<div id="cnt">
		<div class="cntbody">
			<div id="big_section">
				<div class="total_sort">
					<!-- 카테고리 별 전체 상품 갯수 보여주기 -->
					<p class="total">${totalCount}개의 상품</p> 
				</div>
				<div class="wrap_inner">
					<ul class="prd_basic">
						<c:if test="${empty list }">
							없음
						</c:if>
						<c:if test="${not empty list }">
							<c:forEach var="pDTO" items="${list}">
								<div class="box">
									<li>
										<div class="prodImg">
											<!-- 제품 이미지 클릭하면 상품 디테일 뷰로 넘어감 -->
											<a href="selectProductDetail?pNo=${pDTO.pNo}">
												<img title="상품보러가기" alt="${pDTO.pThumbnail}" src="${pageContext.request.contextPath}/resources/storage/${pDTO.pThumbnail}">
											</a>
										</div>
										<div class="info">
											<!-- 제품명 클릭해도 상품 디테일 뷰로 넘어감 -->
											<p class="name"><a href="selectProductDetail?pNo=${pDTO.pNo}">${pDTO.pName }</a></p>
											<p>${pDTO.pDescription }</p>
											<p>가격: ${pDTO.pPrice }</p>
										</div>
									</li>
								</div>
							</c:forEach>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 페이지 구역 -->
	<div class="page">
		<!-- 1. 이전 페이지 버튼 -->
		<c:if test="${pVO.beginBlock <= pVO.pagePerBlock }">
			<span class="disable"><i class="fas fa-chevron-circle-left"></i>&nbsp;</span>
		</c:if>
		<c:if test="${pVO.beginBlock > pVO.pagePerBlock }">
			<c:choose>
				<c:when test="${selectList eq 'selectProductByMaleBrand' or selectList eq 'selectProductByFemaleBrand'}">
					<a href="${selectList}?page=${pVO.beginBlock - 1 }&pCompany=${pCompany }"><i class="fas fa-chevron-circle-left"></i>&nbsp;</a>
				</c:when>
				<c:otherwise>
					<a href="${selectList}?page=${pVO.beginBlock - 1 }&pCategory=${pCategory }"><i class="fas fa-chevron-circle-left"></i>&nbsp;</a>
				</c:otherwise>
			</c:choose>
		</c:if>
		<!-- 2. 페이지 번호 -->
		<c:forEach var="p" begin="${pVO.beginBlock }" end="${pVO.endBlock }" step="1">
			<c:if test="${p == pVO.page }">
				<span class="disable">${p }&nbsp;</span>
			</c:if>
			<c:if test="${p != pVO.page }">
				<c:choose>
					<c:when test="${selectList eq 'selectProductByMaleBrand' or selectList eq 'selectProductByFemaleBrand'}">
						<a href="${selectList}?page=${p }&pCompany=${pCompany }">${p }&nbsp;</a>
					</c:when>
					<c:otherwise>
						<a href="${selectList}?page=${p }&pCategory=${pCategory }">${p }&nbsp;</a>
					</c:otherwise>
				</c:choose>
			</c:if>
		</c:forEach>
		<!-- 3. 다음 페이지 버튼 -->
		<c:if test="${pVO.endBlock >= pVO.totalPage }">
			<span class="disable"><i class="fas fa-chevron-circle-right"></i></span>
		</c:if>
		<c:if test="${pVO.endBlock < pVO.totalPage }">
			<c:choose>
				<c:when test="${selectList eq 'selectProductByMaleBrand' or selectList eq 'selectProductByFemaleBrand'}">
					<a href="${selectList}?page=${pVO.beginBlock + pVO.pagePerBlock }&pCompany=${pCompany }"><i class="fas fa-chevron-circle-right"></i></a>
				</c:when>
				<c:otherwise>
					<a href="${selectList}?page=${pVO.beginBlock + pVO.pagePerBlock }&pCategory=${pCategory }"><i class="fas fa-chevron-circle-right"></i></a>
				</c:otherwise>
			</c:choose>
		</c:if>
	</div>
	
</body>
</html>