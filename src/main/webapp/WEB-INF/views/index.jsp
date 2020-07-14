<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<jsp:include page="./template/header.jsp" />

<div class="visual"><img src="resources/images/1.jpg" alt=""></div>
</header>
<!-- 헤더영역 끝 -->
<!-- 본문영역 -->
	<main>
		<section class="info_box">
			<h2>FCS 이달의 신상</h2>
			<ul class="clear">
			<li>
				<a href="#a">
					<em><img src="resources/images/main.jpg" alt=""></em>
					<div>
						<h3>상품이름</h3>
						<p>상품설명</p>
						
						<div>가격</div>
					</div>
				</a>
			</li>
			<li>
				<a href="#a">
					<em><img src="resources/images/dress1_th.jpg" alt=""></em>
					<div>
						<h3>상품이름</h3>
						<p>상품설명</p>
						
						<div>가격</div>
					</div>
				</a>
			</li>
			<li>
				<a href="#a">
					<em><img src="resources/images/knit2_th.jpg" alt=""></em>
					<div>
						<h3>상품이름</h3>
						<p>상품설명</p>
						 
						<div>가격</div>
					</div>
				</a>
			</li>
			<li>
				<a href="#a">
					<em><img src="resources/images/skirt3_th.jpg" alt=""></em>
					<div>
						<h3>상품이름</h3>
						<p>상품설명</p>
						 
						<div>가격</div>
					</div>
				</a>
			</li>
              <li>
				<a href="#a">
					<em><img src="resources/images/main-copy-0.jpg" alt=""></em>
					<div>
						<h3>상품이름</h3>
						<p>상품설명</p>
						
						<div>가격</div>
					</div>
				</a>
			</li><li>
				<a href="#a">
					<em><img src="resources/images/shoes-main.png" alt=""></em>
					<div>
						<h3>상품이름</h3>
						<p>상품설명</p>
						 
						<div>가격</div>
					</div>
				</a>
			</li><li>
				<a href="#a">
					<em><img src="resources/images/belt-main.jpg" alt=""></em>
					<div>
						<h3>상품이름</h3>
						<p>상품설명</p>
						 
						<div>가격</div>
					</div>
				</a>
			</li><li>
				<a href="#a">
					<em><img src="resources/images/blouse2_th.jpg" alt=""></em>
					<div>
						<h3>상품이름</h3>
						<p>상품설명</p>
						 
						<div>가격</div>
					</div>
				</a>
			</li>  
                
			</ul>
            
            
            
          
		</section>
		<section class="guide_box clear">
			<article class="guide">
				<h2>고객<br>가이드</h2>
				<ul>
				<li><a href="#a">고객문의</a></li>
				<li><a href="reviewList?pNo=10000">상품리뷰</a></li>
				<li><a href="qnaList?pNo=10000">QNA</a></li>
				<li><a href="noticeList">공지사항</a></li>
				</ul>
			</article>
			<article class="phone">
				<div>
					<h2>문의전화</h2>
					<span>02.123.4567</span>
				</div>
				<div>
					<h2>평일</h2>
					<p>AM 09:00 ~ PM 06:00</p>
					<div>(토, 일, 공휴일 휴무)</div>
				</div>
			</article>
		</section>
		
	</main>
		
	<!-- <a href="listPage">공지사항</a>
	<h3><a href="qnaList?pNo=10000">상품문의 게시판</a></h3> -->
	
	<%@ include file="./template/footer.jsp" %>
	
	