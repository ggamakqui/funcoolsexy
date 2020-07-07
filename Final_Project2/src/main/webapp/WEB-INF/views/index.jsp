<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>

<link rel="stylesheet" type="text/css" href="resources/assets/styles/category.css">
</head>
<body>
	<ul>
	  <li class="dropdown">
	  	<a href="javascript:void(0)" class="dropbtn">브랜드별 남성</a>
	    <div class="dropdown-content">
	      <c:forEach var="pDTO" items="${list1 }">
		      <a href="selectProductByMaleBrand?pCompany=${pDTO.pCompany}" >${pDTO.pCompany }</a>
	      </c:forEach>
	    </div>
	  </li>
	  <li class="dropdown">
	  	<a href="javascript:void(0)" class="dropbtn">브랜드별 여성</a>
	     <div class="dropdown-content">
	     	<c:forEach var="pDTO" items="${list2 }">
	      		<a href="selectProductByFemaleBrand?pCompany=${pDTO.pCompany}" >${pDTO.pCompany }</a>
	     	</c:forEach>
	    </div>
	  </li>
	  <li class="dropdown">
	  	<a href="javascript:void(0)" class="dropbtn">남성</a>
	    <div class="dropdown-content">
	    	<c:forEach var="cDTO" items="${list3 }">
	     		<a href="selectProductByMaleCategory?pCategory=${cDTO.cNo }">${cDTO.cName }</a>
	     	</c:forEach>
	    </div>
	  </li>
	  <li class="dropdown">
	  	<a href="javascript:void(0)" class="dropbtn">여성</a>
	    <div class="dropdown-content">
	    	<c:forEach var="cDTO" items="${list4 }">
	      		<a href="selectProductByFemaleCategory?pCategory=${cDTO.cNo }">${cDTO.cName }</a>
	      	</c:forEach>
	    </div>
	  </li>
	  <li class="dropdown">
	    <a href="javascript:void(0)" class="dropbtn">etc</a>
	    <div class="dropdown-content">
	    	<c:forEach var="cDTO" items="${list5 }">
	      		<a href="selectProductEtc?pCategory=${cDTO.cNo }">${cDTO.cName }</a>
	      	</c:forEach>
	    </div>
  </li>
</ul>
</body>
</html>