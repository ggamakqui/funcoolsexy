<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	// 전체 목록으로 이동
	function fn_boardListPage(f) {
		f.action = 'qnaList';
		f.submit();
	}
	// 새 게시글 작성 페이지로 이동
	function fn_boardInsertPage(f) {
		f.action = '/MYHOME/boardInsertPage.board';
		f.submit();
	}
	// 내 게시글 보기
	function fn_myBoardListPage(f) {
		f.action = '/MYHOME/myBoardListPage.board';
		f.submit();
	}
</script>
</head>
<body>

<div class="board-list-box">

	<form>	
		<!-- 로그인하면 게시글을 작성할 수 있다. -->
		<c:if test="${loginDTO ne null}">
			<input type="button" value="새 게시글 작성하기" onclick="fn_boardInsertPage(this.form)" />
			<input type="button" value="내 게시글 보기" onclick="fn_myBoardListPage(this.form)" />
		</c:if>		
		<input type="hidden" name="pNo" value="${pNo}" />
		<input type="hidden" name="page" value="${page}" />
		<input type="button" value="전체목록보기" onclick="fn_boardListPage(this.form)" />
	</form>
	<input type="button" value="메인으로 가기" onclick="location.href='index'">
	<br/><br/>

	<div class="lefted">전체 ${totalRecord}개  ssssss</div>
	<table>
		<thead>
			<tr>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list}">
				<tr>
					<td style="text-align:center;" colspan="3">작성된 게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty list}">
				<c:forEach var="qDTO" items="${list}">
					<tr>
						<td>
							
							<!-- 1. 댓글과 원글의 구분을 위하여 bDepth만큼 들여쓰기를 한다. -->
							<c:forEach begin="1" end="${qDTO.qDepth}" step="1">
								&nbsp;&nbsp;
							</c:forEach>
							
							<!-- 2. 댓글은 제목 앞에 [Re] 를 붙인다. -->
							<c:if test="${qDTO.qDepth ne 0 and qDTO.qDelete eq 0}">
								[Re]&nbsp;
							</c:if>
							<c:if test="${qDTO.qDepth ne 0 and qDTO.qDelete eq -1}">
								<span class="deleted">[Re]&nbsp;</span>
							</c:if>
							
							<!-- 3. 삭제된 게시글은 보여주지 않는다. -->
							<c:if test="${qDTO.bDelete eq 0}">
								<a href="qnaBoardViewPage?qNo=${qDTO.qNo}&page=${page}">${qDTO.qTitle}</a>
							</c:if>
							<c:if test="${qDTO.bDelete eq -1}">
								<span class="deleted">${qDTO.qTitle}(삭제된게시글)</span>
							</c:if>
							
						</td>
						<td>${qDTO.mId}</td>
						<td>${qDTO.qRegdate}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="3">${pageView}</td>
			</tr>
		</tfoot>
	</table>
</div>
</body>
</html>