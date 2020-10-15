<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="../resources/css/main_header.css" />
<link rel="shortcut icon" href="../resources2/images/Netflix_favicon.ico">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>

<style>
body {
	position: static;
}

#clear {
	clear: both;
}

/* #main_back_image{
	position:absolute;
	top:0px;
	left:0px;
	width: 100%;
	z-index: -1;
} */
body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, a, button,
	form, fieldset, p, blockquote {
	margin: 0;
	padding: 0;
	font-size: 23px
}

img, fieldset {
	border: none
}

body, dl, dt, dd, th, td, div, p, a, button, table, li, form, fieldset,
	legend, input, button, textarea, select {
	
}

body, dl, dt, dd, th, td, div, p, a, button, table, li {
	font-size: 12px;
}

form, fieldset, legend, input, button, textarea, select {
	font-size: 13px
}

ul, ol {
	list-style: none
}

table {
	border-collapse: collapse
}

input, textarea {
	display: inline-block;
	font-size: 13px;
	vertical-align: middle
}

textarea {
	resize: none
}

address, em {
	font-style: normal
}

th, td {
	padding: 0;
	vertical-align: top;
	text-align: left;
	font-weight: normal
}


#main_back_image_info {
	position: relative;
	width: 35%;
	left: 5%;
	top: 40%;
	color: white;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, .45);
	font-size: 3vmin;
	display: block;
}

#main_back_image_logo {
	margin-bottom: 0.5em;
}

#vid {
	position: absolute;
	left: 50%;
	top: 0;
	margin-left: -50%;
	width: 100%;
	height: auto;
	z-index: 1;
}
#slide_main_wrap{
	padding: 10% 2%;
}

</style>
</head>
<body>

	
	<header>
		<jsp:include page="../header/main_header.jsp"></jsp:include>
	</header>

	<div id="clear"></div>
	<!-- 헤더 부분 종료 -->


	
	<!-- 메인화면 맨위 div끝 -->


	<div id="clear"></div>
	<div id="slide_main_wrap">
	<!-- 슬라이드 시작 -->
		<div class="slide_start">
		<c:if test="${!empty newContentCategory}">
			<jsp:include page="../slide/new_content_slide/new_content_userLike.jsp"></jsp:include>
		</c:if>
		<c:if test="${!empty newContentDay}">
			<jsp:include page="../slide/new_content_slide/new_content_today.jsp"></jsp:include>
		</c:if>
			<jsp:include page="../slide/new_content_slide/new_content_month.jsp"></jsp:include>
			<jsp:include page="../slide/new_content_slide/new_content_power.jsp"></jsp:include>
			<jsp:include page="../slide/new_content_slide/new_content_Rest.jsp"></jsp:include>
			<jsp:include page="../slide/new_content_slide/new_content_Love.jsp"></jsp:include>
		</div>
		<!-- 슬라이드 끝 -->
	</div>
	<div id="clear"></div>



	<!-- footer -->
	<jsp:include page="../footer/main_footer.jsp" />
</body>

</html>