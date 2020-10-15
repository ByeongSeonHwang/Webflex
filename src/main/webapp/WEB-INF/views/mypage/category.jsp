<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::카테고리 등록 페이지::</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<link rel="icon" type="image/png" sizes="16x16" href="../resources2/images/new logo.png">
<style type="text/css">
/* CSS rules are kept repetitive so that you can get CSS rules for each button easily :) */

*
{
    user-select: none;
    -webkit-tap-highlight-color:transparent;
}

*:focus
{
    outline: none;
}

body
{
    font-family: Arial, Helvetica, sans-serif;
    margin: 0;
    background-color: #f1f9f9;
}

#app-cover
{
    display: table;
    width: 600px;
    margin: 80px auto;
    counter-reset: button-counter;
    margin-top: 150px;
}

.row
{
    display: table-row;
}

.category-btn{
}

.toggle-button-cover
{
    display: table-cell;
    position: relative;
    width: 200px;
    height: 140px;
    box-sizing: border-box;
}

.button-cover
{
    height: 100px;
    margin: 20px;
    background-color: #fff;
    box-shadow: 0 10px 20px -8px #c5d6d6;
    border-radius: 4px;
}

.button-cover:before
{
    position: absolute;
    right: 0;
    bottom: 0;
    color: #d7e3e3;
    font-size: 12px;
    line-height: 1;
    padding: 5px;
}

.button-cover, .knobs, .layer
{
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
}

.button
{
    position: relative;
    top: 50%;
    width: 74px;
    height: 36px;
    margin: -20px auto 0 auto;
    overflow: hidden;
}

.button.r, .button.r .layer
{
    border-radius: 100px;
}

.button.b2
{
    border-radius: 2px;
}

.checkbox
{
    position: relative;
    width: 100%;
    height: 100%;
    padding: 0;
    margin: 0;
    opacity: 0;
    cursor: pointer;
    z-index: 3;
}

.knobs
{
    z-index: 2;
}

.layer
{
    width: 100%;
    background-color: #ebf7fc;
    transition: 0.3s ease all;
    z-index: 1;
}


/* Button 10 */
#button-10 .knobs:before, #button-10 .knobs:after, #button-10 .knobs span
{
    position: absolute;
    top: 4px;
    width: 20px;
    height: 10px;
    font-size: 10px;
    font-weight: bold;
    text-align: center;
    line-height: 1;
    padding: 9px 4px;
    border-radius: 2px;
    transition: 0.3s ease all;
}

#button-10 .knobs:before
{
    content: '';
    left: 4px;
    background-color: #03A9F4;
}

#button-10 .knobs:after
{
    content: 'YES';
    right: 4px;
    color: #4e4e4e;
}

#button-10 .knobs span
{
    display: inline-block;
    left: 4px;
    color: #fff;
    z-index: 1;
}

#button-10 .checkbox:checked + .knobs span
{
    color: #4e4e4e;
}

#button-10 .checkbox:checked + .knobs:before
{
    left: 42px;
    background-color: #F44336;
}

#button-10 .checkbox:checked + .knobs:after
{
    color: #fff;
}

#button-10 .checkbox:checked ~ .layer
{
    background-color: #fcebeb;
}


#ytd-url {
  display: block;
  position: fixed;
  right: 0;
  bottom: 0;
  padding: 10px 14px;
  margin: 20px;
  color: #fff;
  font-size: 14px;
  text-decoration: none;
  background-color: #143240;
  border-radius: 4px;
  box-shadow: 0 10px 20px -5px rgba(20, 50, 64, 0.76);
}

#submit-div{
	width: 100%;
	height: 30%;
}
.menu-sub-div{
	background: white;
	width: 120px;
	height: 60px;
	float: left;
	margin-right: 20px;
	margin-left: 20px;
	box-shadow: 0 10px 20px -8px #E50914;
	border-radius: 5px;
}
.sub-menu-btn{
	border: none;
	width: 100%;
	height: 100%;
	background: #E50914;
	color: white;
	border-radius: 5px;
	transition : all 0.5s ease-out;
	font-size: 14px;
	font-weight: bold;
}
.sub-menu-btn:hover{
	background: white;
	color: black;
	transition : all 0.5s ease-out;
}
.category{
	z-index: 10 !mportant;
	 color: black; 
	 margin-bottom: 50px;
	 position : fixed;
	 margin-top: 6px;
	 margin-left: 64px;
	 font-size: 13px
}
.sub-menu-div{
	color: black;
	height: 100%;
	width: 100%;
	background: #E50914;
	text-align: center;
	border-radius: 5px;
	font-size: 14px;
	font-weight: bold;
	transition: all 0.5s ease-out;
}
.sub-menu-div:hover{
	background: white;
	color: #E50914;
	transition: all 0.5s ease-out;
}
</style>
</head>
<body>
<jsp:include page="../header/subpage_header.jsp"></jsp:include>
<form action="/category_commit" method="post">
<div id="app-cover">
  <div class="row">
    <div class="toggle-button-cover">
      <div class="button-cover" id="action-cover">
      <span class="category" style="margin-left: 70px;">액션</span>
        <div class="button b2" id="button-10">
          <input type="checkbox" class="checkbox" name="category" value="액션" id="actionChk">
          <div class="knobs">
            <span>NO</span>
          </div>
          <div class="layer"></div>
        </div>
      </div>
    </div>
    <div class="toggle-button-cover">
      <div class="button-cover" id="sf-cover">
      <span class="category" style="margin-left: 70px;">SF</span>
        <div class="button b2" id="button-10">
          <input type="checkbox" class="checkbox" name="category" value="SF" id="sfChk">
          <div class="knobs">
            <span>NO</span>
          </div>
          <div class="layer"></div>
        </div>
      </div>
    </div>
    <div class="toggle-button-cover">
      <div class="button-cover" id="thrille-cover">
      <span class="category">스릴러</span>
        <div class="button b2" id="button-10">
          <input type="checkbox" class="checkbox" name="category" value="스릴러" id="thrillerChk">
          <div class="knobs">
            <span>NO</span>
          </div>
          <div class="layer"></div>
        </div>
      </div>
    </div>
   </div>
  <div class="row">
    <div class="toggle-button-cover">
      <div class="button-cover" id="ani-cover">
      <span class="category" style="margin-left: 50px;">애니메이션</span>
        <div class="button b2" id="button-10">
          <input type="checkbox" class="checkbox" name="category" value="애니메이션" id="aniamtionChk">
          <div class="knobs">
            <span>NO</span>
          </div>
          <div class="layer"></div>
        </div>
      </div>
    </div>
   <div class="toggle-button-cover">
      <div class="button-cover" id="fantasy-cover">
      <span class="category">판타지</span>
        <div class="button b2" id="button-10">
          <input type="checkbox" class="checkbox" name="category" value="판타지" id="fantasyChk">
          <div class="knobs">
            <span>NO</span>
          </div>
          <div class="layer"></div>
        </div>
      </div>
    </div>
   <div class="toggle-button-cover">
      <div class="button-cover" id="drama-cover">
      <span class="category">드라마</span>
        <div class="button b2" id="button-10">
          <input type="checkbox" class="checkbox" name="category" value="드라마" id="dramaChk">
          <div class="knobs">
            <span>NO</span>
          </div>
          <div class="layer"></div>
        </div>
      </div>
    </div>
   </div>
  <div class="row">
   <div class="toggle-button-cover">
      <div class="button-cover" id="music-cover">
      <span class="category" style="margin-left: 70px;">음악</span>
        <div class="button b2" id="button-10">
          <input type="checkbox" class="checkbox" name="category" value="음악" id="musicChk">
          <div class="knobs">
            <span>NO</span>
          </div>
          <div class="layer"></div>
        </div>
      </div>
    </div>
    <div class="toggle-button-cover">
      <div class="button-cover" id="romans-cover">
      <span class="category">로맨스</span>
        <div class="button b2" id="button-10">
          <input type="checkbox" class="checkbox" name="category" value="로맨스" id="romanceChk">
          <div class="knobs">
            <span>NO</span>
          </div>
          <div class="layer"></div>
        </div>
      </div>
    </div>
    <div class="toggle-button-cover">
      <div class="button-cover" id="comedy-cover">
        <span class="category">코메디</span>
        <div class="button b2" id="button-10">
          <input type="checkbox" class="checkbox" name="category" value="코메디" id="comedyChk">
          <div class="knobs">
            <span>NO</span>
          </div>
          <div class="layer"></div>
        </div>
      </div>
    </div> 
   </div>
 </div>
 <div id="menu-div" >
 	<div class="menu-sub-div" style="margin-left: 38.8%;">
 		<input type="submit" class="sub-menu-btn" value="확인">
 	</div>
 	<div class="menu-sub-div">
 		<button type="button" onclick="check_false();" class="sub-menu-btn">취소</button>
 	</div>
 	<div class="menu-sub-div">
 		<button type="button" onclick="location.href='/mypage'" class="sub-menu-btn">마이페이지</button>
 	</div>
 </div>
</form>
<script type="text/javascript">
/* var test; */
$(document).ready(function(){
    $("#actionChk").change(function(){
        if($("#actionChk").is(":checked")){
        	$('body').css("background","url(../resources2/images/카테고리/배트맨.jpg)");
        	$('body').css("background-size","100%");        	
        }else{
        	$('body').css("background","#f1f9f9");
        }
    });
});

$(document).ready(function(){
    $("#sfChk").change(function(){
        if($("#sfChk").is(":checked")){
        	$('body').css("background","url(../resources2/images/카테고리/인터스텔라2.jpg)");
        	$('body').css("background-size","100%");
        }else{
        	$('body').css("background","#f1f9f9");
        }
    });
});
$(document).ready(function(){
    $("#thrillerChk").change(function(){
        if($("#thrillerChk").is(":checked")){
        	$('body').css("background","url(../resources2/images/카테고리/스릴러2.jpg)");
        	$('body').css("background-size","100%");
        }else{
        	$('body').css("background","#f1f9f9");
        }
    });
});
$(document).ready(function(){
    $("#aniamtionChk").change(function(){
        if($("#aniamtionChk").is(":checked")){
        	$('body').css("background","url(../resources2/images/카테고리/토토로.jpg)");
        	$('body').css("background-size","100%");
        }else{
        	$('body').css("background","#f1f9f9");
        }
    });
});
$(document).ready(function(){
    $("#fantasyChk").change(function(){
        if($("#fantasyChk").is(":checked")){
        	$('body').css("background","url(../resources2/images/카테고리/해리포터.jpg)");
        	$('body').css("background-size","100%");
        }else{
        	$('body').css("background","#f1f9f9");
        }
    });
});
$(document).ready(function(){
    $("#dramaChk").change(function(){
        if($("#dramaChk").is(":checked")){
        	$('body').css("background","url(../resources2/images/카테고리/타이타닉.jpg)");
        	$('body').css("background-size","100%");
        }else{
        	$('body').css("background","#f1f9f9");
        }
    });
});
$(document).ready(function(){
    $("#musicChk").change(function(){
        if($("#musicChk").is(":checked")){
        	$('body').css("background","url(../resources2/images/카테고리/라라랜드.jpg)");
        	$('body').css("background-size","100%");
        }else{
        	$('body').css("background","#f1f9f9");
        }
    });
});
$(document).ready(function(){
    $("#romanceChk").change(function(){
        if($("#romanceChk").is(":checked")){
        	$('body').css("background","url(../resources2/images/카테고리/노트북.jpg)");
        	$('body').css("background-size","100%");
        }else{
        	$('body').css("background","#f1f9f9");
        }
    });
});
$(document).ready(function(){
    $("#comedyChk").change(function(){
        if($("#comedyChk").is(":checked")){
        	$('body').css("background","url(../resources2/images/카테고리/킹스맨.jpg)");
        	$('body').css("background-size","100%");
        }else{
        	$('body').css("background","#f1f9f9");
        }
    });
});

function check_false() {
	$('.checkbox').prop('checked',false);
}
</script>
</body>
</html>