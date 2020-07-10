<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn_boardDelete(f){
		f.action = 'noticeDelete';
		f.submit();
	}
	
	
</script>
</head>
<body>

<div class="board-view-box">

	<form method="POST">
		<table>
			<thead>
				<tr>
					<td colspan="2">${nDTO.nNo }번 게시물</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>작성자</td>
					<td>${nDTO.mId}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>${nDTO.nTitle }</td>
				</tr>
				<tr>
					<td>작성일</td>
					<td>${nDTO.nRegdate }</td>
				</tr>
				<tr>
					<td>조회수</td>
					<td>${nDTO.nHit }</td>
				</tr>
				<tr>
					<td colspan="2">
						<pre>${nDTO.nContent }</pre>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="button" value="목록으로이동하기" onclick="location.href='noticeList?page=${page}'" />
						<c:if test="${loginDTO.mId eq 'admin' }">
							<input type="button" value="삭제하기" onclick="fn_boardDelete(this.form)">
						</c:if>
						<input type="hidden" name="page" value="${page}" />
						<input type="hidden" name="nNo" value="${param.nNo }">
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>

</body>
</html>