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
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
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
		width: 11vw;
		aspect-ratio: 1 / 1;
		border: 2px dashed #ccc;
		display: flex;
		justify-content: center;
		align-items: center;
		overflow: hidden;
		background-color: #f9f9f9;
	}
	
	@media (max-width: 1024px) {
		.upload-container {
			width: 15vw;
		}
	}
	
	@media (max-width: 768px) {
		.upload-container {
			width: 20vw;
		}
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
		font-size: 2rem;
		color: #888;
	}
	
	#image-preview {
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
		font-size: 1.4rem !important;
	}
	.custom-select {
		font-size: 1.25rem;
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
												<label for="exampleSelectGender" class="text-dark custom-label">동물종류</label>
												<select class="form-control custom-select" id="exampleSelectGender">
													<option>개</option>
													<option>고양이</option>
													<option>기타</option>
												</select>
												</div>
												<div class="col-12 col-md-3 mb-2">
												<label for="petType" class="text-dark custom-label">종류</label>
												<select class="form-control custom-select" id="petType">
													<option value="">선택</option>
												</select>
												</div>
												<div class="col-12 col-md-3 mb-2">
												<label for="exampleInputName2" class="text-dark custom-label">기타 종류</label>
												<input type="text" class="form-control" id="exampleInputName2" placeholder="Name2">
												</div>
												<div class="col-12 col-md-3 mb-2"></div>
											</div>
											
											<div class="form-group">
												<label>Image upload</label>
											    <div class="upload-container">
													<label for="image-input" class="upload-button">
														<input type="file" class="file-upload-default" accept="image/*" id="image-input" />
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
		<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
		<!-- endinject -->
		<!-- Custom js for this page -->
		<script>
			$(function() {
				/*=============== 이미지 미리보기 ===============*/
				$('#image-input').change(function(e) {
					const file = e.target.files[0];
					const reader = new FileReader();
		
					reader.onload = function(e) {
						$('#image-preview').attr('src', e.target.result).show();
						$('.mdi-plus').hide();
					}
		
					if (file) {
						reader.readAsDataURL(file);
					}
				});
				/*=============== 이미지 미리보기 ===============*/
				
				
				/*=============== 검색 드롭다운 ===============*/
				let cachedData = null; 
				
				function loadData() {
				    return $.ajax({
				        url: '/path/to/your/api',
				        dataType: 'json'
				    }).then(function(data) {
				        cachedData = data.items;
				        return cachedData;
				    });
				}
				
				// Select2를 초기화하고 AJAX 설정을 추가합니다.
				$('#exampleSelect').select2({
				    ajax: {
				        transport: function(params, success, failure) {
				            // AJAX 요청을 처리하는 transport 함수입니다.
				            if (cachedData) {
				                // 캐시된 데이터가 존재하는 경우
				                // success 콜백을 호출하여 캐시된 데이터를 반환합니다.
				                success(cachedData);
				            } else {
				                // 캐시된 데이터가 없는 경우
				                // loadData() 함수를 호출하여 AJAX 요청을 수행합니다.
				                loadData().then(success) // 요청이 성공하면 success 콜백을 호출합니다.
				                    .catch(failure); // 요청이 실패하면 failure 콜백을 호출합니다.
				            }
				        },
				        delay: 250, // 사용자가 입력한 후, AJAX 요청을 보내기까지의 지연 시간 (250ms)
				        data: function (params) {
				            // AJAX 요청 시 서버에 전달할 데이터를 정의합니다.
				            return {
				                q: params.term // 사용자가 입력한 검색어를 'q'라는 키로 전달합니다.
				            };
				        },
				        processResults: function(data) {
				            // 서버에서 받은 데이터를 Select2가 이해할 수 있는 형식으로 변환합니다.
				            return {
				                results: data // 캐시된 데이터를 반환합니다.
				            };
				        }
				    },
				    minimumInputLength: 1 // 사용자가 입력해야 하는 최소 문자 수를 설정합니다. 1글자 이상 입력해야 AJAX 요청이 발생합니다.
				});
				/*=============== 검색 드롭다운 ===============*/
				
				
			});//DOM
			
		</script>
		<!-- End custom js for this page -->
	</body>
</html>
