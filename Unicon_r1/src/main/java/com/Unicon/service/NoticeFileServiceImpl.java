package com.Unicon.service;


import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.Unicon.domain.NoticeFileVO;
import com.Unicon.exception.NoticeException;
import com.Unicon.persistence.NoticeFileDAO;

@Service
public class NoticeFileServiceImpl implements NoticeFileService {
	
	private static final Logger logger 
		= LoggerFactory.getLogger(NoticeFileServiceImpl.class);
    
	@Value("${file.upload.path}")
    private String uploadPath;
    
    @Inject
    private NoticeFileDAO fileDAO;
    
    @Override
    @Transactional
    public NoticeFileVO uploadFile(MultipartFile file, String fileType) throws Exception {
        try {
            if ("THUMBNAIL".equals(fileType)) {
                return processThumbnail(file);
            } else {
                return processContentFile(file);
            }
        } catch (Exception e) {
            logger.error("파일 업로드 중 오류 발생", e);
            throw new NoticeException("파일 업로드에 실패했습니다.", e);
        }
    }
    
    @Override
    @Transactional
    public void saveFile(NoticeFileVO file) throws Exception {
        try {
            fileDAO.insertFile(file);
        } catch (Exception e) {
            logger.error("파일 정보 저장 중 오류 발생", e);
            throw new NoticeException("파일 정보 저장에 실패했습니다.", e);
        }
    }
    
    @Override
    @Transactional
    public void deleteFile(Long fileId) throws Exception {
        try {
            NoticeFileVO fileVO = fileDAO.selectFile(fileId);
            if (fileVO != null) {
                // 물리적 파일 삭제
                File file = new File(fileVO.getFilePath() + File.separator + fileVO.getStoredName());
                if (file.exists()) {
                    file.delete();
                }
                // DB 데이터 삭제
                fileDAO.deleteFile(fileId);
            }
        } catch (Exception e) {
            logger.error("파일 삭제 중 오류 발생", e);
            throw new NoticeException("파일 삭제에 실패했습니다.", e);
        }
    }
    
    @Override
    public List<NoticeFileVO> getFilesByNoticeId(Long noId) throws Exception {
        return fileDAO.selectFilesByNoticeId(noId);
    }
    
    @Override
    @Transactional
    public void deleteFilesByType(Long noticeId, String fileType) throws Exception {
        try {
            List<NoticeFileVO> files = fileDAO.selectFilesByType(noticeId, fileType);
            for (NoticeFileVO file : files) {
                File physicalFile = new File(file.getFilePath() + File.separator + file.getStoredName());
                if (physicalFile.exists()) {
                    physicalFile.delete();
                }
            }
            fileDAO.deleteFilesByType(noticeId, fileType);
        } catch (Exception e) {
            logger.error("파일 타입별 삭제 중 오류 발생", e);
            throw new NoticeException("파일 삭제에 실패했습니다.", e);
        }
    }
    
    @Override
    @Transactional
    public void deleteFilesByNoticeId(Long noticeId) throws Exception {
        try {
            List<NoticeFileVO> files = fileDAO.selectFilesByNoticeId(noticeId);
            for (NoticeFileVO file : files) {
                File physicalFile = new File(file.getFilePath() + File.separator + file.getStoredName());
                if (physicalFile.exists()) {
                    physicalFile.delete();
                }
            }
            fileDAO.deleteFilesByNoticeId(noticeId);
        } catch (Exception e) {
            logger.error("공지사항 관련 파일 삭제 중 오류 발생", e);
            throw new NoticeException("파일 삭제에 실패했습니다.", e);
        }
    }
    
    // Private helper methods
    private NoticeFileVO processThumbnail(MultipartFile file) throws IOException {
        BufferedImage originalImage = ImageIO.read(file.getInputStream());
        BufferedImage thumbnail = createSquareThumbnail(originalImage);
        
        String thumbnailName = "thumb_" + UUID.randomUUID().toString() + getExtension(file.getOriginalFilename());
        File thumbnailFile = new File(uploadPath + File.separator + thumbnailName);
        
        ImageIO.write(thumbnail, getExtension(file.getOriginalFilename()).substring(1), thumbnailFile);
        
        return createFileVO(file, thumbnailName, thumbnailFile.length(), "THUMBNAIL");
    }
    
    private NoticeFileVO processContentFile(MultipartFile file) throws IOException {
        String storedFileName = "content_" + UUID.randomUUID().toString() + getExtension(file.getOriginalFilename());
        File savedFile = new File(uploadPath + File.separator + storedFileName);
        file.transferTo(savedFile);
        
        return createFileVO(file, storedFileName, savedFile.length(), "CONTENT");
    }
    
    private BufferedImage createSquareThumbnail(BufferedImage original) {
        int width = original.getWidth();
        int height = original.getHeight();
        int thumbSize = 300;
        
        int squareSize = Math.min(width, height);
        int x = (width - squareSize) / 2;
        int y = 0;
        
        BufferedImage cropped = original.getSubimage(x, y, squareSize, squareSize);
        BufferedImage thumbnail = new BufferedImage(thumbSize, thumbSize, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = thumbnail.createGraphics();
        
        g2d.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BICUBIC);
        g2d.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        
        g2d.drawImage(cropped, 0, 0, thumbSize, thumbSize, null);
        g2d.dispose();
        
        return thumbnail;
    }
    
    private NoticeFileVO createFileVO(MultipartFile file, String storedName, long fileSize, String fileType) {
        NoticeFileVO fileVO = new NoticeFileVO();
        fileVO.setOriginalName(file.getOriginalFilename());
        fileVO.setStoredName(storedName);
        fileVO.setFilePath(uploadPath);
        fileVO.setFileSize(fileSize);
        fileVO.setFileType(fileType);
        return fileVO;
    }
    
    private String getExtension(String filename) {
        return filename.substring(filename.lastIndexOf("."));
    }
}