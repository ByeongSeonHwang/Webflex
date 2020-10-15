<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
   <link rel="icon" type="image/png" sizes="16x16" href="./resources2/images/new logo.png">
    <title>관리자 페이지 </title>
    <!-- Custom CSS -->
    <link href="./resources/admin/assets/libs/flot/css/float-chart.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="./resources/admin/dist/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<style>
.btn-danger {
float : none;
	color: #fff;
	background-color: #DB202C;
	border-color: #DB202C;
	}
	.btn-danger:hover {
float : none;
	color: #fff;
	background-color: #DB202C;
	border-color: #DB202C;
}

.btn-danger.focus, .btn-danger:focus {
	-webkit-box-shadow: 0 0 0 0.2rem rgba(218, 84, 46, 0.5);
	box-shadow: 0 0 0 0.2rem rgba(218, 84, 46, 0.5)
}

.btn-danger.disabled, .btn-danger:disabled {

	color: #fff;
	background-color: #DB202C;
	border-color: #DB202C;
}

.btn-danger:not (:disabled ):not (.disabled ).active, .btn-danger:not (:disabled
	):not (.disabled ):active, .show>.btn-danger.dropdown-toggle {

	color: #fff;
	background-color: #DB202C;
	border-color: #aa3d1e
}

.btn-danger:not (:disabled ):not (.disabled ).active:focus, .btn-danger:not
	(:disabled ):not (.disabled ):active:focus, .show>.btn-danger.dropdown-toggle:focus
	{
	-webkit-box-shadow: 0 0 0 0.2rem rgba(218, 84, 46, 0.5);
	box-shadow: 0 0 0 0.2rem rgba(218, 84, 46, 0.5)
}
#page{
display: flex;
font-size: 1.2rem;
margin-left : 25%;
margin-right : 25%;
padding : 0% 20%;

}
.btn{
padding-top : 5%!important;
}
.no,.no_on{
padding : 0% 5%;
}
#btn-board{
margin : 2% 2%;
}
#searchbox {
    float: right;
}
</style>
</head>

<body>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <header class="topbar" data-navbarbg="skin5">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <div class="navbar-header" data-logobg="skin5">
                    <!-- This is for the sidebar toggle which is visible on mobile only -->
                    <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                    <!-- ============================================================== -->
                    <!-- Logo -->
                    <!-- ============================================================== -->
                    <a class="navbar-brand" href="admin">
                        <!-- Logo icon -->
                        <b class="logo-icon p-l-10">
                            <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                            <!-- Dark Logo icon -->
                            <a href='/main'><img src="./resources2/images/new logo.png" alt="homepage" class="light-logo" width="25px" height="25px" /></a>
                           
                        </b>
                        <!--End Logo icon -->
                         <!-- Logo text -->
                        <span class="logo-text">
                             <!-- dark Logo text -->
                             <img src="./resources2/images/logo_red_new.png" alt="homepage" class="light-logo" width="135px"height="25px"/>
                            
                        </span>
                        <!-- Logo icon -->
                        <!-- <b class="logo-icon"> -->
                            <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                            <!-- Dark Logo icon -->
                            <!-- <img src="assets/images/logo-text.png" alt="homepage" class="light-logo" /> -->
                            
                        <!-- </b> -->
                        <!--End Logo icon -->
                    </a>
                    <!-- ============================================================== -->
                    <!-- End Logo -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- Toggle which is visible on mobile only -->
                    <!-- ============================================================== -->
                    <a class="topbartoggler d-block d-md-none waves-effect waves-light" href="javascript:void(0)" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><i class="ti-more"></i></a>
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav float-left mr-auto">
                        <li class="nav-item d-none d-md-block"><a class="nav-link sidebartoggler waves-effect waves-light" href="javascript:void(0)" data-sidebartype="mini-sidebar"><i class="mdi mdi-menu font-24"></i></a></li>
                        
                        
                     </ul>
                        
                    <!-- ============================================================== -->
                    <!-- Right side toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav float-right">
                       
                        <!-- ============================================================== -->
                        <!-- End Messages -->
                        <!-- ============================================================== -->

                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img img src="./resources2/images/new logo.png" alt="user" class="rounded-circle" width="31"></a>
                            <div class="dropdown-menu dropdown-menu-right user-dd animated">
                                <a class="dropdown-item" href="admin"><i class="ti-user m-r-5 m-l-5"></i> My Profile</a>
                                <div class="dropdown-divider"></div>
                                <div class="p-l-30 p-10"><a href="admin_logout" class="btn btn-sm btn-success btn-rounded" style="margin-left : 20px">로그아웃</a></div>
                            </div>
                        </li>
                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                    </ul>
                </div>
            </nav>
        </header>        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
       <aside class="left-sidebar" data-sidebarbg="skin5">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav" class="p-t-30">
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="admin" aria-expanded="false"><i class="mdi mdi-view-dashboard"></i><span class="hide-menu">관리자 페이지</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="admin_user" aria-expanded="false"><i class="mdi mdi-border-inside"></i><span class="hide-menu">회원 관리</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-receipt"></i><span class="hide-menu">영화</span></a>
                            <ul aria-expanded="false" class="collapse  first-level">
                                <li class="sidebar-item"><a href="movie_info" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu">영화 정보 </span></a></li>
                                <li class="sidebar-item"><a href="movie_insert" class="sidebar-link"><i class="mdi mdi-note-plus"></i><span class="hide-menu"> 영화 추가</span></a></li>
                             <!--    <li class="sidebar-item"><a href="movie_comment" class="sidebar-link"><i class="mdi mdi-note-plus"></i><span class="hide-menu"> 영화 한줄평</span></a></li>  -->
                                </ul>
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-receipt"></i><span class="hide-menu">게시판</span></a>
                            <ul aria-expanded="false" class="collapse  first-level">
                                <li class="sidebar-item"><a href="admin_board" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu">공지사항 </span></a></li>
                                <li class="sidebar-item"><a href="admin_board_insert" class="sidebar-link"><i class="mdi mdi-note-plus"></i><span class="hide-menu"> 공지사항 등록</span></a></li>
                                <li class="sidebar-item"><a href="admin_board_user" class="sidebar-link"><i class="mdi mdi-note-plus"></i><span class="hide-menu"> 사용자 게시판 관리</span></a></li>
                            </ul>
                        </li>           
                        </ul>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>		<!-- ============================================================== -->
		<!-- End Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-12 d-flex no-block align-items-center">
						<h4 class="page-title">게시판</h4>
<br>
                      <br>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<!--  notice_no number(38) primary key, -- 번호
 notice_title varchar2(100) not null, --제목
 notice_writer varchar2(50) not null, --작성자
 notice_cont varchar2(4000) not null, -- 내용
 notice_hit number(38) default 0, -- 조회
 notice_date date --날짜 -->
				<!-- 공지사항 등록된 글 -->
				
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
							
								<h5 class="card-title m-b-0">공지사항 등록된 글</h5>
								<div id="searchbox">
							<form action="/admin_notice_search" method="get" onsubmit="return search_check();">
									<label class="col-md-3"><button type="submit" style="margin-right: 80%; background-color: white; /* margin-left: auto; */ width: 50px; height: 40px; border-color: black; ">검색</button></label>
									<input type="text" name="search" id="disabledTextInput" class="form-control"style="margin-right : 10px;width: auto; border-color:black; float: left;">
                    		</form>
								</div>
							</div>
							<table class="table">
								<thead>
									<tr>
										<th scope="col">No</th>
										<th scope="col">제목</th>
										<th scope="col">작성자</th>
										<th scope="col">내용</th>
										<th scope="col">업로드된 날짜</th>
										
									</tr>
								</thead>
                                        <c:forEach items="${list}" var = "list">
                                        
								<tbody>
									<tr>
										<td>${list.notice_no }</td>
										<td><a href="/admin_notice_view?notice_no=${list.notice_no }">${list.notice_title }</a></td>
										<td>${list.notice_writer }</td>
										<td>${list.notice_cont }</td>
										<td>${list.notice_date }</td>
										
									</tr>
									
								</tbody>
								</c:forEach>
							</table>
								<div class="page" id="page">
	<%-- 검색전 페이징 --%>
	   <c:if test="${page<=1}">
	    <div class="btn">
	     &lt;
	     </div>
	   </c:if>
	    
	    <c:if test="${page>1}">
	    <div class="btn">
	     <a id="board_list" href="./admin_board?page=${page-1}">&lt;</a>
	      </div>
	    </c:if>
	   
	    <%--현재 쪽번호 출력--%>
	    <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
	     <c:if test="${a == page}"><%--현재 페이지가 선택되었다면--%>
	      <div class="no_on">
	       <b>${a}</b>
	      </div>
	     </c:if>
	     <c:if test="${a != page}"><%--현재 페이지가 선택되지 않았다면 --%>
	      <div class="no">
	     <a id="board_list" href="./admin_board?page=${a}">
	      ${a}
	     </a>
	      </div>
	     </c:if>
	    </c:forEach>
	    
	    <c:if test="${page >= maxpage}">
	    <div class="btn">
	   	 &gt;
	   	</div>
	    </c:if>
	    
	    <c:if test="${page < maxpage}">
	    <div class="btn">
	    	<a id="board_list" class="end" href="./admin_board?page=${page+1}">&gt;</a>
	     </div>
	    </c:if>
	   
	</div>
						
								</div>

							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- End PAge Content -->
				<!-- ============================================================== -->
				<!-- ============================================================== -->
				<!-- Right sidebar -->
				<!-- ============================================================== -->
				<!-- .right-sidebar -->
				<!-- ============================================================== -->
				<!-- End Right sidebar -->
				<!-- ============================================================== -->
			</div>
			<!-- ============================================================== -->
			<!-- End Container fluid  -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- footer -->
			<!-- ============================================================== -->
            <footer class="footer text-center">
             &copy; WEBFLEX Services Korea &nbsp;<br><br>
            대표: 이용준 &nbsp;이메일 주소:webflex@webflex.com &nbsp;
            주소: 서울 동작구 장승배기로 171 2층, 3층
            </footer>
			<!-- ============================================================== -->
			<!-- End footer -->
			<!-- ============================================================== -->
		</div>
		<!-- ============================================================== -->
		<!-- End Page wrapper  -->
		<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- All Jquery -->
	<!-- ============================================================== -->
	<script src="./resources/admin/assets/libs/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script src="./resources/admin/assets/libs/popper.js/dist/umd/popper.min.js"></script>
	<script src="./resources/admin/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- slimscrollbar scrollbar JavaScript -->
	<script
		src="./resources/admin/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script src="./resources/admin/assets/extra-libs/sparkline/sparkline.js"></script>
	<!--Wave Effects -->
	<script src="./resources/admin/dist/js/waves.js"></script>
	<!--Menu sidebar -->
	<script src="./resources/admin/dist/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script src="./resources/admin/dist/js/custom.min.js"></script>
	<!-- this page js -->
	<script src="./resources/admin/assets/extra-libs/multicheck/datatable-checkbox-init.js"></script>
	<script src="./resources/admin/assets/extra-libs/multicheck/jquery.multicheck.js"></script>
	<script src="./resources/admin/assets/extra-libs/DataTables/datatables.min.js"></script>
	<script>
        /****************************************
         *       Basic Table                   *
         ****************************************/
        $('#zero_config').DataTable();
    </script>

</body>

</html>