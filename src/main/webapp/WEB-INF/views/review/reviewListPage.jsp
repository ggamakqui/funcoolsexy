<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
<script type="text/javascript">
	function fn_insert(f){
		if(f.file.value==''){		
			f.action = 'insertReview';
		}else{
			f.action = 'insertReviewWithImage';
		}
		f.submit();
	}
	function fn_deletePage(f){
		f.action='/25_BBS/deletePage.bbs';
		f.submit();
	}
</script>
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
									<td>작성자:${rDTO.mId }&nbsp;&nbsp;&nbsp;&nbsp; 작성일<fmt:formatDate value="${rDTO.rRegdate }" pattern="yy/M/dd" /></td>
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
									<td>작성자:${rDTO.mId }&nbsp;&nbsp;&nbsp;&nbsp; 작성일<fmt:formatDate value="${rDTO.rRegdate }" pattern="yy/M/dd" /></td>
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
					<input type="hidden" name="rScore" value="5" />
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