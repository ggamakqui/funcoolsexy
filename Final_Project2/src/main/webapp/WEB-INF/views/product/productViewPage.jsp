<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	.wrap_prd {
		overflow: visible;
		position: relative;
	}
	.prodInfo {
		float: left;
	}
	
</style>
</head>
<body>
	
	<!-- 전체페이지박스 -->
	<div id="container">
		<div class="show_area">
			<div class="prd_detail_basic">
				<div class="image_view">
					<div class="bimg">
						<div class="img">
							<img alt="메인이미지" src="">
						</div>
					</div>
					<div class="thumbnail_area">
						<span class="image_box">
							<a href="#"><img alt="" src=""></a>
							<a href="#"><img alt="" src=""></a>
							<a href="#"><img alt="" src=""></a>
							<a href="#"><img alt="" src=""></a>
							<a href="#"><img alt="" src=""></a>
						</span>
					</div>
				</div>
				<div class="info">
					<form action="">
						<h3 class="name">${pDTO.pName }</h3>
						<table class="list">
							<tbody>
								<tr>
									<td>가격</td>
									<td>${pDTO.pPrice }</td>
								</tr>
								<tr>
									<td>사이즈</td>
									<td>S, M, L</td>
								</tr>
								<tr>
									<td>상품제조회사</td>
									<td>${pDTO.pCompany }</td>
								</tr>
								<tr>
									<td>재고</td>
									<td>${pDTO.pStock }개</td>
								</tr>
								<tr>
									<td>상품등록일</td>
									<td>${pDTO.pRegdate }</td>
								</tr>
							</tbody>
						</table>
						<div class="order">
								<div class="prod_option">
									<ul class="options">
										<li style="z-index:20">
											<em>옵션</em>
											<ul class="check_option">
												<li>
													<div class="selectbox_auto">
														<div class="selectbox-box">
															<div class="selectbox-label" unselectable="on">
																사이즈 선택
															</div>
															<select class="choose_option" title="옵션 선택">
																<option value="-1">선택</option>
																<option value="S">S(SMALL)</option> 
																<option value="M">M(MEDIUM)</option> 
																<option value="L">L(LARGE)</option> 
															</select>
														</div>
													</div>
												</li>
											</ul>
										</li>
									</ul>
								</div>	
								<div class="prod_order">
									<div class="opt_price">
										<div class="parent_area_list" style="display:none">
											<strong class="blind">선택한 상품</strong>
											<ul class="add_option_product_area"></ul>
										</div>
									</div>
									<div class="sum_total">
										<span class="num">
										총 수량<span class="total_count">0</span>개
										</span>
										<span class="bar">|</span>
										<em>총 상품금액</em>
									</div>
									<div class="btn_order">
										<input type="button" value="장바구니"/>
										<input type="button" value="구매하기"/>
										<span class="cart"><a href="#" title="장바구니"></a></span>
										<span class="cart"><a href="#" title="구매하기"></a></span>
									</div>
								</div>
							</div>
						</form>
						</div>
						<div class="prod_detail">

						</div>
					</div>
				</div>
			</div>

</body>
</html>