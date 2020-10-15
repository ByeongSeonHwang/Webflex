<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>영화 수정</title>
<!-- Custom CSS -->
<link rel="stylesheet" type="text/css"
	href="./resources/admin/assets/libs/select2/dist/css/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="./resources/admin/assets/libs/jquery-minicolors/jquery.minicolors.css">
<link rel="stylesheet" type="text/css"
	href="./resources/admin/assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" type="text/css"
	href="./resources/admin/assets/libs/quill/dist/quill.snow.css">
<link href="./resources/admin/dist/css/style.min.css" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
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
        </header>		<!-- ============================================================== -->
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
                              <!--   <li class="sidebar-item"><a href="movie_comment" class="sidebar-link"><i class="mdi mdi-note-plus"></i><span class="hide-menu"> 영화 한줄평</span></a></li> -->
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
						<h4 class="page-title">영화 수정하기</h4>
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

				<div class="card">
					<div class="card-body">
						<h5 class="card-title">영화 수정</h5>
						<div class="form-group row">
							<label class="col-md-3 m-t-15">선택된 카테고리</label>
							<div class="col-md-9">
								<select class="select2 form-control m-t-15" multiple="multiple"
									style="height: 36px; width: 100%;">
									<optgroup label="category">
										<option value="" selected>action</option>
										<option value="">animation</option>
										<option value="">comedy</option>
										<option value="" selected>documentary</option>
										<option value="">thriller</option>
										<option value="">SF</option>
										<option value="" selected>sport</option>
										<option value="">Romance</option>
										<option value="">Hollywood</option>

									</optgroup>

								</select>
							</div>
						</div>

						<div class="form-group row">
							<label class="col-md-3 m-t-15">제목</label>
							<div class="col-md-9">
								<input type="text" value="제목" />
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 m-t-15">감독</label>
							<div class="col-md-9">
								<input type="text" value="감독" />
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 m-t-15">출연진1</label>
							<div class="col-md-9">
								<input type="text" value="출연진1" />
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3 m-t-15">출연진2</label>
							<div class="col-md-9">
								<input type="text" value="출연진2" />
							</div>
						</div>

						<div class="form-group row">
							<label class="col-md-3">File Upload</label>
							<div class="col-md-9">
								<div class="custom-file">
									<input type="file" class="custom-file-input"
										id="validatedCustomFile" required> <label
										class="custom-file-label" for="validatedCustomFile">Choose
										file...</label>
									<div class="invalid-feedback">Example invalid custom file
										feedback</div>
								</div>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-md-3" for="disabledTextInput">Disabled
								input</label>
							<div class="col-md-9">
								<input type="text" id="disabledTextInput" class="form-control"
									placeholder="Disabled input" disabled>
							</div>
						</div>
					</div>
					<div class="border-top">
						<div class="card-body">
							<button type="button" class="btn btn-danger btn-sm" float="right">수정하기
								완료</button>
						</div>
					</div>
				</div>

				<div class="container-fluid">
					<!-- ============================================================== -->
					<!-- Start Page Content -->


					<!-- editor -->

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
					All Rights Reserved by Matrix-admin. Designed and Developed by <a
						href="https://wrappixel.com">WrapPixel</a>.
				</footer>
				<!-- ============================================================== -->
				<!-- End footer -->
				<!-- ============================================================== -->
			</div>
			<!-- ============================================================== -->
			<!-- End Page wrapper  -->
			<!-- ============================================================== -->
		</div>
		</div>
		<!-- ============================================================== -->
		<!-- End Wrapper -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- All Jquery -->
		<!-- ============================================================== -->
		<script src="./resources/admin/assets/libs/jquery/dist/jquery.min.js"></script>
		<!-- Bootstrap tether Core JavaScript -->
		<script
			src="./resources/admin/assets/libs/popper.js/dist/umd/popper.min.js"></script>
		<script
			src="./resources/admin/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
		<!-- slimscrollbar scrollbar JavaScript -->
		<script
			src="./resources/admin/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
		<script
			src="./resources/admin/assets/extra-libs/sparkline/sparkline.js"></script>
		<!--Wave Effects -->
		<script src="./resources/admin/dist/js/waves.js"></script>
		<!--Menu sidebar -->
		<script src="./resources/admin/dist/js/sidebarmenu.js"></script>
		<!--Custom JavaScript -->
		<script src="./resources/admin/dist/js/custom.min.js"></script>
		<!-- This Page JS -->
		<script
			src="./resources/admin/assets/libs/inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
		<script src="./resources/admin/dist/js/pages/mask/mask.init.js"></script>
		<script
			src="./resources/admin/assets/libs/select2/dist/js/select2.full.min.js"></script>
		<script
			src="./resources/admin/assets/libs/select2/dist/js/select2.min.js"></script>
		<script
			src="./resources/admin/assets/libs/jquery-asColor/dist/jquery-asColor.min.js"></script>
		<script
			src="./resources/admin/assets/libs/jquery-asGradient/dist/jquery-asGradient.js"></script>
		<script
			src="./resources/admin/assets/libs/jquery-asColorPicker/dist/jquery-asColorPicker.min.js"></script>
		<script
			src="./resources/admin/assets/libs/jquery-minicolors/jquery.minicolors.min.js"></script>
		<script
			src="./resources/admin/assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
		<script src="./resources/admin/assets/libs/quill/dist/quill.min.js"></script>
		<script>
		//***********************************//
		// For select 2
		//***********************************//
		$(".select2").select2();

		/*colorpicker*/
		$('.demo').each(function() {
			//
			// Dear reader, it's actually very easy to initialize MiniColors. For example:
			//
			//  $(selector).minicolors();
			//
			// The way I've done it below is just for the demo, so don't get confused
			// by it. Also, data- attributes aren't supported at this time...they're
			// only used for this demo.
			//
			$(this).minicolors({
				control : $(this).attr('data-control') || 'hue',
				position : $(this).attr('data-position') || 'bottom left',

				change : function(value, opacity) {
					if (!value)
						return;
					if (opacity)
						value += ', ' + opacity;
					if (typeof console === 'object') {
						console.log(value);
					}
				},
				theme : 'bootstrap'
			});

		});
		/*datwpicker*/
		jQuery('.mydatepicker').datepicker();
		jQuery('#datepicker-autoclose').datepicker({
			autoclose : true,
			todayHighlight : true
		});
		var quill = new Quill('#editor', {
			theme : 'snow'
		});
	</script>
</body>

</html>