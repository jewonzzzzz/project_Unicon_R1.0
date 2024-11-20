<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 ${notice.noId == null ? '등록' : '수정'}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <!-- 썸머노트 에디터 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <style>
        .sidebar { width: 250px; position: fixed; left: 0; height: 100vh; background: #f8f9fa; }
        .main-content { margin-left: 250px; padding: 20px; }
        .preview-image { max-width: 200px; max-height: 200px; }
    </style>
</head>
<body>
    <!-- 사이드바는 list.jsp 가져오기 -->
    
    <div class="main-content">
        <div class="card">
            <div class="card-header">
                <h5 class="card-title mb-0">공지사항 ${notice.noId == null ? '등록' : '수정'}</h5>
            </div>
            <div class="card-body">
                <form id="noticeForm" enctype="multipart/form-data">
                    <input type="hidden" name="noId" value="${notice.noId}">
                    
                    <div class="row mb-3">
                        <div class="col-md-8">
                            <label class="form-label">제목</label>
                            <input type="text" class="form-control" name="noTitle" value="${notice.noTitle}" required>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">카테고리</label>
                            <select class="form-select" name="noCategory" required>
                                <option value="안내사항" ${notice.noCategory == '안내사항' ? 'selected' : ''}>안내사항</option>
                                <option value="이벤트" ${notice.noCategory == '이벤트' ? 'selected' : ''}>이벤트</option>
                                <option value="센터소식" ${notice.noCategory == '센터소식' ? 'selected' : ''}>센터소식</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">내용</label>
                        <textarea id="noContent" name="noContent" required>${notice.noContent}</textarea>
                    </div>
                    
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label">썸네일</label>
                            <input type="file" class="form-control" name="thumbnail" accept="image/*" 
                                   onchange="previewImage(this, 'thumbnailPreview')">
                            <div class="mt-2">
                                <img id="thumbnailPreview" src="${notice.noThumb}" class="preview-image">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">첨부파일</label>
                            <input type="file" class="form-control" name="files" multiple>
                            <!-- 기존 첨부파일 목록 -->
                            <c:if test="${not empty notice.files}">
                                <ul class="list-unstyled mt-2">
                                    <c:forEach items="${notice.files}" var="file">
                                        <li>
                                            <div class="d-flex align-items-center">
                                                <span>${file.originalName}</span>
                                                <button type="button" class="btn btn-sm btn-danger ms-2" 
                                                        onclick="deleteFile(${file.fileId})">삭제</button>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </c:if>
                        </div>
                    </div>
                    
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" name="important" 
                                       ${notice.important ? 'checked' : ''}>
                                <label class="form-check-label">중요 공지사항</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" name="noEmail" 
                                       ${notice.noEmail ? 'checked' : ''}>
                                <label class="form-check-label">이메일 발송</label>
                            </div>
                        </div>
                    </div>
                    
                    <div class="text-end">
                        <button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
                        <button type="submit" class="btn btn-primary">저장</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- 썸머노트 에디터 JS -->
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.min.js"></script>
    
    <script>
        $(document).ready(function() {
            // 썸머노트 에디터 초기화
            $('#noContent').summernote({
                height: 300,
                lang: 'ko-KR',
                toolbar: [
                    ['style', ['style']],
                    ['font', ['bold', 'underline', 'clear']],
                    ['color', ['color']],
                    ['para', ['ul', 'ol', 'paragraph']],
                    ['table', ['table']],
                    ['insert', ['link', 'picture']],
                    ['view', ['fullscreen', 'codeview', 'help']]
                ]
            });

            // 폼 제출
            $('#noticeForm').submit(function(e) {
                e.preventDefault();
                const formData = new FormData(this);
                
                $.ajax({
                    url: '${notice.noId == null ? "/api/admin/notice" : "/api/admin/notice/".concat(notice.noId)}',
                    type: '${notice.noId == null ? "POST" : "PUT"}',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function(response) {
                        alert('저장되었습니다.');
                        location.href = '/admin/notice';
                    },
                    error: function(xhr) {
                        alert('저장 실패: ' + xhr.responseText);
                    }
                });
            });
        });

        // 이미지 미리보기
        function previewImage(input, previewId) {
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById(previewId).src = e.target.result;
                };
                reader.readAsDataURL(input.files[0]);
            }
        }

        // 파일 삭제
        function deleteFile(fileId) {
            if (confirm('파일을 삭제하시겠습니까?')) {
                $.ajax({
                    url: '/api/admin/notice/file/' + fileId,
                    type: 'DELETE',
                    success: function() {
                        alert('파일이 삭제되었습니다.');
                        location.reload();
                    },
                    error: function(xhr) {
                        alert('파일 삭제 실패: ' + xhr.responseText);
                    }
                });
            }
        }
    </script>
</body>
</html>>
</html>