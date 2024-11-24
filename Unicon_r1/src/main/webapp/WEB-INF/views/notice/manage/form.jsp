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

   /* 카드 스타일 */
   .card {
       margin-bottom: 20px;
       border-radius: 8px;
       box-shadow: 0 2px 4px rgba(0,0,0,0.1);
   }

   .card-body {
       padding: 2rem;
   }

   /* 폼 요소 스타일 */
   .form-label {
       font-weight: 500;
       margin-bottom: 0.5rem;
   }

   .form-control {
       border-radius: 4px;
   }

   /* 에디터 스타일 */
   .note-editor .note-editable { 
       background-color: white; 
   }

   .note-editor {
       border-radius: 4px;
   }

   /* 이미지 스타일 */
   .preview-image { 
       max-width: 200px; 
       max-height: 200px; 
       object-fit: contain;
       border-radius: 4px;
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

       /* 카드 */
       .card-body {
           padding: 1rem;
       }

       /* 그리드 순서 */
       .order-1 {
           order: 1;
       }
       
       .order-2 {
           order: 2;
       }
       
       .order-3 {
           order: 3;
       }

       /* 폼 요소 */
       .row > div[class^="col-"] {
           margin-bottom: 1rem;
       }

       .form-control {
           height: calc(2.5rem + 2px);
       }

       /* 에디터 */
       #noContent {
           height: 200px !important;
       }

       /* 이미지 */
       .preview-image {
           max-width: 100%;
           height: auto;
       }

       /* 버튼 */
       .btn {
           padding: 0.75rem 1.5rem;
           width: 100%;
           margin-bottom: 0.5rem;
       }
   }

   /* 태블릿 반응형 */
   @media (min-width: 769px) and (max-width: 1024px) {
       .sidebar {
           width: 200px;
       }
       
       .main-content {
           margin-left: 200px;
       }
       
       .card-body {
           padding: 1.5rem;
       }

       .row > div[class^="col-"] {
           margin-bottom: 1rem;
       }
   }
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
					    <div class="col-md-2 order-md-1 order-1">
					        <label class="form-label">카테고리</label>
					        <select class="form-control" name="noCategory" required>
					            <option value="">카테고리 선택</option>
					            <option value="안내사항" ${notice.noCategory == '안내사항' ? 'selected' : ''}>안내사항</option>
					            <option value="이벤트" ${notice.noCategory == '이벤트' ? 'selected' : ''}>이벤트</option>
					            <option value="센터소식" ${notice.noCategory == '센터소식' ? 'selected' : ''}>센터소식</option>
					        </select>
					    </div>
					    
					    <div class="col-md-7 order-md-2 order-2">
					        <label class="form-label">제목</label>
					        <input type="text" class="form-control" name="noTitle" value="${notice.noTitle}" required>
					    </div>
					    
					    <div class="col-md-3 order-md-3 order-3">
					        <label class="form-label">작성자</label>
					        <input type="text" class="form-control" name="noWriter" value="${notice.noWriter}" required>
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
			            <div class="row">
			                <div class="col-6">
			                    <button type="button" class="btn btn-secondary w-100" onclick="location.href='/notice/manage'">취소</button>
			                </div>
			                <div class="col-6">
			                    <button type="submit" id="submitBtn" class="btn btn-primary w-100">저장</button>
			                </div>
			            </div>
			        </div>
			    </form>
			</div>

    <script>
    var csrfToken = $("meta[name='_csrf']").attr("content");
    var csrfHeader = $("meta[name='_csrf_header']").attr("content");

    // CSRF 토큰이 존재할 때만 ajaxSetup 설정
    if (csrfToken && csrfHeader) {
        $.ajaxSetup({
            beforeSend: function(xhr) {
                xhr.setRequestHeader(csrfHeader, csrfToken);
            }
        });
    }

    $(document).ready(function() {
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
        success: function(imageUrl) {
            console.log('이미지 업로드 성공:', imageUrl);
            $(editor).summernote('insertImage', imageUrl);
        },
        error: function(xhr, status, error) {
            console.error('이미지 업로드 실패:', error);
            console.error('상태 코드:', xhr.status);
            console.error('응답 텍스트:', xhr.responseText);
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