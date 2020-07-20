<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="resources/css/default.css"> 
<link rel="stylesheet" type="text/css" href="resources/css/style2.css">
<link rel="stylesheet" type="text/css" href="resources/css/index.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FCS</title>

</head>
<body>
<!-- 헤더영역 -->
	<header id="header" class="index">
		<h1><a href="index"><img src="resources/images/logo.png" alt="FCS"></a></h1>
		<h2 class="hide">대메뉴</h2>
		<div id="lnb">
			<nav>
				<ul>
		            <li><a href="">남성 브랜드</a>
		               <ul>
		               <li><a href="selectProductList?value=ROUGE&var=pCompany&pGender=1">ROUGE</a></li>
		               <li><a href="selectProductList?value=NOIR&var=pCompany&pGender=1">NOIR</a></li>
		                    <li><a href="selectProductList?value=BLANC&var=pCompany&pGender=1">BLANC</a></li>
		                    <li><a href="selectProductList?value=VERT&var=pCompany&pGender=1">VERT</a></li>
		                    <li><a href="selectProductList?value=ARGENT&var=pCompany&pGender=1">ARGENT</a></li>
		               </ul>
		            </li>
		            <li><a href=""> 여성 브랜드</a>
		               <ul>
			               <li><a href="selectProductList?value=ROUGE&var=pCompany&pGender=2">ROUGE</a></li>
			               <li><a href="selectProductList?value=NOIR&var=pCompany&pGender=2">NOIR</a></li>
		                   <li><a href="selectProductList?value=BLANC&var=pCompany&pGender=2">BLANC</a></li>
		                   <li><a href="selectProductList?value=VERT&var=pCompany&pGender=2">VERT</a></li>
		                   <li><a href="selectProductList?value=ARGENT&var=pCompany&pGender=2">ARGENT</a></li>
		               </ul>
		            </li>
		            <li><a href="">남성</a>
		               <ul>
			               <li><a href="selectProductList?value=11&var=pCategory&pGender=1&cName=JACKET">JACKET</a></li>
			               <li><a href="selectProductList?value=12&var=pCategory&pGender=1&cName=SHIRT">SHIRT</a></li>
			               <li><a href="selectProductList?value=13&var=pCategory&pGender=1&cName=SUIT">SUIT</a></li>
			               <li><a href="selectProductList?value=14&var=pCategory&pGender=1&cName=PANTS">PANTS</a></li>
		                   <li><a href="selectProductList?value=15&var=pCategory&pGender=1&cName=KNIT/T-SHIRT">KNIT/T-SHIRT</a></li>
		               </ul>
		            </li>
		            <li><a href="">여성</a>
		               <ul>
		                    <li><a href="selectProductList?value=21&var=pCategory&pGender=2&cName=JACKET">JACKET</a></li>
		               <li><a href="selectProductList?value=22&var=pCategory&pGender=2&cName=DRESS">DRESS</a></li>
		               <li><a href="selectProductList?value=23&var=pCategory&pGender=2&cName=BLOUSE">BLOUSE</a></li>
		                    <li><a href="selectProductList?value=24&var=pCategory&pGender=2&cName=SKIRT">SKIRT</a></li>
		                    <li><a href="selectProductList?value=25&var=pCategory&pGender=2&cName=PANTS">PANTS</a></li>
		                    <li><a href="selectProductList?value=26&var=pCategory&pGender=2&cName=KNIT/T-SHIRT">KNIT/T-SHIRT</a></li>
		               </ul>
		            </li>
		            <li><a href="">etc</a>
		               <ul>
			               <li><a href="selectProductList?value=32&var=pCategory&pGender=3&cName=Bag(Backpack)">Bag(Backpack)</a></li>
			               <li><a href="selectProductList?value=32&var=pCategory&pGender=3&cName=Bag(Shoulder)">Bag(Shoulder)</a></li>
			               <li><a href="selectProductList?value=31&var=pCategory&pGender=3&cName=Belt">Belt</a></li>
			               <li><a href="selectProductList?value=33&var=pCategory&pGender=3&cName=Shoes">Shoes</a></li>
		               </ul>
		            </li>
		         </ul>
			</nav>
			<div></div>
		</div>
		<h2 class="hide">회원</h2>
		<c:if test="${empty loginDTO }">
			<ul>
				<li>로그인 하기</li>
				<li><a href="loginPage">LOGIN</a></li>
				<li><a href="insertPage">JOIN</a></li>
			</ul>
		</c:if>
	<c:if test="${not empty loginDTO }">
		<c:if test="${loginDTO.mId ne 'admin' }">
			<ul>
				<li style="text-align: center;">${loginDTO.mName } 님</li>
				<li><a href="logout">로그아웃</a></li>
				<li><a href="myPage">마이 페이지</a></li>
				<li><a href="cartListPage?mId=${loginDTO.mId }">장바구니</a></li>
			</ul>
		</c:if>
		<c:if test="${loginDTO.mId eq 'admin' }">
			<ul>
				<li>${loginDTO.mName } 님</li>
				<li><a href="logout">로그아웃</a></li>
				<li><a href="adminPage">관리 페이지</a></li>
			</ul>
		</c:if>
	</c:if>