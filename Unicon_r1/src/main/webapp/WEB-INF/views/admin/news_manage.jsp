<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->

<style>
.product-details:hover .image {
    opacity: 0.7; /* 투명도 설정 */
    transition: opacity 0.3s ease; /* 부드러운 애니메이션 효과 */
}

</style>

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
                                                <button class="btn btn-link" data-bs-toggle="collapse" 
                                                data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
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
                                            <!-- 버튼 -->
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
						<div class="line-title" style="margin-bottom: 15px;">
							<div style="display: flex; justify-content:space-between;">
						        <h5 class="mb-0" style="display: inline-block;">소식 등록내역</h5>
						        <button type="button" class="btn btn-secondary" onclick="location.href='/admin/news_create';"
						        ><span class="small">등록하기</span></button>
							</div>
					    </div>
					    
                        <div class="row">
                            <div class="col-12">
                            <div class="row g-0 align-items-center bg-light rounded p-3">

                                    <div class="col-12 col-md-auto">
                                        <div class="row justify-content-center">

                                            <div class="col-auto my-2 my-md-0">
                                            	<select id="applyfor" class="form-control form-select" name="news_resion">
                                                    <option value="">정렬</option>
                                                    <option value="Office Executive">등록순</option>
                                                    <option value="Mutual Fund Executive">행사일순</option>
                                                    <option value="Financial Investment">지역별</option>
                                                 </select>
                                            </div>
                                            <div class="col-auto my-2 my-md-0">
                                            	<select id="applyfor" class="form-control form-select" name="news_resion">
                                                    <option value="">정렬</option>
                                                    <option value="Office Executive">등록순</option>
                                                    <option value="Mutual Fund Executive">행사일순</option>
                                                    <option value="Financial Investment">지역별</option>
                                                 </select>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row product-grid">
							<c:forEach var="list" items="${newsAllInfo }">
	                            <div class="col-xl-3 col-sm-6">
	                                <div class="product-details">
	                                    <div class="product-img">
	                                        <img src="${list.news_src }" alt="..." class="image rounded-3" style="height: 300px;">
	                                        <div class="product-cart">
	                                            <a href="/admin/news_view/${list.news_id }" style="width: 50px; height: 50px;">
	                                            <i class="fa-regular fa-pen-to-square"></i></a>
	                                            <a class="deleteNews" data-id=${list.news_id } style="width: 50px; height: 50px;">
	                                            <i class="fa-solid fa-trash-can"></i></a>
	                                        </div>
	                                    </div>
	                                    <div class="product-info" style="padding: 0;">
	                                        <a href="/admin/news_view/${list.news_id }">${list.news_subject }</a>
	                                    </div>
	                                </div>
	                            </div>
							</c:forEach>
							<div class="row mt-1-9 mt-lg-6">
	                     <div class="col-12">
	                         <div class="pagination text-small text-uppercase text-extra-dark-gray">
	                             <ul>
	                                 <li><a href="#!"><i class="fas fa-long-arrow-alt-left me-1 d-none d-sm-inline-block"></i> Prev</a></li>
	                                 <li class="active"><a href="#!">1</a></li>
	                                 <li><a href="#!">2</a></li>
	                                 <li><a href="#!">3</a></li>
	                                 <li><a href="#!">Next <i class="fas fa-long-arrow-alt-right ms-1 d-none d-sm-inline-block"></i></a></li>
	                             </ul>
	                         </div>
	                     </div>
                 		</div>
                   		</div>
                    <!-- end right panel section -->

                </div>
            </div>
            </div>
            
        </section>
        

<!--====================================작성부=====================================-->

<script>
$(document).ready(function () {
	
	$('.deleteNews').on('click', function(){
		Swal.fire({
			  title: '소식을 삭제하시겠습니까?',
			  text: "삭제 후에는 소식정보를 복구할 수 없습니다.",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '수정',
			  cancelButtonText: '취소',
			  customClass: {
			        popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
			  }
			}).then((result) => {
				if (result.isConfirmed) {
					$.ajax({
						url: '/admin/news_delete/'+$(this).data('id'),
						type: 'DELETE',
						success: function(){
							Swal.fire({
				  	  			  title: '삭제가 완료되었습니다!',
				  	  			  text: "신규등록을 통해 재등록이 가능합니다.",
				  	  			  icon: 'success',
				  	  			  customClass: {
				  			        popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
				 			 	  }
				  				}).then(function() {
		                            window.location.href = "/admin/news_manage";  // 페이지 이동
		                        });
						},
						error: function(){
							Swal.fire({
			  	  			  title: '에러!',
			  	  			  icon: 'error',
			  	  			  customClass: {
			  			        popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
			 			 	  }
			  				});
						}
					});
				}
			});
		console.log($(this).data('id'));
		
		
		
		
	});
	
	
});//readay

</script>



<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
