<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/topHeader.jsp"%>
<!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->
<style>
body {
	font-family: Arial, sans-serif;
	line-height: 1.6;
	margin: 0;
	padding: 20px;
}

h1 {
	text-align: center;
	margin-bottom: 20px;
}

form {
	max-width: 600px;
	margin: 0 auto;
	background: #f9f9f9;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 8px;
}

label {
	display: block;
	margin-bottom: 8px;
	font-weight: bold;
}

input[type="text"], input[type="email"], textarea, select {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 14px;
}

textarea {
	resize: vertical;
}

.file-upload {
	margin-bottom: 15px;
}

.file-upload label {
	display: block;
	margin-bottom: 5px;
}

.file-upload input[type="file"] {
	display: block;
}

button {
	background-color: #2ecc71;
	color: white;
	padding: 10px 15px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button:hover {
	background-color: #27ae60;
}
</style>
</head>
<%@ include file="../inc/header.jsp"%>
<!-- header -->

<!--====================================작성부=====================================-->

<h1>문의하기</h1>
<form id="inquiryForm">
    <!-- 문의 분류 -->
    <label for="inquiryCategory">문의 분류 *</label>
    <select id="inquiryCategory" name="inquiryCategory" required>
        <option value="">카테고리를 선택해 주세요.</option>
        <option value="general">일반 문의</option>
        <option value="technical">기술 지원</option>
        <option value="billing">결제 관련</option>
    </select>

    <!-- 이메일 주소 -->
    <label for="email">이메일 주소 *</label>
    <input type="text" id="email" name="email" placeholder="입력해 주세요." required>
    <select name="emailDomain" id="emailDomain">
        <option value="">직접 입력</option>
        <option value="gmail.com">@gmail.com</option>
        <option value="naver.com">@naver.com</option>
        <option value="kakao.com">@kakao.com</option>
    </select>

    <!-- 휴대폰 번호 -->
    <label for="phone">휴대폰 번호 *</label>
    <input type="text" id="phone" name="phone" placeholder="01012345678" required>

    <!-- 문의 제목 -->
    <label for="title">문의 제목 *</label>
    <input type="text" id="title" name="title" placeholder="제목을 입력해 주세요. (20자 이내)" maxlength="20" required>

    <!-- 문의 내용 -->
    <label for="content">문의 내용 *</label>
    <textarea id="content" name="content" rows="6" placeholder="내용을 입력해 주세요." maxlength="3000" required></textarea>

    <!-- 파일 첨부 -->
    <div class="file-upload">
        <label for="file">파일 첨부</label>
        <input type="file" id="file" name="file" accept=".jpg, .png, .pdf">
    </div>

    <!-- 전송 버튼 -->
    <button type="submit">문의하기</button>
</form>

<script>
document.getElementById("inquiryForm").addEventListener("submit", function(event) {
    event.preventDefault(); // 폼 제출 시 페이지 리로드 방지

    // 폼 데이터를 JSON 형식으로 변환
    var formData = {
        inquiryCategory: document.getElementById("inquiryCategory").value,
        email: document.getElementById("email").value,
        emailDomain: document.getElementById("emailDomain").value,
        phone: document.getElementById("phone").value,
        title: document.getElementById("title").value,
        content: document.getElementById("content").value,
        file: document.getElementById("file").files[0] // 파일 처리 (필요한 경우)
    };

    // JSON 데이터를 REST API로 POST 요청 보내기
    fetch("/api/submit", {
        method: "POST",
        headers: {
            "Content-Type": "application/json" // 요청 헤더에 Content-Type 설정
        },
        body: JSON.stringify(formData) // JSON 형식으로 변환하여 전송
    })
    .then(response => {
        if (!response.ok) {
            throw new Error("서버 오류: " + response.status);
        }
        return response.json(); // JSON 응답 처리
    })
    .then(data => {
        alert("문의가 성공적으로 등록되었습니다.");
        // 폼 초기화
        document.getElementById("inquiryForm").reset();
    })
    .catch(error => {
        // 오류 발생 시 콘솔에 상세 정보 출력
        console.error("문의 등록 중 오류가 발생했습니다.", error);

        // 네트워크 오류 또는 응답 오류
        alert("서버와 연결할 수 없습니다. 네트워크 상태를 확인해 주세요.");
    });
});
</script>

<!--====================================작성부=====================================-->

<%@ include file="../inc/footer.jsp"%>
<!-- footer -->
