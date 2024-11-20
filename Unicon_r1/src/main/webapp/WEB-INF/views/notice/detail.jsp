<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/topHeader.jsp" %>

<div class="container-xxl py-5">
    <div class="container">
        <!-- 공지사항 상세 내용 -->
        <div class="card">
            <div class="card-header bg-white border-bottom">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <span class="badge bg-primary me-2">${notice.noCategory}</span>
                        <h4 class="mb-0 d-inline-block">${notice.noTitle}</h4>
                    </div>
                    <div class="text-muted">
                        <small>등록일: <fmt:formatDate value="${notice.noRegDate}" pattern="yyyy-MM-dd"/></small>
                        <small class="ms-3">조회수: ${notice.viewCount}</small>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <!-- 썸네일 이미지가 있는 경우 -->
                <c:if test="${not empty notice.noThumb}">
                    <div class="text-center mb-4">
                        <img src="${notice.noThumb}" class="img-fluid" alt="썸네일">
                    </div>
                </c:if>
                
                <!-- 본문 내용 -->
                <div class="notice-content">
                    ${notice.noContent}
                </div>
                
                <!-- 첨부파일 목록 -->
                <c:if test="${not empty notice.files}">
                    <div class="mt-4 border-top pt-3">
                        <h6>첨부파일</h6>
                        <ul class="list-unstyled">
                            <c:forEach items="${notice.files}" var="file">
                                <li>
                                    <i class="fas fa-paperclip me-2"></i>
                                    <a href="/download/${file.fileId}">${file.originalName}</a>
                                    <span class="text-muted ms-2">
                                        (<fmt:formatNumber value="${file.fileSize / 1024}" pattern="#,##0.0"/> KB)
                                    </span>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </c:if>
            </div>
            <div class="card-footer bg-white">
                <div class="d-flex justify-content-between">
                    <a href="/notice" class="btn btn-secondary">목록으로</a>
                    <div>
                        <c:if test="${prevNotice != null}">
                            <a href="/notice/detail/${prevNotice.noId}" class="btn btn-outline-primary me-2">이전글</a>
                        </c:if>
                        <c:if test="${nextNotice != null}">
                            <a href="/notice/detail/${nextNotice.noId}" class="btn btn-outline-primary">다음글</a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../inc/footer.jsp" %>