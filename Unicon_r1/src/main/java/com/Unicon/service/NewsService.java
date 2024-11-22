package com.Unicon.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Unicon.domain.newsVO;
import com.Unicon.persistence.NewsDAO;

@Service("newsService")
public class NewsService {
	
	@Autowired
	private NewsDAO ndao;
	
	private static final Logger logger = LoggerFactory.getLogger(NewsService.class);
	
	
	// 소식 생성
	public void newsCreate(newsVO vo) {
		ndao.newsCreate(vo);
	}
	
	// 모든 소식 조회
	public List<newsVO> getNewsAll() {
		return ndao.getNewsAll();
	}
	
	// 특정 소식 조회
	public newsVO getNews(int news_id) {
		return ndao.getNews(news_id);
	}
	
	
}
