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
        <div class="content-header d-flex justify-content-between align-items-center mb-4">
		    <h4 class="mb-0">공지사항 관리</h4>
		    <div>
		        <button class="btn btn-danger me-2" onclick="deleteSelected()">
		            <i class="fas fa-trash"></i> 선택 삭제
		        </button>
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
				            <!-- 첫 페이지로 -->
				            <c:if test="${page > 1}">
				                <li class="page-item">
				                    <a class="page-link" href="javascript:goToPage(1)">
				                        <i class="fas fa-angle-double-left"></i>
				                    </a>
				                </li>
				                <!-- 이전 페이지로 -->
				                <li class="page-item">
				                    <a class="page-link" href="javascript:goToPage(${page - 1})">
				                        <i class="fas fa-angle-left"></i>
				                    </a>
				                </li>
				            </c:if>
				            
				            <!-- 페이지 번호들 -->
				            <c:forEach begin="${startPage}" end="${endPage}" var="pageNum">
				                <li class="page-item ${pageNum == page ? 'active' : ''}">
				                    <a class="page-link" href="javascript:goToPage(${pageNum})">${pageNum}</a>
				                </li>
				            </c:forEach>
				            
				            <!-- 다음 페이지로 -->
				            <c:if test="${page < totalPages}">
				                <li class="page-item">
				                    <a class="page-link" href="javascript:goToPage(${page + 1})">
				                        <i class="fas fa-angle-right"></i>
				                    </a>
				                </li>
				                <!-- 마지막 페이지로 -->
				                <li class="page-item">
				                    <a class="page-link" href="javascript:goToPage(${totalPages})">
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
    window.goToPage = function(page) {
        var category = $('select[name="category"]').val();
        var keyword = $('input[name="keyword"]').val();
        var startDate = $('input[name="startDate"]').val();
        var endDate = $('input[name="endDate"]').val();
        
        var params = new URLSearchParams();
        params.append('page', page);
        params.append('size', '10');
        
        if (category) params.append('category', category);
        if (keyword) params.append('keyword', keyword);
        if (startDate) params.append('startDate', startDate);
        if (endDate) params.append('endDate', endDate);
        
        window.location.href = '/notice/manage?' + params.toString();
    };

    // 검색 초기화
    window.resetSearch = function() {
        window.location.href = '/notice/manage?page=1&size=10';
    };

    // 공지사항 삭제
    window.deleteNotice = function(noId) {
        if (!confirm('정말 삭제하시겠습니까?')) {
            return;
        }
        
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        
        $.ajax({
            url: '/notice/api/delete/' + noId,
            type: 'POST',
            beforeSend: function(xhr) {
                if (token && header) {
                    xhr.setRequestHeader(header, token);
                }
            },
            success: function() {
                alert('삭제되었습니다.');
                location.reload();
            },
            error: function(xhr) {
                console.error('Error:', xhr);
                var errorMsg = xhr.responseText || '서버 오류가 발생했습니다.';
                alert('삭제 실패: ' + errorMsg);
            }
        });
    };
    
    // 공지사항 선택 삭제
    window.deleteSelected = function() {
    const selectedIds = [];
    $('.notice-check:checked').each(function() {
        selectedIds.push($(this).val());
    });
    
    if (selectedIds.length === 0) {
        alert('삭제할 항목을 선택해주세요.');
        return;
    }
    
    if (!confirm('선택한 ' + selectedIds.length + '개의 항목을 삭제하시겠습니까?')) {
        return;
    }
    
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    
    // 선택된 항목들을 순차적으로 삭제
    let deleteCount = 0;
    let errorCount = 0;
    
    function deleteNext(index) {
        if (index >= selectedIds.length) {
            if (errorCount === 0) {
                alert('선택한 항목이 모두 삭제되었습니다.');
                location.reload();
            } else {
                alert(deleteCount + '개 항목이 삭제되었으며, ' + errorCount + '개 항목 삭제 중 오류가 발생했습니다.');
                location.reload();
            }
            return;
        }
        
        $.ajax({
            url: '/notice/api/delete/' + selectedIds[index],
            type: 'POST',
            beforeSend: function(xhr) {
                if (token && header) {
                    xhr.setRequestHeader(header, token);
                }
            },
            success: function() {
                deleteCount++;
                deleteNext(index + 1);
            },
            error: function(xhr) {
                console.error('Error:', xhr);
                errorCount++;
                deleteNext(index + 1);
            }
        });
    }
    
    deleteNext(0);
};

    // DOM이 완전히 로드된 후 이벤트 핸들러 설정
    $(document).ready(function() {
        // 검색 폼 제출
        $('#searchForm').on('submit', function(e) {
            e.preventDefault();
            goToPage(1);
        });
        
        // 전체 선택 체크박스
        $('#headerCheckbox').on('change', function() {
            $('.notice-check').prop('checked', $(this).is(':checked'));
        });
    });
 	
    </script>
</body>
</html>