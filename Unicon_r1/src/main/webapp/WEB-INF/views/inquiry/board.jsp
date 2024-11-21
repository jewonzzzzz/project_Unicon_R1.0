<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/topHeader.jsp"%>
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
</style>
</head>
<%@ include file="../inc/header.jsp"%>
<!-- header -->

<!--====================================작성부=====================================-->
<h1 class="main-title"> unicon 고객센터</h1>
<br>

<h2> 종합 문의 게시판</h2>


<!-- 테이블 -->
<table id="inquiryTable">
	<thead>
		<tr>
			<th class="no">No</th>
			<th class="title">제목</th>
			<th class="member">작성자</th>
			<th class="date">작성일</th>
		</tr>
	</thead>
	<tbody>
		<!-- 데이터를 Ajax로 채움 -->
	</tbody>
</table>

<script>
$(document).ready(function() {
    // 데이터를 가져와서 테이블에 추가
    $.ajax({
        url: "/api/boards",  
        method: "GET",
        dataType: "json",
        success: function(data) {
            let tbody = "";
            data.forEach(function(inquiry) {
            	tbody += '<tr>' +
                '<td class="no">' + inquiry.bno + '</td>' +
                '<td class="title">' + inquiry.title + '</td>' +
                '<td class="member">' + inquiry.member_id + '</td>' +
                '<td class="date">' + inquiry.created_at + '</td>' +
                '</tr>';
            });
            $("#inquiryTable tbody").html(tbody);
        },
        error: function(error) {
            console.error("데이터 로드 실패:", error);
        }
    });
});


</script>


<!--====================================작성부=====================================-->

<%@ include file="../inc/footer.jsp"%>
<!-- footer -->
