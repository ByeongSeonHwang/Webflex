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
    <link rel="icon" type="image/png" sizes="16x16" href="./resources2/images/new logo.png">
  <title>관리자 페이지 </title>
    <!-- Custom CSS -->
    <link href="./resources/admin/assets/libs/flot/css/float-chart.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="./resources/admin/dist/css/style.min.css" rel="stylesheet">
   
    <link rel="stylesheet" type="text/css" href="./resources/admin/assets/extra-libs/multicheck/multicheck.css">
    <link href="./resources/admin/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<style type="text/css">
#my_info{
padding :3% 10%;
}
#admin_info,#board_info{
padding : 2% 10%;
}
#info{
padding-left : 10%;
}
#button{
margin-right : 50%;
}

</style>
<title>관리자 페이지</title>
</head>

<body>

<script type="text/javascript">
	var id = "${sessionScope.id}";
	var authority = "${sessionScope.authority}"
	var msg = "${msg}";
	if($.trim(id) == ""){
		alert('로그인 후 이용해 주세요!');
		location.href='/admin_login';
	} 
	if($.trim(authority) != "admin"){
		alert('일반 사용자는 접근이 금지되었습니다!');
		location.href='/';
	}
	

</script>
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
        </header>
        <!-- ============================================================== -->
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
                             <!--     <li class="sidebar-item"><a href="movie_comment" class="sidebar-link"><i class="mdi mdi-note-plus"></i><span class="hide-menu"> 영화 한줄평</span></a></li> -->
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
        </aside>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper" method="post">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->		
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
		
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<!-- 내 정보 -->
	<div>
	<div>
	</div>
				<div class="card">
					<div class="card-body" id = "my_info">
				
						<h5 class="card-title">내 정보</h5>						
							<hr>
							<div class="form-group row">
							<label class="col-md-3 m-t-15" id="info">이름</label>
							<div class="col-md-9">
								<p id ="name"> : ${adminInfo.name }</p>
							</div>
						</div>

						<div class="form-group row">
							<label class="col-md-3 m-t-15" id="info">아이디</label>
							<div class="col-md-9">
								<p id ="id"> : ${adminInfo.email }</p>
							</div>
						</div>
					
						<div class="form-group row">
							<label class="col-md-3 m-t-15" id="info">닉네임</label>
							<div class="col-md-9">
								<p> : ${adminInfo.nick }</p>
							</div>
						</div>
							<hr>
					</div>
	

				</div>
					<!-- 관리자  -->	
					        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">관리자 목록</h5>
                                <div class="table-responsive" id="admin_info">
                                    <table id="zero_config" class="table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                            	<th>No</th>
                                                <th>이름</th>
                                                <th>아이디</th>                                          
                                                <th>가입 날짜</th>
                                            </tr>
                                        </thead>
                                        <c:set var="cnt" value="1"/>
					<c:forEach items="${list }" var="alist">
					<c:set var="sum" value="${sum+1 }"/>
                                        <tbody>
                                            <tr>
                                              <td>${sum }</td> 
                                                <td>${alist.name }</td>
                                                <td>${alist.email }</td>                                     
                                                <td>${fn:substring(alist.joindate,0,10) }</td>
                                            </tr>
                                            </tbody>
					</c:forEach>
                                           
                                    </table>
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
			</div>
		
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
        
            <!-- ============================================================== -->
   
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <!-- Bootstrap tether Core JavaScript -->
    <script src="./resources/admin/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="./resources/admin/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="./resources/admin/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="./resources/admin/assets/extra-libs/sparkline/sparkline.js"></script>
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
    <!--This page JavaScript -->
    <!-- <script src="dist/js/pages/dashboards/dashboard1.js"></script> -->
    
    <!-- this page js -->
  <!--   <script src="./resources/admin/assets/extra-libs/multicheck/datatable-checkbox-init.js"></script>
    <script src="./resources/admin/assets/extra-libs/multicheck/jquery.multicheck.js"></script>
    <script src="./resources/admin/assets/extra-libs/DataTables/datatables.min.js"></script>
   -->  
</body>

</html>