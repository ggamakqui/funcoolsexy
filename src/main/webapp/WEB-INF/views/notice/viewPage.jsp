<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn_update(f){
		f.action = 'NoticeUpdate'; // @RequestMapping("update")와 연결
		f.submit();
	}
	function fn_delete(f){
		if(confirm('진짜 삭제할까요?')){
			if ( f.mPw.value == loginDTO.mPw ) {
				f.action = 'NoticeDelete';
				f.submit();				
			} else {
				alert('비밀번호를 확인하세요.');
				return;
			}
		}
	}
</script>
</head>
<body>
	<div class="wrap">
		<form method="POST">
			<table>
				<thead>
					<tr>
						<td colspan="2">${nDTO.nNo}번 게시물</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>작성자</td>
						<td>${loginDTO.mId }</td>
					</tr>
					<tr>
						<td>제목</td>
						<td>${nDTO.nTitle}</td>
					</tr>
					<tr>
						<td>작성일</td>
						<td>${nDTO.nRegdate}</td>
					</tr>
					<tr>
						<td>조회수</td>
						<td>${nDTO.nHit}</td>
					</tr>
					<tr>
						<td style="height:100px;" colspan="2">
							<pre>${nDTO.nContent}</pre>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
						
							<input type="button" value="목록으로이동하기" onclick="location.href='NoticeListPage'" />
							
							<!-- 로그인을 해야만 글을 삭제할 수 있다. -->
							<c:if test="${loginDTO ne null}">
								&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="button" value="수정하기" onclick="fn_update(this.form)"/>
								<input type="button" value="삭제하기" onclick="fn_delete(this.form)" />
								삭제비밀번호 <input type="password" name="mPw" size="5" />
							</c:if>
	
							<input type="hidden" name="page" value="${page}" />
							<input type="hidden" name="nNo" value="${nDTO.nNo}" />
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>