<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<script type="text/javascript">
	

	function fn_totalPrice(f){
		var price = '${pDTO.pPrice}';
		var total = document.querySelector('#total');
		total.innerHTML = (f.cartQuantity.value * price) + '원';
	}
	
	function fn_countUp(f){
		f.cartQuantity.value = f.cartQuantity.value - 1 + 2;
		fn_totalPrice(f);
		
	}
	function fn_countDown(f){
		if(f.cartQuantity.value > 1){
			f.cartQuantity.value = f.cartQuantity.value - 1;
			fn_totalPrice(f);
		}
		
	}


	function fn_directOrder(f){
		
		var stock = 0;
		if(confirm('주문하시겠습니까?')){
			switch(f.cSize.value){
			case 'S':
				stock = '${pDTO.pStock1}';
				break;
			case 'M':
				stock = '${pDTO.pStock2}';
				break;
			case 'L':
				stock = '${pDTO.pStock3}';
				break;
			}
			if(f.cartQuantity.value == 0){
				alert('주문수량은 0보다 큰 숫자를 입력해 주세요.');
				return;
			}
			if(f.cartQuantity.value > stock){
				alert('재고수량보다 많이 주문할 수 없습니다. (현재 재고 : ' + stock + '개)');
				return;
			}
			f.action = 'directOrder';
			f.submit();
		}
		
	}
	function fn_addCartList(f){
		var stock = 0;
		if(confirm('장바구니에 추가하시겠습니까?')){
			switch(f.cSize.value){
			case 'S':
				stock = '${pDTO.pStock1}';
				break;
			case 'M':
				stock = '${pDTO.pStock2}';
				break;
			case 'L':
				stock = '${pDTO.pStock3}';
				break;
			}
			if(f.cartQuantity.value == 0){
				alert('주문수량은 0보다 큰 숫자를 입력해 주세요.');
				return;
			}
			if(f.cartQuantity.value > stock){
				alert('재고수량보다 많이 주문할 수 없습니다. (현재 재고 : ' + stock + '개)');
				return;
			}
			f.action = 'addCartList';
			f.submit();
			if(confirm('장바구니에 추가되었습니다. 계속 쇼핑하시겠습니까?')){
				return;
			}else{
				f.action = 'goCartList';
			}
			
		}
	}
	function fn_goLoginPage(f){
		alert('로그인 후 구매 가능합니다.');
		f.action = 'loginPage';
		f.submit();
	}
	
	
	
</script>
</head>
	<body>
	   
   <!-- 전체페이지박스 -->

            <div class="image_view">
               <div class="bimg">
                  <div class="img">
                     <img alt="썸네일이미지" src="${pageContext.request.contextPath}/resources/storage/${pDTO.pThumbnail}"><br/>
                     <img alt="상세이미지" src="${pageContext.request.contextPath}/resources/storage/${pDTO.pFilename}"><br/>
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
                           <td>브랜드</td>
                           <td>${pDTO.pCompany }</td>
                        </tr>
                        <tr>
                           <td>S사이즈 재고</td>
                           <td>${pDTO.pStock1 }개</td>
                        </tr>
                        <tr>
                           <td>M사이즈 재고</td>
                           <td>${pDTO.pStock2 }개</td>
                        </tr>
                        <tr>
                           <td>L사이즈 재고</td>
                           <td>${pDTO.pStock3 }개</td>
                        </tr>
                        <tr>
                           <td>상품등록일</td>
                           <td>${pDTO.pRegdate }</td>
                        </tr>
                        <tr>
                        	<td>
                        		<select name="cSize">
                        			<option value="S">S</option>
                        			<option value="M">M</option>
                        			<option value="L">L</option>
                        		</select>
                        		<input type="text" name="cartQuantity" value="1" onkeyup="fn_totalPrice(this.form)"/>
                        		<input type="button" value="+" onclick="fn_countUp(this.form)"/>
                        		<input type="button" value="-" onclick="fn_countDown(this.form)"/>
                        		<input type="hidden" name="pNo" value="${pDTO.pNo }"/>
                        		<input type="hidden" name="mId" value="${loginDTO.mId }"/>
                        		<span id="total"></span>
                        	</td>
                        </tr>
                        <tr>
                        	<td colspan="2">
                        		<c:if test="${not empty loginDTO }">
                        			<input type="button" value="주문하기" onclick="fn_directOrder(this.form)"/>
                        		</c:if>
                        		<c:if test="${empty loginDTO }">
                        			<input type="button" value="주문하기" onclick="fn_goLoginPage(this.form)"/>
                        		</c:if>
                        		<input type="button" value="장바구니에 담기" onclick="fn_addCartList(this.form)"/>
                        		<input type="button" value="목록으로 이동" onclick="history.back()"/>
                        		<a href='reviewList?pNo=${pDTO.pNo }'>리뷰 보기</a>
                        	</td>
                        </tr>
                     </tbody>
                  </table>
               </form>
            </div>
	</body>
</html>