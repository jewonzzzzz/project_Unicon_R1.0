<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    let selectedCategory = null; // 이전에 선택된 카테고리를 추적하는 변수
    let selectedCategoryDetail = null; // 이전에 선택된 카테고리를 추적하는 변수
    const data = {};
    
    function category(value,type) {
    	// display 속성을 block으로 변경하여 보이게 함
        $('.selected-category-text').css('display', 'block');
    	 // 선택한 카테고리 출력
        $('.selected-category-text').html("선택한 카테고리 : " + type);
//         ' <i class="mdi mdi-chevron-right"></i>'
    	
        console.log(value, type);
     	// 기존 카테고리 값을 지우고 새로 선택된 카테고리 값을 저장
        data.category = type;
     	
        // 이전 선택된 카테고리가 있다면 색상 초기화
        if (selectedCategory) {
            $("#category" + selectedCategory).css('color', '#000000'); // 이전 카테고리 색상 변경
        }
    	if (selectedCategoryDetail) {
			$("#categoryDetail" + selectedCategoryDetail).css('color', '#000000'); // 해당 카테고리 span 색상 변경
    	}
    	 
		// 처음 선택한 카테고리의 span 색상 변경
		$("#category" + value).css('color', '#bf94e4'); // 해당 카테고리 span 색상 변경
		// 현재 선택한 카테고리 값을 저장
	    selectedCategory = value;
		
		
		// category-detail 안의 내용을 초기화
	    $('.category-detail').empty();
		
		
		$.ajax({
		    url: '/store/category/'+value, // 요청할 API URL
		    type: 'GET', // 요청 방식 (GET, POST, PUT, DELETE 등)
		    success: function(response) {
		        console.log('성공:', response);
		        // 응답 처리 로직
		        
		        // category_value를 콤마로 분리하여 배열로 변환
				const categories = response[0].category_value.split(',');
		        
				// 배열의 각 요소에 대해 버튼을 생성하고 append
				categories.forEach(function(category, index) {
				    // 버튼 HTML 생성 (따옴표 사용)
				    const button = '<button onclick="categoryDetail(\'' + category + '\', ' + index + ')">' +
				                   '<span id="categoryDetail' + index + '">' + category + '</span>' + // 인덱스를 사용하여 고유한 ID 생성
				                   '<i class="mdi mdi-chevron-right"></i>' +
				                   '</button>';
				    
				    // category-detail 클래스 안에 버튼 추가
				    $('.category-detail').append(button);
				});

		        
		    },
		    error: function(xhr, status, error) {
		        console.error('오류:', error);
		        // 오류 처리 로직
		    }
		});

    }
 	// categoryDetail 함수 정의
    function categoryDetail(category, index) {
		// 처음 선택한 카테고리의 span 색상 변경
		if (selectedCategoryDetail) {
			$("#categoryDetail" + selectedCategoryDetail).css('color', '#000000'); // 해당 카테고리 span 색상 변경
    	}
		selectedCategoryDetail = index;
		$("#categoryDetail" + index).css('color', '#bf94e4'); // 해당 카테고리 span 색상 변경
		
		// 기존 카테고리 값을 지우고 새로 선택된 카테고리 값을 저장
	    data.categoryDetail = category;
		
	    // 선택된 카테고리에 대한 정보를 출력할 HTML에 추가
	    $('.selected-category-text').html("선택한 카테고리 : " + data.category + ' <i class="mdi mdi-chevron-right"></i>'+category);
	}
 	
    function closeBox(value) {
        if ('category' == value) {
            // 요소의 현재 display 상태를 확인하고 토글
            const $Box = $('.closeBox-category');
            if ($Box.css('display') === 'none') {
                $Box.css('display', 'block'); // 숨겨져 있으면 보여줌
            } else {
                $Box.css('display', 'none'); // 보여져 있으면 숨김
            }
        } else if('productName' == value) {
        	// 요소의 현재 display 상태를 확인하고 토글
            const $Box = $('.closeBox-productName');
            if ($Box.css('display') === 'none') {
                $Box.css('display', 'block'); // 숨겨져 있으면 보여줌
            } else {
                $Box.css('display', 'none'); // 보여져 있으면 숨김
            }
        }
        
    }
    </script>
	<script type="text/javascript">
	 $(document).ready(function() {
         $('#textInput').focus(function() {
             $(this).closest('.input-container').addClass('focused'); // 포커스 시 클래스 추가
             $('#error-message').hide(); // 에러 메시지 숨김
         });

         $('#textInput').blur(function() {
             const inputVal = $(this).val().trim();
             const $inputContainer = $(this).closest('.input-container');

             if (inputVal === '') {
                 $inputContainer.css('border-color', 'lightcoral'); // 비어 있을 때 테두리 색상 변경
                 $('#error-message').show(); // 에러 메시지 표시
             } else {
                 $inputContainer.removeClass('focused').css('border-color', '#ccc'); // 입력된 경우 원래 색상으로
             }
         });

         $('#textInput').on('input', function() {
             const textLength = $(this).val().length;
             $('#currentCount').text(textLength); // 변경되는 숫자만 업데이트

             // 전체 문자 수는 항상 /100으로 설정
             $('#charCount').text(textLength + '/100'); // 문자 수 전체 업데이트

             // 입력이 시작되면 에러 메시지 숨기기
             if ($(this).val().trim() !== '') {
                 $('#error-message').hide();
                 $(this).closest('.input-container').css('border-color', '#bf94e4'); // 원래 색상으로 변경

                 // 입력된 값을 data 객체에 저장
                 data.productName = $(this).val().trim(); // productName 키에 값 저장
             } else {
                 $('#error-message').show(); // 입력이 없으면 에러 메시지 표시
                 $(this).closest('.input-container').css('border-color', 'lightcoral'); // 경고 색상으로 변경

                 // 입력이 없을 경우 data 객체에서 값 삭제
                 delete data.productName; // productName 키 삭제
             }
             
             console.log(data.productName);
         });
     });
	</script>    
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/vendors/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/style.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/admin/images/favicon.png" />
    <style type="text/css">
    .selected {
    	color: #bf94e4; /* 선택된 버튼의 폰트 색상 */
	}
    .category-box {
		display: flex;
		padding: 7px 0 0 0;
		border : 1px solid;
		width: 50rem;
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
   	    padding: 3px 7px 7px 8px;
    	display: flex;
    	justify-content: space-between;
    }
    .category button:hover, .category-detail button:hover {
    	background-color: #f7f7f7
    }
    .selected-category-text {
    	color: #1088ed;
	    margin-top: 0.5em;
	    font-size: 13px;
	    display: none;
    }
    .icon-must {
	    margin-left: 5px;
	    width: 6px;
	    height: 6px;
	}
    .icon-dot, .icon-must {
	    display: inline-block;
	    background-color: #ff545c;
	    border-radius: 50%;
	    vertical-align: middle;
	}
	
	.card {
		margin:10px 0 3.0rem;
	}
	.input-container {
		display: flex;
	    align-items: center;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    padding: 7px;
	    background-color: #f9f9f9;
	    margin-bottom: 10px
	}
	/* 포커스 시 테두리 색상 */
	.input-container.focused {
	    border-color: #bf94e4; /* 포커스 시 색상 */
	    background-color: white; /* 포커스 시 배경 색상 (예: 연한 파란색) */
	}
	
	.closeBox-productName .input-container input {
		width: 96%;
		margin-right: 0.5em;
		border: none;
		background-color: transparent;
		font-size: 13px;
	}
	/* 필수 입력 문구 스타일 */
	#error-message {
	    margin: 0px;
	    font-size: 12px;
	    color: red; /* 에러 메시지 색상 */
	    display: none;
	}
	#charCount {
        margin-left: 10px;
        color: #2ecc71; /* 글자 수 색상 */
        font-size: 13px;
    }
    label {
		width: 180px;
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
                        <!-- 카테고리 시작 -->
                        <div class="card">
                          <div class="card-body" style="padding: 1.5rem 2.5rem;" >
                            <div class="row">
                              <div class="col-12 grid-margin stretch-card">
				                <div style="width:100%;">
				                  <div style="padding : padding: 1.0rem 2.0rem;">
				                  	<div style="display: flex; justify-content: space-between;">
				                  		<div style="display: flex;align-items: center;">
						                    <h4 class="card-title" style="margin-bottom: 0">카테고리 </h4>
						                    <i class="icon-must" aria-label="필수항목"></i>
				                  		</div>
					                    <button onclick="closeBox('category')"><i class="mdi mdi-chevron-right"></i></button>
				                  	</div>
				                    <div class="dropdown-divider"></div>
				                    <div class="closeBox-category">
				                      <div class="category-box">
				                      <div class="category">
				                      	<c:forEach items="${CategoryDataList}" var="c">
										    <button onclick="category('${c.category_code}', '${c.category_type}')">
										        <span id="category${c.category_code}">${c.category_type}</span>
										        <i class="mdi mdi-chevron-right"></i>
										    </button>
										</c:forEach>
										</div>
				                      <div class="category-detail">
				                      </div>
				                      </div>
					                  <div id="selected-category" class="selected-category-text">선택한 카테고리 : </div>
				                    </div>
				                  </div>
				                </div>
				              </div>
                            </div>
                          </div>
                        </div>
                        <!-- 카테고리 끝 -->
                        <!-- 상품명 시작 -->
                        <div class="card">
                          <div class="card-body" style="padding: 1.5rem 2.5rem;" >
                            <div class="row">
                              <div class="col-12 grid-margin stretch-card">
				                <div style="width:100%;">
				                  <div style="padding : padding: 1.0rem 2.0rem;">
				                  	<div style="display: flex; justify-content: space-between;">
				                  		<div style="display: flex;align-items: center;">
						                    <h4 class="card-title" style="margin-bottom: 0">상품명 </h4>
						                    <i class="icon-must" aria-label="필수항목"></i>
				                  		</div>
					                    <button onclick="closeBox('productName')"><i class="mdi mdi-chevron-right"></i></button>
				                  	</div>
				                    <div class="dropdown-divider"></div>
				                    <div class="closeBox-productName">
				                    	<div class="input-container">
				                    		 <input type="text" id="textInput" maxlength="100" name="productName" >
				                    		 <span id="charCount"><span id="currentCount">0</span>/100</span>
				                    	</div>
				                    	<p id="error-message" ><i class="mdi mdi-block-helper" style="margin-right:5px "></i>필수 입력 정보입니다.</p>
				                    	<span style="color: #000000; font-size: 13px">
				                    		상품명을 맞게 입력하면 검색 노출에 도움이 될 수 있습니다.
				                    	</span>
				                    <div class="dropdown-divider"></div>
				                    <div style="color : #2ecc71; font-size: 12px">
				                    	*가이드에 맞지 않는 상품명 입력 시 별도 고지 없이 제재될 수 있습니다.<br>
										· 기존 상품을 다른 상품으로 변경하는 상품 ID 재사용 정책 위반(기존 상품명의 띄어쓰기, 설명 등 단순 변경은 허용)<br>
										· 상품과 직접 관련이 없는 다른 상품명, 스팸성, 유명 상품을 도용한 ~스타일, ~st 키워드 사용
				                    </div>
				                    </div>

				                  </div>
				                </div>
				              </div>
                            </div>
                          </div>
                        </div>
                        <!-- 상품명 끝 -->
                        <!-- 판매가 시작 -->
                        <div class="card">
                          <div class="card-body" style="padding: 1.5rem 2.5rem;" >
                            <div class="row">
                              <div class="col-12 grid-margin stretch-card">
				                <div style="width:100%;">
				                  <div style="padding : padding: 1.0rem 2.0rem;">
				                  	<div style="display: flex; justify-content: space-between;">
				                  		<div style="display: flex;align-items: center;">
						                    <h4 class="card-title" style="margin-bottom: 0">판매가 </h4>
						                    <i class="icon-must" aria-label="필수항목"></i>
				                  		</div>
					                    <button onclick="closeBox('priceBlock')"><i class="mdi mdi-chevron-right"></i></button>
				                  	</div>
				                    <div class="dropdown-divider"></div>
				                    <div class="closeBox-priceBlock">
				                    	<div style="display: flex;">
								            <label for="price">판매가</label>
								            <div>
								            	<div style="display: flex;">
										            <input style="border: 1px solid #dbdde2;" type="text" id="price" name="price" placeholder="판매가를 입력하세요">
										            <span style="padding: 4px 10px;line-height: 24px;color: #4d5159;background-color: #f8f9fd;border: 1px solid #dbdde2;border-radius: 0;border-left: none;">원</span>
								            	</div>
									            <p id="price-error" class="error-message">올바른 판매가를 입력하세요.</p>
								            </div>
				                    	</div>
					                    <div class="dropdown-divider"></div>
							
							            <label for="sale-period">판매기간</label>
							            <input type="text" id="sale-period" name="sale-period" placeholder="판매기간을 입력하세요 (예: 2023-11-01)">
							            <span id="period-error" class="error-message">올바른 날짜 형식으로 입력하세요.</span>
					                    <div class="dropdown-divider"></div>
							
							            <label for="discount">할인율 (%)</label>
							            <input type="number" id="discount" name="discount" placeholder="할인율을 입력하세요">
							            <span id="discount-error" class="error-message">올바른 할인율을 입력하세요.</span>
				                    </div>
				                  </div>
				                </div>
				              </div>
                            </div>
                          </div>
                        </div>
                        <!-- 판매가 끝 -->
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
    <script src="/resources/admin/vendors/js/vendor.bundle.base.js"></script>
    <script src="/resources/admin/vendors/chart.js/Chart.min.js"></script>
    <script src="/resources/admin/vendors/jquery-circle-progress/js/circle-progress.min.js"></script>
    <script src="/resources/admin/js/off-canvas.js"></script>
    <script src="/resources/admin/js/hoverable-collapse.js"></script>
    <script src="/resources/admin/js/misc.js"></script>
    <script src="/resources/admin/js/dashboard.js"></script>
  </body>
</html>