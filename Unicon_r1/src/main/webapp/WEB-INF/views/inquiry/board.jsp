<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp"%>
<!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->

<style>
/* 메인 타이틀 스타일 */
.main-title {
    font-size: 2rem;
    font-weight: bold;
    margin: 60px 0 20px 200px;
    color: black;       
}


/* 테이블 스타일 */
table {
	width: 60%; /* 테이블 너비를 조금 줄임 */
	margin: 20px auto; /* 테이블의 위치를 중앙에 배치 */
	font-size: 12px; /* 폰트 크기 줄임 */
	border-collapse: collapse; /* 셀 간격 제거 */
}

th, td {
	padding: 8px; /* 셀의 padding을 줄여서 공간 절약 */
	text-align: left;
	border: 1px solid #ddd;
	font-weight: normal;
}

th {
	background-color: #f4f4f4;
	color: #333;
}

td {
	background-color: #fff;
	color: #555;
}

/* 모든 세로줄 (열의 경계) 제거 */
td, th {
    border-left: none; /* 모든 셀의 왼쪽 세로줄 제거 */
    border-right: none; /* 모든 셀의 오른쪽 세로줄 제거 */
}


/* 글 번호 스타일 */
.no {
	width: 5%;
	text-align: center;
	font-weight: bold;
}



/* 제목 스타일 */
.title {
	width: 60%;
	text-align: center;
	font-weight: bold;
}

/* 글쓴이와 작성일 */
.member, .date {
	width: 15%;
	text-align: center;
	font-size: 12px;
	font-weight: bold;
}

/* 상태 및 검색 필터 */
.status {
	font-weight: bold;
	color: #2ecc71; /* 진행중 상태는 초록색 */
}

/* 검색창 스타일 */
.search-bar {
	text-align: center;
	margin-bottom: 20px;
}

/* 게시판 제목 */
h2 {
	font-size: 24px;
	color: #333;
	text-align: center;
	margin-bottom: 20px;
}

/* 글쓰기 버튼 스타일 */
.write-btn-container {
    text-align: right; /* 오른쪽 정렬 */
    margin: 20px 390px 20px 40px; /* 페이지 우측 공간과 상단 여백 설정 */
}

.write-btn {
    background-color: #2ecc71; /* 버튼 색상 */
    color: white; /* 텍스트 색상 */
    font-size: 14px; /* 폰트 크기 */
    font-weight: bold;
    padding: 10px 20px; /* 버튼 여백 */
    border: none; /* 테두리 제거 */
    border-radius: 5px; /* 둥근 모서리 */
    cursor: pointer; /* 마우스 커서 변경 */
    transition: background-color 0.3s ease; /* 호버 효과 추가 */
}

.write-btn:hover {
    background-color: #27ae60; /* 호버 시 색상 변경 */
}

/* 상태 열 스타일 */
.status {
    text-align: center;
    font-weight: bold;
    color: #333;
}

/* 진행 중 상태 */
.status-ongoing {
    color: #2ecc71; /* 초록색 */
}

/* 답변 완료 상태 */
.status-completed {
    color: #3498db; /* 파란색 */
}

/* 페이징 스타일 */
.pagination {
    display: flex;
    justify-content: center;
    margin-top: 20px;
    list-style: none;
    padding: 0;
}

.pagination li {
    margin: 0 5px;
}

.pagination li a {
    display: block;
    padding: 8px 12px;
    text-decoration: none;
    border: 1px solid #ddd;
    color: #333;
    border-radius: 4px;
    transition: background-color 0.3s ease;
    font-size: 14px; /* 화살표 버튼 크기와 텍스트 크기 조정 */
}

.pagination li a:hover,
.pagination li.active a {
    background-color: #2ecc71;
    color: white;
}



</style>
</head>
<%@ include file="../inc/new_header.jsp"%>
<!-- header -->

<!--====================================작성부=====================================-->
<section class="page-title-section bg-primary">
    <div class="container">
		
        <div class="row">
            <div class="col-md-12">
                <h1>unicon 고객센터</h1>
            </div>
            <div class="col-md-12">
                <ul class="ps-0">
                    <li><a href="inquiry"><i class="ti-home"></i></a></li>
                    <li class="active"><a href="board">문의게시판</a></li>
                </ul>
            </div>
        </div>
	
    </div>
</section>
<br>
<br>

<div class="container">
	<div class="section-heading">
		<h3>문의 게시판</h3>
	</div>
	<div class="row position-relative">
		<div class="col-12">
			<div class="table-responsive">
				<table class="table" id="inquiryTable">
					<thead>
						<tr>
							<th class="no">No</th>
							<th class="title">제목</th>
							<th class="member">작성자</th>
							<th class="date">작성일</th>
							<th class="status">상태</th>
						</tr>
					</thead>
					<tbody>
						<!-- 데이터를 Ajax로 채움 -->
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<!-- 글쓰기 버튼 -->
<div class="write-btn-container">
    <button class="write-btn" onclick="location.href='/inquiry/write'">문의하기</button>
</div>
<!-- 페이지네이션 -->
<div class="pagination text-small text-uppercase text-extra-dark-gray">
	<ul class="ps-0 mb-0" id="pagination"></ul>
</div>


<br>
<br>

<script>
$(document).ready(function () {
    // 현재 페이지와 페이지 크기
    let currentPage = 1;
    const pageSize = 10;

    function loadPage(page) {
        $.ajax({
            url: "/api/boards",
            method: "GET",
            data: { page: page, size: pageSize },
            dataType: "json",
            success: function (response) {
                const data = response.boards; // 서버에서 가져온 데이터
                const totalPages = response.totalPages; // 전체 페이지 수

                let tbody = "";
                data.forEach(function (inquiry) {
                    let statusText = inquiry.status === 1 ? "진행 중" : "답변 완료";
                    let statusClass = inquiry.status === 1 ? "status-ongoing" : "status-completed";

                    tbody +=
                        '<tr>' +
                        '<td class="no">' + inquiry.bno + '</td>' +
                        '<td class="title">' + inquiry.title + '</td>' +
                        '<td class="member">' + inquiry.member_name + '</td>' +
                        '<td class="date">' + inquiry.created_at + '</td>' +
                        '<td class="status ' + statusClass + '">' + statusText + '</td>' +
                        '</tr>';
                });

                $("#inquiryTable tbody").html(tbody);
                renderPagination(totalPages, page);
            },
            error: function (error) {
                console.error("데이터 로드 실패:", error);
            }
        });
    }

    function renderPagination(totalPages, currentPage) {
        let paginationHtml = "";

        // 이전 버튼
        if (currentPage > 1) {
            paginationHtml +=
                '<li>' +
                '<a href="#" data-page="' + (currentPage - 1) + '">«</a>' +
                '</li>';
        }

        // 페이지 번호
        for (let i = 1; i <= totalPages; i++) {
            paginationHtml +=
                '<li class="' + (i === currentPage ? "active" : "") + '">' +
                '<a href="#" data-page="' + i + '">' + i + '</a>' +
                '</li>';
        }

        // 다음 버튼
        if (currentPage < totalPages) {
            paginationHtml +=
                '<li>' +
                '<a href="#" data-page="' + (currentPage + 1) + '">»</a>' +
                '</li>';
        }

        $("#pagination").html(paginationHtml);
    }

    // 페이지네이션 클릭 이벤트
    $(document).on("click", ".pagination a", function (e) {
        e.preventDefault();
        const page = $(this).data("page");
        currentPage = page;
        loadPage(page);
    });

    // 초기 페이지 로드
    loadPage(currentPage);
});

</script>


<!--====================================작성부=====================================-->

<%@ include file="../inc/new_footer.jsp"%>
<!-- footer -->
