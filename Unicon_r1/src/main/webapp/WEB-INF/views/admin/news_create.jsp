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

                        <div class="border bg-white p-1-9 p-lg-2-3 p-xl-1-6 rounded">

                            <form class="quform" action="quform/apply-job.php" method="post" enctype="multipart/form-data" onclick="">
                                <div class="quform-elements">

                                    <div class="row">

                                        <!-- Begin Select element -->
                                        <div class="col-md-12">
                                            <div class="quform-element form-group">
                                                <label for="applyfor">소식 제목 <span class="quform-required">*</span></label>
                                            	<input id="name" class="form-control" type="text" name="name" placeholder="First Name">
                                            </div>

                                        </div>
                                        <!-- End Select element -->

                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="name">First Name <span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <input id="name" class="form-control" type="text" name="name" placeholder="First Name">
                                                </div>
                                            </div>

                                        </div>
                                        <!-- End Text input element -->

                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="last_name">Last Name <span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <input id="last_name" class="form-control" type="text" name="last_name" placeholder="Last Name">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Text input element -->

                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="email">Email Address <span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <input id="email" class="form-control" type="text" name="email" placeholder="name@example.com">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Text input element -->

                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="linkedin">URL</label>
                                                <div class="quform-input">
                                                    <input id="linkedin" class="form-control" type="text" name="linkedin" placeholder="Linkedin">
                                                </div>
                                            </div>

                                        </div>
                                        <!-- End Text input element -->

                                        <!-- Begin Select element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">

                                                <!-- Begin Upload element -->
                                                <div class="quform-input">

                                                    <label for="resume">Resume/CV <span class="quform-required">*</span></label>

                                                    <div class="custom-file">
                                                        <input class="custom-file-input" type="file" id="resume" name="resume">
                                                        <label class="custom-file-label" data-browse="Browse">Choose file</label>
                                                    </div>

                                                    <p class="quform-description">All files allowed. Maximum size 10MB.</p>

                                                </div>
                                                <!-- End Upload element -->

                                            </div>

                                        </div>
                                        <!-- End Select element -->

                                        <!-- Begin Select element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">

                                                <div class="quform-input">
                                                    <label for="coverletter">Cover Letter</label>

                                                    <div class="custom-file">
                                                        <input class="custom-file-input" type="file" id="coverletter" name="coverletter">
                                                        <label class="custom-file-label" data-browse="Browse">Choose file</label>
                                                    </div>

                                                    <p class="quform-description">All files allowed. Maximum size 10MB.</p>

                                                </div>
                                            </div>

                                        </div>
                                        <!-- End Select element -->

                                        <!-- Begin Textarea element -->
                                        <div class="col-md-12">
                                            <div class="quform-element form-group">
                                                <label for="message">In a Few Words <span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <textarea id="message" class="form-control" name="message" rows="4" placeholder="How'd you hear about Crizal?"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Textarea element -->

                                        <!-- Begin Captcha element -->
                                        <div class="col-md-12">
                                            <div class="quform-element">
                                                <label for="type_the_word">Type the word <span class="quform-required">*</span></label>
                                                <div class="form-group">
                                                    <div class="quform-input">
                                                        <input id="type_the_word" class="form-control" type="text" name="type_the_word" placeholder="Type the below word">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="quform-captcha">
                                                        <div class="quform-captcha-inner">
                                                            <img src="quform/images/captcha/courier-new-light.png" alt="...">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Captcha element -->

                                        <!-- Begin Submit button -->
                                        <div class="col-md-12">
                                            <div class="quform-submit-inner text-center">
                                                <button class="butn w-100" type="submit"><span>Apply Now</span></button>
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

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
