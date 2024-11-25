<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>유니콘 스토어</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
    
   
    </script>
    <script type="text/javascript">
    function category(value) {
        console.log(value);
		// 처음 선택한 카테고리의 span 색상 변경
		$("#" + value).css('color', '#bf94e4'); // 해당 카테고리 span 색상 변경
		
		$.ajax({
		    url: '/store/category/'+value, // 요청할 API URL
		    type: 'GET', // 요청 방식 (GET, POST, PUT, DELETE 등)
		    success: function(response) {
		        console.log('성공:', response);
		        // 응답 처리 로직
		    },
		    error: function(xhr, status, error) {
		        console.error('오류:', error);
		        // 오류 처리 로직
		    }
		});
		
		$.each(items, function(index, item) {
		    var $button = $('<button></button>') // 버튼 생성
		        .text(item) // 버튼 텍스트 설정
		        .on('click', function() {
		            console.log(item); // 클릭한 항목의 값 출력

		            // 이전 선택된 span 색상 초기화
		            $('.category-detail button').css('color', ''); // 모든 span 색상 초기화
		            
		            // 현재 클릭한 버튼의 span 색상 변경
		            $(this).find('span').css('color', '#bf94e4'); // 현재 span 색상 변경
		        });

		    $detailDiv.append($button); // category-detail에 버튼 추가
		});

    }


    
    </script>
    <!-- plugins:css -->
    <link rel="stylesheet" href="/resources/admin/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="/resources/admin/vendors/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="/resources/admin/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="/resources/admin/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="/resources/admin/images/favicon.png" />
    <style type="text/css">
    .selected {
    	color: #bf94e4; /* 선택된 버튼의 폰트 색상 */
	}
    .category-box {
		display: flex;
		padding: 7px 0 0 0;
		border : 1px solid;
    }
    .category, .category-detail  {
    	font-size : 13px;
    	width: 50%;
	    height: 200px;
	    overflow: auto;
	    background-color: #ffffff

    }
    .category button, .category-detail button {
	    background-color: #ffffff;
    	width: 100%;
    	border : none;
    	padding: 7px;
    	display: flex;
    	justify-content: space-between;
    }
    .category button:hover, .category-detail button:hover {
    	background-color: #f7f7f7
    }
    </style>
  </head>
  <body>
    <div class="container-scroller">
      <!-- partial:/WEB-INF/views/inc/admin_navbar.jsp -->
      <%@ include file="/WEB-INF/views/inc/admin_navbar_store.jsp"%>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:/WEB-INF/views/inc/admin_sidebar.jsp" -->
		<%@ include file="/WEB-INF/views/inc/admin_sidebar_store.jsp"%>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <div class="row">
              <div class="col-md-12">
                <div class="tab-content tab-transparent-content">
                  <div class="tab-pane fade show active" id="business-1" role="tabpanel" aria-labelledby="business-tab">
                    <div class="row">
                      <div class="col-12 grid-margin">
                        <div class="card">
                          <div class="card-body">
                            <div class="row">
                              <div class="col-12 grid-margin stretch-card">
				                <div class="card">
				                  <div class="card-body">
				                    <h4 class="card-title" style="margin-bottom: 0">카테고리</h4>
				                    <div class="dropdown-divider"></div>
				                      <div class="category-box">
				                      <div class="category">
									    <button onclick="category('강아지 간식')">
									        <span id="snacks">강아지 간식</span>
									        <i class="mdi mdi-chevron-right"></i>
									    </button>
									    <button onclick="category('강아지 건강/관리용품')">
									        <span id="careProducts">강아지 건강/관리용품</span>
									        <i class="mdi mdi-chevron-right"></i>
									    </button>
									    <button onclick="category('강아지 배변용품')">
									        <span id="pottyTrainingProducts">강아지 배변용품</span>
									        <i class="mdi mdi-chevron-right"></i>
									    </button>
									    <button onclick="category('강아지 사료')">
									        <span id="foodProducts">강아지 사료</span>
									        <i class="mdi mdi-chevron-right"></i>
									    </button>
									    <button onclick="category('강아지 장난감/훈련')">
									        <span id="toysAndTraining">강아지 장난감/훈련</span>
									        <i class="mdi mdi-chevron-right"></i>
									    </button>
									    <button onclick="category('고양이 간식')">
									        <span id="catSnacks">고양이 간식</span>
									        <i class="mdi mdi-chevron-right"></i>
									    </button>
									    <button onclick="category('고양이 건강/관리용품')">
									        <span id="catCareProducts">고양이 건강/관리용품</span>
									        <i class="mdi mdi-chevron-right"></i>
									    </button>
									    <button onclick="category('고양이 배변용품')">
									        <span id="catLitterProducts">고양이 배변용품</span>
									        <i class="mdi mdi-chevron-right"></i>
									    </button>
									</div>
				                      <div class="category-detail"	>
				                      </div>
				                      </div>
				                  </div>
				                </div>
				              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- content-wrapper ends -->
          <!-- partial:/WEB-INF/views/inc/admin_footer.jsp -->
		  <%@ include file="/WEB-INF/views/inc/admin_footer.jsp"%>
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
    <script src="/resources/admin/vendors/chart.js/Chart.min.js"></script>
    <script src="/resources/admin/vendors/jquery-circle-progress/js/circle-progress.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="/resources/admin/js/off-canvas.js"></script>
    <script src="/resources/admin/js/hoverable-collapse.js"></script>
    <script src="/resources/admin/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="/resources/admin/js/dashboard.js"></script>
    <!-- End custom js for this page -->
    
    
    
    
  </body>
</html>