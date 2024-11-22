package com.Unicon.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Unicon.domain.newsVO;

@Repository("newsDAO")
public class NewsDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	// Mapper namespace 정보 저장
	private static final String NAMESPACE = "com.Unicon.mapper.NewsMapper";
	
	// 소식 생성
	public void newsCreate(newsVO vo) {
		sqlSession.insert(NAMESPACE+".newsCreate", vo);
	}
	
	// 모든 소식 조회
	public List<newsVO> getNewsAll() {
		return sqlSession.selectList(NAMESPACE+".getNewsAll");
	}
	
	// 특정 소식 조회
	public newsVO getNews(int news_id) {
		return sqlSession.selectOne(NAMESPACE+".getNews", news_id);
	}
	
	
	
	
	
	
}
