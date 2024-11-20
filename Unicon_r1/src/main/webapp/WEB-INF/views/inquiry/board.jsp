<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->
 
   <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<%@ include file="../inc/header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
   
     <h1>문의사항 게시판</h1>
    <table id="inquiryTable">
        <thead>
            <tr>
                <th>글번호</th>
                <th>작성자</th>
                <th>제목</th>
                <th>내용</th>
                <th>작성일</th>
                <th>상태</th>
            </tr>
        </thead>
        <tbody>
            <!-- 데이터를 Ajax로 채움 -->
        </tbody>
    </table>

    <script>
    $(document).ready(function() {
        // RESTful API 호출
        $.ajax({
            url: "/api/boards",  // InquiryRestController에서 설정한 엔드포인트
            method: "GET",
            dataType: "json",  // 응답 데이터 형식은 JSON
            success: function(data) {
                let tbody = "";
                data.forEach(function(inquiry) {
                    // 서버에서 받은 데이터를 테이블에 추가
                    tbody += `
                        <tr>
                            <td>${inquiry.bno}</td>
                            <td>${inquiry.member_id}</td>
                            <td>${inquiry.title}</td>
                            <td>${inquiry.content}</td>
                            <td>${new Date(inquiry.create_at).toLocaleDateString()}</td> <!-- create_at을 날짜 형식으로 변환 -->
                            <td>${inquiry.status === 1 ? "진행 중" : "답변 완료"}</td>
                        </tr>
                    `;
                });
                // #inquiryTable tbody에 데이터를 삽입
                $("#inquiryTable tbody").html(tbody);
            },
            error: function(error) {
                console.error("데이터 로드 실패:", error);
            }
        });
    });
    </script>
    


<!--====================================작성부=====================================-->

<%@ include file="../inc/footer.jsp" %> <!-- footer -->
