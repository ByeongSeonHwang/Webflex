<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

   <video style="width:100%; height: 100%; " autoplay controls muted >
      <source
         src="${pageContext.request.contextPath}${movieInfo.movieCardVideo}"
         type="video/mp4">
   </video>

</body>
</html>