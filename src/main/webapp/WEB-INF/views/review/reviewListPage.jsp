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
	function fn_check(f){
        alert(f.rScore.value);
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
	img{
		width:300px;
		height:200px;
	}
	#star {
		width:100px;
		height:20px;
		
	}
</style>


</head>
<body>
	<div class="wrap">
		<!-- 댓글 목록 창 -->
		<div class="review-list">
			<input type="button" value="메인으로 이동" onclick="location.href='index'" />
			<form method="POST">
				<table class="reply-list-table">
					<tbody>
						
						<c:if test="${empty list2 }">
							<tr>
								<td class="centered" colspan="5">상세리뷰가 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${not empty list2 }">
							<c:forEach var="rDTO" items="${list2 }">
								<tr>
									<td>
										<br>
										작성자:${rDTO.mId }&nbsp;&nbsp;&nbsp;&nbsp; 작성일<fmt:formatDate value="${rDTO.rRegdate }" pattern="yy/M/dd" />
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
									</td>
								</tr>
								<tr>
									<td><img alt="${rDTO.rFilename }" src="${pageContext.request.contextPath }/resources/storage/${rDTO.rFilename }"></td>
								</tr>
								<tr>
									<td>${rDTO.rContent }</td>
								</tr>
								<tr>
									<c:if test="${loginDTO.mId == 'admin' or loginDTO.mId == rDTO.mId }">
										<td>
											<a href="deleteReview?pNo=${pNo }&rNo=${rDTO.rNo}&page2=${page2}&page1=${page1}"><i class="fas fa-trash-alt"></i></a>
										</td>
									</c:if>
								</tr>
							</c:forEach>
						</c:if>
						<tr>
							<td colspan="5">${pageView2}</td>
						</tr>
						
						<tr>
							<td><br><br><br><br></td>
						</tr>
						
						<c:if test="${empty list1 }">
							<tr>
								<td class="centered" colspan="5">일반리뷰가 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${not empty list1 }">
							<c:forEach var="rDTO" items="${list1 }">
								<tr>
									<td>
										<br>
										작성자:${rDTO.mId }&nbsp;&nbsp;&nbsp;&nbsp; 작성일<fmt:formatDate value="${rDTO.rRegdate }" pattern="yy/M/dd" />
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
									</td>
								</tr>
								<tr>
									<td>${rDTO.rContent }</td>
								</tr>
								<tr>
									<c:if test="${loginDTO.mId == 'admin' or loginDTO.mId == rDTO.mId }">
										<td>
											<a href="deleteReview?pNo=${pNo }&rNo=${rDTO.rNo}&page2=${page2}&page1=${page1}"><i class="fas fa-trash-alt"></i></a>
										</td>
									</c:if>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
					<tfoot>
			<tr>
				<td colspan="5">${pageView1}</td>
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
					<input type="button" value="확인" onclick="fn_check(this.form)">
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