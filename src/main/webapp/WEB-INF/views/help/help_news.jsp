<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::WEBFLEX NEWS::</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.css" />
<link rel="stylesheet" type="text/css" href="../resources/css/help.css" />
<link rel="icon" type="image/png" sizes="16x16" href="../resources2/images/new logo.png">
<style type="text/css">
#news_text{
	color: black;
}
#news_text:hover{
	color: #E50914;
}
</style>
</head>
<body>
<header>
<jsp:include page="../header/subpage_header.jsp"></jsp:include>
</header>
<!-- Notice -->
<div id="sub">

<div class="title" style="margin-bottom:0px;">WEBFELX NEWS</div>

<div class="sub_tab" width="1060px;" style="overflow:hidden; margin:0 auto; text-align:center;">
	<div class="sub_tab_menu"><a href="/help_notice">공지사항</a></div>
	<div class="sub_tab_menu"><a href="/board_list">고객게시판</a></div>
	<div class="sub_tab_menu"><a href="/help_FAQ">FAQ</a></div>
	<div class="sub_tab_menu on"><a href="/help_news">WEBFLEX NEWS</a></div>
</div>
 <img style="width:100%;" src="../resources2/images/News.jpg">
<div id="sub" style="width:1060px; padding:50px 0; margin:0 auto;">

<!-- News Start -->

<ul id="news">
    <li>
        <div class="n_img">
			<img src="../resources2/images/50story.jpg">
        </div>
        <div class="n_con">
            <span>2020-10-14</span>
            <a id="news_text" href="${pageContext.request.contextPath}/help_news/news3">WEBFLEX, 50일간의 이야기</a>
        </div>
    </li>

    <li>
        <div class="n_img">
			<img src="../resources2/images/WEBFLEX.png">
        </div>
        <div class="n_con">
            <span>2020-06-10</span>
            <a id="news_text" href="${pageContext.request.contextPath}/help_news/news2">WEBFLEX, 프레임워크 기반 자바 웹 개발자 양성 프로젝트 기획</a>
        </div>
    </li>

    <li>
        <div class="n_img">
			<img src="../resources2/images/KG에듀원.png">
        </div>
        <div class="n_con">
            <span>2020-04-21</span>
            <a id="news_text" href="${pageContext.request.contextPath}/help_news/news1">(주)KG에듀원 아이디뱅크 노량진학원, 개발자 양성 진행</a>
        </div>
    </li>

</ul>


<!-- news END -->
<div>

</div>
	<br><br>
</div>



</div>

<!-- Notice END -->



</body>
</body>
</html>