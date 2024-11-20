<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<!-- admin_notice.jsp (관리자용 공지사항 페이지) -->
    <meta charset="UTF-8">
    <title>공지사항 관리</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <style>
        .sidebar { width: 250px; position: fixed; left: 0; height: 100vh; background: #f8f9fa; }
        .main-content { margin-left: 250px; padding: 20px; }
        .content-header { border-bottom: 1px solid #dee2e6; padding-bottom: 1rem; margin-bottom: 2rem; }
        .table th { background: #f8f9fa; }
        .search-bar { background: #f8f9fa; padding: 1rem; border-radius: 4px; margin-bottom: 1rem; }
        .action-buttons { gap: 0.5rem; }
    </style>
</head>
<body>
    <!-- 사이드바 -->
    <div class="sidebar p-3">
        <div class="d-flex align-items-center mb-3">
            <img src="${pageContext.request.contextPath}/resources/images/logo.png" class="me-2" height="40">
            <h5 class="mb-0">유니콘</h5>
        </div>
        <ul class="nav flex-column">
            <li class="nav-item"><a class="nav-link" href="#"><i class="fas fa-home me-2"></i>Overview</a></li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="collapse" href="#reportsCollapse">
                    <i class="fas fa-chart-bar me-2"></i>Reports
                </a>
                <div class="collapse" id="reportsCollapse">
                    <ul class="nav flex-column ms-3">
                        <li class="nav-item"><a class="nav-link" href="#">Sales</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Traffic</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Inventories</a></li>
                    </ul>
                </div>
            </li>
            <li class="nav-item"><a class="nav-link active" href="#"><i class="fas fa-bell me-2"></i>Messages</a></li>
            <li class="nav-item"><a class="nav-link" href="#"><i class="fas fa-archive me-2"></i>Archive data</a></li>
        </ul>
    </div>

    <!-- 메인 컨텐츠 -->
    <div class="main-content">
        <div class="content-header d-flex justify-content-between align-items-center">
            <h4 class="mb-0">공지사항 관리</h4>
            <div>
                <button class="btn btn-outline-secondary me-2">Import</button>
                <button class="btn btn-outline-secondary">Export</button>
            </div>
        </div>

        <!-- 검색 영역 -->
        <div class="search-bar">
            <div class="row g-3">
                <div class="col-md-3">
                    <input type="text" class="form-control" placeholder="검색어 입력...">
                </div>
                <div class="col-md-3">
                    <select class="form-select">
                        <option>전체</option>
                        <option>진행중</option>
                        <option>마감</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <div class="input-group">
                        <input type="date" class="form-control">
                        <span class="input-group-text">~</span>
                        <input type="date" class="form-control">
                    </div>
                </div>
                <div class="col-md-2">
                    <button class="btn btn-primary w-100">검색</button>
                </div>
            </div>
        </div>

        <!-- 공지사항 목록 -->
        <div class="card">
            <div class="card-body">
                <table class="table">
                    <thead>
                        <tr>
                            <th width="40px">
                                <input type="checkbox" class="form-check-input">
                            </th>
                            <th>제목</th>
                            <th width="100px">카테고리</th>
                            <th width="120px">등록일</th>
                            <th width="120px">모집기간</th>
                            <th width="100px">상태</th>
                            <th width="120px">관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox" class="form-check-input"></td>
                            <td>부산 반려동물 복지센터 청소 및 산책</td>
                            <td>봉사활동</td>
                            <td>2024-09-25</td>
                            <td>2024-10-01</td>
                            <td><span class="badge bg-success">모집중</span></td>
                            <td>
                                <div class="d-flex action-buttons">
                                    <button class="btn btn-sm btn-outline-primary"><i class="fas fa-edit"></i></button>
                                    <button class="btn btn-sm btn-outline-danger"><i class="fas fa-trash"></i></button>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <!-- 페이지네이션 -->
                <nav class="mt-3">
                    <ul class="pagination justify-content-center">
                        <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>