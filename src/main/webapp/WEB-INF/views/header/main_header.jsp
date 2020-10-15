<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="./resources/css/main_header.css" />
<link rel="icon" type="image/png" sizes="16x16" href="../resources2/images/new logo.png">
</head>

<script>
$(document).ready(function() {
    $('#searchOk').submit(function() {
        if ($('#search').val() == '') {
            return false;
        }
      
        
        
        
    }); // end submit()
}); // end ready()
</script>

<body>
	<header class="upper">

		<div id="right_head">
			<a href='/main'><img src="./resources2/images/logo_red.png" width=5% height=4%
				id="logo" /></a>
			<li class="sub-menu-parent" tab-index="0"><a
				href="/mypage"><img src="./resources2/images/new logo.png"
					width=30px height=30px></a> <img
				src="../resources2/images/mouse_over.png" width=10px height=10px
				id="cursor">
				<ul class="sub-menu">
					<li><a href="/mypage">마이 홈</a></li>
         			<li><hr></li>
         			<li><a href="/help_notice">고객센터</a></li>
          			<li><hr></li>
          			<c:if test="${!empty sessionScope.id }">
         			<li><a href="/logout">로그아웃</a></li>
         			</c:if>
        			 <c:if test="${empty sessionScope.id }">
         			<li><a href="/login">로그인</a></li>
         			</c:if>
				</ul></li>

			<div id="wrap">
				<form action="searchView" autocomplete="on" name="searchOk" id="searchOk">
					<input id="search" name="search" type="text" placeholder="제목,사람,장르">
					<input id="search_submit" type="submit">
				</form>
			</div>
			<div id="main_category">
				<ul id="main_ul">
					<li><a href="/main">홈</a></li>
					<c:if test="${sessionScope.tiket eq 101 }">
					<li><a href="/newContent">최신 콘텐츠</a></li>
					</c:if>
					<c:if test="${sessionScope.authority eq 'admin' }">
					<li><a href="/newContent">최신 콘텐츠</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	
	</header>
</body>
</html>