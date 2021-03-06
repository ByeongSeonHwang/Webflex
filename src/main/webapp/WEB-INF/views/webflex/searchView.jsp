<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url(https://fonts.googleapis.com/css?family=Open+Sans:300,400,700);
 * {
 background-size: cover;
 box-sizing: border-box;
}
 body {
	 -webkit-font-smoothing: antialiased;
	 -moz-osx-font-smoothing: grayscale;
	 height: 100vh;
	 font-family: 'Open Sans', sans-serif;
	 background-color: black;
}
 a {
	 text-decoration: none;
}
 h1 {
	 font-family: 'Open Sans', sans-serif;
	 font-weight: 300;
}
 .row {
	 max-width: 95%;
	 margin: 50px auto 0;
}
 .card {	
	 float: left;
	 padding: 25px 0.2rem;
	 width: 20%;
}
 .card .menu-content {
	 margin: 0;
	 padding: 0;
	 list-style-type: none;
}
 .card .menu-content::before, .card .menu-content::after {
	 content: '';
	 display: table;
}
 .card .menu-content::after {
	 clear: both;
}
 .card .menu-content li {
	 display: inline-block;
}
 .card .menu-content a {
	 color: #fff;
}
 .card .menu-content span {
	 left: 50%;
	 top: 0;
	 font-size: 20px;
	 font-weight: 700;
	 font-family: 'Open Sans';
	 transform: translate(-50%, 0);
	 width: 40px;
}
 .card .wrapper {
	 background-color: #fff;
	 min-height: 200px;
	 position: relative;
	 overflow: hidden;
	 box-shadow: 0 19px 38px rgba(0, 0, 0, 0.3), 0 15px 12px rgba(0, 0, 0, 0.2);
	 border-radius: 6px;
	 
}
 .card .wrapper:hover .data {
	 transform: translateY(0);
}
 .card .data {
	 position: absolute;
	 bottom: 0;
	 width: 100%;
	 transform: translateY(calc(70px + 1em));
	 transition: transform 0.3s;
}
 .card .data .content {
	 padding: 1em;
	 position: relative;
	 z-index: 1;
}
 .card .author {
	 font-size: 12px;
}
 .card .title {
	 margin-top: 10px;
}
 .card .text {
	 height: 70px;
	 margin: 0;
}
 .card input[type='checkbox'] {
	 display: none;
}
 .card input[type='checkbox']:checked + .menu-content {
	 transform: translateY(-60px);
}

 .example-2 .wrapper {
}
 .example-2 .wrapper:hover .menu-content span {
	 transform: translate(-50%, -10px);
	 opacity: 1;
}
 .example-2 .header {
	 color: #fff;
	 padding: 1em;
}
 .example-2 .header::before, .example-2 .header::after {
	 content: '';
	 display: table;
}
 .example-2 .header::after {
	 clear: both;
}
 .example-2 .header .date {
	 float: left;
	 font-size: 12px;
}
 .example-2 .menu-content {
	 float: right;
}
 .example-2 .menu-content li {
	 margin: 0 5px;
	 position: relative;
}
 .example-2 .menu-content span {
	 transition: all 0.3s;
	 opacity: 0;
}
 .example-2 .data {
	 color: #fff;
	 transform: translateY(calc(70px + 4em));
}
 .example-2 .title a {
	 color: #fff;
}
 .example-2 .button {
	 display: block;
	 width: 100px;
	 margin: 2em auto 1em;
	 text-align: center;
	 font-size: 12px;
	 color: #fff;
	 line-height: 1;
	 position: relative;
	 font-weight: 700;
}
 .example-2 .button::after {
	 content: '\2192';
	 opacity: 0;
	 position: absolute;
	 right: 0;
	 top: 50%;
	 transform: translate(0, -50%);
	 transition: all 0.3s;
}
 .example-2 .button:hover::after {
	 transform: translate(5px, -50%);
	 opacity: 1;
}
#Rel_content{
color: grey;
padding-top: 10%;
padding-left: 35px;
}
 .Rel_content_ul ul,li,a{
list-style: none;
margin: 0;
padding: 0;
color: white;
float: left;
text-decoration: none;
 }
#clear {
	clear: both;
}
#search_none{
	display: table;
	margin-left: auto;
  	margin-right: auto;
}

</style>
</head>
<body>
	<div id="Rel_content">
			<span>다음과 관련된 컨텐츠 :
			<ul class="Rel_content_ul">
				<c:set var="loop_flag" value="false" /> <!-- break 대신 -->
					<c:forEach var="m" items="${relMovie}" varStatus="status">
						<c:if test="${status.last}">
						
							<li><a href="/searchView?search=${m}">&nbsp;${m}</a></li>
						
							<c:set var="loop_flag" value="true" />
						</c:if>
						<c:if test="${not loop_flag}">
						
							<li><a href="/searchView?search=${m}">&nbsp;${m} |</a></li>
						
						</c:if>
					</c:forEach>
			</ul>
			</span>
	</div>
	
	<div id="clear"></div>
	
<div class="row">
 <!--  <div class="example-1 card">
    <div class="wrapper">
      <div class="date">
        <span class="day">12</span>
        <span class="month">Aug</span>
        <span class="year">2016</span>
      </div>
      <div class="data">
        <div class="content">
          <span class="author">Jane Doe</span>
          <h1 class="title"><a href="#">Boxing icon has the will for a couple more fights</a></h1>
          <p class="text">The highly anticipated world championship fight will take place at 10am and is the second major boxing blockbuster in the nation after 43 years.</p>
          <label for="show-menu" class="menu-button"><span></span></label>
        </div>
        <input type="checkbox" id="show-menu" />
        <ul class="menu-content">
          <li>
            <a href="#" class="fa fa-bookmark-o"></a>
          </li>
          <li><a href="#" class="fa fa-heart-o"><span>47</span></a></li>
          <li><a href="#" class="fa fa-comment-o"><span>8</span></a></li>
        </ul>
      </div>
    </div>
  </div> -->
  <c:if test="${!empty searchMovie}">
  
	  <c:forEach var="m" items="${searchMovie}">
	  <c:set var = "length" value = "${fn:length(m.moviePosterPath)}"/>
	  <div class="example-2 card">
	    <div class="wrapper" style="background-image:url('${pageContext.request.contextPath}/resources2/images/mainPoster/${fn:substring(m.moviePosterPath,29,length) }');">
	      <div class="header">
	        <ul class="menu-content">
	         
	          <li><span>${m.movieRating}</span></li>

	        </ul>
	      </div>
	      <div class="data">
	        <div class="content">
	         <!--  <span class="author">Jane Doe</span> -->
	          <%-- <h1 class="title">${m.movieTitle}</h1> --%>
	          <c:set var="TextValue" value="${m.movieContent}"/>
	          <p class="text">${fn:substring(TextValue,0,60) }...</p>
	          <a href="info?movieId=${m.movieId}" class="button">Read more</a>
	        </div>
	      </div>
	    </div>
	  </div>
  	</c:forEach>
  </c:if>
  <c:if test="${empty searchMovie}">
  <div id="search_none">
  	<p style="color: white">입력하신 검색어 ${result}와(과) 일치하는 결과가 없습니다.</p> <br/><br/>
  	추천검색어 : <br/>
  	<ul>
  		<li>다른 키워드를 검색해 보세요.</li><br/>
  		<li>영화 제목이나 배우이름으로 검색해 보세요.</li><br/>
  		<li>액션,로맨스,가족 등 장르명으로 검색해 보세요.</li><br/>
  		
  	</ul>
  	
  </div>
  </c:if>
</div>

</body>
</html>