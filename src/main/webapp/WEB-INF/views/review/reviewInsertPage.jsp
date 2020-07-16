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
</head>
<body>
	<div class="review-write">
		<form method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pNo" value="${pNo }" />
			<input required class="rb-rating" type="text" value="1" title="" name="rScore">
			<label>작성자</label>
			<input type="text" name="mId" value="${loginDTO.mId }" readonly/><br/>
			제목<br>
			<input type="text" name="rTitle"><br>
			내용<br>
			<textarea name="rContent" rows="2" cols="50"></textarea><br>
			이미지(선택) <input type="file" name="file"><br>
			<input type="button" value="리뷰 등록하기" onclick="fn_insert(this.form)">
		</form>
	</div>
</body>
</html>






