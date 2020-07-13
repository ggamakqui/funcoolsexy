<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<jsp:include page="../template/header.jsp" />


<div class="visual"><img src="resources/images/qna.jpg" alt=""></div>
</header>

  <style type="text/css">

@charset "utf-8";

/* index */
header.index { padding: 0 30px 30px;}

header { padding: 0 30px 55px; background: linear-gradient(to right, #000000, #000000 50%, #f2f2f2 50%, #f2f2f2);} /* 배경 검정 흰색*/
header .visual img { width: 100%; height: 400px;} /*이미지 사이즈*/
header h1 { position: absolute; left:30px; top: 0; z-index: 31;}/*투명 내비바*/
header > ul { display: flex; position: absolute; right: 30px; top: 0; z-index: 30; width: 170px; background: #f2f2f2;} /*배경 흰선 파란선 윗부분 절단*/
header > ul li { flex: 1; padding: 0 0 0 18px; line-height: 70px; }/*로그인 박스*/
header > ul li a:before { content: ""; display: inline-block; width:23px; height:23px; background: url(../images/icon.png) no-repeat; vertical-align: middle;} /*로그인 아이콘*/
header > ul li:first-child a:before { background-position: 0 0;} /*로그인 아이콘 처리*/
header > ul li:last-child a:before { background-position:-23px 0;}
/*로그인 아이콘 처리*/
    
header #lnb { position: absolute; left: 0; top: 0; z-index: 30; padding: 0 232px; width: 100%; box-sizing: border-box;}
header #lnb nav { position: relative; z-index: 30; border-bottom: 1px solid rgba(255,255,255,.5); text-align: center; font-size: 0;} /*내비바 밑줄*/

header #lnb nav > ul { display: inline-block; overflow: hidden; height:70px; transition: all 0.5s;} /*내비바 텍스트 정렬*/
header #lnb nav > ul:hover { overflow: visible;} /*내비바 후버*/
header #lnb nav > ul > li { display: inline-block; position: relative;}
    /*내비바 하단메뉴 정렬*/
header.index { padding: 0 30px 30px;}

header #lnb nav > ul > li > a { display: block; position: relative; width: 160px; height: 69px; font-size: 24px; color:#fff; line-height: 69px;} /*내비바 폰트 색*/
    
header #lnb nav > ul > li > a:after { content: ""; position: absolute; left:50%; bottom: -1px; width:0; height: 2px; background: #fff; transition: all 0.5s;} /*상단 메뉴 밑줄효과*/
header #lnb nav > ul > li:hover > a:after  { left: 0; width: 100%;}
 /*상단 메뉴 밑줄효과*/
    
header #lnb nav > ul ul { position: absolute; width: 100%; height: 230px; padding: 22px 0 0; text-align: center; opacity:0; transition: all 0.5s;} /*하단메뉴 정렬*/
header #lnb nav > ul:hover ul { opacity: 1;} /*하단메뉴 후버*/

header #lnb nav > ul ul li { line-height: 39px;} /*하단메뉴 줄 높이*/
header #lnb nav > ul ul a { position: relative;font-size: 14px; color:#fff; transition: all 0.5s;} /*하단메뉴 폰트 색*/
header #lnb nav > ul ul a:hover { color:#2acef1; } /*하단 후버 효과색*/
header #lnb nav > ul ul a:after { content: ""; position: absolute; left:50%; bottom: -7px; width:0; height: 2px; background: #2acef1; transition: all 0.5s;}
header #lnb nav > ul ul a:hover:after  { left: 0; width: 100%;}
/* 하단 후버 효과 밑줄색*/

footer { margin: 80px 0 0; background: #272f3c;} /*푸터 색*/
footer > div { position: relative; width:1175px; padding: 45px 0; margin: 0 auto;}
footer > div > a { position: absolute; right: 0; top: -25px; width: 39px; height: 49px; background: url(../images/icon.png) no-repeat -157px 8px #22a5d5; color:transparent;} 
footer > div .left { float: left; line-height: 100%;}
footer > div .left div a { margin: 0 10px 0 0; font-size: 13px; color:#fff; }
footer > div .left p { padding: 13px 0 0; line-height: 21px; font-size: 13px; color:#747b85;}
footer > div .left p span { padding: 0 13px 0 0;}
footer > div .right { float: right; position: relative;}
footer > div .right select { width: 134px; height: 29px; background:#272f3c; border:none; border-bottom: 1px solid #7d828a; font-size: 10px; color:#fff; text-indent: 20px; appearance:none; -webkit-appearance:none; -moz-appearance:none; }
footer > div .right select::-ms-expand { display: none;}
footer > div .right:after { content: ""; position: absolute; right: 20px; top:50%; margin-top: -3px; width: 8px; height: 6px; background: url(../images/icon.png) no-repeat -221px -5px;   }

.contents { width: 1180px; margin: 0 auto;}
.h2 { position: relative; padding: 55px 0 53px; font-size: 36px; color:#222; line-height: 100%; text-align: center; font-weight: normal;} 
.h2:after { content: ""; position: absolute; left: 50%; bottom: 0; width: 50px; height: 1px; background: #aaa; transform: translateX(-50%);} 
.h2 + p { padding:46px 0 54px; font-size: 18px; color:#666; text-align: center; line-height: 30px;} /*내용*/
.h3 { margin: 50px 0 20px; font-size:18px; color:#222; font-weight: normal;}
.h3:before { content: ""; display: inline-block; margin: 0 8px 0 0; width: 4px; height: 4px; background: #00a5e1; vertical-align:5px;}
.noti { font-size: 14px; color:#888;}
.noti:before { content: ""; display: inline-block; margin: 0 3px 0 0; width: 15px; height: 15px; background: url("../images/icon.png") no-repeat -336px -5px; vertical-align: -3px;}
.h3:before { content: ""; display: inline-block; margin: 0 8px 0 0; width: 4px; height: 4px; background: #00a5e1; vertical-align:5px;}
.noti { font-size: 14px; color:#888;}

.qna_btn_center { text-align: center;  margin: auto; width: 260px; height: 60px; margin-top: 15px;}
label + .qna_btn_center { padding: 65px 0 0;}
.btn1 { display: inline-block; width: 120px; height:45px; background: #000; text-align: center; line-height: 45px; color:#fff; font-size: 13px; border: 1px solid black; float: left;}
.btn2 { display: inline-block; width: 120px; height:45px; background: #FFF; text-align: center; line-height: 45px; color:#000; font-size: 13px; border: 1px solid black; float: right; }


.btn1:hover { background-color: darkgray;  }
.btn2:hover { background-color: lightgray;  }
.qna{ border: 1px solid black;}
td{ border: 1px solid black; text-align: center;}
			
td:nth-of-type(1){
		width: 300px;		
	}
	td:nth-of-type(2){
		width: 150px;	
	
	}
	td:nth-of-type(3){
		width: 70px;
	
	}


/* 회원가입 버튼  */


*{box-sizing: border-box;} /* 로그인과 아이디 비밀번호 찾기 부분 */
.top-blank-content {width: 500px; margin: auto; padding: 100px; text-align: center;}
.content { height: 70vh; padding: 20px; }
.login-form { width: 500px; padding: 20px; margin: 0 auto; }
.screen-out {display: none; }
.login-input , .find-input { width: 100%;  padding: 20px 10px;  box-sizing: border-box;  border: 0.5px solid lightgray;  margin-bottom: 5px; } 
.input-btn  { width: 100%; padding: 20px 10px;  border-radius: 5px; background-color: black; font-size: 1.2em; margin-top: 50px; margin: inherit;  color: white; }
.input-btn:hover { background-color: darkgray; color: white;  border: 2px solid black; }

.find-info { color: white; }
.find-info .find-info-text { color: white; text-decoration: none; }
.find-info .find-info-text:hover { color: black; font-weight: bold; }
      
.find-btn { background-color: white; font-size: 16px; border: none; }

    







   </style>
<main>
<script type="text/javascript">
   // 전체 목록으로 이동
   function fn_boardListPage(f) {
      f.action = 'qnaList';
      f.submit();
   }
   // 새 게시글 작성 페이지로 이동
   function fn_boardInsertPage(f) {
      f.action = 'qnaBoardInsertPage';
      f.submit();
   }
   // 내 게시글 보기
   function fn_myBoardListPage(f) {
      f.action = 'myBoardListPage';
      f.submit();
   }
   function fn_boardViewPage(qPw, qNo, page){
      if(prompt('비밀번호를 입력하세요')==qPw){
         location.href='qnaBoardViewPage?qNo='+qNo+'&page='+page;
      }else{
         alert('비밀번호가 틀렸습니다.');
      }
   }
</script>
</head>
<body>

<div class="contents">

    <div class="contents">
    	<h2 class="h2">FCS QNA</h2>
        <p>Fun하고 Cool 하고 Sexy하게</p>
        <p style="margin-left: 150px; margin-bottom: 20px;"  >전체 ${totalRecord}개</p>  
 
   <table>
      <thead>
         <tr>
            <td>제목</td>
            <td style="text-align: center;">작성자</td>
            <td>작성일</td>
         </tr>
      </thead>
      <tbody>
         <c:if test="${empty list}">
            <tr>
               <td style="text-align:center;" colspan="3">작성된 게시글이 없습니다.</td>
            </tr>
         </c:if>
         <c:if test="${not empty list}">
            <c:forEach var="qDTO" items="${list}">
               <tr>
                  <td>
                     
                     <!-- 1. 댓글과 원글의 구분을 위하여 bDepth만큼 들여쓰기를 한다. -->
                     <c:forEach begin="1" end="${qDTO.qDepth}" step="1">
                        &nbsp;&nbsp;
                     </c:forEach>
                     
                     <!-- 2. 댓글은 제목 앞에 [Re] 를 붙인다. -->
                     <c:if test="${qDTO.qDepth ne 0 and qDTO.qDelete eq 0}">
                        [Re]&nbsp;
                     </c:if>
                     <c:if test="${qDTO.qDepth ne 0 and qDTO.qDelete eq -1}">
                        <span class="deleted">[Re]&nbsp;</span>
                     </c:if>
                     
                     <!-- 3. 삭제된 게시글은 보여주지 않는다. -->
                     <c:if test="${qDTO.qDelete eq 0}">
                        <c:if test="${qDTO.qPw eq NULL or loginDTO.mId eq 'admin'}">
                           <a href="qnaBoardViewPage?qNo=${qDTO.qNo}&page=${page}">${qDTO.qTitle}</a>
                        </c:if>
                        <c:if test="${qDTO.qPw ne NULL and loginDTO.mId ne 'admin'}">
                           <input type="hidden" name="qPw" value="${qDTO.qPw }">
                           <input type="hidden" name="page" value="${page }">
                           <a href="javascript:void(0);" onclick="fn_boardViewPage(${qDTO.qPw}, ${qDTO.qNo}, ${page});">
                           (비밀 글 입니다)
                           </a>
                        </c:if>
                     </c:if>
                     <c:if test="${qDTO.qDelete eq -1}">
                        <c:if test="${loginDTO.mId eq 'admin' }">
                           <span class="deleted"><a href="qnaBoardViewPage?qNo=${qDTO.qNo}&page=${page}">${qDTO.qTitle}(삭제된게시글)</a></span>
                        </c:if>
                        <c:if test="${loginDTO.mId ne 'admin' }">
                           <span class="deleted">삭제된 게시글</span>
                        </c:if>
                     </c:if>
                     
                  </td>
                  <td>${qDTO.mId}</td>
                  <td>${qDTO.qRegdate}</td>
               </tr>
            </c:forEach>
         </c:if>
      </tbody>
      <tfoot>
         <tr>
            <td colspan="3">${pageView}</td>
         </tr>
      </tfoot>
   </table>
</div> <br/><br/>
<div class="qna_btn_center">
	<form>   
      <!-- 로그인하면 게시글을 작성할 수 있다. -->
      <input type="hidden" name="pNo" value="${pNo}" />
      <c:if test="${loginDTO ne null}">
         <input type="hidden" name="mId" value="${loginDTO.mId}"/>
         <input type="button" value="새 게시글 작성하기" onclick="fn_boardInsertPage(this.form)" />
         <input type="button" value="내 게시글 보기" onclick="fn_myBoardListPage(this.form)" />
      </c:if>      
      <input type="hidden" name="page" value="${page}" />
      <input type="button" class="btn1" value="전체목록보기" onclick="fn_boardListPage(this.form)" />
 	 <input type="button" class="btn2" value="메인으로 가기" onclick="location.href='index'" >
   </form>
   </div>
</div>
</main>
   <%@ include file="../template/footer.jsp" %>
   
   