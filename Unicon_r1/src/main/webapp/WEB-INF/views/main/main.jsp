<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath }/resources/assets_sub/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath }/resources/assets_sub/css/style.css" rel="stylesheet">
</head>
<%@ include file="../inc/header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->

	<!-- Slider -->
	<section class="section-slide">
		<div class="wrap-slick1">
			<div class="slick1">	
				<div class="item-slick1" style="background-image: url(${pageContext.request.contextPath }/resources/assets/images/slide-01_1.jpg);">
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false" data-appear="rotateInDownLeft" data-delay="0">
								<span class="ltext-101 cl2 respon2">
									Men Collection 2018
								</span>
							</div>
								
							<div class="layer-slick1 animated visible-false" data-appear="rotateInUpRight" data-delay="800">
								<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">
									New arrivals
								</h2>
							</div>
						</div>
					</div>
				</div>
				<div class="item-slick1" style="background-image: url(${pageContext.request.contextPath }/resources/assets/images/slide-01_1.jpg);">
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false" data-appear="fadeInDown" data-delay="0">
								<span class="ltext-101 cl2 respon2">
									Men Collection 2018
								</span>
							</div>
								
							<div class="layer-slick1 animated visible-false" data-appear="fadeInUp" data-delay="800">
								<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">
									New arrivals
								</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Product -->
	<section class="bg0 p-t-40">
		<div class="container">
			<div class="p-t-20 p-b-20">
				<h3 class="ltext-103 cl5">
					새로운 유니콘 소개
				</h3>
				<p class="mtext-102">신규로 등록된 유니콘들을 소개드려요</p>
			</div>

			<div class="row isotope-grid">
				<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0">
							<a href="#"><img src="${pageContext.request.contextPath }/resources/assets/images/product-01.jpg" alt="IMG-PRODUCT"></a>
						</div>

						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
									Esprit Ruffle Shirt
								</a>

								<span class="stext-105 cl3">
									$16.64
								</span>	
							</div>

							<div class="block2-txt-child2 flex-r p-t-3">
								<a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
									<img class="icon-heart1 dis-block trans-04" src="${pageContext.request.contextPath }/resources/assets/images/icons/icon-heart-01.png" alt="ICON">
									<img class="icon-heart2 dis-block trans-04 ab-t-l" src="${pageContext.request.contextPath }/resources/assets/images/icons/icon-heart-02.png" alt="ICON">
								</a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0">
							<img src="${pageContext.request.contextPath }/resources/assets/images/product-02.jpg" alt="IMG-PRODUCT">

							<a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
								Quick View
							</a>
						</div>

						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
									Herschel supply
								</a>

								<span class="stext-105 cl3">
									$35.31
								</span>
							</div>

							<div class="block2-txt-child2 flex-r p-t-3">
								<a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
									<img class="icon-heart1 dis-block trans-04" src="${pageContext.request.contextPath }/resources/assets/images/icons/icon-heart-01.png" alt="ICON">
									<img class="icon-heart2 dis-block trans-04 ab-t-l" src="${pageContext.request.contextPath }/resources/assets/images/icons/icon-heart-02.png" alt="ICON">
								</a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item men">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0">
							<img src="${pageContext.request.contextPath }/resources/assets/images/product-03.jpg" alt="IMG-PRODUCT">

							<a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
								Quick View
							</a>
						</div>

						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
									Only Check Trouser
								</a>

								<span class="stext-105 cl3">
									$25.50
								</span>
							</div>

							<div class="block2-txt-child2 flex-r p-t-3">
								<a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
									<img class="icon-heart1 dis-block trans-04" src="${pageContext.request.contextPath }/resources/assets/images/icons/icon-heart-01.png" alt="ICON">
									<img class="icon-heart2 dis-block trans-04 ab-t-l" src="${pageContext.request.contextPath }/resources/assets/images/icons/icon-heart-02.png" alt="ICON">
								</a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0">
							<img src="${pageContext.request.contextPath }/resources/assets/images/product-04.jpg" alt="IMG-PRODUCT">

							<a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
								Quick View
							</a>
						</div>

						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
									Classic Trench Coat
								</a>

								<span class="stext-105 cl3">
									$75.00
								</span>
							</div>

							<div class="block2-txt-child2 flex-r p-t-3">
								<a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
									<img class="icon-heart1 dis-block trans-04" src="${pageContext.request.contextPath }/resources/assets/images/icons/icon-heart-01.png" alt="ICON">
									<img class="icon-heart2 dis-block trans-04 ab-t-l" src="${pageContext.request.contextPath }/resources/assets/images/icons/icon-heart-02.png" alt="ICON">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<div class="container-xxl py-5">
        <div class="container">
      		<div class="p-t-20 p-b-20">
				<h3 class="ltext-103 cl5">
					소식 전해드려요
				</h3>
				<p class="mtext-102">반려동물과 관련된 전국 지자체 소식을 전해드려요</p>
			</div>
            <div class="row g-5 align-items-end">
                <div class="col-lg-3 col-md-5">
                    <img class="img-fluid rounded" src="${pageContext.request.contextPath }/resources/assets/images/poster.png">
                </div>
                <div class="col-lg-6 col-md-7">
                    <h1 class="display-4 mb-0">11.19</h1>
                    <p class="ltext-101 mb-4"> 10:00 ~ 15:00</p>
                    <h1 class="display-5 mb-4">We Make Your Home</h1>
                    <p class="mb-4">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit. Aliqu diam amet diam et eos. Clita erat ipsum et lorem et sit, sed stet lorem sit clita duo justo magna dolore erat amet</p>
                    <a class="btn btn-secondary py-3 px-4" href="">상세보기</a>
                </div>
                <div class="col-lg-3 col-md-12">
                    <div class="row g-5">
                        <div class="col-12 col-sm-6 col-lg-12">
                            <div class="border-start ps-4">
                                <i class="fa fa-award fa-3x mb-3"></i>
                                <h4 class="mb-3">Award Winning</h4>
                                <span>Clita erat ipsum et lorem et sit, sed stet lorem sit clita duo justo magna</span>
                            </div>
                        </div>
                        <div class="col-12 col-sm-6 col-lg-12">
                            <div class="border-start ps-4">
                                <i class="fa fa-users fa-3x mb-3"></i>
                                <h4 class="mb-3">Dedicated Team</h4>
                                <span>Clita erat ipsum et lorem et sit, sed stet lorem sit clita duo justo magna</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
		
	
    
    <div class="container-xxl py-5">
        <div class="container">
            <div class="p-t-20 p-b-20">
				<h3 class="ltext-103 cl5">
					유니콘의 일상 공유
				</h3>
				<p class="mtext-102">오늘 있었던 유니콘들의 하루를 공유해봐요</p>
			</div>
            <div class="row g-4">
                <div class="col-lg-3 col-md-6">
                    <div class="team-item rounded">
                        <img class="img-fluid" src="${pageContext.request.contextPath }/resources/assets_sub/img/team-1.jpg" alt="">
                        <div class="team-text">
                            <h5 class="mb-15">나의 일상일상일상일상</h5>
                            <div class="d-flex m-b-10">
                                <div class="btn-lg-square me-2" style="width: 80px;">
                                	<img class="img-fluid rounded-circle" src="${pageContext.request.contextPath }/resources/assets_sub/img/service-1.jpg" >
                             	</div>
								<div class="block2-txt-child1 flex-col-l ">
									<div class="stext-104 cl4 hov-cl1 trans-04 js-name-b2">
										징졩죵
									</div>
									<span class="stext-105 cl3">
										특별회원
									</span>	
								</div>
	                            <div class="team-social">
	                                <a class="btn" href="">상세보기</a>
	                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <div class="container-xxl py-5">
        <div class="container">
            <div class="p-t-20 p-b-20">
				<h3 class="ltext-103 cl5">
					우리 가족됐어요
				</h3>
				<p class="mtext-102">새롭게 가족이된 유니콘들의 입양후기를 들어보세요</p>
			</div>
		</div>
    </div>
    
    <div class="container-fluid facts my-5 py-5" style="margin-top: 14rem !important; background-color: #eee;">
		<div class="container-fluid top-feature" style="margin-top: -280px !important;">
	        <div class="container py-5 pt-lg-0" style="width: 65%;">
	            <div class="row gx-0 rounded-circle">
	                <div class="col shadow">
	                    <div class="bg-white align-items-end px-5" style="min-height: 500px;">
	                        <div class="p-t-60 p-b-20">
	                                <h4>강아지 한마리 입양했쥬</h4>
	                        </div>
	                        <div class="p-t-10 p-b-20">
	                                <span>강아지 한마리 입양했쥬강아지 한마리 입양했쥬강아지 한마리 입양했쥬
	                                강아지 한마리 입양했쥬강아지 한마리 입양했쥬강아지 한마리 입양했쥬
	                                강아지 한마리 입양했쥬강아지 한마리 입양했쥬강아지 한마리 입양했쥬
	                                강아지 한마리 입양했쥬강아지 한마리 입양했쥬강아지 한마리 입양했쥬
	                                강아지 한마리 입양했쥬강아지 한마리 입양했쥬강아지 한마리 입양했쥬
	                                강아지 한마리 입양했쥬강아지 한마리 입양했쥬강아지 한마리 입양했쥬</span>
	                        </div>
	                        <div class="d-flex p-t-30 p-b-20">
                                <div class="btn-lg-square rounded-circle me-2">
                                	<img class="img-fluid rounded-circle" src="${pageContext.request.contextPath }/resources/assets_sub/img/service-1.jpg" >
                             	</div>
								<div class="block2-txt-child1 flex-col-l ">
									<div class="stext-104 cl4 hov-cl1 trans-04 js-name-b2">
										우주스타 징졩죵
									</div>
									<span class="stext-105 cl3">
										특별회원
									</span>	
								</div>
	                            <div class="team-social">
	                                <a class="btn btn-secondary" href="">상세보기</a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="col shadow">
	                	<div class="bg-white" style="height: 500px; overflow: hidden;">
                        	<img width="100%" src="${pageContext.request.contextPath }/resources/assets_sub/img/team-2.jpg" alt="">
                   	 	</div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	
	
	<section class="bg0 p-t-40">
		<div class="container">
			<div class="p-t-20 p-b-20">
				<h3 class="ltext-103 cl5">
					집사를 찾고있슴
				</h3>
			</div>
			<div class="row isotope-grid">
				<div class="col-lg-3 p-b-35 isotope-item">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0">
							<a href="#"><img src="${pageContext.request.contextPath }/resources/assets_sub/img/service-5.jpg" alt="IMG-PRODUCT"></a>
						</div>
						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<div class="m-b-5">
									<button class="btn-secondary rounded p-1">강아지</button>
									<span class="mtext-101">푸들</span>	
								</div>
								<span class="stext-105 cl3 m-b-2"><i class="fa fa-award"></i>
									서울 강남구 강남초옆
								</span>	
								<span class="stext-105 cl3"><i class="fa fa-award"></i>
									2024.11.19
								</span>	
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 p-b-35 isotope-item">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0">
							<a href="#"><img src="${pageContext.request.contextPath }/resources/assets_sub/img/service-5.jpg" alt="IMG-PRODUCT"></a>
						</div>
						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<div class="m-b-5">
									<button class="btn-secondary rounded p-1">강아지</button>
									<span class="mtext-101">푸들</span>	
								</div>
								<span class="stext-105 cl3 m-b-2"><i class="fa fa-award"></i>
									서울 강남구 강남초옆
								</span>	
								<span class="stext-105 cl3"><i class="fa fa-award"></i>
									2024.11.19
								</span>	
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 p-b-35 isotope-item">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0">
							<a href="#"><img src="${pageContext.request.contextPath }/resources/assets_sub/img/service-5.jpg" alt="IMG-PRODUCT"></a>
						</div>
						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<div class="m-b-5">
									<button class="btn-secondary rounded p-1">강아지</button>
									<span class="mtext-101">푸들</span>	
								</div>
								<span class="stext-105 cl3 m-b-2"><i class="fa fa-award"></i>
									서울 강남구 강남초옆
								</span>	
								<span class="stext-105 cl3"><i class="fa fa-award"></i>
									2024.11.19
								</span>	
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="col-lg-3 p-b-35 isotope-item">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0">
							<a href="#"><img src="${pageContext.request.contextPath }/resources/assets_sub/img/service-5.jpg" alt="IMG-PRODUCT"></a>
						</div>
						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<div class="m-b-5">
									<button class="btn-secondary rounded p-1">강아지</button>
									<span class="mtext-101">푸들</span>	
								</div>
								<span class="stext-105 cl3 m-b-2"><i class="fa fa-award"></i>
									서울 강남구 강남초옆
								</span>	
								<span class="stext-105 cl3"><i class="fa fa-award"></i>
									2024.11.19
								</span>	
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	
	

<!--====================================작성부=====================================-->
	<!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/wow/wow.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/easing/easing.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/waypoints/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/counterup/counterup.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/parallax/parallax.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/isotope/isotope.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath }/resources/assets_sub/js/main.js"></script>

<%@ include file="../inc/footer.jsp" %> <!-- footer -->
