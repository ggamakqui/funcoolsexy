<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="resources/css/default.css"> 
<link rel="stylesheet" type="text/css" href="resources/css/style2.css">
<link rel="stylesheet" type="text/css" href="resources/css/index.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FCS</title>

</head>
<body>
	<a href="#contents" class="skip">본문바로가기</a>
<!-- 헤더영역 -->
	<header id="header" class="index">
		<h1><a href="index"><img src="resources/images/logo.png" alt="FCS"></a></h1>
		<h2 class="hide">대메뉴</h2>
		<div id="lnb">
			<nav>
				<ul>
				<li><a href="">남성 브랜드</a>
					<ul>
					<li><a href="selectProductByMaleBrand?pCompany=ROUGE">ROUGE</a></li>
					<li><a href="selectProductByMaleBrand?pCompany=NOIR">NOIR</a></li>
                    <li><a href="selectProductByMaleBrand?pCompany=BLANC">BLANC</a></li>
                    <li><a href="selectProductByMaleBrand?pCompany=VERT">VERT</a></li>
                    <li><a href="selectProductByMaleBrand?pCompany=ARGENT">ARGENT</a></li>
					</ul>
				</li>
				<li><a href=""> 여성 브랜드</a>
					<ul>
					<li><a href="selectProductByFemaleBrand?pCompany=ROUGE">ROUGE</a></li>
					<li><a href="selectProductByFemaleBrand?pCompany=NOIR">NOIR</a></li>
                    <li><a href="selectProductByFemaleBrand?pCompany=BLANC">BLANC</a></li>
                    <li><a href="selectProductByFemaleBrand?pCompany=VERT">VERT</a></li>
                    <li><a href="selectProductByFemaleBrand?pCompany=ARGENT">ARGENT</a></li>
					</ul>
				</li>
				<li><a href="">남성</a>
					<ul>
					 <li><a href="selectProductByMaleCategory?pCategory=11">Jacket</a></li>
					<li><a href="selectProductByMaleCategory?pCategory=12">Shirt</a></li>
					<li><a href="selectProductByMaleCategory?pCategory=13">Suit</a></li>
                    <li><a href="selectProductByMaleCategory?pCategory=14">Pants</a></li>
                    <li><a href="selectProductByMaleCategory?pCategory=15">Knit/T-Shirt</a></li>  
					</ul>
				</li>
				<li><a href="">여성</a>
					<ul>
                    <li><a href="selectProductByFemaleCategory?pCategory=21">Jacket</a></li>
					<li><a href="selectProductByFemaleCategory?pCategory=22">Dress</a></li>
					<li><a href="selectProductByFemaleCategory?pCategory=23">Blouse</a></li>
                    <li><a href="selectProductByFemaleCategory?pCategory=24">Skirts</a></li>
                    <li><a href="selectProductByFemaleCategory?pCategory=25">Pants</a></li>
                    <li><a href="selectProductByFemaleCategory?pCategory=26">Knit/T-Shirt</a></li>
					</ul>
				</li>
				<li><a href="">etc</a>
					<ul>
					<li><a href="selectProductEtc?pCategory=31">Bag(Backpack)</a></li>
					<li><a href="selectProductEtc?pCategory=32">Bag(Shoulder)</a></li>
					<li><a href="selectProductEtc?pCategory=33">Belt</a></li>
					<li><a href="selectProductEtc?pCategory=34">Shoes</a></li>
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