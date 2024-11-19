/*
package com.Unicon.service;


import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.Unicon.domain.NoticeFileVO;
import com.Unicon.persistence.NoticeFileDAO;

@Service
public class NoticeFileServiceImpl implements NoticeFileService {
    
    @Value("${file.upload.path}")
    private String uploadPath;
    
    @Inject
    private NoticeFileDAO fileDAO;
    
    @Override
    public NoticeFileVO uploadFile(MultipartFile file, String fileType) throws Exception {
        String originalFilename = file.getOriginalFilename();
        String storedFileName = fileType + "_" + UUID.randomUUID().toString() + 
                              getExtension(originalFilename);
        
        File savedFile = new File(uploadPath + File.separator + storedFileName);
        file.transferTo(savedFile);
        
        NoticeFileVO fileVO = new NoticeFileVO();
        fileVO.setOriginalName(originalFilename);
        fileVO.setStoredName(storedFileName);
        fileVO.setFilePath(uploadPath);
        fileVO.setFileSize(file.getSize());
        fileVO.setFileType(fileType);
        
        return fileVO;
    }
    
    @Override
    public void deleteFile(Long fileId) throws Exception {
        NoticeFileVO fileVO = fileDAO.selectFile(fileId);
        if (fileVO != null) {
            File file = new File(fileVO.getFilePath() + File.separator + fileVO.getStoredName());
            if (file.exists()) {
                file.delete();
            }
            fileDAO.deleteFile(fileId);
        }
    }
    
    @Override
    public List<NoticeFileVO> getFilesByNoticeId(Long noId) throws Exception {
        return fileDAO.selectFilesByNoticeId(noId);
    }
}
*/
