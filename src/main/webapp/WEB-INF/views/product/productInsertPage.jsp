<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function fn_productInsert(f){
		f.action = 'productInsert';
		f.submit();
	}

</script>
</head>
<body>
	<form method="post" enctype="multipart/form-data">
	
		pName <input type="text" name="pName"/><br/>
		pPrice <input type="text" name="pPrice"/><br/>
		pSize <input type="text" name="pSize"/><br/>
		pCategory <input type="text" name="pCategory"/><br/>
		pGender &nbsp;&nbsp;남<input type="radio" name="pGender" value="0"/>&nbsp;&nbsp;여<input type="radio" name="pGender" value="1"/>
		&nbsp;&nbsp;공용<input type="radio" name="pGender" value="2"/>
		<br/>
		pCompany <input type="text" name="pCompany"/><br/>
		pThumbnail(썸네일이미지) <input type="file" name="pThumbnail"/><br/>
		pFilename(제품상세이미지) <input type="file" name="pFilename"/><br/>
		pDescription <textarea rows="5" cols="10" name="pDescription"></textarea><br/>
		pStock(초기재고) <input type="text" name="pStock"/><br/>
		
		<br/>
		<input type="button" value="제품 삽입" onclick="fn_productInsert(this.form)"/>
	</form>
</body>
</html>