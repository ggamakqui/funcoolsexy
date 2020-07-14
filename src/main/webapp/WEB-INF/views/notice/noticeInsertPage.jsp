<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn_insertBoard(f) {
		if (f.nTitle.value == '') {
			alert('제목을 입력하세요.');
			f.nTitle.focus();
			return;
		}
		f.action = 'insertNotice';
		f.submit();
	}
</script>
</head>
<body>
<div class="board-insert-box">

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
					<td><input type="text" name="nTitle" autofocus /></td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="nContent" rows="10" cols="80" placeholder="내용"></textarea>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="button" value="등록하기" onclick="fn_insertBoard(this.form)" />
						<input type="reset" value="다시작성하기" />
						<input type="button" value="목록으로이동하기" onclick="location.href='noticeList'" />
						<input type="hidden" name="page" value="${page}" />
						<input type="hidden" name="mId" value="${loginDTO.mId }">
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>
</body>
</html>