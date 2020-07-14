<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="resources/css/default.css"> 
<link rel="stylesheet" type="text/css" href="resources/css/style2.css">
<link rel="stylesheet" type="text/css" href="resources/css/index.css">

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
				<li><a href="#a">남성 브랜드</a>
					<ul>
				<li><a href="#a">ROUGE</a></li>
					<li><a href="#a">NOIR</a></li>
                    <li><a href="#a">BLANC</a></li>
                    <li><a href="#a">VERT</a></li>
                    <li><a href="#a">ARGENT</a></li>
					</ul>
				</li>
				<li><a href="#a"> 여성 브랜드</a>
					<ul>
					<li><a href="#a">ROUGE</a></li>
					<li><a href="#a">NOIR</a></li>
                    <li><a href="#a">BLANC</a></li>
                    <li><a href="#a">VERT</a></li>
                    <li><a href="#a">ARGENT</a></li>
					</ul>
				</li>
				<li><a href="#a">남성</a>
					<ul>
					 <li><a href="#a">Jacket</a></li>
					<li><a href="#a">Shirts</a></li>
					<li><a href="#a">Sute</a></li>
                    <li><a href="#a">Pants</a></li>
                    <li><a href="#a">Knit/Tee</a></li>  
					</ul>
				</li>
				<li><a href="#a">여성</a>
					<ul>
                    <li><a href="#a">Jacket</a></li>
					<li><a href="#a">Dress</a></li>
					<li><a href="#a">Blouse</a></li>
                    <li><a href="#a">Skirts</a></li>
                    <li><a href="#a">Pants</a></li>
                    <li><a href="#a">Knit/Tee</a></li>
					</ul>
				</li>
				<li><a href="#a">ect</a>
					<ul>
					<li><a href="#a">Bag(Backpack)</a></li>
					<li><a href="#a">Bag(Shoulder)</a></li>
					<li><a href="#a">Belt</a></li>
					<li><a href="#a">Shoes</a></li>
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
				<li style="text-align: center;">${loginDTO.mName } 님</li><br>
				<li><a href="logout">로그아웃</a></li><br>
				<li><a href="myPage">마이 페이지</a></li>
			</ul>
		</c:if>
		<c:if test="${loginDTO.mId eq 'admin' }">
			<ul>
				<li>${loginDTO.mName } 님</li><br>
				<li><a href="logout">로그아웃</a></li><br>
				<li><a href="adminPage">관리 페이지</a></li>
			</ul>
		</c:if>
	</c:if>