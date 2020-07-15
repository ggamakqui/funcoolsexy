<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="resources/css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="resources/js/star-rating.js" type="text/javascript"></script>

<script type="text/javascript">
	function fn_insert(f){
		if(f.file.value==''){		
			f.action = 'insertReview';
		}else{
			f.action = 'insertReviewWithImage';
		}
		if(f.rScore.value == ''){
			alert('별점을 입력하세요');
			return;
		}
		f.submit();
	}
</script>
<script>
$(document).ready(function(){
	$('.starRev span').click(function(){
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  document.getElementById("rScore").innerHTML = '';
		  return false;
		});
});
jQuery(document).ready(function () {
    $('.rb-rating').rating({
        'showCaption': false,
        'stars': '5',
        'min': '0',
        'max': '5',
        'step': '1',
        'size': 'xs',
    });
});
</script>

<style type="text/css">
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}
	
	img{
		width:150px;
		height:100px;
	}
	#star {
		width:100px;
		height:20px;
		
	}
	.review-write {
		width: 100%;
		margin: auto;
	}
	.review-list {
		width: 60%;
		margin: auto;
		padding: 10px;
	}
	.review-list-table {
		border: 1px solid gray;
		width: 100%;
		margin: auto;
		border-collapse: collapse;
	}
	.review-list-table td {
		padding: 10px 0 0 10px;
	}
	.review-list-table td:nth-of-type(1) { width: 25%; }
	.review-list-table td:nth-of-type(2) { width: 55%; }
	.review-list-table td:nth-of-type(3) { width: 20%; }
	tfoot td { text-align: center; }
</style>


</head>
<body>
	<div class="wrap">
		<!-- 댓글 목록 창 -->
		<div class="review-list">
			<input type="button" value="메인으로 이동" onclick="location.href='index'" />
			<form method="POST">
				<h1>프리미엄 상품평</h1>
				<table class="review-list-table">
					<tbody>
						<c:if test="${empty list2 }">
							<tr>
								<td class="centered" colspan="3">상세리뷰가 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${not empty list2 }">
							<c:forEach var="rDTO" items="${list2 }">
								<tr>
									<td><img alt="${rDTO.rFilename }" src="${pageContext.request.contextPath }/resources/storage/${rDTO.rFilename }"></td>
									<td>
										${rDTO.rTitle }<br><br>
										${rDTO.rContent }
									</td>
									<td>
										작성자:${rDTO.mId }<br>
										작성일<fmt:formatDate value="${rDTO.rRegdate }" pattern="yy/M/dd" /><br>
										<c:if test="${rDTO.rScore eq '1' }">
											<img id="star" alt="fcs" src="resources/images/star1.jpg">
										</c:if>
										<c:if test="${rDTO.rScore eq '2' }">
											<img id="star" alt="fcs" src="resources/images/star2.jpg">
										</c:if>
										<c:if test="${rDTO.rScore eq '3' }">
											<img id="star" alt="fcs" src="resources/images/star3.jpg">
										</c:if>
										<c:if test="${rDTO.rScore eq '4' }">
											<img id="star" alt="fcs" src="resources/images/star4.jpg">
										</c:if>
										<c:if test="${rDTO.rScore eq '5' }">
											<img id="star" alt="fcs" src="resources/images/star5.jpg">
										</c:if>
										<c:if test="${loginDTO.mId == 'admin' or loginDTO.mId == rDTO.mId }">
												<br><a href="deleteReview?pNo=${pNo }&rNo=${rDTO.rNo}&page2=${page2}&page1=${page1}">리뷰삭제</a>
										</c:if>
									</td>
								</tr>
								<tr>
									<td colspan="3"><hr></td>
								</tr>
							</c:forEach>
						</c:if>
					<tfoot>
						<tr>
							<td colspan="3">${pageView2}</td>
						</tr>
					</tfoot>
				</table>
				<br><br><br>
				<h1>일반 상품평</h1>				
				<table class="review-list-table">
					<tbody>
						<c:if test="${empty list1 }">
							<tr>
								<td class="centered" colspan="3">일반리뷰가 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${not empty list1 }">
							<c:forEach var="rDTO" items="${list1 }">
								<tr>
									<td></td>
									<td>
										${rDTO.rTitle }<br><br>
										${rDTO.rContent }
									</td>
									<td>
										작성자:${rDTO.mId }<br>
										작성일<fmt:formatDate value="${rDTO.rRegdate }" pattern="yy/M/dd" /><br>
										<c:if test="${rDTO.rScore eq '1' }">
											<img id="star" alt="fcs" src="resources/images/star1.jpg">
										</c:if>
										<c:if test="${rDTO.rScore eq '2' }">
											<img id="star" alt="fcs" src="resources/images/star2.jpg">
										</c:if>
										<c:if test="${rDTO.rScore eq '3' }">
											<img id="star" alt="fcs" src="resources/images/star3.jpg">
										</c:if>
										<c:if test="${rDTO.rScore eq '4' }">
											<img id="star" alt="fcs" src="resources/images/star4.jpg">
										</c:if>
										<c:if test="${rDTO.rScore eq '5' }">
											<img id="star" alt="fcs" src="resources/images/star5.jpg">
										</c:if>
										<c:if test="${loginDTO.mId == 'admin' or loginDTO.mId == rDTO.mId }">
											<br><a href="deleteReview?pNo=${pNo }&rNo=${rDTO.rNo}&page2=${page2}&page1=${page1}">리뷰삭제</a>
										</c:if>
									</td>
								</tr>
								<tr>
									<td colspan="3"><hr></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="3">${pageView1}</td>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
		
		<br/><br/>
		<c:if test="${loginDTO.mId ne null}">
			<div class="review-write">
				<form method="POST" enctype="multipart/form-data">
					<input type="hidden" name="pNo" value="${pNo }" />
					<input type="hidden" name="page1" value="${page1 }" />
					<input type="hidden" name="page2" value="${page2 }" />
					<input required class="rb-rating" type="text" value="1" title="" name="rScore">
					<label>작성자</label>
					<input type="text" name="mId" value="${loginDTO.mId }" readonly/><br/>
					<input type="text" name="rTitle"><br>
					<textarea name="rContent" rows="2" cols="50"></textarea><br>
					첨부파일 <input type="file" name="file"><br>
					<input type="button" value="리뷰 등록하기" onclick="fn_insert(this.form)">
				</form>
			</div>
		</c:if>
	</div>
</body>
</html>