<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/topHeader.jsp" %>

<!-- notice/list.jsp (일반 공지사항 페이지) -->
<div class="container-xxl py-5">
    <div class="container">
        <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
            <h1 class="mb-3">공지사항</h1>
            <p>유니콘의 새로운 소식과 정보를 전해드립니다</p>
        </div>

        <!-- 검색 영역 -->
        <div class="row g-4 mb-5">
            <div class="col-md-3">
                <select class="form-select">
                    <option value="">전체 카테고리</option>
                    <option value="notice">공지</option>
                    <option value="event">이벤트</option>
                    <option value="news">소식</option>
                </select>
            </div>
            <div class="col-md-7">
                <input type="text" class="form-control" placeholder="검색어를 입력하세요">
            </div>
            <div class="col-md-2">
                <button class="btn btn-primary w-100">검색</button>
            </div>
        </div>

        <!-- 공지사항 목록 -->
        <div class="row g-4">
            <c:forEach items="${notices}" var="notice">
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="service-item rounded h-100 p-5">
                        <div class="d-flex align-items-center ms-n5 mb-4">
                            <div class="service-icon flex-shrink-0 bg-primary rounded-end me-4">
                                <img class="img-fluid" src="${notice.thumbnailUrl}" alt="">
                            </div>
                            <h4 class="mb-0">${notice.title}</h4>
                        </div>
                        <p class="mb-4">${notice.content}</p>
                        <div class="d-flex justify-content-between">
                            <span><i class="far fa-calendar-alt me-2"></i>${notice.regDate}</span>
                            <a class="btn btn-light px-3" href="notice-detail.html">자세히 보기</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- 페이지네이션 -->
        <div class="row mt-5">
            <div class="col-12">
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>

<%@ include file="../inc/footer.jsp" %>