<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ include file="../inc/topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath }/resources/assets_sub/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath }/resources/assets_sub/css/style.css" rel="stylesheet">
</head>
<%@ include file="../inc/header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
<div class="container-xxl py-5">
    <div class="container">
        <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
            <h1 class="mb-3">공지사항</h1>
            <p>유니콘의 새로운 소식과 정보를 전해드립니다</p>
        </div>

        <!-- 검색 영역 -->
        <form class="row g-4 mb-5" action="/notice" method="get">
            <div class="col-md-3">
                <select class="form-select" name="category">
                    <option value="">전체 카테고리</option>
                    <option value="안내사항" <c:if test="${category == '안내사항'}">selected</c:if>>안내사항</option>
                    <option value="이벤트" <c:if test="${category == '이벤트'}">selected</c:if>>이벤트</option>
                    <option value="센터소식" <c:if test="${category == '센터소식'}">selected</c:if>>센터소식</option>
                </select>
            </div>
            <div class="col-md-7">
                <input type="text" class="form-control" name="keyword" placeholder="검색어를 입력하세요" value="${keyword}">
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-primary w-100">검색</button>
            </div>
        </form>

        <!-- 공지사항 목록 -->
        <div class="row g-4">
            <c:forEach items="${notices}" var="notice">
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="service-item rounded h-100 p-5">
                        <div class="d-flex align-items-center ms-n5 mb-4">
                            <div class="service-icon flex-shrink-0 bg-primary rounded-end me-4">
                                <img class="img-fluid" src="${notice.noThumb}" alt="">
                            </div>
                            <h4 class="mb-0">${notice.noTitle}</h4>
                        </div>
                        <p class="mb-4">${notice.noContent}</p>
                        <div class="d-flex justify-content-between">
                            <span><i class="far fa-calendar-alt me-2"></i>
                                <fmt:formatDate value="${notice.noRegDate}" pattern="yyyy-MM-dd"/>
                            </span>
                            <a class="btn btn-light px-3" href="/notice/${notice.noId}">자세히 보기</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
            
            <c:if test="${empty notices}">
                <div class="col-12 text-center">
                    <p>등록된 공지사항이 없습니다.</p>
                </div>
            </c:if>
        </div>

        <!-- 페이지네이션 -->
        <div class="row mt-5">
            <div class="col-12">
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <c:if test="${page > 1}">
                            <li class="page-item">
                                <a class="page-link" href="/notice?page=1&category=${category}&keyword=${keyword}" aria-label="First">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        
                        <c:forEach begin="${Math.max(1, page - 2)}" end="${Math.min(totalPages, page + 2)}" var="pageNum">
                            <li class="page-item <c:if test='${pageNum == page}'>active</c:if>'">
                                <a class="page-link" href="/notice?page=${pageNum}&category=${category}&keyword=${keyword}">
                                    ${pageNum}
                                </a>
                            </li>
                        </c:forEach>
                        
                        <c:if test="${page < totalPages}">
                            <li class="page-item">
                                <a class="page-link" href="/notice?page=${totalPages}&category=${category}&keyword=${keyword}" aria-label="Last">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>

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
