package com.Unicon.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.Unicon.domain.NoticeFileVO;

@Repository
public class NoticeFileDAOImpl implements NoticeFileDAO {
    
    @Inject
    private SqlSession sqlSession;
    
    private static final String NAMESPACE = "com.Unicon.mapper.FileMapper";
    
    @Override
    public void insertFile(NoticeFileVO file) throws Exception {
        sqlSession.insert(NAMESPACE + ".insertFile", file);
    }
    
    @Override
    public void updateFile(NoticeFileVO file) throws Exception {
        sqlSession.update(NAMESPACE + ".updateFile", file);
    }
    
    @Override
    public void deleteFile(Long fileId) throws Exception {
        sqlSession.delete(NAMESPACE + ".deleteFile", fileId);
    }
    
    @Override
    public NoticeFileVO selectFile(Long fileId) throws Exception {
        return sqlSession.selectOne(NAMESPACE + ".selectFile", fileId);
    }
    
    @Override
    public List<NoticeFileVO> selectFilesByNoticeId(Long noId) throws Exception {
        return sqlSession.selectList(NAMESPACE + ".selectFilesByNoticeId", noId);
    }
    
    @Override
    public List<NoticeFileVO> selectFilesByType(Long noId, String fileType) throws Exception {
        Map<String, Object> params = new HashMap<>();
        params.put("noId", noId);
        params.put("fileType", fileType);
        return sqlSession.selectList(NAMESPACE + ".selectFilesByType", params);
    }
    
    @Override
    public void deleteFilesByNoticeId(Long noId) throws Exception {
        sqlSession.delete(NAMESPACE + ".deleteFilesByNoticeId", noId);
    }
}
