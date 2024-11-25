package com.Unicon.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.Unicon.domain.newsVO;
import com.Unicon.service.NewsService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private NewsService nService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	//관리자페이지 이동(슬라이드 설정 보여주기)
	@GetMapping("")
	public String adminSlide() {
		return "admin/slide";
	}
	
	//관리자페이지 - 소식관리페이지 이동
	@GetMapping("/news_manage")
	public String adminNews(Model model) {
		
		// 모든정보 조회 서비스
		//List<newsVO> newsAllInfo = nService.getNewsAll();
		
		//model.addAttribute("newsAllInfo", newsAllInfo);
		
		return "/admin/news_manage";
	}
	
	//소식등록페이지 이동
	@GetMapping("/news_create")
	public String adminNewsCreateGET() {
		return "admin/news_create";
	}
	
	//소식등록처리
	@PostMapping("/newsCreate")
	public String adminNewsCreatePOST(newsVO vo) {
		
		logger.debug(vo.toString());
		
		MultipartFile file = vo.getNews_file();
		String uploadDir = servletContext.getRealPath("/uploads/");
		logger.debug(uploadDir);
		
		try {
            // 경로가 없으면 디렉터리 생성
            File dir = new File(uploadDir);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            String uniqueFileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
            File uploadFile = new File(uploadDir + uniqueFileName);

            String news_src = "/uploads/" + uniqueFileName;
            vo.setNews_src(news_src);
            // 파일 저장
            file.transferTo(uploadFile);

        } catch (IOException e) {
            e.printStackTrace();
        }
		
			// 서비스 호출
			nService.newsCreate(vo);
		
		return "redirect:/admin/newsCreate";
	}
	
	// 소식 조회
	@GetMapping(value = "/newsView/{num}")
	public String getNewsInfo(@PathVariable("num") int num, Model model) {
		
		// 특정 소식정보 가져오기
		newsVO newsInfo  =	nService.getNews(num);
		model.addAttribute("newsInfo", newsInfo);
		
		return "admin/newsView";
	}
	
	// 소식정보 수정
	@PostMapping(value = "/newsUpdate/{num}")
	public String updateNewsInfo(newsVO vo) {
		
		logger.debug(vo.toString());
		
		return "";
	}
	
		
}
