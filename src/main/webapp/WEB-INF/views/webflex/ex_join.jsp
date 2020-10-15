<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::WEBFLEX유저 회원가입::</title>
<link rel="stylesheet" type="text/css" href="../resources/css/ex_join.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.css" />
<link rel="icon" type="image/png" sizes="16x16" href="../resources2/images/new logo.png">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
@charset "UTF-8";

#footer .footerbox {
   float: center;
   color: white;
   margin-left: auto;
   margin-right: auto;
}

#footer {
   padding-top: 10px;
   text-align: center;
   background-color: black;
   background-repeat: no-repeat;
   opacity: 100%;
   color: white;
   position: relative;
   bottom: 0;
   left: 0;
   right: 0;
   width: 100%;
}

#footer a {
   text-decoration: none;
   color: inherit;
}

#footer a:hover {
   text-decoration: none;
   color: red;
}

#footer .copyright {
   color: white;
   border-style: none;
   top: 0;
   font-size: 0.7em;
}

#footer .icons {
   text-align: center;
   font-size: inherit;
   top: 10;
   list-style: none;
   text-decoration: none;
}

#footer .icons:hover {
   text-align: center;
   font-size: inherit;
   top: 10;
   text-decoration: none;
}

#footer ul {
   text-align: center;
}

#footer ul li {
   display: inline-block;
}
</style>
</head>
<body>
<script type="text/javascript">
	var message = "${message}"
	if(message == "overlap"){
		alert('중복된 아이디 입니다!');
		history.replaceState({}, null, location.pathname);
	}
</script>
   <!-- header -->
   <header>
     <a href="/login"><img src="../resources2/images/logo_red.png" width=10% height=5%; /></a>
   </header>
   
   
   <!-- main -->
   <div class="join_main">
      <form action="/join_ok" method="post"
         onsubmit="return join2_check();">
         <fieldset class="fieldset">
            <p id="title_join">회 원 가 입</p>
            <br> <br>
            <legend> </legend>
            <p>아이디와 비밀번호를 설정하고 우리의 멤버가 되세요!</p>
            <br>

            <div id="join_id">
               <input id="id" type="text" class="type01" name="email"
                  textarea="required" placeholder="이메일 주소"> 
                  <span id="id_check"></span>
            </div>
            
            <div id="checkbox_promotion">
               <h3>
                  
               </h3>
            </div>
            
            <div id="join_pwd">
               <input type="password" id="pw" class="type01" textarea="required"
                  placeholder="비밀번호" name="password"><br> 
                  <span id="pw_check"></span>
            </div>
            <br>
            
            <div id="join_name">
               <input id="name" type="text" class="type01" name="name"
                  textarea="required" placeholder="이름">
               <div class="red"></div>
               <span id="name_check"></span>
            </div>
            <br>
            
            <div id="join_nick">
               <input id="nick" type="text" class="type01" name="nick"
                  textarea="required" placeholder="닉네임" maxlength="10"> 
                  <span id="nick_check"></span>
            </div>
            <br>
            
            <p id="birth">생 년 월 일</p>
            <div id="join_birth">
               <br /> 
               <input type="text" name="year" id="birthyy" maxlength="4" size="6">&nbsp;년 &nbsp;&nbsp; 
               <input type="text" name="month" id="birthmm" maxlength="2" size="4">&nbsp;월&nbsp;&nbsp;
               <input type="text" name="day" id="birthdd" maxlength="2" size="4">&nbsp;일&nbsp;<br>
               <span id="birth_check"></span>
            </div>
            <br>
            
            <div id="join_phone">
               <br> <input type="tel" class="type01" name="phone" id="phone"
                  maxlength="11" placeholder="전화번호( ' - ' 를 빼고 기입해 주세요.)"><br>
               <span id="tel_check"></span>
            </div>
            <br> <br>
            <p>
               <input type="submit" class="next" value="확인"> <br> 
               <input type="reset" class="next" value="취소"
                  onclick="$('.type01').val('').focus();">
            </p>
         </fieldset>
      </form>
   </div>
   <br>


   <!-- Footer -->

   <footer id="footer">
      <ul class="icons">
         <li><a href="https://ko-kr.facebook.com/NetflixKR/"> 
         <i class="fab fa-facebook-f">&nbsp;Facebook&nbsp;</i></a></li>
         <li><a href=""> <i class="fab fa-twitter-square">&nbsp;Twitter&nbsp;</i></a></li>
         <li><a href="https://www.instagram.com/netflixkr/?hl=ko"> 
         <i class="fab fa-instagram">&nbsp;Instagram&nbsp;</i></a></li>
      </ul>
      
      <div class="footerbox">
         <p class="copyright">
            <a href="#">고객 센터 </a><br> <br> &copy; 웹플렉스서비시스코리아 &nbsp;
            유한회사 &nbsp; 통신판매업신고번호: 제xxxx-서울종로-xxxx호<br> <br> 대표: 이용준<br>
            이메일 주소: korea@webflex.com<br> 주소: 서울 동작구 장승배기로 171 2층, 3층<br>
            클라우드 호스팅: Amazon Web Services Inc.: 
            <a href="http://html5up.net">&nbsp;HTML5 UP</a>
         </p>
      </div>
   </footer>


   <script type="text/javascript">
   var message = "${param.message}"
   if(message == "overlap"){
      alert('중복된 아이디 입니다!');
      history.replaceState({}, null, location.pathname);
   }
   </script>

   <script type="text/javascript">   
   $("#id_check").hide();
   $("#pw_check").hide();
   
   function join_check() {
      if($.trim($('#id').val()) == ""){
         $newText = "<font size='2' color='red'>이메일(ID)를 입력해 주세요!</font>"
         $('#id_check').text('');
         $('#id_check').show();
         $('#id_check').append($newText);
         $('#id').val('').focus();
         return false;
      }
      if($.trim($('#pw').val()) == ""){
         $newText = "<font size='2' color='red'>비밀번호를 입력해 주세요!</font>"
         $('#pw_check').text('');
         $('#pw_check').show();
         $('#pw_check').append($newText);
         $('#pw').val('').focus();
         return false;
      }
   }
   
   $("#id").on('keyup', function() {
      var idVal = $.trim($("#id").val());
      var regExp = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/;
      if(idVal.match(regExp) == null){
         $newText = "<font size='2' color='red'>사용 불가능한 이메일 형식입니다.</font>"
         $('#id_check').text('');
         $('#id_check').show();
         $('#id_check').append($newText);
      }else {
         $.ajax({
            type: 'POST',
            url: 'check',
            data: { "id" : idVal },
            datatype: "int",
            success: function(data){ 
               if($.trim(data) == 0){ 
                  $newText = "<font size='2' color='green'>사용 가능한 이메일 입니다.</font>"
                  $('#id_check').text('');
                  $('#id_check').show();
                  $('#id_check').append($newText); 
               } else {
                  $newText = "<font size='2' color='red'>중복되는 아이디 입니다.</font>"
                  $('#id_check').text('');
                  $('#id_check').show();
                  $('#id_check').append($newText);
               } 
            },
         error: function() {
               $newText = "<font size='2' color='red'>오류발생</font>"
               $('#id_check').text('');
               $('#id_check').show();
               $('#id_check').append($newText);
            }
         })
      }
   });
   
    $('#pw').on('keyup', function() {
         var pwVal = $.trim($("#pw").val());
         var regex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$/;
      
         if(pwVal.match(regex) == null){
            $newText = "<font size='2' color='red'>비밀번호는 문자, 숫자를 조합하여 8~16자 이내이여야 합니다.(특수문자 x)</font>"
            $('#pw_check').text('');
            $('#pw_check').show();
            $('#pw_check').append($newText);
         }else {
            $newText = "<font size='2' color='green'>사용 가능한 비밀번호.</font>"
            $('#pw_check').text('');
            $('#pw_check').show();
            $('#pw_check').append($newText);
         }
      });
   </script>

   <script type="text/javascript">
      $("#name_check").hide();
      $("#nick_check").hide();
      $("#tel_check").hide();
      $("#birth_check").html("<font size='2' color='green'>형식: yyyy년 mm월 dd일</font>");
      function join2_check() {
         $("#name_check").hide();
         $("#nick_check").hide();
         $("#birth_check").hide();
         $("#tel_check").hide();
         if ($.trim($('#name').val()) == "") {
            $newText = "<font size='2' color='red'>이름을 입력하세요.</font>";
            $("#name_check").text('');
            $('#name_check').show();
            $('#name_check').append($newText);
            $("#name").focus();
            return false;
         }
         if ($.trim($('#nick').val()) == "") {
            $newText = "<font size='2' color='red'>별명을 입력하세요.</font>";
            $("#nick_check").text('');
            $('#nick_check').show();
            $('#nick_check').append($newText);
            $("#nick").focus();
            return false;
         }
         if ($.trim($('#birthyy').val()) == "") {
            $newText = "<font size='2' color='red'>년도를 입력하세요.</font>";
            $("#birth_check").text('');
            $('#birth_check').show();
            $('#birth_check').append($newText);
            $("#birthyy").focus();
            return false;
         }
         if ($.trim($('#birthmm').val()) == "") {
            $newText = "<font size='2' color='red'>월을 입력하세요.</font>";
            $("#birth_check").text('');
            $('#birth_check').show();
            $('#birth_check').append($newText);
            $("#birthmm").focus();
            return false;
         }
         if ($.trim($('#birthdd').val()) == "") {
            $newText = "<font size='2' color='red'>일을 입력하세요.</font>";
            $("#birth_check").text('');
            $('#birth_check').show();
            $('#birth_check').append($newText);
            $("#birthdd").focus();
            return false;
         }
         if ($.trim($('#phone').val()) == "") {
            $newText = "<font size='2' color='red'>전화번호를 입력하세요.</font>";
            $("#tel_check").text('');
            $('#tel_check').show();
            $('#tel_check').append($newText);
            $("#phone").focus();
            return false;
         }
      };
      $('#phone').on("keyup",function() {
         var phoneVal = $.trim($("#phone").val());
         var regExp = /(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/;
         if (phoneVal.match(regExp) == null) {
            $newText = "<font size='2' color='red'>존재하지 않는 형식의 전화번호 입니다..</font>";
            $("#tel_check").text('');
            $('#tel_check').show();
            $('#tel_check').append($newText);
         } else {
            $newText = "<font size='2' color='green'>전화번호 형식이 정확합니다.</font>";
            $("#tel_check").text('');
            $('#tel_check').show();
            $('#tel_check').append($newText);
         }
      });
      
      $('#name').on("keyup", function() {
         var nameVal = $.trim($('#name').val());
         var regExp = /^[가-힣]{2,4}$/;
         if(nameVal.match(regExp) == null){
            $newText = "<font size='2' color='red'>올바른 이름을 입력해주세요.</font>";
            $('#name_check').text('');
            $('#name_check').show();
            $('#name_check').append($newText);
         }else{
            $('#name_check').hide();
         }
      });
      
      $('#nick').on("keyup", function() {
         var nickVal = $.trim($('#nick').val());
         var regExp = /^.{2,15}$/;
         if(nickVal.match(regExp) == null){
            $newText = "<font size='2' color='red'>닉네임은 2~15자 이내로 입력해주세요</font>";
            $('#nick_check').text('');
            $('#nick_check').show();
            $('#nick_check').append($newText);
         }else{
            $.ajax({
               type: "POST",
               url: "nick_check",
               data: {
                  "nick" : nickVal
               },
               datatype: "int",
               success: function(data) {
                  if($.trim(data) == 0){
                     $newText = "<font size='2' color='green'>사용 가능한 닉네임 입니다.</font>";
                     $('#nick_check').text('');
                     $('#nick_check').show();
                     $('#nick_check').append($newText);
                  }else{
                     $newText = "<font size='2' color='red'>중복되는 닉네임</font>";
                     $('#nick_check').text('');
                     $('#nick_check').show();
                     $('#nick_check').append($newText);
                  }
               },
               error: function() {
                  alert("error!");
               }
            });
         }
      });
      
      $('#birthyy').on("keyup", function() {
         var birthVal = $.trim($('#birthyy').val());
         var regExp =  /^[0-9]*$/
         if(birthVal.match(regExp) == null){
            $newText = "<font size='2' color='red'>숫자만 입력하세요!</font>";
            $('#birth_check').text('');
            $('#birth_check').show();
            $('#birth_check').append($newText);
         }else{
            $('#birth_check').hide();
         }
      });
      
      $('#birthmm').on("keyup", function() {
         var birthVal = $.trim($('#birthmm').val());
         var regExp =  /^[0-9]*$/
         if(birthVal.match(regExp) == null){
            $newText = "<font size='2' color='red'>숫자만 입력하세요!</font>";
            $('#birth_check').text('');
            $('#birth_check').show();
            $('#birth_check').append($newText);
         }else{
            $('#birth_check').hide();
         }
      });
      
      $('#birthdd').on("keyup", function() {
         var birthVal = $.trim($('#birthdd').val());
         var regExp =  /^[0-9]*$/
         if(birthVal.match(regExp) == null){
            $newText = "<font size='2' color='red'>숫자만 입력하세요!</font>";
            $('#birth_check').text('');
            $('#birth_check').show();
            $('#birth_check').append($newText);
         }else{
            $('#birth_check').hide();
         }
      });
   </script>


   </body>
</html>