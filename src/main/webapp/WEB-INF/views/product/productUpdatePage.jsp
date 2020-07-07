<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function fn_productUpdate(f){
		f.action = 'productUpdate';
		f.submit();
	}
	function fn_productDelete(f){
		if(confirm('정말 삭제하시겠습니까?')){
			f.action = 'productDelete';
			f.submit();
		}else{
			return;
		}
	}

</script>
</head>
<body>
	<form method="post" enctype="multipart/form-data">
	
		pNo  : ${pDTO.pNo }<br/>
		<input type="hidden" name="pNo" value="${pDTO.pNo }"/>
		pName <input type="text" name="pName" value="${pDTO.pName }"/><br/>
		pPrice <input type="text" name="pPrice" value="${pDTO.pName }"/><br/>
		pSize <input type="text" name="pSize" value="${pDTO.pName }"/><br/>
		pCategory <input type="text" name="pCategory" value="${pDTO.pName }"/><br/>
		pGender &nbsp;&nbsp;남<input type="radio" name="pGender" value="0"/>&nbsp;&nbsp;여<input type="radio" name="pGender" value="1"/>
		&nbsp;&nbsp;공용<input type="radio" name="pGender" value="2"/>
		<br/>
		pCompany <input type="text" name="pCompany" value="${pDTO.pCompany }"/><br/>
		pThumbnail(썸네일이미지) : ${pDTO.pThumbnail }<input type="file" name="pThumbnail"/><br/>
		pFilename(제품상세이미지) : ${pDTO.pFilename }<input type="file" name="pFilename"/><br/>
		pDescription <textarea rows="5" cols="10" >${pDTO.pDescription }</textarea><br/>
		pStock(초기재고) <input type="text" name="pStock" value="${pDTO.pStock }"/><br/>
		
		<br/>
		<input type="button" value="수정하기" onclick="fn_productUpdate(this.form)"/>
		<input type="button" value="돌아가기" onclick="history.back()"/>
		<input type="button" value="제품 삭제하기" onclick="fn_productDelete(this.form)"/>
		
	</form>
</body>
</html>