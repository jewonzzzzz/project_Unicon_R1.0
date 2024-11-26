<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

  <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath }/resources/assets_sub/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath }/resources/assets_sub/css/style.css" rel="stylesheet">

<!-- 추가 템플릿 css/js 작성란 -->
<style>

/* 메인 타이틀 스타일 */
.main-title {
    font-size: 2rem;
    font-weight: bold;
    margin: 60px 0 20px 200px;
    color: black;       
}

/* 서브 타이틀 스타일 */
.sub-title {
    font-size: 1.5rem;
    font-weight: 300;
    margin: 0 0 30px 0;
    text-align: center;          /* 텍스트를 가운데 정렬 */
      color: black;                 /* 글자 색상 */
      font: bold;
}

/* 검색창 섹션 스타일 */
.search-box {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 10px;
    margin-top: 20px;
}

/* 검색 입력 필드 */
.search-box input {
    padding: 10px 15px;
    border-radius: 5px;
    border: 1px solid #ddd;
    font-size: 1rem;
    width: 300px;
    outline: none;
}

/* 검색 버튼 */
.search-box button {
    padding: 10px 20px;
    border-radius: 5px;
    border: none;
    background-color: #ff7f50;
    color: white;
    font-size: 1rem;
    cursor: pointer;
    transition: background 0.3s;
}

.highlight {
    color: #ff4500;              /* 강조 색상 (주황색) */
    font-weight: bolder;          /* 더욱 굵게 설정 */
    font-size: 1.8rem;            /* 약간 큰 글자 크기 */
}

.search-box button:hover {
    background-color: #ff6347;

}
/* 네비게이션 탭 스타일 */
.tabs ul {
	
    list-style-type: none;
    padding: 0;
    margin: 20px 0;
    display: flex;
    justify-content: center; /* 가운데 정렬 */
}

.tabs ul li {
	
    margin-right: 20px;
}

.tabs ul li a {
	   
    text-decoration: none;
    color: #333;
    font-size: 1.1rem;
    font-weight: bold;
    padding: 10px 20px;
    border: 2px solid transparent;
    border-radius: 5px;
    transition: background-color 0.3s ease, color 0.3s ease;
}

.tabs ul li a:hover {
	
    background-color: #007bff;
    color: white;
    border-color: #007bff;
}


/* 부드러운 호버 애니메이션 */
.transition-all {
    transition: all 0.3s ease-in-out;
}

/* 기본 상태에서 투명 */
.hover-opacity-100 {
    opacity: 1 !important;
}

.card-img-overlay {
    opacity: 0; /* 기본 숨김 */
}

.card:hover .card-img-overlay {
    opacity: 1; /* 호버 시 표시 */
}


</style>
</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
	<div class="customer-support">
    <h1 class="main-title"> unicon 고객센터</h1>
    <h2 class="sub-title">
    <span class="highlight">유니콘 고객센터</span> <br>무엇을 도와드릴까요?</h2>
     <!-- 네비게이션 탭 -->
    <nav class="tabs">
        <ul>
            <li><a href="board">문의사항 게시판</a></li>
            <li><a href="history">내 문의내역</a></li>
            <li><a href="question">자주 묻는 질문</a></li>
            <li><a href="write">문의하기</a></li>
        </ul>
    </nav>
    
    
    
    <div class="search-box">
        <input type="text" placeholder="검색어를 입력하세요..." />
        <button>검색</button>
    </div>
</div>




	

<section class="project-single-two">

            <div class="container">
                <div class="section-heading">
                    <h2>카테고리 별 문의사항</h2>
                </div>
            </div>

            <div class="container-fluid p-0">

                <div class="owl-carousel owl-theme owl-loaded owl-drag">

                    

                    

                    

                    
                <div class="owl-stage-outer"><div class="owl-stage" style="transform: translate3d(0px, 0px, 0px); transition: all; width: 1933px;"><div class="owl-item active" style="width: 453.25px; margin-right: 30px;"><div class="project-grid-style3">
                        <div class="inner-box">
                            <div class="project-image">
                                <img src="${pageContext.request.contextPath}/resources/assets/images/yang.jpg" alt="...">
                                <div class="overlay">
                                    <div class="overlay-inner">
                                        <div class="description">
                                            <div class="text"> 입양 관련 문의 </div>
                                            <a href="adoption" class="read-more"><span class="fa fa-angle-right"></span> Inquiry now </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="project-desc">
                                <div class="category">Saving investments</div>
                                <h3><a href="adoption">Hands working with finances saving economy</a></h3>
                            </div>
                        </div>
                    </div></div><div class="owl-item active" style="width: 453.25px; margin-right: 30px;"><div class="project-grid-style3">
                        <div class="inner-box">
                            <div class="project-image">
                                <img src="${pageContext.request.contextPath}/resources/assets/images/yong.jpg" alt="...">
                                <div class="overlay">
                                    <div class="overlay-inner">
                                        <div class="description">
                                            <div class="text">Lorem ipsum dolor sit amet adipisicing elit sed eiusmod tempor incididunt ut labore et dolore magna aliqua. Utna enim ad minim veniam quis nostrud exercitation ulamco laboris nisi aliquip exea comm ayodo consequat.
                                                Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim.</div>
                                            <a href="shop" class="read-more"><span class="fa fa-angle-right"></span> Read More</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="project-desc">
                                <div class="category">Online consulting</div>
                                <h3><a href="shop">Communication technology with consulting</a></h3>
                            </div>
                        </div>
                    </div></div><div class="owl-item active" style="width: 453.25px; margin-right: 30px;"><div class="project-grid-style3">
                        <div class="inner-box">
                            <div class="project-image">
                                <img src="${pageContext.request.contextPath}/resources/assets/images/co.jpg" alt="...">
                                <div class="overlay">
                                    <div class="overlay-inner">
                                        <div class="description">
                                            <div class="text">Lorem ipsum dolor sit amet adipisicing elit sed eiusmod tempor incididunt ut labore et dolore magna aliqua. Utna enim ad minim veniam quis nostrud exercitation ulamco laboris nisi aliquip exea comm ayodo consequat.
                                                Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim.</div>
                                            <a href="community" class="read-more"><span class="fa fa-angle-right"></span> Read More</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="project-desc">
                                <div class="category">Investment bank</div>
                                <h3><a href="community">Instead of cash investment banking money</a></h3>

                            </div>
                        </div>
                    </div></div><div class="owl-item active" style="width: 453.25px; margin-right: 30px;"><div class="project-grid-style3">
                        <div class="inner-box">
                            <div class="project-image">
                                <img src="${pageContext.request.contextPath}/resources/assets/images/git.jpg" alt="...">
                                <div class="overlay">
                                    <div class="overlay-inner">
                                        <div class="description">
                                            <div class="text">Lorem ipsum dolor sit amet adipisicing elit sed eiusmod tempor incididunt ut labore et dolore magna aliqua. Utna enim ad minim veniam quis nostrud exercitation ulamco laboris nisi aliquip exea comm ayodo consequat.
                                                Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim.</div>
                                            <a href="project-detail.html" class="read-more"><span class="fa fa-angle-right"></span> Read More</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="project-desc">
                                <div class="category">Finance analysis</div>
                                <h3><a href="project-detail.html">Making presentation for finance research analysis</a></h3>
                            </div>
                        </div>
                    </div></div></div></div><div class="owl-nav disabled"><button type="button" role="presentation" class="owl-prev"><span aria-label="Previous">‹</span></button><button type="button" role="presentation" class="owl-next"><span aria-label="Next">›</span></button></div><div class="owl-dots disabled"></div><div class="owl-thumbs"></div></div>
            </div>
        </section>
<script>






</script>
	
	

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




<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
