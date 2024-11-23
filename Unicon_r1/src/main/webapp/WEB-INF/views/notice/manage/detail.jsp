<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    

<!-- CSS 스타일시트 추가 -->
<link href="${pageContext.request.contextPath }/resources/assets_sub/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets_sub/css/style.css" rel="stylesheet">

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
                <!-- 관리자 전용 상태 표시 -->
                <div class="mt-2 text-end">
                    <span class="badge ${notice.temporary == 1 ? 'bg-warning' : 'bg-success'} me-2">
                        ${notice.temporary == 1 ? '임시저장' : '게시중'}
                    </span>
                    <span class="badge bg-info me-2">${notice.visibility}</span>
                    <span class="badge ${notice.noEmail ? 'bg-success' : 'bg-secondary'} me-2">
                        이메일 ${notice.noEmail ? '발송됨' : '미발송'}
                    </span>
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
                                <li class="d-flex align-items-center mb-2">
                                    <div>
                                        <i class="fas fa-paperclip me-2"></i>
                                        <a href="/notice/download/${file.fileId}">${file.originalName}</a>
                                        <span class="text-muted ms-2">
                                            (<fmt:formatNumber value="${file.fileSize / 1024}" pattern="#,##0.0"/> KB)
                                        </span>
                                    </div>
                                    <!-- 관리자 전용 삭제 버튼 -->
                                    <button class="btn btn-sm btn-outline-danger ms-auto" 
                                            onclick="deleteFile(${file.fileId})">삭제</button>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </c:if>
            </div>
            
            <div class="card-footer bg-white">
                <div class="d-flex justify-content-between">
                    <a href="/notice/manage" class="btn btn-secondary">목록으로</a>
                    <div>
                        <c:if test="${prevNotice != null}">
                            <a href="/notice/manage/${prevNotice.noId}" class="btn btn-outline-primary me-2">이전글</a>
                        </c:if>
                        <c:if test="${nextNotice != null}">
                            <a href="/notice/manage/${nextNotice.noId}" class="btn btn-outline-primary me-2">다음글</a>
                        </c:if>
                        <!-- 관리자 전용 버튼 -->
                        <button class="btn btn-warning me-2" 
                                onclick="location.href='/notice/manage/form?noId=${notice.noId}'">수정</button>
                        <button class="btn btn-danger" 
                                onclick="confirmDelete(${notice.noId})">삭제</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 기존 JavaScript 유지 -->
<script>
function confirmDelete(noId) {
    if(confirm('정말 삭제하시겠습니까?')) {
        fetch(`/notice/api/${noId}`, {
            method: 'DELETE'
        }).then(response => {
            if(response.ok) {
                alert('삭제되었습니다');
                location.href = '/notice/manage';
            }
        });
    }
}

function deleteFile(fileId) {
    if(confirm('파일을 삭제하시겠습니까?')) {
        fetch(`/notice/api/file/${fileId}`, {
            method: 'DELETE'
        }).then(response => {
            if(response.ok) {
                location.reload();
            }
        });
    }
}
</script>