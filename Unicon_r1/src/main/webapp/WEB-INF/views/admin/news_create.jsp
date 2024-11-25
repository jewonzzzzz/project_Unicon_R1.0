<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->

</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
	
	<section style="padding-top: 50px;">
            <div class="container">
	            <div class="line-title">
			        <h4 class="mb-0">소식 관리</h4>
			    </div>
                <div class="row">

                    <!-- start product grid left panel -->
                    <div class="col-lg-3">

                        <div class="side-bar">

                            <div class="widget">

                                <div id="accordion" class="accordion-style2">
                                    <div class="card">
                                        <div class="card-header" id="headingOne">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne"> Electrical</button>
                                            </h5>
                                        </div>
                                        <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                <ul class="mb-0 list-unstyled">
                                                    <li><a href="#!">Flash Lights</a></li>
                                                    <li><a href="#!">Tool Organisers</a></li>
                                                    <li><a href="#!">Safety Cables</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header" id="headingTwo">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                                  소식 관리
                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                <ul class="mb-0 list-unstyled">
                                                    <li><a href="/admin/news_create">소식 등록</a></li>
                                                    <li><a href="/admin/news_manage">소식 등록내역</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header" id="headingThree">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                Accessories
                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                <ul class="mb-0 list-unstyled">
                                                    <li><a href="#!">Drives &amp; Storage</a></li>
                                                    <li><a href="#!">Networking Devices</a></li>
                                                    <li><a href="#!">Software</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header" id="headingFour">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                  Clothes
                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                <ul class="mb-0 list-unstyled">
                                                    <li><a href="#!">T-Shirt</a></li>
                                                    <li><a href="#!">Pants</a></li>
                                                    <li><a href="#!">Saree</a></li>
                                                    <li><a href="#!">Joggers</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header" id="headingFive">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                  Mobile
                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                <ul class="mb-0 list-unstyled">
                                                    <li><a href="#!">Intex</a></li>
                                                    <li><a href="#!">Google</a></li>
                                                    <li><a href="#!">Samsung</a></li>
                                                    <li><a href="#!">Apple</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                    <!-- end product grid left panel -->

                    <!-- start right panel section -->
                    <div class="col-lg-9 ps-lg-1-9">
						<div class="line-title">
					        <h5 class="mb-0">소식 등록내역</h5>
					    </div>
                        <div class="col-md-11 col-lg-12">

                        <form class="quform" action="/admin/news_create" method="post" enctype="multipart/form-data" onclick="">
                                <div class="quform-elements">
                                    <div class="row">
                                    
                                        <!-- Begin Select element -->
                                        <div class="col-md-12">
                                            <div class="quform-element form-group">
                                            	<label for="name">소식명<span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <input id="name" class="form-control" type="text" name="news_subject" placeholder="First Name">
                                                </div>
                                            </div>

                                        </div>
                                        <!-- End Select element -->

                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="applyfor">지역 <span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <select id="applyfor" class="form-control form-select" name="news_resion"
                                                    style="padding: 6px 12px;">
                                                        <option value="">-- 지역선택 --</option>
                                                        <option value="Office Executive">Office Executive</option>
                                                        <option value="Mutual Fund Executive">Mutual Fund Executive</option>
                                                        <option value="Financial Investment">Financial Investment</option>
                                                        <option value="Others">Others</option>
                                                    </select>
                                                </div>
                                            </div>

                                        </div>
                                        <!-- End Text input element -->

                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="last_name">장소 <span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <input id="last_name" class="form-control" type="text" name="news_place" placeholder="Last Name">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Text input element -->
                                        
                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="last_name">주관기관 <span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <input id="last_name" class="form-control" type="text" name="news_ins" placeholder="Last Name">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Text input element -->
                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="last_name">참여대상 <span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <input id="last_name" class="form-control" type="text" name="news_att" placeholder="Last Name">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Text input element -->
                                        
                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="email">행사일자 <span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <input id="email" class="form-control" type="date" name="news_date" placeholder="name@example.com">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Text input element -->

                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="linkedin">행사시간</label>
                                                <div class="quform-input">
                                                    <input id="linkedin" class="form-control" type="time" name="news_time" placeholder="Linkedin">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Text input element -->

                                        <!-- Begin Textarea element -->
                                        <div class="col-md-12">
                                            <div class="quform-element form-group">
                                                <label for="message">내용 <span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <textarea id="message" class="form-control" name="news_content" rows="4" placeholder="How'd you hear about Crizal?"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Textarea element -->
                                        
                                        <!-- Begin Upload element -->
                                        <div class="col-md-12">
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <div class="quform-input">
                                                    <label for="resume">소식 이미지 <span class="quform-required">*</span></label>
                                                    <div class="custom-file">
                                                        <input class="custom-file-input" type="file" id="resume" name="news_file">
                                                        <label class="custom-file-label" data-browse="Browse">Choose file</label>
                                                    </div>
                                                    <p class="quform-description">이미지파일만 업로드 가능. 최대크기 10MB.</p>
                                                </div>
                                            </div>
                                        </div>
                                        </div>
                                       <!-- End Upload element -->
                                        
                                        <div class="col-md-4">
                                            <div class="quform-element form-group">
                                                <div id="news_preview"></div>
                                            </div>
                                        </div>

                                        <!-- Begin Submit button -->
                                        <div class="col-md-12">
                                            <div class="text-center">
                                                <button class="butn w-100" type="submit"><span>등록하기</span></button>
                                            </div>
                                            <div class="quform-loading-wrap"><span class="quform-loading"></span></div>
                                        </div>
                                        <!-- End Submit button -->

                                    </div>

                                </div>
                            </form>

                    </div>

                </div>
            </div>
            </div>
        </section>

<!--====================================작성부=====================================-->

<script>
$(document).ready(function () {
    // 파일 선택 이벤트 처리
    $('.custom-file-input').on('change', function (event) {
        // 선택된 파일 이름 가져오기
        var fileName = $(this).val().split('\\').pop(); // 파일 경로에서 이름만 분리
        // 파일 이름을 라벨에 적용
        $(this).next('.custom-file-label').text(fileName || 'Choose file');
        
        const file = event.target.files[0]; // 업로드한 파일 가져오기
	    const $preview = $('#news_preview'); // 미리보기 영역 선택
	    if (file) {
	    	const reader = new FileReader();
	        reader.onload = function(e) {
	          const imgTag = 
	            "<img src='" + e.target.result + "' alt='Uploaded Image' " +
	            "style='max-width: 100%; max-height: 100%; object-fit: cover;' />";
	          $preview.html(imgTag);
	        };
	        reader.readAsDataURL(file); // 파일을 Data URL로 읽기
	    } else {
	    	$preview.empty();
	    }
        
        
        
        
    });
    
    
    
    
    
    
}); //jquery

</script>


<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
