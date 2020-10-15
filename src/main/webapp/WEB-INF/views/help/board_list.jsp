<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::WEBFLEX 게시판 목록::</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.css" />
<link rel="stylesheet" type="text/css" href="../resources/css/help.css" />
<link rel="icon" type="image/png" sizes="16x16" href="../resources/images/new logo.png">
<style>
#a{color: black;}


#footer .footerbox {
   text-align : center;
   color:white;
   margin-left: auto;
   margin-right: auto;
}
#footer {
   text-align : center;
   background-color: black;
   background-repeat: no-repeat;
   opacity:100%;
   color: white;
   position: absolute;
   width: 100%;
}

#footer a {
   text-decoration: none;
   color: white;
}

#footer a:hover {
   text-decoration: none;
   color: red;
}

#footer .copyright {
   padding-bottom: 2em;
   color : white;
   border-style : none;
   top : 0;
   font-size: 0.7em;
}
#footer .copyright .center{
   display:block;
}
#footer .icons {
   text-align : center;
   font-size : inherit;
   list-style: none;
   text-decoration: none;
   display: inline-block;
}
#footer .icons:hover{
   text-align : center;
   font-size : inherit;
   top:10;
   text-decoration: none;
}
#footer ul{
   text-align: center;
}
#footer ul li{
   display: inline-block;
}
.write_btn{
	border: 1px solid #E50914;
	padding: 10px 15px 10px 15px;
	background: #E50914;
	color: white;
	transition : all 0.5s ease-out;
}
.write_btn:hover {
	border: 1px solid #E50914;
	padding: 10px 15px 10px 15px;
	background-color: white;
	color: #E50914;
	transition: background 0.5s ease-out;
	cursor: pointer;
}
#board_list{
	color: black;
}
</style>
</head>
<body>
<jsp:include page="../header/subpage_header.jsp"></jsp:include>
<!-- Notice -->
<div id="sub">

<div class="title" style="margin-bottom:0px;">고객게시판</div>

<div class="sub_tab" width="1060px;" style="overflow:hidden; margin:0 auto; text-align:center;">
	<div class="sub_tab_menu"><a href="/help_notice">공지사항</a></div>
	<div class="sub_tab_menu on"><a href="/board_list">자유게시판</a></div>
	<div class="sub_tab_menu"><a href="/help_FAQ">FAQ</a></div>
	<div class="sub_tab_menu"><a href="/help_news">WEBFELX NEWS</a></div>
</div>
<br>
<br>
<c:if test="${!empty sessionScope.id }">
<button onclick="location.href='/board_write?page=${page}';" class="write_btn">글쓰기</button>
</c:if>
<div id="sub" style="width:1060px; padding:50px 0; margin:0 auto;">
	<table class="boardlist">
<thead>
	<tr>
		<th width="60">번호</th>
		<th width="">제목</th>
		<th width="100">글쓴이</th>
		<th width="120">날짜</th>
		<th width="80">조회수</th>
	</tr>
</thead>

<c:if test="${!empty list }">
<c:forEach var="list" items="${list }">
	<tbody>
		<tr>
			<td class="num">${list.board_no }</td>
			<td class="subject">
				<a  id="a" href="/board_cont?board_no=${list.board_no}&page=${page}">${list.board_title } </a>
			</td>
			<td class="txt">${list.board_writer }</td>
			<td class="num">${fn:substring(list.board_date,0,10) }</td>
			<td class="num">${list.board_hit }</td>
		</tr>
	</tbody>
</c:forEach>
</c:if>
<c:if test="${empty list }">
	<tbody>
		<tr>
			<th colspan="5">게시물 내용이 존재하지 않습니다.</th>
		</tr>
	</tbody>
</c:if>
</table>

	<div class="page" style="display: flex; justify-content : center;">
	<%-- 검색전 페이징 --%>
	   <c:if test="${page<=1}">
	    <div class="btn">
	     &lt;
	     </div>
	   </c:if>
	    
	    <c:if test="${page>1}">
	    <div class="btn">
	     <a id="board_list" href="./board_list?page=${page-1}">&lt;</a>
	      </div>
	    </c:if>
	   
	    <%--현재 쪽번호 출력--%>
	    <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
	     <c:if test="${a == page}"><%--현재 페이지가 선택되었다면--%>
	      <div class="no_on">
	       <b>${a}</b>
	      </div>
	     </c:if>
	     <c:if test="${a != page}"><%--현재 페이지가 선택되지 않았다면 --%>
	      <div class="no">
	     <a id="board_list" href="./board_list?page=${a}">
	      ${a}
	     </a>
	      </div>
	     </c:if>
	    </c:forEach>
	    
	    <c:if test="${page >= maxpage}">
	    <div class="btn">
	   	 &gt;
	   	</div>
	    </c:if>
	    
	    <c:if test="${page < maxpage}">
	    <div class="btn">
	    	<a id="board_list" class="end" href="./board_list?page=${page+1}">&gt;</a>
	     </div>
	    </c:if>
	   
	</div>



<div>
</div>
</div>
	<br><br>
</div>

</div>

<!-- Notice END -->


</body>

</html>