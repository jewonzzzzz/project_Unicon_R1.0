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
 	.sidebar { 
	   width: 250px; 
	   position: fixed; 
	   left: 0; 
	   height: 100vh; 
	   background: #f8f9fa; 
	   transition: all 0.3s ease;
	}
	
	.main-content { 
	   margin-left: 250px; 
	   padding: 20px; 
	   transition: margin 0.3s ease;
	}
	
	/* 헤더 영역 */
	.content-header { 
	   border-bottom: 1px solid #dee2e6; 
	   padding-bottom: 1rem; 
	   margin-bottom: 2rem; 
	}
	
	.content-header .d-flex.flex-column {
	   gap: 0.5rem;
	}
	
	/* 검색 영역 */
	.search-bar { 
	   background: #f8f9fa; 
	   padding: 1rem; 
	   border-radius: 4px; 
	   margin-bottom: 1rem; 
	}
	
	/* 테이블 스타일 */
	.table {
	   border-collapse: collapse;
	}
	
	.table-responsive {
	   overflow-x: auto;
	   -webkit-overflow-scrolling: touch;
	}
	
	.table th,
	.table td {
	   border-top: 1px solid #dee2e6;      /* 가로줄만 표시 */
  	   border-bottom: 1px solid #dee2e6;    /* 가로줄만 표시 */
	   padding: 0.75rem;
	   vertical-align: middle;
	   line-height: 1.5;       /* 줄 높이 통일 */
   	   min-height: 24px; 
	}
	
	.table th {
	   background-color: #f8f9fa;
	   font-weight: 600;
	}
	
	.badge {
	   font-weight: normal;
	   padding: 0.5em 0.8em;
	}
	
	/* 모바일 반응형 */
	@media (max-width: 768px) {
	   /* 레이아웃 */
	   .sidebar {
	       width: 0;
	       overflow: hidden;
	   }
	
	   .main-content {
	       margin-left: 0;
	       padding: 15px;
	   }
	
	   /* 헤더 영역 */
	   .content-header {
	       flex-direction: column;
	       align-items: stretch;
	       gap: 1rem;
	   }
	
	   .content-header .btn {
	       width: 100%;
	       margin-bottom: 0.5rem;
	   }
	
	   /* 검색 영역 */
	   .search-bar .row {
	       margin: 0;
	   }
	
	   .search-bar .col-md-3,
	   .search-bar .col-md-2,
	   .search-bar .col-md-4 {
	       padding: 5px;
	       width: 100%;
	   }
	
	   /* 테이블 영역 */
	   .table th:not(:nth-child(1)):not(:nth-child(4)):not(:nth-child(8)),
	   .table td:not(:nth-child(1)):not(:nth-child(4)):not(:nth-child(8)) {
	       display: none;
	   }
	
	   .notice-title {
	       max-width: 200px;
	   }
	
	   /* 버튼 영역 */
	   .action-buttons {
	       display: flex;
	       gap: 0.25rem;
	       justify-content: flex-end;
	   }
	}
    </style>
</head>
<body>
    <!-- 메인 컨텐츠 -->
    <div class="main-content">
        <div class="content-header d-flex justify-content-between align-items-center mb-4">
		    <h4 class="mb-0">공지사항 관리</h4>
		    <div class="d-flex flex-column gap-2"> <!-- flex-column과 gap-2 추가 -->
		        <button class="btn btn-primary" onclick="location.href='/notice/manage/form'">
		            <i class="fas fa-plus"></i> 공지사항 등록
		        </button>
		        <button class="btn btn-danger" onclick="deleteSelected()">
		            <i class="fas fa-trash"></i> 선택 삭제
		        </button>
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
				                <th class="text-center" style="width: 50px;">
				                    <input type="checkbox" class="form-check-input" id="headerCheckbox">
				                </th>
				                <th class="text-center" style="width: 80px;">번호</th>
				                <th style="width: 100px;">카테고리</th>
				                <th>제목</th>
				                <th style="width: 100px;">작성자</th>
				                <th style="width: 120px;">등록일</th>
				                <th class="text-center" style="width: 80px;">조회수</th>
				                <th style="width: 100px;">관리</th>
				            </tr>
				        </thead>
				        <tbody>
				            <c:forEach items="${boards}" var="notice">
				                <tr>
				                    <td class="text-center">
				                        <input type="checkbox" class="form-check-input notice-check" value="${notice.noId}">
				                    </td>
				                    <td class="text-center">${notice.noId}</td>
				                    <td>
				                        <span class="badge bg-secondary">${notice.noCategory}</span>
				                    </td>
				                    <td class="notice-title">
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
				                    <td>${notice.noWriter}</td>
				                    <td><fmt:formatDate value="${notice.noRegDate}" pattern="yyyy-MM-dd"/></td>
				                    <td class="text-center">${notice.viewCount}</td>
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