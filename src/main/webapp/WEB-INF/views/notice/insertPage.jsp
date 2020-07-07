<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrap">
		<!-- action="insert"는 @RequestMapping("insert")를 찾아간다 -->
		<form action="NoticeInsert" method="POST">
			<table>
				<thead>
					<tr>
						<td colspan="2">새 게시글 작성</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>작성자</td>
						<td>${loginDTO.mId }</td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="nTitle" autofocus/></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="mPw"/></td>
					</tr>
					<tr>
						<td colspan="2">
							<textarea name="bContent" rows="10" cols="100" placeholder="내용"></textarea>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<th colspan="2">
							<input type="submit" value="등록" />
							<input type="reset" value="리셋"/>
							<input type="button" value="목록" onclick="location.href='NoticeListPage'"/>
							<input type="hidden" name="page" value="${page }"/>
							<input type="hidden" name="mId" value="${loginDTO.mId }"/>
						</th>
					</tr>
				</tfoot>
			</table>
			
			작성자 : ${loginDTO.mId }<br/>
			제목 <input type="text" name="nTitle"/><br/>
			내용 <input type="text" name="nContent"/><br/>
			<input type="submit" value="작성"/>
		</form>
	</div>
</body>
</html>