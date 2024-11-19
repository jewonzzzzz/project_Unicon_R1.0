<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

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


</style>
</head>
<%@ include file="../inc/header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
	<div class="customer-support">
    <h1 class="main-title"> unicon 고객센터</h1>
    <h2 class="sub-title">
    <span class="highlight">유니콘 고객센터</span> <br>무엇을 도와드릴까요?</h2>
     <!-- 네비게이션 탭 -->
    <nav class="tabs">
        <ul>
            <li><a href="/faq">문의사항 게시판</a></li>
            <li><a href="/adopt">내 문의내역</a></li>
            <li><a href="/shop">자주 묻는 질문</a></li>
            <li><a href="/community">문의하기</a></li>
        </ul>
    </nav>
    
    
    
    <div class="search-box">
        <input type="text" placeholder="검색어를 입력하세요..." />
        <button>검색</button>
    </div>
</div>




	
<div class="sec-banner bg0 p-t-80 p-b-50">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
					<!-- Block1 -->
					<div class="block1 wrap-pic-w">
						<img src="${pageContext.request.contextPath}/resources/assets/images/yang.jpg" alt="IMG-BANNER">

						<a href="product.html" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
							<div class="block1-txt-child1 flex-col-l">
								<span class="block1-name ltext-102 trans-04 p-b-8">
									입양
								</span>

								<span class="block1-info stext-102 trans-04">
									유기견 입양 관련 문의
								</span>
							</div>

							<div class="block1-txt-child2 p-b-4 trans-05">
								<div class="block1-link stext-101 cl0 trans-09">
									inquiry Now
								</div>
							</div>
						</a>
					</div>
				</div>

				<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
					<!-- Block1 -->
					<div class="block1 wrap-pic-w">
						<img src="${pageContext.request.contextPath}/resources/assets/images/yong.jpg" alt="IMG-BANNER">

						<a href="product.html" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
							<div class="block1-txt-child1 flex-col-l">
								<span class="block1-name ltext-102 trans-04 p-b-8">
									쇼핑몰
								</span>

								<span class="block1-info stext-102 trans-04">
									애견 용품 쇼핑 관련 문의
								</span>
							</div>

							<div class="block1-txt-child2 p-b-4 trans-05">
								<div class="block1-link stext-101 cl0 trans-09">
									inquiry Now
								</div>
							</div>
						</a>
					</div>
				</div>

				<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
					<!-- Block1 -->
					<div class="block1 wrap-pic-w">
						<img src="${pageContext.request.contextPath}/resources/assets/images/co.jpg" alt="IMG-BANNER">

						<a href="product.html" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
							<div class="block1-txt-child1 flex-col-l">
								<span class="block1-name ltext-102 trans-04 p-b-8">
									커뮤니티
								</span>

								<span class="block1-info stext-102 trans-04">
									 커뮤니티 관련 문의
								</span>
							</div>

							<div class="block1-txt-child2 p-b-4 trans-05">
								<div class="block1-link stext-101 cl0 trans-09">
									inquiry Now
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	
	

<!--====================================작성부=====================================-->

<%@ include file="../inc/footer.jsp" %> <!-- footer -->
