<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/css/subpage_header.css" />
<link rel="icon" type="image/png" sizes="16x16" href="../resources2/images/new logo.png">
<style type="text/css">
</style>
</head>
<body>
<header>
<div id="right_head">
<a href="/main"><img src="../resources2/images/logo_red.png" width=7% height=4% id="logo"/></a>
<li class="sub-menu-parent" tab-index="0" >
       <a href="http://google.com"><img src= "../resources2/images/new logo.png" width=30px height=30px ></a>
       <img src = "../resources2/images/mouse_over.png" width=10px height=10px id="cursor">
       <ul class="sub-menu">
         <li><a href="/mypage">마이 홈</a></li>
         <li><hr></li>
         <li><a href="/help_notice">고객 센터</a></li>
          <li><hr></li>
          <c:if test="${!empty sessionScope.id }">
         <li><a href="/logout">로그아웃</a></li>
         </c:if>
         <c:if test="${empty sessionScope.id }">
         <li><a href="/login">로그인</a></li>
         </c:if>
       </ul>
     </li>
</div>
</header>
</body>
</html>