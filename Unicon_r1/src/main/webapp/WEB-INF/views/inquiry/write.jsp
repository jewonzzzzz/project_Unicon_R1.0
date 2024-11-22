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
input[type="tel"] {
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
/* 메인 타이틀 스타일 */
.main-title {
    font-size: 2rem;
    font-weight: bold;
    margin: 60px 0 20px 200px;
    color: black;       
}


/* 게시판 제목 */
h2 {
	font-size: 24px;
	color: #333;
	text-align: center;
	margin-bottom: 20px;
}

</style>
</head>
<%@ include file="../inc/header.jsp"%>
<!-- header -->

<!--====================================작성부=====================================-->
<h1 class="main-title"> unicon 고객센터</h1>

<h2>문의하기</h2>
<form id="inquiryForm" enctype="multipart/form-data">
    <!-- 문의 분류 -->
    <label for="istatus">문의 분류 *</label>
    <select id="istatus" name="istatus" required>
        <option value="">카테고리를 선택해 주세요.</option>
        <option value="general">일반 문의</option>
        <option value="technical">기술 지원</option>
        <option value="billing">결제 관련</option>
    </select>

  <!-- 이메일 주소 -->
	<label for="email">이메일 주소 *</label>
	<input type="text" id="email" name="email" placeholder="입력해 주세요." required>
	<select name="emailDomain" id="emailDomain" onchange="updateEmail()">
	    <option value="">직접 입력</option>
	    <option value="gmail.com">@gmail.com</option>
	    <option value="naver.com">@naver.com</option>
	    <option value="kakao.com">@kakao.com</option>
	</select>

    <!-- 휴대폰 번호 -->
    <label for="phone">휴대폰 번호 *</label>
    <input type="tel" id="phone" name="phone" placeholder="01012345678" required>

    <!-- 문의 제목 -->
    <label for="title">문의 제목 *</label>
    <input type="text" id="title" name="title" placeholder="제목을 입력해 주세요. (20자 이내)" maxlength="20" required>
    
    <!-- 작성자 이름 -->
    <label for="member_name">작성자 *</label>
    <input type="text" id="member_name" name="member_name" placeholder="이름을 입력해 주세요." maxlength="10" required>
        
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

    const istatus = document.getElementById("istatus").value;
    const email = document.getElementById("email").value.trim();
    const emailDomain = document.getElementById("emailDomain").value.trim();
    
    // 이메일 합치기: emailDomain이 빈 값일 경우 이메일에 도메인을 추가
    const fullEmail = emailDomain ? `${email}@${emailDomain}` : email;

    const phone = document.getElementById("phone").value.trim();
    const title = document.getElementById("title").value.trim();
    const content = document.getElementById("content").value.trim();
    const member_name = document.getElementById("member_name").value.trim();
    const fileInput = document.getElementById("file").files[0];
    
    // 휴대폰 번호 유효성 검사 (숫자만 입력 가능)
    if (!/^\d+$/.test(phone)) {
        alert("휴대폰 번호는 숫자만 입력해야 합니다.");
        return;
    }

    // 1. JSON 데이터 전송
    const data = {
        istatus: istatus,
        email: fullEmail,
        phone: phone,
        title: title,
        content: content,
        member_name: member_name,
        // 파일 이름을 서버에서 사용할 수 있도록 처리 (파일 전송은 나중에)
        file: fileInput ? fileInput.name : null
    };

    fetch("/api/submit", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(data)  // JSON 문자열로 변환해서 서버에 전송
    })
    .then(response => {
        if (!response.ok) {
            throw new Error("서버 오류: " + response.status);
        }
        return response.text();
    })
    .then(data => {
        alert(data); // 서버 응답 메시지 표시
        // 2. 파일 데이터 전송
        if (fileInput) {
            const formData = new FormData();
            formData.append('file', fileInput);  // 파일을 FormData로 추가

            return fetch("/api/submitFile", {
                method: "POST",
                body: formData // 파일만 전송
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error("파일 업로드 오류: " + response.status);
                }
                return response.text();
            })
            .then(fileData => {
                alert(fileData); // 파일 업로드 성공 메시지
                document.getElementById("inquiryForm").reset(); // 폼 초기화
            })
            .catch(error => {
                console.error("파일 업로드 에러:", error);
                alert("파일 업로드 중 문제가 발생했습니다.");
            });
        } else {
            document.getElementById("inquiryForm").reset(); // 폼 초기화
        }
    })
    .catch(error => {
        console.error("문의 등록 중 오류:", error);
        alert("문의 등록 중 문제가 발생했습니다.");
    });
});
</script>

<!--====================================작성부=====================================-->

<%@ include file="../inc/footer.jsp"%>
<!-- footer -->
