<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var beInserted = '${beInserted}';
	var insertPage = '${insertPage}';
	if(beInserted == 'true'){
		if(insertPage == 1){
			alert('삽입 성공');			
		}else{
			alert('삽입 실패');
		}
	}
</script>
</head>
<body>
	<div class="wrap">
		<table border="1">
			<caption>전체 : ${totalCount }개 게시글</caption>
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list }">
					<tr>
						<td colspan="6">게시글이 없습니다</td>
					</tr>
				</c:if>
				<c:if test="${not empty list }">
					<c:forEach var="nDTO" items="${list }">
						<tr>
							<td>${nDTO.nNo }</td>
							<td>${loginDTO.mId }</td>
							<!-- href="viewPage"는 @RequestMapping("viewPage")를 찾아간다 -->
							<td><a href="NoticeViewPage?nNo=${nDTO.nNo }">${nDTO.nTitle }</a></td>
							<td>${nDTO.nContent }</td>
							<td>${nDTO.nRegdate }</td>
							<td>${nDTO.nHit }</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5">
						<input type="button" value="새글등록" onclick="location.href='NoticeInsertPage'"/>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>