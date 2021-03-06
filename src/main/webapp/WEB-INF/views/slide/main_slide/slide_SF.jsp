<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<title></title>
<style>
html, #slide_body{
  position: relative;
  height: 100%;
}

#slide_body {
  background: #000;
  font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
  font-size: 14px;
  color: #fff;
  margin: 0;
  padding: 0;
}

.swiper-container {
  width: 100%;
  height: 100%;
}

.swiper-slide {
  text-align: center;
  font-size: 18px;
  /* Center slide text vertically */
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: center;
  -ms-flex-pack: center;
  justify-content: center;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
}


h1 {
  font-family: Arial, Helvetica, sans-serif;
  color: red;
  text-align: center;
}
/* h2{
margin:0px;
} */

#poster {
  max-width: 100%;
  height: auto;
  width: 100%;
  height: 200px;
}

:root {
  --swiper-theme-color: #fff;
}

.netflix-slider .swiper-wrapper {
  padding: 20px 0;
}

.netflix-slider .swiper-slide {
  -webkit-transition: 250ms all;
  transition: 250ms all;
}

.netflix-slider .swiper-slide:hover {
  -webkit-transform: scale(1.4);
          transform: scale(1.4);
  z-index: 1;
  transition-delay: 0.3s;
}

.netflix-slider .swiper-slide:first-child:hover {
  margin: 0 40px;
}

.netflix-slider .swiper-slide:last-child:hover {
  margin: 0 -40px;
}
</style>

</head>
<body id="slide_body">
 <!-- Swiper -->
  <div class="netflix-slider">
    <h2>SF : 있을법한 공상과학</h2>
    <div class="swiper-container">
      <div class="swiper-wrapper">
      
      	<c:forEach var="m" items="${SF}">
      	
        <div class="swiper-slide"><a href="info?movieId=${m.movieId}"><img src="${pageContext.request.contextPath}${m.moviePosterPath}" alt="Movie Title" id="poster"></a></div>
      	</c:forEach>
      </div>
      <br>
      <!-- Add Pagination -->
      <div class="swiper-pagination"></div>
      <!-- <div class="swiper-pagination"></div> -->
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
    </div>
  </div>
  
  <!-- Swiper JS -->

  <!-- Initialize Swiper -->
  <script type="text/javascript">
    var swiper = new Swiper('.swiper-container', {
      slidesPerView: 6,
      spaceBetween: 10,
      slidesPerGroup: 6,
      speed:500,
      loop:"true",
      loopFillGroupWithBlank : true,
      pagination: {
        clickable: false,
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
    
    
    $('document').ready(function(){
    	
    	$('#btn_a').on('click',function(){
    		//alert('Top');
    		var offset = $('#btn_a').offset();
    		$('html,body').animate({scrollTop:offset.top},400);
    		
        });

    	$('html').on('mousewheel',function(){  		
    		
    		var wheel = $('html').scrollTop();
    		if(wheel == 0){
    			$('header.upper').removeClass('fix');
    		}
    		else{
    			$('header.upper').addClass('fix');
    		}
    	});
    });
    
  </script>
</body>
</html>