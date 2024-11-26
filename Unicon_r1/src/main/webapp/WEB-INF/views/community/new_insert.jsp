<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->

</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->

<section class="bg-light">
    <div class="container">

        <div class="row justify-content-center">

            <!-- start form section -->
            <div class="col-md-11 col-lg-9">

                <div class="border bg-white p-1-9 p-lg-2-3 p-xl-6 rounded">

                    <div class="text-center mb-1-9">
                       <h2 class="font-weight-600 mb-3">커뮤니티 게시글 등록</h2>
                       <p class="mb-0">입양 후기 / 반려 이야기 / 실종 / 임시 보호 에 대한 커뮤니티 게시글을 작성해주세요.</p>
                    </div>

                    <form class="quform" action="" method="post" enctype="multipart/form-data" onclick="">
                        <div class="quform-elements">

                            <div class="row">

                                <!-- Begin Select element -->
                                <div class="col-md-3">
                                    <div class="quform-element form-group">
                                        <label for="applyfor">게시글 종류 <span class="quform-required">*</span></label>
                                        <div class="quform-input">
                                            <select id="applyfor" class="form-control form-select" name="applyfor">
                                                <option>게시글 종류</option>
                                                <option value="Office Executive">입양 후기</option>
                                                <option value="Mutual Fund Executive">반려 이야기</option>
                                                <option value="Financial Investment">실종</option>
                                                <option value="Others">임시 보호</option>
                                            </select>
                                        </div>
                                    </div>

                                </div>
                                <!-- End Select element -->
                                
                                <!-- Begin Select element -->
                                <div class="col-md-3">
                                    <div class="quform-element form-group">
                                        <label for="applyfor">동물 종류 <span class="quform-required">*</span></label>
                                        <div class="quform-input">
                                            <select id="applyfor" class="form-control form-select" name="applyfor">
                                                <option>동물 종류</option>
                                                <option value="Office Executive">개</option>
                                                <option value="Mutual Fund Executive">고양이</option>
                                                <option value="Financial Investment">기타</option>
                                            </select>
                                        </div>
                                    </div>

                                </div>
                                <!-- End Select element -->
                                
                                <!-- Begin Select element -->
                                <div class="col-md-3">
                                    <div class="quform-element form-group">
                                        <label for="applyfor">동물 품종 <span class="quform-required">*</span></label>
                                        <div class="quform-input">
	                                        <div class="quform-input">
	                                            <input id="name" class="form-control" type="text" name="name" placeholder="자동 완성 예정" />
	                                        </div>
                                        </div>
                                    </div>

                                </div>
                                <!-- End Select element -->
                                
                                <!-- Begin Select element -->
                                <div class="col-md-3">
                                    <div class="quform-element form-group">
                                        <label for="applyfor">기타 동물 품종 <span class="quform-required">*</span></label>
                                        <div class="quform-input">
	                                        <div class="quform-input">
	                                            <input id="name" class="form-control" type="text" name="name" placeholder="개와 고양이를 제외한 동물은 품종을 적어주세요" />
	                                        </div>
                                        </div>
                                    </div>

                                </div>
                                <!-- End Select element -->

                                <!-- Begin Text input element -->
                                <div class="col-md-6">
                                    <div class="quform-element form-group">
                                        <label for="name">글 제목</label>
                                        <div class="quform-input">
                                            <input id="name" class="form-control" type="text" name="name" placeholder="입력" />
                                        </div>
                                    </div>

                                </div>
                                <!-- End Text input element -->

                                <!-- Begin Text input element -->
                                <div class="col-md-6">
                                    <div class="quform-element form-group">
                                        <label for="last_name">거주 지역</label>
                                        <div class="quform-input">
                                            <input id="last_name" class="form-control" type="text" name="last_name" placeholder="자동 등록 / 변경을 원하시면 마이페이지에서 변경해주세요." />
                                        </div>
                                    </div>
                                </div>
                                <!-- End Text input element -->

                                <!-- Begin Text input element -->
                                <div class="col-md-6">
                                    <div class="quform-element form-group">
                                        <label for="email">실종(발견) 장소 <span class="quform-required">*</span></label>
                                        <div class="quform-input">
                                            <input id="email" class="form-control" type="text" name="email" placeholder="입력" />
                                        </div>
                                    </div>
                                </div>
                                <!-- End Text input element -->

                                <!-- Begin Text input element -->
                                <div class="col-md-6">
                                    <div class="quform-element form-group">
                                        <label for="linkedin">실종(발견) 일자 <span class="quform-required">*</span></label>
                                        <div class="quform-input">
                                            <input id="linkedin" class="form-control" type="text" name="linkedin" placeholder="입력" />
                                        </div>
                                    </div>

                                </div>
                                <!-- End Text input element -->

                                

                                <!-- Begin Textarea element -->
                                <div class="col-md-12">
                                    <div class="quform-element form-group">
                                        <label for="message">글 내용</label>
                                        <div class="quform-input">
                                            <textarea id="message" class="form-control" name="message" rows="4" placeholder="실종과 임시보호 게시글은 성별, 나이, 색상, 기타 특징 등 동물 정보를 상세히 적어주세요"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Textarea element -->
                                
                                
                                <!-- Begin Select element -->
								<div id="test12345" class="col-md-12 row">
								    <!-- 첫 번째 이미지 업로드 및 미리보기 -->
								    <div id="test123" class="col-md-3">
								        <div class="quform-element form-group">
								            <!-- Begin Upload element -->
								            <div class="quform-input">
								                <div class="custom-file">
								                    <input class="custom-file-input" type="file" id="image-input-1" name="resume" style="display: none;" />
								                    <label for="repImage1">대표 이미지 <span class="quform-required">*</span></label>
								                </div>
								            </div>
								            <!-- End Upload element -->
								        </div>
								        <!-- Begin Preview element -->
								        <div class="project-grid-img" style="width: 200px; height: 200px; overflow: hidden; position: relative; cursor: pointer; border: 2px solid #ccc; border-radius: 4px;">
								        	<i class="fa-solid fa-plus fa-2xl" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);"></i>
								            <img id="image-preview-1" alt="" style="width: 100%; height: 100%; object-fit: fill; position: absolute; top: 0; left: 0; display: none;" />
								        </div>
								        <!-- End Preview element -->
								    </div>
								
								    <!-- 두 번째 이미지 업로드 및 미리보기 -->
								    <div id="test124" class="col-md-3">
								        <div class="quform-element form-group">
								            <!-- Begin Upload element -->
								            <div class="quform-input">
								                <div class="custom-file">
								                    <input class="custom-file-input" type="file" id="image-input-2" name="resume" style="display: none;" />
								                    <label for="Image2">이미지</label>
								                </div>
								            </div>
								            <!-- End Upload element -->
								        </div>
								        <!-- Begin Preview element -->
								        <div class="project-grid-img" style="width: 200px; height: 200px; overflow: hidden; position: relative; cursor: pointer; border: 2px solid #ccc; border-radius: 4px;">
								        	<i class="fa-solid fa-plus fa-2xl" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);"></i>
								            <img id="image-preview-2" alt="" style="width: 100%; height: 100%; object-fit: fill; position: absolute; top: 0; left: 0; display: none;" />
								        </div>
								        <!-- End Preview element -->
								    </div>
								
								    <!-- 세 번째 이미지 업로드 및 미리보기 -->
								    <div id="test125" class="col-md-3">
								        <div class="quform-element form-group">
								            <!-- Begin Upload element -->
								            <div class="quform-input">
								                <div class="custom-file">
								                    <input class="custom-file-input" type="file" id="image-input-3" name="resume" style="display: none;" />
								                    <label for="Image2">이미지</label>
								                </div>
								            </div>
								            <!-- End Upload element -->
								        </div>
								        <!-- Begin Preview element -->
								        <div class="project-grid-img" style="width: 200px; height: 200px; overflow: hidden; position: relative; cursor: pointer; border: 2px solid #ccc; border-radius: 4px;">
								        	<i class="fa-solid fa-plus fa-2xl" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);"></i>
								            <img id="image-preview-3" alt="" style="width: 100%; height: 100%; object-fit: fill; position: absolute; top: 0; left: 0; display: none;" />
								        </div>
								        <!-- End Preview element -->
								    </div>
								    
								    <!-- 네 번째 이미지 업로드 및 미리보기 -->
								    <div id="test126" class="col-md-3">
								        <div class="quform-element form-group">
								            <!-- Begin Upload element -->
								            <div class="quform-input">
								                <div class="custom-file">
								                    <input class="custom-file-input" type="file" id="image-input-4" name="resume" style="display: none;" />
								                    <label for="Image2">이미지</label>
								                </div>
								            </div>
								            <!-- End Upload element -->
								        </div>
								        <!-- Begin Preview element -->
								        <div class="project-grid-img" style="width: 200px; height: 200px; overflow: hidden; position: relative; cursor: pointer; border: 2px solid #ccc; border-radius: 4px;">
								        	<i class="fa-solid fa-plus fa-2xl" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);"></i>
								            <img id="image-preview-4" alt="" style="width: 100%; height: 100%; object-fit: fill; position: absolute; top: 0; left: 0; display: none;" />
								        </div>
								        <!-- End Preview element -->
								    </div>
								</div>
								<!-- End Select element -->
								
								

                                <!-- Begin Submit button -->
                                <div class="col-md-6 offset-md-3 mt-4">
                                    <div class="quform-submit-inner text-center">
                                        <button class="butn w-100" type="submit"><span>글 등록하기</span></button>
                                    </div>
                                    <div class="quform-loading-wrap"><span class="quform-loading"></span></div>
                                </div>
                                <!-- End Submit button -->

                            </div>
							
                        </div>
                    </form>

                </div>

            </div>
            <!-- end form section -->

        </div>
    </div>
</section>

<script>
$(function() {
    // 이미지 미리보기
    function setupImagePreview(inputId, previewId) {
        $('#' + inputId).change(function(e) {
            const file = e.target.files[0];
            const reader = new FileReader();

            reader.onload = function(e) {
                $('#' + previewId).attr('src', e.target.result).show();
            }

            if (file) {
                reader.readAsDataURL(file);
            }
        });

        // 미리보기 이미지 클릭 시 파일 선택
        $('#' + previewId).parent().click(function() {
            $('#' + inputId).click();
        });
    }

    setupImagePreview('image-input-1', 'image-preview-1');
    setupImagePreview('image-input-2', 'image-preview-2');
    setupImagePreview('image-input-3', 'image-preview-3');
    setupImagePreview('image-input-4', 'image-preview-4');
}); // 돔레디
</script>

<!--====================================작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->