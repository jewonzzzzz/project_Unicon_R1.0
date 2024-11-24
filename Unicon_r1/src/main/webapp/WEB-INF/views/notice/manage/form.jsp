<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="_csrf" content="${_csrf.token}" />
    <meta name="_csrf_header" content="${_csrf.headerName}" />
    
    <title>공지사항 ${notice.noId == null ? '등록' : '수정'}</title>
    
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <!-- Summernote CSS -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    
    <!-- Summernote JS -->
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.min.js"></script>
    
    <style>
        .sidebar { width: 250px; position: fixed; left: 0; height: 100vh; background: #f8f9fa; }
        .main-content { margin-left: 250px; padding: 20px; }
        .preview-image { max-width: 200px; max-height: 200px; object-fit: contain; }
        .spinner-border { width: 1rem; height: 1rem; }
        .note-editor .note-editable { background-color: white; }
    </style>
</head>
<body>
    <div class="main-content">
        <div class="card">
            <div class="card-header">
                <h5 class="card-title mb-0">공지사항 ${notice.noId == null ? '등록' : '수정'}</h5>
            </div>
            <div class="card-body">
                <form id="noticeForm" method="post" action="/notice/manage/submit" enctype="multipart/form-data">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <input type="hidden" name="noId" value="${notice.noId}" />
                    
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label">제목</label>
                            <input type="text" class="form-control" name="noTitle" value="${notice.noTitle}" required>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">작성자</label>
                            <input type="text" class="form-control" name="noWriter" value="${notice.noWriter}" required>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">카테고리</label>
                            <select class="form-control" name="noCategory" required>
                                <option value="">카테고리 선택</option>
                                <option value="안내사항" ${notice.noCategory == '안내사항' ? 'selected' : ''}>안내사항</option>
                                <option value="이벤트" ${notice.noCategory == '이벤트' ? 'selected' : ''}>이벤트</option>
                                <option value="센터소식" ${notice.noCategory == '센터소식' ? 'selected' : ''}>센터소식</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">내용</label>
                        <textarea id="noContent" name="noContent">${notice.noContent}</textarea>
                    </div>
                    
                    <div class="mb-3">
					    <label class="form-label">썸네일</label>
					    <input type="file" class="form-control" name="thumbnail" accept="image/*" onchange="previewImage(this, 'thumbnailPreview')">
					    <div class="mt-2">
					        <img id="thumbnailPreview" src="${notice.noThumb}" class="preview-image" onerror="this.src='/resources/assets_sub/img/default-thumb.jpg'">
					    </div>
					</div>
                    
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="important" name="important" 
                                       ${notice.important ? 'checked' : ''}>
                                <label class="custom-control-label" for="important">중요 공지사항</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="noEmail" name="noEmail" 
                                       ${notice.noEmail ? 'checked' : ''}>
                                <label class="custom-control-label" for="noEmail">이메일 발송</label>
                            </div>
                        </div>
                    </div>
                    
                    <div class="text-right">
                        <button type="button" class="btn btn-secondary" onclick="location.href='/notice/manage'">취소</button>
                        <button type="submit" id="submitBtn" class="btn btn-primary">저장</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
    $(document).ready(function() {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");

        // Summernote 초기화
        $('#noContent').summernote({
            height: 300,
            lang: 'ko-KR',
            toolbar: [
                ['style', ['style']],
                ['font', ['bold', 'underline', 'clear']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['table', ['table']],
                ['insert', ['link', 'picture', 'video']],
                ['view', ['fullscreen', 'codeview', 'help']]
            ],
            callbacks: {
                onImageUpload: function(files) {
                    for(let file of files) {
                        uploadSummernoteImage(file, this);
                    }
                }
            }
        });

        // 폼 제출
        $('#noticeForm').on('submit', function(e) {
            e.preventDefault();
            
            if (!validateForm()) {
                return false;
            }

            // FormData 객체 생성
            var formData = new FormData(this);
            
            // 폼 제출
            $.ajax({
                url: this.action,
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    window.location.href = '/notice/manage';
                },
                error: function(xhr, status, error) {
                    console.error('저장 실패:', error);
                    alert('저장에 실패했습니다.');
                }
            });
        });
    });

    // 이미지 업로드 함수
    function uploadSummernoteImage(file, editor) {
        var formData = new FormData();
        formData.append("file", file);

        $.ajax({
            url: '/notice/api/upload',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            success: function(imageUrl) {
                console.log('이미지 업로드 성공:', imageUrl);
                var fullUrl = window.location.origin + imageUrl;
                $(editor).summernote('insertImage', fullUrl);
            },
            error: function(xhr, status, error) {
                console.error('이미지 업로드 실패:', error);
                alert('이미지 업로드에 실패했습니다.');
            }
        });
    }

    function validateForm() {
        const title = $('input[name="noTitle"]').val().trim();
        const content = $('#noContent').summernote('isEmpty');
        const category = $('select[name="noCategory"]').val();
        
        if (!title) {
            alert('제목을 입력해주세요.');
            return false;
        }
        if (content) {
            alert('내용을 입력해주세요.');
            return false;
        }
        if (!category) {
            alert('카테고리를 선택해주세요.');
            return false;
        }
        return true;
    }

    function previewImage(input, previewId) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#' + previewId).attr('src', e.target.result);
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
    </script>
</body>
</html>