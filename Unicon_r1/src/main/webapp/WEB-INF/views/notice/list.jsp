<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ include file="../inc/topHeader.jsp" %>

<!-- CSS 파일 -->
<link href="${pageContext.request.contextPath }/resources/assets_sub/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets_sub/css/style.css" rel="stylesheet">

<!-- 추가 스타일 -->
<style>
.notice-card {
    cursor: pointer;
    transition: transform 0.2s;
    height: 100%;  /* 카드 높이 100% 설정 */
}
.notice-card:hover {
    transform: translateY(-5px);
}
.notice-image-wrapper {
    position: relative;
    padding-bottom: 75%;  /* 4:3 비율 설정 */
    overflow: hidden;
}
.notice-image {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
}
.notice-title {
    font-size: 1.1rem;
    margin: 0;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
.badge-wrapper {
    display: flex;
    align-items: center;
    gap: 0.5rem;  /* 뱃지 사이 간격 */
}
.notice-header {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    margin-bottom: 0.5rem;
}
</style>

<%@ include file="../inc/header.jsp" %>

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
		            <div class="card notice-card" onclick="location.href='/notice/${notice.noId}'">
		                <!-- 썸네일 이미지 -->
		                <div class="notice-image-wrapper">
		                    <img src="${notice.noThumb != null ? notice.noThumb : '/resources/assets_sub/img/default-thumb.jpg'}" 
		                         class="notice-image" 
		                         alt="공지사항 썸네일">
		                </div>
		                <!-- 카테고리와 제목 -->
		                <div class="card-body">
		                    <div class="notice-header">
		                        <!-- 중요 표시가 제일 먼저 -->
		                        <c:if test="${notice.important}">
		                            <span class="badge bg-danger">중요</span>
		                        </c:if>
		                        <!-- 카테고리 -->
		                        <span class="badge bg-primary">${notice.noCategory}</span>
		                        <!-- 제목 -->
		                        <h5 class="notice-title">
		                            ${notice.noTitle}
		                        </h5>
		                    </div>
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
                                <a class="page-link" href="/notice?page=1&category=${category}&keyword=${keyword}">
                                    <i class="fas fa-angle-double-left"></i>
                                </a>
                            </li>
                        </c:if>
                        
                        <c:forEach begin="${Math.max(1, page - 2)}" end="${Math.min(totalPages, page + 2)}" var="pageNum">
                            <li class="page-item <c:if test='${pageNum == page}'>active</c:if>">
                                <a class="page-link" href="/notice?page=${pageNum}&category=${category}&keyword=${keyword}">
                                    ${pageNum}
                                </a>
                            </li>
                        </c:forEach>
                        
                        <c:if test="${page < totalPages}">
                            <li class="page-item">
                                <a class="page-link" href="/notice?page=${totalPages}&category=${category}&keyword=${keyword}">
                                    <i class="fas fa-angle-double-right"></i>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- 기존 JavaScript 라이브러리들 -->

<%@ include file="../inc/footer.jsp" %>