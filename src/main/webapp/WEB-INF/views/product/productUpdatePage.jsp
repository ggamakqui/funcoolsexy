<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../template/header.jsp" />

<div class="visual"><img src="resources/images/1.jpg" alt=""></div>
</header>
</head>
<body>
<script type="text/javascript">

	function fn_productUpdate(f){
		
		if(f.pThumbnail.value !='' && f.pFilename.value != ''){
			f.action = 'productUpdate';
			f.submit();
			
			
		}else if(f.pThumbnail.value != ''){
			f.action = 'productThumbnailUpdate';
			f.submit();
		}else if(f.pFilename.value != ''){
			f.action = 'productDetailImageUpdate';
			f.submit();
			
			
		}else{
			f.action = 'productUpdateWithNoImage';
			f.submit();
			
		}
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
	<form method="post" enctype="multipart/form-data">
	
		pNo  : ${pDTO.pNo }<br/>
		<input type="hidden" name="pNo" value="${pDTO.pNo }"/>
		pName <input type="text" name="pName" value="${pDTO.pName }"/><br/>
		pPrice <input type="text" name="pPrice" value="${pDTO.pPrice }"/><br/>
		pCategory <input type="text" name="pCategory" value="${pDTO.pCategory }"/><br/>
		pGender &nbsp;&nbsp;남<input type="radio" name="pGender" value="1"/>&nbsp;&nbsp;여<input type="radio" name="pGender" value="2"/>
		&nbsp;&nbsp;공용<input type="radio" name="pGender" value="3"/>
		<br/>
		pCompany <input type="text" name="pCompany" value="${pDTO.pCompany }"/><br/>
		pThumbnail(썸네일이미지) : ${pDTO.pThumbnail }<input type="file" name="pThumbnail"/><br/>
		pFilename(제품상세이미지) : ${pDTO.pFilename }<input type="file" name="pFilename"/><br/>
		pDescription <textarea name="pDescription" rows="5" cols="10" >${pDTO.pDescription }</textarea><br/>
		pStock(S사이즈) <input type="text" name="pStock1" value="${pDTO.pStock1 }"/><br/>
		pStock(M사이즈) <input type="text" name="pStock2" value="${pDTO.pStock2 }"/><br/>
		pStock(L사이즈) <input type="text" name="pStock3" value="${pDTO.pStock3 }"/><br/>
		
		<br/>
		<input type="button" value="수정하기" onclick="fn_productUpdate(this.form)"/>
		<input type="button" value="돌아가기" onclick="history.back()"/>
		<input type="button" value="제품 삭제하기" onclick="fn_productDelete(this.form)"/>
		
	</form>
</body>
</html>