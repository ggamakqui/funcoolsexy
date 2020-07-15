<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	

$(document).ready(function(){
	
	$('#oName').val('${loginDTO.mName}');
	$('#oEmail').val('${loginDTO.mEmail}');
	$('#oMobile1').val('${loginDTO.mMobile1}');
	$('#oMobile2').val('${loginDTO.mMobile2}');
	$('#oMobile3').val('${loginDTO.mMobile3}');
	$('#oPost').val('${loginDTO.mPost}');
	$('#oAddr1').val('${loginDTO.mAddr1}');
	$('#oAddr2').val('${loginDTO.mAddr2}');
	$('#oAddr3').val('${loginDTO.mAddr3}');

	// 체크되어 있다
	$('#resetInfo').change(function(){
		if ( $('#resetInfo').is(':checked') ) {
			$('#oName').val('${loginDTO.mName}');
			$('#oEmail').val('${loginDTO.mEmail}');
			$('#oMobile1').val('${loginDTO.mMobile1}');
			$('#oMobile2').val('${loginDTO.mMobile2}');
			$('#oMobile3').val('${loginDTO.mMobile3}');
			$('#oPost').val('${loginDTO.mPost}');
			$('#oAddr1').val('${loginDTO.mAddr1}');
			$('#oAddr2').val('${loginDTO.mAddr2}');
			$('#oAddr3').val('${loginDTO.mAddr3}');
		} else {
			$('#oName').val('');
			$('#oEmail').val('');
			$('#oMobile1').val('');
			$('#oMobile2').val('');
			$('#oMobile3').val('');
			$('#oPost').val('');
			$('#oAddr1').val('');
			$('#oAddr2').val('');
			$('#oAddr3').val('');
		}
	});
});
	
	function inputCheck(f) {
		var nameCheckResult = document.querySelector('#nameCheckResult');
		if (f.oName.value == '' ) {
			nameCheckResult.textContent = '이름을 입력해주세요.';
		} else {
			nameCheckResult.textContent = '';
		}
	}
		
	
	//주소 api
	function execDaumPostcode() {
	     new daum.Postcode({
	         oncomplete: function(data) {
	             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	             // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	             var roadAddr = data.roadAddress; // 도로명 주소 변수
	             var extraRoadAddr = ''; // 참고 항목 변수
	
	             // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	             // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	             if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                 extraRoadAddr += data.bname;
	             }
	             // 건물명이 있고, 공동주택일 경우 추가한다.
	             if(data.buildingName !== '' && data.apartment === 'Y'){
	                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	             }
	             // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	             if(extraRoadAddr !== ''){
	                 extraRoadAddr = ' (' + extraRoadAddr + ')';
	             }
	
	             // 우편번호와 주소 정보를 해당 필드에 넣는다.
	             document.getElementById('oPost').value = data.zonecode;
	             document.getElementById("oAddr1").value = roadAddr;
	             document.getElementById("oAddr2").value = data.jibunAddress;
	           
	         }
	     }).open();
	 }
	
	function fn_submitOrder(f) {
		
		// 각 항목 중 하나라도 비워져 있으면 alert 뜨게 구현 필요
		f.action = 'submitOrder';
		f.submit();
	}
	
	function fn_submitOrderFromCart(f) {
		f.action = 'submitOrderFromCart';
		f.submit();
	}
	
	function func1() {
		
		if (f.oName.value == '' ) {
			document.querySelector('#nameCheckResult').innerHTML = '이름을 입력해주세요.';
			document.querySelector('#nameCheckResult').style.color = 'red';
		} else {
			document.querySelector('#nameCheckResult').innerHTML = '';
		}

	}
	
</script>
</head>
<body>
	
	<div class="orderProductList">
		<h3>주문상품</h3>
		<table border="1">
			<thead>
				<tr>
					<th>상품정보</th>
					<th>사이즈</th>
					<th>가격</th>
					<th>수량</th>
					<th>총금액</th>
				</tr>
			</thead>
			<tbody>
					<tr>
						<td>${pDTO.pName }<br/></td>
						<td>${cDTO.cSize}</td>
						<td>${pDTO.pPrice }</td>
						<td>${cDTO.cartQuantity}</td>
						<td>${totalPrice }</td>
					</tr>
			</tbody>
		</table>
	</div>
	
	<div class="order-info">
   <form id="f" method="POST" >
       <div>
       		<!-- 체크하면 항목 내용이 다 지워진다. -->
           <p>주문자 정보와 다를 경우 체크를 해제해주세요. <input id="resetInfo" type="checkbox" name="resetInfo" value="true" checked/></p>
       </div>
      <table>
         <tbody>
            <tr>
               <td>성명</td>
               <td><input type="text" id="oName" name="oName" onclick="func1()"/>
					<span id="nameCheckResult"></span>           
               </td>
            </tr>
            <tr>
               <td>이메일</td>
               <td>
                  <input id="oEmail" type="text" name="oEmail"/>
                  <span id="emailCheckResult"></span>
               </td>
            </tr>
            <tr>
               <td>전화번호</td>
               <td>
                  <select id="oMobile1" name="oMobile1">
                     <option>010</option>
                     <option>011</option>
                     <option>016</option>
                     <option>019</option>
                  </select>
                  -
                  <input id="oMobile2" type="number" name="oMobile2"/>
                  -
                  <input id="oMobile3" type="number" name="oMobile3"/>    
                  <span id="mobileCheckResult"></span>     
               </td>
            </tr>
            <tr>
               <td>우편번호</td>
               <td><input type="text" id="oPost" name="oPost"><input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br></td>
            </tr>
            <tr>
               <td>도로명주소</td>
               <td><input type="text" id="oAddr1" name="oAddr1"  placeholder="도로명주소"></td>
            </tr>
            <tr>
               <td>지번주소</td>
               <td>
                  <input type="text" id="oAddr2" name="oAddr2" placeholder="지번주소">
                  <span id="guide" style="color:#999;display:none"></span>
               </td>
            </tr>
            <tr>
               <td>상세주소</td>
               <td><input type="text" id="oAddr3" name="oAddr3" placeholder="상세주소">
               		<span id="addrCheckResult"></span>
               </td>
            </tr>
         </tbody>
         <tfoot>
            <tr>
               <td colspan="2">
                  <!-- 사이즈 변수를 받아와서 mapper 에서 if 문으로 s일 경우, m일 경우, l일 경우를 구분하여 재고 업데이트 -->
                  <input type="hidden" name="pNo" value="${pDTO.pNo}" />
                  <input type="hidden" name="cartNo" value="${cDTO.cartNo}" />
                  <input type="hidden" name="totalPrice" value="${totalPrice}" />
                  <input type="hidden" name="cSize" value="${cDTO.cSize}" />
                  <input type="hidden" name="cartQuantity" value="${cDTO.cartQuantity}" />
                  <input id="cancelOrder" type="button" value="결제취소"  onclick="장바구니로 돌아가기"/>
                  <input id="submitOrder" type="button" value="바로_결제하기" onclick="fn_submitOrder(this.form)"/>
                  <input id="submitOrderFromCart" type="button" value="장바구니통해서_결제하기" onclick="fn_submitOrderFromCart(this.form)"/>
               </td>
            </tr>
         </tfoot>
      </table>
   </form>
</div>
	
	
</body>
</html>