<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>판매자</title>
    <link rel="stylesheet" href="/resources/admin/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="/resources/admin/vendors/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="/resources/admin/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="/resources/admin/css/style.css">
    <link rel="shortcut icon" href="/resources/admin/images/favicon.png" />
	
	<style type="text/css">
	.store-notice {
		color: black;
		line-height: 42px;
	}
	
	.store-notice-left{
		font-size: 32px;
	}
	
	.store-notice-right {
		font-size: 32px;
	}
	
	.store-flex, .store-card-flex {
		display: flex;
    	justify-content: space-between;
	}
	.store-flex h5,h6 , .store-card-title h5 {
		margin: 0;
		line-height: 26px;
	}
	.store-card-title {
		display: flex;
	}
	.store-card-title i{
		margin-left : 0.5rem;
		font-size: 20px;
	} 
	
	.store-card-flex a {
    	color: #8e94a9; 
    	transition: color 0.3s; 
	}
	/* 호버 시 색상 */
	.store-card-flex a:hover {
	    color: #bf94e4; 
	}
	.store-flex span a {
		color : gray;
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
          <div style="padding: .8rem 2.875rem 0 2.875rem;" class="content-wrapper">
<!--             <div class="row" id="proBanner">
              <div class="col-12">
				<span class="d-flex align-items-center purchase-popup">
                  <p>Like what you see? Check out our premium version for more.</p>
                  <a href="https://github.com/BootstrapDash/ConnectPlusAdmin-Free-Bootstrap-Admin-Template" target="_blank" class="btn ml-auto download-button">Download Free Version</a>
                  <a href="http://www.bootstrapdash.com/demo/connect-plus/jquery/template/" target="_blank" class="btn purchase-button">Upgrade To Pro</a>
                  <i class="mdi mdi-close" id="bannerClose"></i>
                </span>
              </div>
            </div> -->
            <div class="d-xl-flex justify-content-between align-items-start">
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="card">
                   <div style="padding: 1rem; display: flex" class="card-body text-center align-items-start justify-content-between">
                   		 <i class="mdi mdi-chevron-left store-notice-left"></i>
                   		 <div class="store-notice" id="store-notices"><span>공지사항 내용 5개 슬라이드로 돌아가면서 보여줄 예정</span></div>
                   		 <i class="mdi mdi-chevron-right store-notice-right"></i>
                   </div>
                </div>
                <div class="tab-content tab-transparent-content">
                  <div class="tab-pane fade show active" id="business-1" role="tabpanel" aria-labelledby="business-tab">
                    <div class="row">
                      <div class="col-xl-3 col-lg-3 col-sm-12 grid-margin stretch-card">
                        <div class="card">
                          <div class="card-body ">
                            <h5 class="mb-4 text-dark font-weight-bold">주문/배송</h5>
                            <div class="dropdown-divider"></div>
                            <div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">신규 주문</h5>
	                            <span>
	                            	<a href="/#">0</a> 건
	                            </span>
	                            
                            </div>
                            <div class="dropdown-divider"></div>
                            <div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">배송 준비</h5>
	                            <span>
	                            	<a href="/#">0</a> 건
	                            </span>
                            </div>
                            <div class="dropdown-divider"></div>
                            <div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">배송중</h5>
	                            <span>
	                            	<a href="/#">0</a> 건
	                            </span>
                            </div>
                            <div class="dropdown-divider"></div>
                            <div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">배송 완료</h5>
	                            <span>
	                            	<a href="/#">0</a> 건
	                            </span>
                            </div>
                            <div class="dropdown-divider"></div>
                          </div>
                        </div>
                      </div>
                      <div class="col-xl-3 col-lg-3 col-sm-12 grid-margin stretch-card">
                        <div class="card">
                          <div class="card-body ">
                            <h5 class="mb-4 text-dark font-weight-bold">클레임</h5>
                            <div class="dropdown-divider"></div>
                            <div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">취소 요청</h5>
	                            <span>
	                            	<a href="/#">0</a> 건
	                            </span>
                            </div>
                            <div class="dropdown-divider"></div>
                            <div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">반품 요청</h5>
	                            <span>
	                            	<a href="/#">0</a> 건
	                            </span>
                            </div>
                            <div class="dropdown-divider"></div>
                            <div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">교환 요청</h5>
	                            <span>
	                            	<a href="/#">0</a> 건
	                            </span>
                            </div>
                            <div class="dropdown-divider"></div>
                          </div>
                        </div>
                      </div>
                      <div class="col-xl-3 col-lg-3 col-sm-12 grid-margin stretch-card">
                        <div class="card">
                          <div class="card-body ">
                          	<h5 class="mb-4 text-dark font-weight-bold">상품</h5>
                            <div class="dropdown-divider"></div>
                           	<div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">판매중 상품</h5>
	                            <span>
	                            	<a href="/#">0</a> 건
	                            </span>
                            </div>
                            <div class="dropdown-divider"></div>
                            <div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">품절 상품</h5>
	                            <span>
	                            	<a href="/#">0</a> 건
	                            </span>
                            </div>
                            <div class="dropdown-divider"></div>
                            <div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">등록/수정요청 상품</h5>
	                            <span>
	                            	<a href="/#">0</a> 건
	                            </span>
                            </div>
                            <div class="dropdown-divider"></div>
                          </div>
                        </div>
                      </div>
                      <div class="col-xl-3 col-lg-3 col-sm-12 grid-margin stretch-card">
                        <div class="card">
                          <div class="card-body ">
                          	<h5 class="mb-4 text-dark font-weight-bold">문의</h5>
                            <div class="dropdown-divider"></div>
                            <div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">이름</h5>
	                            <h5 class="text-dark font-weight-normal">문의 	내용</h5>
	                            <h6 class="text-dark font-weight-normal">2024.11.20</h6>
                            </div>
                            <div class="dropdown-divider"></div>
                            <div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">이름</h5>
	                            <h5 class="text-dark font-weight-normal">문의 	내용</h5>
	                            <h6 class="text-dark font-weight-normal">2024.11.20</h6>
                            </div>
                            <div class="dropdown-divider"></div>
                            <div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">이름</h5>
	                            <h5 class="text-dark font-weight-normal">문의 	내용</h5>
	                            <h6 class="text-dark font-weight-normal">2024.11.20</h6>
                            </div>
                            <div class="dropdown-divider"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-sm-4 grid-margin stretch-card">
                        <div class="card">
                          <div class="card-body mb-4">
                            <h4 class="card-title text-dark">솔루션(AI)</h4>
                            <div style="display: flex;justify-content: center;align-items: center;height: 100%;margin-top: -2rem;">
	                            <a href="/#">	
		                            <img src="${pageContext.request.contextPath}/resources/admin/images/ChatGPT-Logo.svg.png">
	                            </a>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-sm-8  grid-margin stretch-card">
                        <div class="card">
                          <div class="card-body">
                            <div class="d-xl-flex justify-content-between mb-2">
                              <h4 class="card-title">매출 통계</h4>
                              <div class="graph-custom-legend primary-dot" id="pageViewAnalyticLengend"></div>
                            </div>
                            <canvas id="page-view-analytic"></canvas>
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