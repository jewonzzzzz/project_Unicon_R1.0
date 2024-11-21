<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <title>판매자</title>
    <link
      rel="stylesheet"
      href="/resources/admin/vendors/mdi/css/materialdesignicons.min.css"
    />
    <link
      rel="stylesheet"
      href="/resources/admin/vendors/flag-icon-css/css/flag-icon.min.css"
    />
    <link
      rel="stylesheet"
      href="/resources/admin/vendors/css/vendor.bundle.base.css"
    />
    <link
      rel="stylesheet"
      href="/resources/admin/vendors/font-awesome/css/font-awesome.min.css"
    />
    <link
      rel="stylesheet"
      href="/resources/admin/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css"
    />
    <link rel="stylesheet" href="/resources/admin/css/style.css" />
    <link rel="shortcut icon" href="/resources/admin/images/favicon.png" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style type="text/css">
      .btns-flex {
        display: flex;
      }
      .store-search input {
      	width: 150px;
      }
      /* .store-search {
      	display: flex;
      	justify-content: space-between;
      	align-items: center;
      } */
      .store-search label {
    	margin: 0 0.6rem;
    	font-size: 13px;
      }
      .store-search-btn {
   	    display: inline-block;
	    height: 0;
	    padding: 0;
	    font-size: 28px;
	    margin: 0 10px;
	    line-height: 0;
      }
      input {
        border: 1px solid #dbdde2;
	    padding: 4px 8px 4px 8px;
	    font-size: 14px;
	    transition: border 0.1s;
      }

      input:focus {
        border: 1px solid #bf94e4; /* 포커스 시 보더 색상 변경 */
        outline: none; /* 기본 아웃라인 제거 */
      }
      input[type="checkbox"] {
        transform: scale(1.5);
        margin: 0 0.2rem 0 0.8rem;
        cursor: pointer;
      }
  </style>
  
  <script>
    $(document).ready(function() {
        let selectedValues = [];

        // 전체 체크박스 클릭 이벤트
        $('#selectAll').change(function() {
            const isChecked = $(this).is(':checked');
            $('.status-checkbox').prop('checked', isChecked).prop('disabled', isChecked);

            // 전체 체크박스가 체크되면 모든 값 추가, 아니면 비우기
            if (isChecked) {
                selectedValues = $('.status-checkbox').map(function() {
                    return this.value;
                }).get();
            } else {
                selectedValues = [];
            }

            console.log(selectedValues); // 배열 출력
        });

        // 각 체크박스 클릭 이벤트
        $('.status-checkbox').change(function() {
            const value = $(this).val();
            if ($(this).is(':checked')) {
                // 체크된 경우 배열에 추가
                selectedValues.push(value);
            } else {
                // 체크 해제된 경우 배열에서 제거
                selectedValues = selectedValues.filter(v => v !== value);
            }

            // 전체 체크박스 상태 업데이트
            $('#selectAll').prop('checked', $('.status-checkbox:checked').length === $('.status-checkbox').length);
            
            console.log(selectedValues); // 배열 출력
        });
        
     // 오늘 날짜를 YYYY-MM-DD 형식으로 설정
        const today = new Date();
        const formattedToday = today.toISOString().split('T')[0];

     // 364일 전 날짜 계산 (1년 전의 같은 날짜)
        const oneYearAgo = new Date(today);
        oneYearAgo.setDate(today.getDate() - 365); // 364일 빼기
        const formattedOneYearAgo = oneYearAgo.toISOString().split('T')[0];

        // 시작일과 종료일 필드 설정 및 max 속성 설정
        $('#startDate').val(formattedOneYearAgo).attr('max', formattedToday);
        $('#endDate').val(formattedToday).attr('max', formattedToday);

        function setDate(months) {
            const startDate = new Date(today);
            const endDate = new Date(today);

            if (months === 0) {
                startDate.setDate(today.getDate());
                endDate.setDate(today.getDate());
            } else {
                startDate.setDate(today.getDate());
                endDate.setMonth(today.getMonth() + months);
                if (endDate.getDate() < today.getDate()) {
                    endDate.setDate(0); // 이전 달의 마지막 날로 설정
                }
            }

            // 날짜 포맷을 YYYY-MM-DD로 변환
            const formatDate = (date) => {
                const year = date.getFullYear();
                const month = String(date.getMonth() + 1).padStart(2, '0');
                const day = String(date.getDate()).padStart(2, '0');
                return `${year}-${month}-${day}`;
            };

            $('#startDate').val(formatDate(startDate));
            $('#endDate').val(formatDate(endDate));
        }

        $('#today').click(function() {
            setDate(0); // 오늘
        });

        $('#oneWeek').click(function() {
            setDate(0); // 오늘을 기준으로 한 주일 후 날짜 계산
            const start = new Date($('#startDate').val());
            start.setDate(start.getDate() + 7);
            $('#endDate').val(formatDate(start));
        });

        $('#oneMonth').click(function() {
            setDate(1); // 1개월
        });

        $('#threeMonths').click(function() {
            setDate(3); // 3개월
        });

        $('#sixMonths').click(function() {
            setDate(6); // 6개월
        });

        $('#oneYear').click(function() {
            setDate(12); // 1년
        });

        $('#all').click(function() {
            $('#startDate').val(''); // 전체 선택 시 빈 값으로 설정
            $('#endDate').val('');
        });
    });
</script>
  </head>
  <body>
    <div class="container-scroller">
      <%@ include file="/WEB-INF/views/inc/admin_navbar_store.jsp"%>
      <div class="container-fluid page-body-wrapper">
        <%@ include file="/WEB-INF/views/inc/admin_sidebar_store.jsp"%>
        <div class="main-panel">
          <div class="content-wrapper">
            <div class="d-xl-flex justify-content-between align-items-start">
              <h2 class="text-dark font-weight-bold mb-2">상품 조회/수정</h2>
              <div
                class="d-sm-flex justify-content-xl-between align-items-center mb-2"
              ></div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="tab-content tab-transparent-content">
                  <div
                    class="tab-pane fade show active"
                    id="business-1"
                    role="tabpanel"
                    aria-labelledby="business-tab"
                  >
                    <div class="row" style="color :#4d5159;">
                      <div class="col-lg-12 grid-margin stretch-card">
                        <div class="card">
                          <div style="background-color: #f8f9fd" class="card-body">
                            <div  class="col-lg-12 store-search" style="display: flex;">
                            	<div style="width: 180px">
    	                       		<h4>검색어</h4>
                            	</div>
                            	<div style="display: flex; align-items: center;">
                            		<div>
		                            	<label for="productName">상품명</label>
										<input type="text" id="productName" name="productName">
										<label for="manufacturerName">제조사명</label>
										<input type="text" id="manufacturerName" name="manufacturerName">
                            		</div>
                            		<div>
										<label for="brandName">브랜드명</label>
										<input type="text" id="brandName" name="brandName">
										<label for="category">카테고리</label>
										<input type="text" id="category" name="category">
                            		</div>
                            	</div>
                            </div>
                            <div class="dropdown-divider"></div>
                            <div class="col-lg-12" style="display: flex;">
                           		<!-- <h4 style="margin-right: 170px">판매 선택</h4> -->
                           		<div style="width: 180px">
    	                       		<h4>판매 선택</h4>
                            	</div>
							    <div style="display: flex; ">
							        <label style="margin-left: 0.6rem;">
								        <input type="checkbox" id="selectAll"> 전체
								    </label>
								    <label>
								        <input type="checkbox" name="status" value="판매대기" class="status-checkbox"> 판매대기
								    </label>
								    <label>
								        <input type="checkbox" name="status" value="판매중" class="status-checkbox"> 판매중
								    </label>
								    <label>
								        <input type="checkbox" name="status" value="품절" class="status-checkbox"> 품절
								    </label>
								    <label>
								        <input type="checkbox" name="status" value="승인대기" class="status-checkbox"> 승인대기
								    </label>
								    <label>
								        <input type="checkbox" name="status" value="판매중지" class="status-checkbox"> 판매중지
								    </label>
								    <label>
								        <input type="checkbox" name="status" value="판매종료" class="status-checkbox"> 판매종료
								    </label>
								    <label>
								        <input type="checkbox" name="status" value="판매금지" class="status-checkbox"> 판매금지
								    </label>
							    </div>
                            </div>
                            <div class="dropdown-divider"></div>
                            
                            <div class="col-lg-12" style="display: flex;">
                           		<div style="width: 180px">
    	                       		<h4>기간</h4>
                            	</div>
							    <div style="display: flex; ">
							        <button id="today">오늘</button>
								    <button id="oneWeek">1주일</button>
								    <button id="oneMonth">1개월</button>
								    <button id="threeMonths">3개월</button>
								    <button id="sixMonths">6개월</button>
								    <button id="oneYear">1년</button>
								    <button id="all">전체</button>
							    </div>
							    <input type="date" id="startDate">
							    <span>~</span>
							     <input type="date" id="endDate" max="">
                            </div>
                            <div class="dropdown-divider"></div>
                        	<i class="input-group-text border-0 mdi mdi-magnify store-search-btn"></i>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="tab-content tab-transparent-content">
                  <div
                    class="tab-pane fade show active"
                    id="business-1"
                    role="tabpanel"
                    aria-labelledby="business-tab"
                  >
                    <div class="row">
                      <div class="col-lg-12 grid-margin stretch-card">
                        <div class="card">
                          <div class="card-body">
                            <h4 class="card-title">
                              	상품 목록 (총 <span>0</span> 개)
                            </h4>
                            <div class="btns-flex">
                              <button>선택 삭제</button>
                              <spna>|</spna>
                              <select>
                                <option selected>판매변경</option>
                                <option>판매중</option>
                                <option>판매중지</option>
                              </select>
                              <spna>|</spna>
                              <button>판매가 변경</button>
                              <button>판매기간 변경</button>
                            </div>
                            <table class="table table-bordered">
                              <thead>
                                <tr>
                                  <th>#</th>
                                  <th>First name</th>
                                  <th>Progress</th>
                                  <th>Amount</th>
                                  <th>Deadline</th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td>1</td>
                                  <td>Herman Beck</td>
                                  <td>
                                    <div class="progress">
                                      <div
                                        class="progress-bar bg-success"
                                        role="progressbar"
                                        style="width: 25%"
                                        aria-valuenow="25"
                                        aria-valuemin="0"
                                        aria-valuemax="100"
                                      ></div>
                                    </div>
                                  </td>
                                  <td>$ 77.99</td>
                                  <td>May 15, 2015</td>
                                </tr>
                                <tr>
                                  <td>2</td>
                                  <td>Messsy Adam</td>
                                  <td>
                                    <div class="progress">
                                      <div
                                        class="progress-bar bg-danger"
                                        role="progressbar"
                                        style="width: 75%"
                                        aria-valuenow="75"
                                        aria-valuemin="0"
                                        aria-valuemax="100"
                                      ></div>
                                    </div>
                                  </td>
                                  <td>$245.30</td>
                                  <td>July 1, 2015</td>
                                </tr>
                                <tr>
                                  <td>3</td>
                                  <td>John Richards</td>
                                  <td>
                                    <div class="progress">
                                      <div
                                        class="progress-bar bg-warning"
                                        role="progressbar"
                                        style="width: 90%"
                                        aria-valuenow="90"
                                        aria-valuemin="0"
                                        aria-valuemax="100"
                                      ></div>
                                    </div>
                                  </td>
                                  <td>$138.00</td>
                                  <td>Apr 12, 2015</td>
                                </tr>
                                <tr>
                                  <td>4</td>
                                  <td>Peter Meggik</td>
                                  <td>
                                    <div class="progress">
                                      <div
                                        class="progress-bar bg-primary"
                                        role="progressbar"
                                        style="width: 50%"
                                        aria-valuenow="50"
                                        aria-valuemin="0"
                                        aria-valuemax="100"
                                      ></div>
                                    </div>
                                  </td>
                                  <td>$ 77.99</td>
                                  <td>May 15, 2015</td>
                                </tr>
                                <tr>
                                  <td>5</td>
                                  <td>Edward</td>
                                  <td>
                                    <div class="progress">
                                      <div
                                        class="progress-bar bg-danger"
                                        role="progressbar"
                                        style="width: 35%"
                                        aria-valuenow="35"
                                        aria-valuemin="0"
                                        aria-valuemax="100"
                                      ></div>
                                    </div>
                                  </td>
                                  <td>$ 160.25</td>
                                  <td>May 03, 2015</td>
                                </tr>
                                <tr>
                                  <td>6</td>
                                  <td>John Doe</td>
                                  <td>
                                    <div class="progress">
                                      <div
                                        class="progress-bar bg-info"
                                        role="progressbar"
                                        style="width: 65%"
                                        aria-valuenow="65"
                                        aria-valuemin="0"
                                        aria-valuemax="100"
                                      ></div>
                                    </div>
                                  </td>
                                  <td>$ 123.21</td>
                                  <td>April 05, 2015</td>
                                </tr>
                                <tr>
                                  <td>7</td>
                                  <td>Henry Tom</td>
                                  <td>
                                    <div class="progress">
                                      <div
                                        class="progress-bar bg-warning"
                                        role="progressbar"
                                        style="width: 20%"
                                        aria-valuenow="20"
                                        aria-valuemin="0"
                                        aria-valuemax="100"
                                      ></div>
                                    </div>
                                  </td>
                                  <td>$ 150.00</td>
                                  <td>June 16, 2015</td>
                                </tr>
                              </tbody>
                            </table>
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
