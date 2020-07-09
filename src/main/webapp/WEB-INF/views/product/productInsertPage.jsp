<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function fn_productInsert(f){
		
		/* if(f.pThumbnail.value =='' && f.pFilename.value == ''){
			alert('상품 이미지 또는 상세이미지를 업로드하시기 바랍니다.');
			return;
			
		} else if(f.pThumbnail.value != '' && f.pFilename.value == ''){
			f.action = 'insertProductWithNoDetailImage';
			f.submit();
		}else if(f.pFilename.value != '' && f.pThumbnail.value == ''){
			f.action = 'insertProductWithNoThumbnail';
			f.submit();
		} else{
			f.action = 'productInsert';
			f.submit();
		} */
		alert(f.pThumbnail.value);
		alert(f.pFilename.value);
		 if(f.pThumbnail.value !='' && f.pFilename.value != ''){
			f.action = 'productInsert';
			f.submit();
		} else if(f.pThumbnail.value != ''){
			f.action = 'insertProductWithNoDetailImage';
			f.submit();
		}else if(f.pFilename.value != ''){
			f.action = 'insertProductWithNoThumbnail';
			f.submit();
		}else{
			alert('상품 이미지 또는 상세이미지를 업로드하시기 바랍니다.');
			return;
		}
	}

</script>
</head>
<body>
	<form method="post" enctype="multipart/form-data">
	
		pName <input type="text" name="pName"/><br/>
		pPrice <input type="text" name="pPrice"/><br/>
		pCategory <input type="text" name="pCategory"/><br/>
		pGender &nbsp;&nbsp;남<input type="radio" name="pGender" value="1"/>&nbsp;&nbsp;여<input type="radio" name="pGender" value="2"/>
		&nbsp;&nbsp;공용<input type="radio" name="pGender" value="3"/>
		<br/>
		pCompany <input type="text" name="pCompany"/><br/>
		pThumbnail(썸네일이미지) <input type="file" name="pThumbnail"/><br/>
		pFilename(제품상세이미지) <input type="file" name="pFilename"/><br/>
		pDescription <textarea rows="10" cols="100" name="pDescription"></textarea><br/>
		pStock1(S사이즈 재고) <input type="text" name="pStock1"/><br/>
		pStock2(M사이즈 재고) <input type="text" name="pStock2"/><br/>
		pStock3(L사이즈 재고) <input type="text" name="pStock3"/><br/>
		
		<br/>
		<input type="button" value="제품 삽입" onclick="fn_productInsert(this.form)"/>
	</form>
</body>
</html>