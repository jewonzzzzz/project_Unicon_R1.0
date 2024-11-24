<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!-- CSRF 토큰 -->
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
    <!-- 메인 컨텐츠 -->
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
                            <c:if test="${not empty notice.files}">
                                <ul class="list-unstyled mt-2">
                                    <c:forEach items="${notice.files}" var="file">
                                        <li>
                                            <div class="d-flex align-items-center">
                                                <span>${file.originalName}</span>
                                                <button type="button" class="btn btn-sm btn-danger ml-2" 
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
 	// 전역 변수로 CSRF 토큰 설정
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    
    $(document).ready(function() {
        console.log('Initializing Summernote...');
        console.log('CSRF Token:', token);
        console.log('CSRF Header:', header);
        
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
                onInit: function() {
                    console.log('Summernote initialized');
                },
                onImageUpload: function(files) {
                    console.log('Image upload triggered');
                    for(let file of files) {
                        uploadImage(file, this);
                    }
                }
            }
        });

        // 폼 제출 처리
        $('#noticeForm').submit(function(e) {
            e.preventDefault();
            if (!validateForm()) {
                return false;
            }
            this.submit();
        });
    });

    // 이미지 업로드 함수
    function uploadImage(file, editor) {
    console.log('Uploading image:', file.name);
    var formData = new FormData();
    formData.append("file", file);

    $.ajax({
        url: '/notice/api/upload',
        type: 'POST',
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        success: function(imageUrl) {
            console.log('Upload success, URL:', imageUrl);
            // 전체 URL 구성
            var fullUrl = window.location.origin + imageUrl;
            console.log('Full image URL:', fullUrl);
            $(editor).summernote('insertImage', fullUrl);
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error('Upload failed:', textStatus, errorThrown);
            alert('이미지 업로드에 실패했습니다.');
        }
    });
}

    // 폼 검증
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

    // 파일 크기 검사
    function checkFileSize(file, maxSize) {
        if (file.size > maxSize) {
            alert('파일 크기는 ' + (maxSize/1024/1024) + 'MB를 초과할 수 없습니다.');
            return false;
        }
        return true;
    }

    // 파일 타입 검사
    function checkFileType(file) {
        const allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];
        if (!allowedTypes.includes(file.type)) {
            alert('지원하지 않는 파일 형식입니다. (jpg, png, gif만 가능)');
            return false;
        }
        return true;
    }

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
        if (!confirm('파일을 삭제하시겠습니까?')) {
            return;
        }
        
        $.ajax({
            url: '/notice/api/file/' + fileId,
            type: 'DELETE',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="_csrf"]').attr('content')
            },
            success: function() {
                alert('파일이 삭제되었습니다.');
                location.reload();
            },
            error: function(xhr, status, error) {
                alert('파일 삭제에 실패했습니다.');
                console.error(error);
            }
        });
    }
    </script>
</body>
</html>