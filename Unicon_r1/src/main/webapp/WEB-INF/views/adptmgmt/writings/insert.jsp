<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<!-- Required meta tags -->
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>Unicorn</title>
		<!-- plugins:css -->
		<link rel="stylesheet" href="/resources/admin/vendors/mdi/css/materialdesignicons.min.css">
		<link rel="stylesheet" href="/resources/admin/vendors/flag-icon-css/css/flag-icon.min.css">
		<link rel="stylesheet" href="/resources/admin/vendors/css/vendor.bundle.base.css">
		<!-- endinject -->
		<!-- Plugin css for this page -->
		<!-- End plugin css for this page -->
		<!-- inject:css -->
		<!-- endinject -->
		<!-- Layout styles -->
		<link rel="stylesheet" href="/resources/admin/css/style.css">
		<!-- End layout styles -->
		<link rel="shortcut icon" href="/resources/admin/images/favicon.png" />
		<style type="text/css">
		.upload-container {
			position: relative;
			width: 150px;
			height: 150px;
			border: 2px dashed #ccc;
			display: flex;
			justify-content: center;
			align-items: center;
			overflow: hidden;
			background-color: #f9f9f9;
		}
		
 		.upload-button {
			position: absolute;
			width: 100%;
			height: 100%;
			cursor: pointer;
			display: flex;
			justify-content: center;
			align-items: center;
			margin: 0;
		}
		
		.upload-button input {
			display: none;
		}
		
		.mdi-plus {
			font-size: 40px;
			color: #888;
		}
		
		#image-preview {
			width: 100%;
			height: 100%;
			object-fit: fill;
			display: none;
		}
				
		
		</style>
	</head>
	<body>
		<div class="container-scroller">
			<!-- partial:navbar.jsp -->
			<%@ include file="/WEB-INF/views/inc/admin_navbar_adpt.jsp"%>
			<!-- partial -->
			<div class="container-fluid page-body-wrapper">
				<!-- partial:sidebar.jsp -->
				<%@ include file="/WEB-INF/views/inc/admin_sidebar_adpt.jsp"%>
				<!-- partial -->
				<div class="main-panel">
					<div class="content-wrapper">
						<div class="row">
							<div class="col-12 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">Basic form elements</h4>
										<p class="card-description"> Basic form elements </p>
										<form class="forms-sample">
											<div class="form-group">
												<label for="exampleInputName1">Name</label>
												<input type="text" class="form-control" id="exampleInputName1" placeholder="Name">
											</div>
											<div class="form-group">
												<label for="exampleInputEmail3">Email address</label>
												<input type="email" class="form-control" id="exampleInputEmail3" placeholder="Email">
											</div>
											<div class="form-group">
												<label for="exampleInputPassword4">Password</label>
												<input type="password" class="form-control" id="exampleInputPassword4" placeholder="Password">
											</div>
											<div class="form-group">
												<label for="exampleSelectGender">Gender</label>
												<select class="form-control" id="exampleSelectGender">
													<option>Male</option>
													<option>Female</option>
												</select>
											</div>
											<div class="form-group">
												<label>Image upload</label>
											    <div class="upload-container">
													<label for="file-input" class="upload-button">
														<input type="file" class="file-upload-default" accept="image/*" id="file-input" />
														<i class="mdi mdi-plus"></i>
														<img id="image-preview" alt="이미지 미리보기" />
													</label>
												</div>
											</div>
											<div class="form-group">
												<label for="exampleInputCity1">City</label>
												<input type="text" class="form-control" id="exampleInputCity1" placeholder="Location">
											</div>
											<div class="form-group">
												<label for="exampleTextarea1">Textarea</label>
												<textarea class="form-control" id="exampleTextarea1" rows="4"></textarea>
											</div>
											<button type="submit" class="btn btn-primary mr-2">Submit</button>
											<button class="btn btn-light">Cancel</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- content-wrapper ends -->
					<!-- partial:footer.jsp -->
					<%@ include file="/WEB-INF/views/inc/admin_footer_adpt.jsp"%>
					<!-- partial -->
				</div>
				<!-- main-panel ends -->
			</div>
			<!-- page-body-wrapper ends -->
		</div>
		<!-- container-scroller -->
		<!-- plugins:js -->
		<script src="/resources/admin/vendors/js/vendor.bundle.base.js"></script>
		<!-- endinject -->
		<!-- Plugin js for this page -->
		<!-- End plugin js for this page -->
		<!-- inject:js -->
		<script src="/resources/admin/js/off-canvas.js"></script>
		<script src="/resources/admin/js/hoverable-collapse.js"></script>
		<script src="/resources/admin/js/misc.js"></script>
		<!-- endinject -->
		<!-- Custom js for this page -->
		<script>
			$(document).ready(function() {
				$('#file-input').change(function(event) {
					const file = event.target.files[0];
					const reader = new FileReader();
		
					reader.onload = function(e) {
						$('#image-preview').attr('src', e.target.result).show();
						$('.mdi-plus').hide();
					}
		
					if (file) {
						reader.readAsDataURL(file);
					}
				});
			});
		</script>
		<!-- End custom js for this page -->
	</body>
</html>
