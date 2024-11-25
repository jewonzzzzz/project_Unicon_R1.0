<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				
				
				<div class="col-md-8 col-lg-9 p-b-80">
					<div class="p-r-45 p-r-0-lg">
						<!-- item blog -->
						<div style="display: flex; justify-content: space-between;">
							<h4 class="p-b-15 ltext-108 cl2 ">
								등록하기
							</h4>
						</div>
						
					<div class="p-t-20 p-b-40 p-lr-15-lg w-full-md">
				<form id="newsCreateForm" action="/admin/newsCreate" method="post" enctype="multipart/form-data">
					<div class="row">
					<div class="col-lg-4" >
						<span class="mtext-101">이미지</span>
						<div id="news_preview" class="bor8 m-b-20" style="min-height: 330px;">
						</div>
							<input id="news_image" class="stext-111 cl2 plh3 size-116" type="file" 
							name="news_file" required>
					</div>
					
					<div class="col-lg-8" >
						<span class="mtext-101">제목</span>
						<div class="bor8 m-b-20 how-pos4-parent">
							<input class="stext-111 cl2 plh3 size-116 p-l-20 p-r-30" type="text" 
							name="news_subject" placeholder="제목을 입력하세요" required>
						</div>
						
						<div style="display: flex; justify-content: space-between;">
							<div style="flex: 5">
							<h4 class="mtext-101">지역</h4>
								<div class="m-b-20">
										<select class="stext-111 plh3 size-116 p-l-20 p-r-30 bor8" 
										name="news_resion" required>
											<option>지역선택</option>
											<option>서울</option>
											<option>인천</option>
											<option>부산</option>
											<option>대구</option>
											<option>대전</option>
											<option>울산</option>
											<option>광주</option>
											<option>경북</option>
										</select>
									</div>
							</div>

							<div style="flex: 1"></div>
							
							<div style="flex: 12">
							<h4 class="mtext-101">장소</h4>
							<div class="bor8 m-b-20">
								<input class="stext-111 cl2 plh3 size-116 p-l-20 p-r-30" type="text" 
								name="news_place" placeholder="장소를 입력하세요" required>
							</div>
							</div>
						</div>
						
						
						<div style="display: flex; justify-content: space-between;">
							<div style="flex: 10">
							<h4 class="mtext-101">행사일자</h4>
								<div class="bor8 m-b-20">
									<input class="stext-111 cl2 plh3 size-116 p-l-20 p-r-30" type="date" 
									name="news_date" required>
								</div>
							</div>
							
							<div style="flex: 1"></div>
							
							<div style="flex: 10">
							<h4 class="mtext-101">행사시간</h4>
							<div class="bor8 m-b-20">
								<input class="stext-111 cl2 plh3 size-116 p-l-20 p-r-30" 
								type="time" name="news_time" required>
							</div>
							</div>
						</div>
						
						<div style="display: flex; justify-content: space-between;">
							<div style="flex: 10">
							<h4 class="mtext-101">주관기관</h4>
								<div class="bor8 m-b-20">
									<input class="stext-111 cl2 plh3 size-116 p-l-20 p-r-30" 
									type="text" name="news_ins" placeholder="주관기관을 입력하세요" required>
								</div>
							</div>
							
							<div style="flex: 1"></div>
							
							<div style="flex: 10">
							<h4 class="mtext-101">참여대상</h4>
							<div class="bor8 m-b-20">
								<input class="stext-111 cl2 plh3 size-116 p-l-20 p-r-30" type="text" 
								name="news_att" placeholder="참여대상을 입력하세요" required>
							</div>
							</div>
						</div>
						
					</div>
						</div>
						<div>
						<span class="mtext-101">내용</span>
						<div class="bor8 m-b-30">
							<textarea class="stext-111 cl2 plh3 size-124 p-lr-20 p-tb-25" 
							name="news_content" placeholder="내용을 입력하세요" required></textarea>
						</div>

						<button id="btn_newsCreate" type="submit"
							    class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">
							등록하기
						</button>
						</div>
					</form>
				</div>
						
					</div>
				</div>
			</div>
		</div>
	</section>

<!--====================================작성부=====================================-->


<script>
	$(document).ready(function (){
	
		$('#news_image').on('change', function(event){
    		const file = event.target.files[0]; // 업로드한 파일 가져오기
    	    const $preview = $('#news_preview'); // 미리보기 영역 선택
    	    if (file) {
    	    	const reader = new FileReader();
    	        reader.onload = function(e) {
    	          const imgTag = 
    	            "<img src='" + e.target.result + "' alt='Uploaded Image' " +
    	            "style='max-width: 100%; max-height: 100%; object-fit: cover;' />";
    	          $preview.html(imgTag);
    	        };
    	        reader.readAsDataURL(file); // 파일을 Data URL로 읽기
    	    } else {
    	    	$preview.empty();
    	    }
    	});
		
		
		$('#newsCreateForm').on('submit', function(event){
			event.preventDefault();
			
			swal("aaaa", "is added to wishlist !", "success")
			.then(function() {
	           $('#newsCreateForm').off('submit').submit();
            });
		
		});
	});

</script>


<%@ include file="../inc/footer.jsp" %> <!-- footer -->
