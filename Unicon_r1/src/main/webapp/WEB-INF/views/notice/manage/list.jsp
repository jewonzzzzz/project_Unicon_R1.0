<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <title>공지사항 관리</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <style>
        .sidebar { width: 250px; position: fixed; left: 0; height: 100vh; background: #f8f9fa; }
        .main-content { margin-left: 250px; padding: 20px; }
        .content-header { border-bottom: 1px solid #dee2e6; padding-bottom: 1rem; margin-bottom: 2rem; }
        .table th { background: #f8f9fa; }
        .search-bar { background: #f8f9fa; padding: 1rem; border-radius: 4px; margin-bottom: 1rem; }
        .action-buttons { gap: 0.5rem; }
        .important-notice { background-color: #fff3f3; }
        .important-badge { color: red; font-weight: bold; }
        .notice-title { color: #333; text-decoration: none; }
        .notice-title:hover { color: #007bff; text-decoration: underline; }
        .spinner-border { width: 1rem; height: 1rem; }
    </style>
</head>
<body>
    <!-- 메인 컨텐츠 -->
    <div class="main-content">
        <div class="content-header d-flex justify-content-between align-items-center">
            <h4 class="mb-0">공지사항 관리</h4>
            <div>
                <button class="btn btn-primary" onclick="location.href='/notice/manage/form'">공지사항 등록</button>
            </div>
        </div>

        <!-- 검색 영역 -->
        <form id="searchForm" class="search-bar">
            <div class="row g-3">
                <div class="col-md-3">
                    <input type="text" name="keyword" class="form-control" 
                           placeholder="제목 또는 내용 검색" value="${param.keyword}">
                </div>
                <div class="col-md-2">
                    <select name="category" class="form-select">
                        <option value="">전체 카테고리</option>
                        <option value="안내사항" ${param.category == '안내사항' ? 'selected' : ''}>안내사항</option>
                        <option value="이벤트" ${param.category == '이벤트' ? 'selected' : ''}>이벤트</option>
                        <option value="센터소식" ${param.category == '센터소식' ? 'selected' : ''}>센터소식</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <div class="input-group">
                        <input type="date" name="startDate" class="form-control" value="${param.startDate}">
                        <span class="input-group-text">~</span>
                        <input type="date" name="endDate" class="form-control" value="${param.endDate}">
                    </div>
                </div>
                <div class="col-md-3">
                    <button type="submit" class="btn btn-primary" id="searchBtn">
                        <i class="fas fa-search"></i> 검색
                    </button>
                    <button type="button" class="btn btn-outline-secondary" onclick="resetSearch()">
                        <i class="fas fa-undo"></i> 초기화
                    </button>
                </div>
            </div>
        </form>

        <!-- 공지사항 목록 -->
        <div class="card">
            <div class="card-body">
                <!-- 전체 선택 및 액션 버튼 -->
                <div class="d-flex justify-content-between mb-3">
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="selectAll">
                        <label class="form-check-label" for="selectAll">전체 선택</label>
                    </div>
                    <div>
                        <button class="btn btn-danger btn-sm" onclick="deleteSelected()">
                            <i class="fas fa-trash"></i> 선택 삭제
                        </button>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead class="table-light">
                            <tr>
                                <th width="40px">
                                    <input type="checkbox" class="form-check-input" id="headerCheckbox">
                                </th>
                                <th width="80px">번호</th>
                                <th>제목</th>
                                <th width="100px">카테고리</th>
                                <th width="100px">작성자</th>
                                <th width="120px">등록일</th>
                                <th width="80px">조회수</th>
                                <th width="120px">관리</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${boards}" var="notice">
                                <tr class="${notice.important ? 'important-notice' : ''}">
                                    <td>
                                        <input type="checkbox" class="form-check-input notice-check" 
                                               value="${notice.noId}">
                                    </td>
                                    <td>${notice.noId}</td>
                                    <td>
                                        <a href="/notice/manage/${notice.noId}" class="notice-title">
                                            ${notice.important ? '<span class="important-badge">[중요]</span>' : ''}
                                            ${notice.noTitle}
                                            <c:if test="${not empty notice.noThumb}">
                                                <i class="fas fa-image text-muted ms-1"></i>
                                            </c:if>
                                            <c:if test="${not empty notice.files}">
                                                <i class="fas fa-paperclip text-muted ms-1"></i>
                                            </c:if>
                                        </a>
                                    </td>
                                    <td>
                                        <span class="badge bg-secondary">${notice.noCategory}</span>
                                    </td>
                                    <td>${notice.noWriter}</td>
                                    <td>
                                        <fmt:formatDate value="${notice.noRegDate}" pattern="yyyy-MM-dd"/>
                                    </td>
                                    <td>${notice.viewCount}</td>
                                    <td>
                                        <div class="d-flex action-buttons">
                                            <button class="btn btn-sm btn-outline-primary" 
                                                    onclick="location.href='/notice/manage/form?noId=${notice.noId}'"
                                                    title="수정">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button class="btn btn-sm btn-outline-danger" 
											        onclick="deleteNotice(${notice.noId})"
											        title="삭제">
											    <i class="fas fa-trash"></i>
											</button>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty boards}">
                                <tr>
                                    <td colspan="8" class="text-center py-5">
                                        <p class="mb-0 text-muted">
                                            <i class="fas fa-info-circle me-2"></i>등록된 공지사항이 없습니다.
                                        </p>
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>

                <!-- 페이지네이션 -->
                <div class="d-flex justify-content-center mt-4">
                    <nav>
                        <ul class="pagination">
                            <c:if test="${page > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="javascript:void(0)" onclick="goToPage(1)">
                                        <i class="fas fa-angle-double-left"></i>
                                    </a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="javascript:void(0)" onclick="goToPage(${page-1})">
                                        <i class="fas fa-angle-left"></i>
                                    </a>
                                </li>
                            </c:if>
                            
                            <c:forEach begin="${startPage}" end="${endPage}" var="pageNum">
							    <li class="page-item ${pageNum == page ? 'active' : ''}">
							        <a class="page-link" href="javascript:void(0)" onclick="goToPage(${pageNum})">
							            ${pageNum}
							        </a>
							    </li>
							</c:forEach>
                            
                            <c:if test="${page < totalPages}">
                                <li class="page-item">
                                    <a class="page-link" href="javascript:void(0)" onclick="goToPage(${page+1})">
                                        <i class="fas fa-angle-right"></i>
                                    </a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="javascript:void(0)" onclick="goToPage(${totalPages})">
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

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
    $(document).ready(function() {
        // 전체 선택 체크박스 이벤트
        $('#headerCheckbox').change(function() {
            $('.notice-check').prop('checked', $(this).is(':checked'));
        });

        // 검색 폼 제출
        $('#searchForm').submit(function(e) {
            e.preventDefault();
            goToPage(1);
        });
    });

    // 페이지 이동
    function goToPage(page) {
        const params = new URLSearchParams(new FormData(document.getElementById('searchForm')));
        params.set('page', page);
        params.set('size', ${size});
        location.href = `/notice/manage?${params.toString()}`;
    }

    // 검색 초기화
    function resetSearch() {
        location.href = '/notice/manage';
    }

    function deleteNotice(noId) {
        if (!confirm('정말 삭제하시겠습니까?')) {
            return;
        }
        
        const token = $("meta[name='_csrf']").attr("content");
        const header = $("meta[name='_csrf_header']").attr("content");
        
        $.ajax({
        	url: '/notice/api/delete/' + noId,  
            type: 'POST',
            beforeSend: function(xhr) {
                if(token && header) {
                    xhr.setRequestHeader(header, token);
                }
            },
            success: function() {
                alert('삭제되었습니다.');
                location.reload();
            },
            error: function(xhr) {
                console.error('Error:', xhr);
                const errorMsg = xhr.responseText || '서버 오류가 발생했습니다.';
                alert('삭제 실패: ' + errorMsg);
            }
        });
    }
 	
    </script>
</body>
</html>