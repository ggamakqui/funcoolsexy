<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
		
	/* for all templates and grids */
	body{text-align:center;}
	#ft{clear:both;}
	/**/
	/* 750 centered, and backward compatibility */ 
	#doc,#doc2,#doc3,.yui-t1,.yui-t2,.yui-t3,.yui-t4,.yui-t5,.yui-t6,.yui-t7 {
		margin:auto;text-align:left;
		width:57.69em;*width:56.3em;min-width:750px;}
	/* 950 centered */ 
	#doc2 {
		width:73.074em;*width:71.313em;min-width:950px;}
	/* 100% with 10px viewport side matting */ 
	#doc3 {
		margin:auto 10px; /* not for structure, but so content doesn't bleed to edge */
		width:auto;}
		
	/* below required for all fluid grids; adjust widths and margins above accordingly */
	
		/* to preserve source-order independence for Gecko */
		.yui-b{position:relative;}
		.yui-b{_position:static;} /* for IE < 7 */
		#yui-main .yui-b{position:static;} 
	
	#yui-main {width:100%;}
	.yui-t1 #yui-main,
	.yui-t2 #yui-main,
	.yui-t3 #yui-main{float:right;margin-left:-25em;/* IE: preserve layout at narrow widths */}
	
	.yui-t4 #yui-main,
	.yui-t5 #yui-main,
	.yui-t6 #yui-main{float:left;margin-right:-25em;/* IE: preserve layout at narrow widths */}
	
	.yui-t1 .yui-b {
		float:left;
	    width:12.3207em;*width:12.0106em;}
	.yui-t1 #yui-main .yui-b{
	    margin-left:13.3207em;*margin-left:13.0106em;
	}
	
	.yui-t2 .yui-b {
		float:left;
	    width:13.8456em;*width:13.512em;}
	.yui-t2 #yui-main .yui-b {
	    margin-left:14.8456em;*margin-left:14.512em;
	}
	
	.yui-t3 .yui-b {
		float:left;
	    width:23.0759em;*width:22.52em;}
	.yui-t3 #yui-main .yui-b {
	    margin-left:24.0759em;*margin-left:23.52em;
	}
	
	.yui-t4 .yui-b {
		float:right;
	    width:13.8456em;*width:13.512em;}
	.yui-t4 #yui-main .yui-b {
	    margin-right:14.8456em;*margin-right:14.512em;
	}
	
	.yui-t5 .yui-b {
		float:right;
	    width:18.4608em;*width:18.016em;}
	.yui-t5 #yui-main .yui-b {
	    margin-right:19.4608em;*margin-right:19.016em;
	}
	
	.yui-t6 .yui-b {
		float:right;
	    width:23.0759em;*width:22.52em;}
	.yui-t6 #yui-main .yui-b {
	    margin-right:24.0759em;*margin-right:23.52em;
	}
	
	.yui-t7 #yui-main .yui-b {
		display:block;margin:0 0 1em 0;
	}
	#yui-main .yui-b {float:none;width:70%;}
	/* GRIDS (not TEMPLATES) */
	.yui-g .yui-u, 
	.yui-g .yui-g, 
	.yui-gc .yui-u,
	.yui-gc .yui-g .yui-u,
	.yui-ge .yui-u, 
	.yui-gf .yui-u{float:right;display:inline;}
	.yui-g div.first, 
	.yui-gc div.first,
	.yui-gc div.first div.first,
	.yui-gd div.first, 
	.yui-ge div.first, 
	.yui-gf div.first{float:left;}
	.yui-g .yui-u, 
	.yui-g .yui-g{width:49.1%;}
	.yui-g .yui-g .yui-u,
	.yui-gc .yui-g .yui-u {width:48.1%;}
	.yui-gb .yui-u, 
	.yui-gc .yui-u, 
	.yui-gd .yui-u{float:left;margin-left:2%;*margin-left:1.895%;width:32%;}
	.yui-gb div.first, 
	.yui-gc div.first, 
	.yui-gd div.first{margin-left:0;}
	.yui-gc div.first, 
	.yui-gd .yui-u{width:66%;}
	.yui-gd div.first{width:32%;}
	.yui-ge .yui-u{width:24%;}
	.yui-ge div.first, 
	.yui-gf .yui-u{width:74.2%;}
	.yui-gf div.first{width:24%;}
	.yui-ge div.first{width:74.2%;}
	#bd:after,
	.yui-g:after, 
	.yui-gb:after, 
	.yui-gc:after, 
	.yui-gd:after, 
	.yui-ge:after, 
	.yui-gf:after{content:".";display:block;height:0;clear:both;visibility:hidden;}
	#bd,
	.yui-g, 
	.yui-gb, 
	.yui-gc, 
	.yui-gd, 
	.yui-ge, 
	.yui-gf{zoom:1;}
	
	/* Basic Element Formatting */
	
	#header{
		height:100px;
		background-color:#F3F2ED;
		margin:0;
		padding:0;
		}
		
	#header h1{
		font-size:1em;
		margin:0;
		padding:10px;
		}
		
	#header h1 a{
		color:#000000;
		background-color:#F3F2ED;
		}
	
	.content{
		height:300px;
		background:#CCC8B3;
		border-top:#FFFFFF 2px solid;
		margin:0;
		padding:0;
		}
	
	#secondary{
		height:300px;
		background:#F6F0E0;
		border-top:#FFFFFF 2px solid;
		margin:0;
		padding:0;
		}
	
	#secondaryFull{
		height:50px;
		background-color:#CFB59F;
		border-top:#FFFFFF 2px solid;
		margin:0;
		padding:0;
		}

	.dataTable {
		margin: auto;
		padding: 30px;
		width: 80%;
	}
	
</style>
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
</head>
<body>

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

</body>
</html>