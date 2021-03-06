<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.css" />

<title></title>


<style>
@import url(https://fonts.googleapis.com/css?family=Lato:400,300,700);

@import
	url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

*, *:before, *:after {
	box-sizing: border-box;
}

html {
	min-width: 100%;
	min-height: 100%;
	background-image:
		url(${pageContext.request.contextPath}/resources2/images/new_background.jpg)
}

body {
	/* background: #43423e; */
	
}

a {
	text-decoration: none;
	color: #5c7fb8;
}

a:hover {
	text-decoration: underline;
}

.movie-card {
	font: 14px/22px "Lato", Arial, sans-serif;
	color: #a9a8a3;
	padding: 40px 0;
	position: relative;
}

.movie-card i {
	position: absolute;
	z-index: 10;
	top: 252px;
	color: darkgray;
	left: 88px;
	font-size: 92px;
	opacity: 40%;
}

.container {
	margin: 0 auto;
	width: 780px;
	height: 680px;
	background: #f0f0ed;
	border-radius: 5px;
	position: relative;
}

.hero {
	height: 342px;
	margin: 0;
	position: relative;
	overflow: hidden;
	z-index: 1;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
}
/* 카드 백그라운드 */
.hero:before {
	content: '';
	width: 100%;
	height: 100%;
	position: absolute;
	overflow: hidden;
	top: 0;
	left: 0;
	background: red;
	background-size: cover;
	z-index: -1;
	transform: skewY(-2.2deg);
	transform-origin: 0 0;
	-webkit-backface-visibility: hidden;
	background-image: url("${pageContext.request.contextPath}/resources2/images/subPoster/${backPath}");
}

.cover {
	position: absolute;
	top: 160px;
	left: 40px;
	z-index: 2;
}

.details {
	padding: 190px 0 0 280px;
}

.details .title1 {
	color: white;
	font-size: 44px;
	margin-bottom: 13px;
	position: relative;
}

.details .title1 span {
	position: absolute;
	top: 3px;
	margin-left: 12px;
	background: #c4af3d;
	border-radius: 5px;
	color: #544c21;
	font-size: 14px;
	padding: 0px 4px;
}

.details .title2 {
	color: #c7c1ba;
	font-size: 23px;
	font-weight: 300;
	margin-bottom: 15px;
}

.details .likes {
	margin-left: 24px;
}

.details .likes:before {
	content:
		url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/195612/icon_like.png");
	position: relative;
	top: 2px;
	padding-right: 7px;
}

.description {
	bottom: 0px;
	height: 200px;
	font-size: 16px;
	line-height: 26px;
	color: #b1b0ac;
}

.column1 {
	padding-left: 50px;
	padding-top: 120px;
	width: 220px;
	float: left;
	text-align: center;
}

.tag {
	background: white;
	border-radius: 10px;
	padding: 3px 8px;
	font-size: 14px;
	margin-right: 4px;
	line-height: 35px;
	cursor: pointer;
}

.tag:hover {
	background: #ddd;
	color: black;
}

.column2 {
	padding-left: 41px;
	padding-top: 30px;
	margin-left: 20px;
	width: 480px;
	float: left;
	font-size: 23px;
    line-height: 1.4;
    color: initial;
}

.avatars {
	margin-top: 23px;
}

.avatars img {
	cursor: pointer;
}

.avatars img:hover {
	opacity: 0.6;
}

.avatars a:hover {
	text-decoration: none;
}

fieldset, label {
	margin: 0;
	padding: 0;
}
/****** Style Star Rating Widget *****/
.rating {
	border: none;
	float: left;
}

.rating>input {
	display: none;
}

.rating>label:before {
	margin: 5px;
	margin-top: 0;
	font-size: 1em;
	font-family: FontAwesome;
	display: inline-block;
	content: "\f005";
}

.rating>.half:before {
	content: "\f089";
	position: absolute;
}

.rating>label {
	color: #ddd;
	float: right;
}
/***** CSS Magic to Highlight Stars on Hover *****/
.rating>input:checked ~ label, .rating:not (:checked ) >label:hover,
	.rating:not (:checked ) >label:hover ~ label {
	/* show gold star when clicked */
	/* hover current star */
	color: #ffd700;
}
/* hover previous stars in list */
.rating>input:checked+label:hover, .rating>input:checked ~ label:hover,
	.rating>label:hover ~ input:checked ~ label, .rating>input:checked ~
	label:hover ~ label {
	/* hover current star when changing rating */
	/* lighten current selection */
	color: #ffed85;
}

a[data-tooltip] {
	position: relative;
}

a[data-tooltip]::before, a[data-tooltip]::after {
	position: absolute;
	display: none;
	opacity: 0.85;
}

a[data-tooltip]::before {
	/* * using data-tooltip instead of title so we * don't have the real tooltip overlapping */
	content: attr(data-tooltip);
	background: #000;
	color: #fff;
	font-size: 13px;
	padding: 5px;
	border-radius: 5px;
	/* we don't want the text to wrap */
	white-space: nowrap;
	text-decoration: none;
}

a[data-tooltip]::after {
	width: 0;
	height: 0;
	border: 6px solid transparent;
	content: '';
}

a[data-tooltip]:hover::before, a[data-tooltip]:hover::after {
	display: block;
}
/** positioning **/
/* top tooltip */
a[data-tooltip][data-placement="top"]::before {
	bottom: 100%;
	left: 0;
	margin-bottom: 40px;
}

a[data-tooltip][data-placement="top"]::after {
	border-top-color: #000;
	border-bottom: none;
	bottom: 50px;
	left: 20px;
	margin-bottom: 4px;
}

#post_play:hover {
	-webkit-transition: 250ms all;
	transition: 250ms all;
}
.avatars img{
width: 52px;
height: auto;
}

</style>
</head>
<body>

	<jsp:include page="../header/main_header.jsp"></jsp:include>
	<div class="movie-card">

		<div class="container">
			<!-- 재생 포스터 부분 -->
			<a href="${movieInfo.movieCardVideoPath}"> <img
				src="${pageContext.request.contextPath}${movieInfo.movieCardBackPath}"
				id="post_play" alt="cover" class="cover" width="187px"
				height="282px" /> <i class="far fa-play-circle"></i>
			</a>
			
			<div class="hero">

				<div class="details">

					<!-- 제목 부분 -->
					<div class="title1">
						${movieInfo.movieTitle}
						<%-- ${해당 영화 제목} --%>
						<span>${movieInfo.movieRating}</span>
					</div>

					<div class="title2">
						${movieInfo.movieSubTitle}
						<%-- ${해당 영화 부제목} --%>
					</div>

				<!-- 	<fieldset class="rating">
						<input type="radio" id="star5" name="rating" value="5" /><label
							class="full" for="star5" title="Awesome - 5 stars"></label> <input
							type="radio" id="star4half" name="rating" value="4 and a half" /><label
							class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
						<input type="radio" id="star4" name="rating" value="4" checked /><label
							class="full" for="star4" title="Pretty good - 4 stars"></label> <input
							type="radio" id="star3half" name="rating" value="3 and a half" /><label
							class="half" for="star3half" title="Meh - 3.5 stars"></label> <input
							type="radio" id="star3" name="rating" value="3" /><label
							class="full" for="star3" title="Meh - 3 stars"></label> <input
							type="radio" id="star2half" name="rating" value="2 and a half" /><label
							class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
						<input type="radio" id="star2" name="rating" value="2" /><label
							class="full" for="star2" title="Kinda bad - 2 stars"></label> <input
							type="radio" id="star1half" name="rating" value="1 and a half" /><label
							class="half" for="star1half" title="Meh - 1.5 stars"></label> <input
							type="radio" id="star1" name="rating" value="1" /><label
							class="full" for="star1" title="Sucks big time - 1 star"></label>
						<input type="radio" id="starhalf" name="rating" value="half" /><label
							class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
					</fieldset> -->

					

				</div>
				<!-- end details -->

			</div>
			<!-- end hero -->

			<div class="description">

				<!-- 키워드 태그부분 -->
				<div class="column1">
					<span class="tag">#${movieInfo.movieCategory}</span>
				</div>
				<!-- end column1 -->

				<div class="column2">
					<!-- 영화 설명부분 -->
					<p>
						${movieInfo.movieContent}

					
					</p>



					<!-- 평론가 부분 -->
					<div class="avatars">
						<c:if test="${!empty Comment.joy}">
							<a href="#" data-tooltip="${Comment.joy}" data-placement="top">
								<img
								src="${pageContext.request.contextPath}/resources2/images/face/나은.png"
								alt="avatar1" />
							</a>
						</c:if>
						<c:if test="${!empty Comment.stone}">
							<a href="#" data-tooltip="${Comment.stone}" data-placement="top">
								<img
								src="${pageContext.request.contextPath}/resources2/images/face/진석.png"
								alt="avatar2" />
							</a>
						</c:if>
						<c:if test="${!empty Comment.dragon}">
						<a href="#" data-tooltip="${Comment.dragon}" data-placement="top">
							<img
							src="${pageContext.request.contextPath}/resources2/images/face/용준.png"
							alt="avatar3" />
						</a>
						</c:if>
						<c:if test="${!empty Comment.fire}">
							<a href="#" data-tooltip="${Comment.fire}" data-placement="top">
								<img
								src="${pageContext.request.contextPath}/resources2/images/face/동열.png"
								alt="avatar3" />
							</a>
						</c:if>
						<c:if test="${!empty Comment.sun}">
							<a href="#" data-tooltip="${Comment.sun}" data-placement="top">
								<img
								src="${pageContext.request.contextPath}/resources2/images/face/병선.png"
								alt="avatar3" />
							</a>
						</c:if>
					</div>
					<!-- end avatars -->



				</div>
				<!-- end column2 -->
			</div>
			<!-- end description -->

		</div>
		<!-- end container -->
	</div>
	<!-- end movie-card -->
</body>
</html>