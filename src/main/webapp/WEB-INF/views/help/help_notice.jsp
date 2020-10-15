<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>           
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::WEBFLEX 공지목록::</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.css" />
<link rel="stylesheet" type="text/css" href="../resources/css/help.css" />
<link rel="icon" type="image/png" sizes="16x16" href="../resources2/images/new logo.png">
<style>
#help_notice_cont{
	color: black;
}
.btn{
	color: black;
}
</style>
</head>
<header>
<jsp:include page="../header/subpage_header.jsp"></jsp:include>
</header>
<body>
<!-- Notice -->
<div id="sub">
<div class="title" style="margin-bottom:0px;">공지사항</div>

<div class="sub_tab" width="1060px;" style="overflow:hidden; margin:0 auto; text-align:center;">
	<div class="sub_tab_menu on"><a href="/help_notice">공지사항</a></div>
	<div class="sub_tab_menu"><a href="/board_list">자유게시판</a></div>
	<div class="sub_tab_menu"><a href="/help_FAQ">FAQ</a></div>
	<div class="sub_tab_menu"><a href="/help_news">WEBFELX NEWS</a></div>
</div>

<div id="sub" style="width:1060px; padding:50px 0; margin:0 auto;">
	<table class="boardlist">
<thead>
	<tr>
		<th width="60">번호</th>
		<th width="">제목</th>
		<th width="100">글쓴이</th>
		<th width="120">날짜</th>
		<th width="80">조회</th>
	</tr>
</thead>
<c:if test="${!empty hlist}">
<tbody>
   <c:forEach var="h" items="${hlist}">
   <tr>
   <td>${h.notice_no}</td>
   <td><a id="help_notice_cont"href="./help_notice_cont?notice_no=${h.notice_no}&page=${page}">${h.notice_title}</a></td>
   <td>${h.notice_writer}</td>
   <td>${fn:substring(h.notice_date, 0, 10)}</td>
   <td>${h.notice_hit}</td>
   </tr>
   </c:forEach>
</tbody>
 </c:if>
 <c:if test="${empty hlist }">
 <tbody>
 	<tr>
 		<th colspan="5">공지사항이 존재하지 않습니다.</th>
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
	     <a id="help_notice_cont" href="./help_notice?page=${page-1}">&lt;</a>
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
	     <a id="help_notice_cont" href="./help_notice?page=${a}">
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
	    	<a id="help_notice_cont" class="end" href="./help_notice?page=${page+1}">&gt;</a>
	     </div>
	    </c:if>
	   
	</div>

</div>



<div>
	<br><br>
</div>

</div>

<!-- Notice END -->



</body>
</body>
</html>