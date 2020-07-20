<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	function fn_replyInsertPage(f){
		f.action = 'replyInsertPage';
		f.submit();
	}
	
	function fn_boardDelete(f){
		var qPw = '${qDTO.qPw}';
		var mId = '${loginDTO.mId}';
		if(mId == 'admin'){
			f.action = 'qnaBoardDelete';
			f.submit();
		}else{
			if(f.qPw.value==''){
				alert('삭제 비밀번호를 입력하세요.');
				f.qPw.focus();
				return;
			}
			if(f.qPw.value != qPw){
				alert('삭제 비밀번호를 확인하세요.');
				return;
			}
			f.action = 'qnaBoardDelete';
			f.submit();
		}
	}
	
	
</script>
</head>
<body>
<div class="board-view-box">

	<form method="POST">
		<table>
			<thead>
				<tr>
					<td colspan="2">${qDTO.qNo }번 게시물</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>작성자</td>
					<td>${qDTO.mId}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>${qDTO.qTitle }</td>
				</tr>
				<tr>
					<td>작성일</td>
					<td>${qDTO.qRegdate }</td>
				</tr>
				<tr>
					<td colspan="2">
						<pre>${qDTO.qContent }</pre>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<!-- 로그인을 해야만 글을 쓸 수 있다. 원글에만 댓글을 달 수 있다. -->
						<c:if test="${loginDTO.mId eq 'admin' and qDTO.qDepth eq 0 }">
							<input type="button" value="답글달기" onclick="fn_replyInsertPage(this.form)">
						</c:if>
						<input type="button" value="목록으로이동하기" onclick="location.href='qnaList?pNo=${qDTO.pNo}&page=${page}'" />
						<!-- 로그인을 해야만 글을 삭제할 수 있다. -->
						<c:if test="${loginDTO ne null }">
							<input type="button" value="삭제하기" onclick="fn_boardDelete(this.form)">
							삭제비밀번호 <input type="password" name="qPw" size="5">
						</c:if>
						<input type="hidden" name="pNo" value="${qDTO.pNo }">
						<input type="hidden" name="page" value="${page}" />
						<input type="hidden" name="qNo" value="${param.qNo }">
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>

</body>
</html>