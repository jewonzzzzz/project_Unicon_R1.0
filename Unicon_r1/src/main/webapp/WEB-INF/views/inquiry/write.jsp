<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp"%>
<!-- topHeader / jquery 추가 -->
 <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath }/resources/assets_sub/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath }/resources/assets_sub/css/style.css" rel="stylesheet">

<!-- 추가 템플릿 css/js 작성란 -->
<style>


</style>
</head>
<%@ include file="../inc/new_header.jsp"%>
<!-- header -->

<!--====================================작성부=====================================-->

<section>
            <div class="container">
                <div class="section-heading">
                    <h2>문의하기</h2>
                </div>
                <div class="row">
                    <div class="col-lg-6 mb-1-9 mb-lg-0">

                        <!-- start form here -->

       		<form id="quform" class="quform">
    <div class="quform-elements">
        <div class="row">
            <!-- 카테고리 선택 -->
            <div class="col-md-6">
                <div class="quform-element form-group">
                    <div class="quform-input">
                        <select id="istatus" class="form-control" name="istatus">
                            <option value="default" disabled selected>카테고리를 선택해주세요.</option>
                            <option value="입양 문의">입양 문의</option>
                            <option value="쇼핑몰 문의">쇼핑몰 문의</option>
                            <option value="커뮤니티 문의">커뮤니티 문의</option>
                            <option value="기타 문의">기타 문의</option>
                        </select>
                    </div>
                </div>
            </div>
            
            <!-- 이메일 -->
            <div class="col-md-6">
                <div class="quform-element form-group">
                    <div class="quform-input">
                        <input id="email" class="form-control" type="text" name="email" placeholder="이메일을 기입해주세요.">
                    </div>
                </div>
            </div>

            <!-- 제목 -->
            <div class="col-md-6">
                <div class="quform-element form-group">
                    <div class="quform-input">
                        <input id="title" class="form-control" type="text" name="title" placeholder="제목을 입력해주세요.">
                    </div>
                </div>
            </div>

            <!-- 전화번호 -->
            <div class="col-md-6">
                <div class="quform-element form-group">
                    <div class="quform-input">
                        <input id="phone" class="form-control" type="text" name="phone" placeholder="휴대폰 번호를 입력해주세요.">
                    </div>
                </div>
            </div>

            <!-- 문의 내용 -->
            <div class="col-md-12">
                <div class="quform-element form-group">
                    <div class="quform-input">
                        <textarea id="content" class="form-control" name="content" rows="3" placeholder="문의 내용을 입력해주세요."></textarea>
                    </div>
                </div>
            </div>

            <!-- 작성자 -->
            <div class="col-md-6">
                <div class="quform-element form-group">
                    <div class="quform-input">
                        <input id="member_name" class="form-control" type="text" name="member_name" placeholder="작성자 이름을 입력해주세요.">
                    </div>
                </div>
            </div>

            <!-- reCAPTCHA -->
            <div class="quform-element">
                <div class="form-group">
                    <div class="quform-captcha">
                        <div class="g-recaptcha" data-sitekey="6LeEYooqAAAAAH2ogyEfXXzUkqvS0VH0VTwQkGjh"></div>
                    </div>
                </div>
            </div>

            <!-- 제출 버튼 -->
            <div class="col-md-12">
                <div class="quform-submit-inner">
                    <button class="butn" type="submit"><span>문의하기</span></button>
                </div>
            </div>
        </div>
    </div>
</form>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>

                        <!-- end form here -->

                    </div>
                    <div class="col-lg-6">
                        <div id="accordion" class="accordion-style3">
                            <div class="card">
                                <div class="card-header" id="headingOne">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                  How can i purchase this item ?
                                </button>
                                    </h5>
                                </div>
                                <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-bs-parent="#accordion" style="">
                                    <div class="card-body bg-white">
                                        Tempora incidunt ut labore et dolore exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,
                                        sunt in culpa qui officia deserunt mollit anim id est laborum.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="headingTwo">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                                  why unique and creative design ?
                                </button>
                                    </h5>
                                </div>
                                <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-bs-parent="#accordion" style="">
                                    <div class="card-body bg-white">
                                        Neque porro quisquam est quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,
                                        sunt in culpa qui officia deserunt mollit anim id est laborum.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="headingThree">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                  are you ready to buy this theme ?
                                </button>
                                    </h5>
                                </div>
                                <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-bs-parent="#accordion" style="">
                                    <div class="card-body bg-white no-padding-bottom">
                                        Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,
                                        sunt in culpa qui officia deserunt mollit anim id est laborum.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>










<script>
document.getElementById("quform").addEventListener("submit", function (event) {
    event.preventDefault(); // 폼 제출 방지

    // 폼 데이터 가져오기
    const data = {
        member_name: document.getElementById("member_name").value.trim(),
        email: document.getElementById("email").value.trim(),
        title: document.getElementById("title").value.trim(),
        phone: document.getElementById("phone").value.trim(),
        content: document.getElementById("content").value.trim(),
        istatus: document.getElementById("istatus").value.trim(),
        recaptcha: grecaptcha.getResponse(), // reCAPTCHA 응답 토큰
    };

    // 유효성 검사
    if (!data.member_name) return alert("작성자 이름을 입력해주세요.");
    if (!/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(data.email))
        return alert("유효한 이메일을 입력해주세요.");
    if (!data.title) return alert("제목을 입력해주세요.");
    if (!/^[0-9]{10,11}$/.test(data.phone))
        return alert("휴대폰 번호는 10-11자리 숫자로 입력해주세요.");
    if (!data.content) return alert("문의 내용을 입력해주세요.");
    if (data.istatus === "default") return alert("카테고리를 선택해주세요.");
    if (!data.recaptcha) return alert("reCAPTCHA 인증을 완료해주세요.");

    // JSON 데이터 전송
    fetch("/api/submit", {
        method: "POST",
        headers: {
            "Content-Type": "application/json; charset=utf-8",
        },
        body: JSON.stringify(data),
    })
        .then((response) => {
            if (!response.ok) throw new Error("서버 오류: " + response.status);
            return response.text();
        })
        .then((result) => {
            alert(result);
            document.getElementById("quform").reset(); // 폼 초기화
            grecaptcha.reset(); // reCAPTCHA 초기화
        })
        .catch((error) => {
            console.error("문의 등록 중 오류:", error);
            alert("문의 등록 중 문제가 발생했습니다.");
        });
});
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





<%@ include file="../inc/new_footer.jsp"%>
<!-- footer -->
