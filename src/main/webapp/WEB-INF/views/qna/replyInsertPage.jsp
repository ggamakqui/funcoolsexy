<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn_replyInsert(f) {
		if (f.qTitle.value == '') {
			alert('제목을 입력하세요.');
			f.qTitle.focus();
			return;
		}
		f.action = 'replyInsert';
		f.submit();
	}
</script>
</head>
<body>
<div class="reply-insert-box">

	<form method="POST">
		<table>
			<thead>
				<tr>
					<td colspan="2">새 게시글 작성</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>작성자</td>
					<td>${loginDTO.mName}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="qTitle" autofocus /></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="qPw" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="qContent" rows="10" cols="80" placeholder="내용"></textarea>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="button" value="답글등록하기" onclick="fn_replyInsert(this.form)" />
						<input type="reset" value="다시작성하기" />
						<input type="button" value="목록으로이동하기" onclick="location.href='qnaList?page=${page}&pNo=${pNo }'" />
						
						<input type="hidden" name="page" value="${page}" />
						<input type="hidden" name="pNo" value="${pNo}" />
						<input type="hidden" name="mId" value="${loginDTO.mId }"><!-- 작성자 -->
						<input type="hidden" name="qNo" value="${param.qNo }"> <!-- 댓글이 달리는 게시글의 번호 -->
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>
</body>
</html>