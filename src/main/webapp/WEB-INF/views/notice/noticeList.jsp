<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../template/header.jsp" />
<script type="text/javascript">
	function fn_boardListPage(f) {
		f.action = 'noticeList';
		f.submit();
	}
	// 새 게시글 작성 페이지로 이동
	function fn_boardInsertPage(f) {
		f.action = 'noticeInsertPage';
		f.submit();
	}
	// 검색 결과 보기
	function fn_queryBoardList(f) {
		f.action = 'queryBoardListPage';
		f.submit();
	}
</script>
</head>
<body>
	<div class="board-list-box">
		<form>
		<!-- 검색 -->
		<select name="column">
			<option value="NTITLE">제목</option>
			<option value="NCONTENT">내용</option>
			<option value="BOTH">제목+내용</option>
		</select>
		<input type="text" name="query" />
		<input type="button" value="검색" onclick="fn_queryBoardList(this.form)" />
		<br/><br/>
				
		<!-- 로그인하면 게시글을 작성할 수 있다. -->
		<c:if test="${loginDTO.mId eq 'admin'}">
			<input type="button" value="새 게시글 작성하기" onclick="fn_boardInsertPage(this.form)" />
		</c:if>
		<input type="hidden" name="page" value="${page}" />
		<input type="button" value="전체목록보기" onclick="fn_boardListPage(this.form)" />
	</form>
	
	<br/><br/>

	<div class="lefted">전체 ${totalRecord}개</div>
	<table>
		<thead>
			<tr>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list}">
				<tr>
					<td style="text-align:center;" colspan="4">작성된 게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty list}">
				<c:forEach var="nDTO" items="${list}">
					<tr>
						<td>
							<a href="noticeViewPage?nNo=${nDTO.nNo}&page=${page}">${nDTO.nTitle}</a>
						</td>
						<td>${nDTO.mId}</td>
						<td>${nDTO.nRegdate}</td>
						<td>${nDTO.nHit}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4">${pageView}</td>
			</tr>
		</tfoot>
	</table>
	</div>
</body>
</html>