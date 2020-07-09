<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn_insertBoard(f) {
		if (f.qTitle.value == '') {
			alert('제목을 입력하세요.');
			f.bTitle.focus();
			return;
		}
		f.action = 'qnaInsertBoard';
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
						<input type="hidden" name="pNo" value="${pNo}" />
						<input type="button" value="등록하기" onclick="fn_insertBoard(this.form)" />
						<input type="reset" value="다시작성하기" />
						<input type="button" value="목록으로이동하기" onclick="location.href='qnaList?pNo=${pNo}&page=${page }'" />
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