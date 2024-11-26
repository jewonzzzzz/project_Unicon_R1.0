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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<!-- endinject -->
<!-- Layout styles -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/style.css">
<!-- End layout styles -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/admin/images/favicon.png" />
<style type="text/css">
	.upload-container {
		position: relative;
		aspect-ratio: 1 / 1;
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
	
	#plusIcon1, #plusIcon2, #plusIcon3, #plusIcon4, #plusIcon5 {
		font-size: 2rem;
		color: #888;
	}
	
	#image-preview1, #image-preview2, #image-preview3, #image-preview4, #image-preview5 {
		width: 100%;
		height: 100%;
		object-fit: fill;
		display: none;
	}
	
	.form-group input {
		display: flex;
		flex: 1;
	}
	
	.custom-label {
		font-size: 1.2rem !important;
	}
	
	.custom-select {
		font-size: 1.1rem;
	}

	.custom-text {
		font-size: 1.2rem;
	}
	
	.dropdown .dropdown-menu {
		margin-top: 0;
	}
	
	.dropdown-menu {
		display: none;
		position: absolute;
		z-index: 1000;
		background-color: white;
		border: 1px solid #ccc;
		width: 100%;
		height: 50vh;
		overflow-y: auto;
	}
	
	.dropdown-menu.show {
		display: block;
	}
	
	.dropdown-item {
		font-size: 1.2rem !important;
		padding: 8px;
		cursor: pointer;
	}
	
	.dropdown-item:hover {
		background-color: #f0f0f0;
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
										<form class="forms-adptwritings">
											<div class="form-group row">
												<div class="col-12 col-md-3 mb-2">
													<label for="petType" class="text-dark custom-label">동물 종류</label>
													<select class="form-control custom-select" id="petType">
														<option value="">동물 종류 선택</option>
													</select>
												</div>
												<div class="dropdown col-12 col-md-3 mb-2">
													<label class="text-dark custom-label">종류</label>
													<input type="text" id="searchInputPre" class="form-control custom-text" readonly/>
													<input type="text" id="searchInput" class="form-control custom-text"/>
													<div id="dropdownList" class="dropdown-menu"></div>
												</div>
												<div class="col-12 col-md-3 mb-2">
													<label for="exampleInputName2" class="text-dark custom-label">기타 종류</label>
													<input type="text" class="form-control" id="exampleInputName2" placeholder="Name2">
												</div>
												<div class="col-12 col-md-3 mb-2"></div>
											</div>
											
											<div class="form-group row">
												<div class="col-10 col-xl-2 col-lg-3 col-md-3 mr-3 mb-2">
													<label class="text-dark custom-label">대표 이미지</label>
												    <div class="upload-container">
														<label for="image-input1" class="upload-button">
															<input type="file" class="file-upload-default image-input" accept="image/*" id="image-input1" />
															<i id="plusIcon1" class="mdi mdi-plus"></i>
															<img id="image-preview1" alt="이미지 미리보기" />
														</label>
													</div>
												</div>
												<div class="col-10 col-xl-2 col-lg-3 col-md-3 mr-3 mb-2">
													<label class="text-dark custom-label">이미지</label>
												    <div class="upload-container">
														<label for="image-input2" class="upload-button">
															<input type="file" class="file-upload-default image-input" accept="image/*" id="image-input2" />
															<i id="plusIcon2" class="mdi mdi-plus"></i>
															<img id="image-preview2" alt="이미지 미리보기" />
														</label>
													</div>
												</div>
												<div class="col-10 col-xl-2 col-lg-3 col-md-3 mr-3 mb-2">
													<label class="text-dark custom-label">이미지</label>
												    <div class="upload-container">
														<label for="image-input3" class="upload-button">
															<input type="file" class="file-upload-default image-input" accept="image/*" id="image-input3" />
															<i id="plusIcon3" class="mdi mdi-plus"></i>
															<img id="image-preview3" alt="이미지 미리보기" />
														</label>
													</div>
												</div>
												<div class="col-10 col-xl-2 col-lg-3 col-md-3 mr-3 mb-2">
													<label class="text-dark custom-label">이미지</label>
												    <div class="upload-container">
														<label for="image-input4" class="upload-button">
															<input type="file" class="file-upload-default image-input" accept="image/*" id="image-input4" />
															<i id="plusIcon4" class="mdi mdi-plus"></i>
															<img id="image-preview4" alt="이미지 미리보기" />
														</label>
													</div>
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
		<script src="${pageContext.request.contextPath}/resources/admin/vendors/js/vendor.bundle.base.js"></script>
		<!-- endinject -->
		<!-- Plugin js for this page -->
		<!-- End plugin js for this page -->
		<!-- inject:js -->
		<script src="${pageContext.request.contextPath}/resources/admin/js/off-canvas.js"></script>
		<script src="${pageContext.request.contextPath}/resources/admin/js/hoverable-collapse.js"></script>
		<script src="${pageContext.request.contextPath}/resources/admin/js/misc.js"></script>
		<!-- endinject -->
		<!-- Custom js for this page -->
		<script>
			$(function() {
				$('#searchInput').hide();
				
				/*=============== 이미지 미리보기 ===============*/
				$('.image-input').on('change', function(e) {
					const file = e.target.files[0];
					const reader = new FileReader();
					
					const inputId = e.target.id;
					const previewId = '#image-preview' + inputId.charAt(inputId.length - 1);
					const plusIconId = '#plusIcon' + inputId.charAt(inputId.length - 1);
				
					if (file) {
						reader.onload = function(e) {
							$(previewId).attr('src', e.target.result).show();
							$(plusIconId).hide();
						}
						reader.readAsDataURL(file);
					} else {
						$(previewId).hide();
						$(plusIconId).show();
					}
				});
				/*=============== 이미지 미리보기 ===============*/
				
				
				/*=============== 동물 종류 리스트 가져오기 ===============*/
				$('#petType').on('click', function() {
					const $select = $('#petType');
				
					if ($select.find('option').length === 1) {
						$.ajax({
							url: '/petData/petType',
							type: 'GET',
							dataType: 'json',
							success: function(data) {
								$select.empty();
								$select.append('<option value="">동물 종류 선택</option>');
				
								data.forEach(function(item) {
									$select.append("<option value='" + item.category_code + "'>" + item.category_type + "</option>");
								});
							},
							error: function(jqXHR, textStatus, errorThrown) {
								console.error('AJAX 요청 실패:', textStatus, errorThrown);
							}
						});
					}
				});
				/*=============== 동물 종류 리스트 가져오기 ===============*/
				
				
				/*=============== 검색 드롭다운 ===============*/
				function petTypeDetailList(petType) {
					$.ajax({
						url: '/petData/petType/' + petType,
						method: 'GET',
						success: function(data) {
							populateDropdown(data);
						},
						error: function(error) {
							console.error('데이터를 가져오는 데 실패했습니다:', error);
						}
					});
				}
				
				function populateDropdown(data) {
					const dropdownList = $('#dropdownList');
					dropdownList.empty();
				
					data.forEach(item => {
						dropdownList.append("<div class='dropdown-item' data-value='"+item.category_code+"'>" + item.category_value + "</div>");
					});
				
					if (data.length == 0) {
						dropdownList.removeClass('show');
					}
				}
				
				$('#petType').on('change', function() {
					const selectedType = $(this).val();
					if (selectedType) {
						petTypeDetailList(selectedType);
						$('#searchInputPre').val('');
					} else {
						$('#dropdownList').empty().removeClass('show');
						$('#searchInputPre').val('');
					}
				});
				
				$('#searchInputPre').on('focus', function() {
					const dropdownList = $('#dropdownList');
					if($('#petType').val() !== '') {
						dropdownList.addClass('show');
						$('#searchInputPre').hide();
						$('#searchInput').show();
					}
				});
				
				$('#searchInput').on('input', function() {
					const filter = $(this).val().toLowerCase();
					const dropdownList = $('#dropdownList');
				
					if (!filter) {
						dropdownList.removeClass('show');
					}
				
					dropdownList.addClass('show');
				
					dropdownList.children().each(function() {
						const text = $(this).text().toLowerCase();
						$(this).toggle(text.includes(filter));
					});
				});
				
				$(document).on('click', '.dropdown-item', function() {
					$('#searchInput').hide();
					$('#searchInputPre').show();
					$('#searchInputPre').val($(this).text());
					$('#dropdownList').removeClass('show');
				});
				
				$(document).click(function(event) {
					if (!$(event.target).closest('.dropdown').length) {
						$('#dropdownList').removeClass('show');
						$('#searchInput').hide();
						$('#searchInputPre').show();
					}
				});

				/*=============== 검색 드롭다운 ===============*/
				
				
			});//DOM
			
		</script>
		<!-- End custom js for this page -->
	</body>
</html>
