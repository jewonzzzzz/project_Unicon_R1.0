<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->

</head>
<%@ include file="../inc/header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
<section class="bg0 p-t-62 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-lg-3 p-b-80">
					<div class="side-menu">
						<div>
							<ul>
								<li>
									<a href="/admin" class="dis-block mtext-112 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										메인슬라이드 관리
									</a>
								</li>
								<li class="m-t-10">
									<a href="/admin/news" class="dis-block mtext-112 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										소식 관리
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				
				<%-- ${newsAllInfo } --%>
				<div class="col-md-8 col-lg-9 p-b-80">
					<div class="p-r-45 p-r-0-lg">
						<!-- item blog -->
							<div style="display: flex; justify-content: space-between;">
								<h4 class="p-b-15 ltext-108 cl2 ">
									소식 관리
								</h4>
								<button class="flex-c-m stext-101 cl0 size-103 bg3 bor1 hov-btn3 p-lr-15 trans-04"
								onclick="location.href='/admin/newsCreate';">
									소식등록
								</button>
							</div>


			<div class="row isotope-grid p-t-20">
			<c:forEach var="list" items="${newsAllInfo }">
			
				<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0">
							<a href="/admin/newsView/${list.news_id }"><img src="${list.news_src }"></a>
						</div>

						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="/admin/newsView/${list.news_id }" 
								class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
									${list.news_subject }
								</a>
							</div>

						</div>
					</div>
				</div>
			
			</c:forEach>
				
			</div>
						<!-- Pagination -->
						<div class="flex-l-m flex-w w-full p-t-10 m-lr--7">
							<a href="#" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1">
								1
							</a>

							<a href="#" class="flex-c-m how-pagination1 trans-04 m-all-7">
								2
							</a>
						</div>
					</div>
				</div>
				
				
			</div>
		</div>
	</section>

<!--====================================작성부=====================================-->

<%@ include file="../inc/footer.jsp" %> <!-- footer -->
