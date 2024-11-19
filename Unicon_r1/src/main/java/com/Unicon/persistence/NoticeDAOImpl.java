package com.Unicon.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.Unicon.domain.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
    
    @Inject
    private SqlSession sqlSession;
    
    private static final String NAMESPACE = "com.Unicon.mapper.NoticeMapper";
    
    @Override
    public void insertNotice(NoticeVO noVo) throws Exception {
        sqlSession.insert(NAMESPACE + ".insertNotice", noVo);
    }
    
    @Override
    public void updateNotice(NoticeVO noVo) throws Exception {
        sqlSession.update(NAMESPACE + ".updateNotice", noVo);
    }
    
    @Override
    public void deleteNotice(Long noId) throws Exception {
        sqlSession.update(NAMESPACE + ".deleteNotice", noId);
    }
    
    @Override
    public List<NoticeVO> selectNoticeList(Map<String, Object> params) throws Exception {
        return sqlSession.selectList(NAMESPACE + ".selectNoticeList", params);
    }
    
    @Override
    public int selectNoticeCount(Map<String, Object> params) throws Exception {
        return sqlSession.selectOne(NAMESPACE + ".selectNoticeCount", params);
    }
    
    @Override
    public NoticeVO selectNotice(Long noId) throws Exception {
        return sqlSession.selectOne(NAMESPACE + ".selectNotice", noId);
    }
    
    @Override
    public void updateViewCount(Long noId) throws Exception {
        sqlSession.update(NAMESPACE + ".updateViewCount", noId);
    }
    
    @Override
    public void updateStatus(Long noId, String status) throws Exception {
        Map<String, Object> params = new HashMap<>();
        params.put("noticeId", noId);
        params.put("status", status);
        sqlSession.update(NAMESPACE + ".updateStatus", params);
    }
}
