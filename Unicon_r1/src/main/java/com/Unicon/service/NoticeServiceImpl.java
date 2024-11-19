package com.Unicon.service;

import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.Unicon.controller.NoticeController;
import com.Unicon.domain.NoticeFileVO;
import com.Unicon.domain.NoticeVO;
import com.Unicon.persistence.NoticeDAO;
import com.Unicon.persistence.NoticeFileDAO;
import com.Unicon.exception.NoticeException;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	private static final Logger logger 
					= LoggerFactory.getLogger(NoticeServiceImpl.class);
    
	@Value("${file.upload.path}")
    private String uploadPath;
    
	@Inject
    private NoticeDAO noDAO;
    
    @Inject 
    private NoticeFileDAO fileDAO;
    
    @Override
    @Transactional
    public void registerNotice(NoticeVO noVO, MultipartFile thumbnail, MultipartFile[] contentFiles) throws Exception {
        try {
            // 1. 공지사항 등록
            noDAO.insertNotice(noVO);
            
            List<NoticeFileVO> fileList = new ArrayList<>();
            
            // 2. 썸네일 처리
            if (thumbnail != null && !thumbnail.isEmpty()) {
                // 사용자가 지정한 썸네일 처리
                NoticeFileVO thumbnailFile = processThumbnail(thumbnail);
                thumbnailFile.setNoticeId(noVO.getNoId());
                thumbnailFile.setFileType("THUMBNAIL");
                fileDAO.insertFile(thumbnailFile);
                fileList.add(thumbnailFile);
            }
            
            // 3. 본문 이미지 처리작업
            if (contentFiles != null && contentFiles.length > 0) {
                for (MultipartFile contentFile : contentFiles) {
                    if (contentFile.getContentType().startsWith("image/")) {
                        // 본문 이미지 저장
                        NoticeFileVO contentFileVO = processContentImage(contentFile);
                        contentFileVO.setNoticeId(noVO.getNoId());
                        contentFileVO.setFileType("CONTENT");
                        fileDAO.insertFile(contentFileVO);
                        fileList.add(contentFileVO);
                        
                        // 썸네일이 없는 경우 첫 번째 이미지로 썸네일 자동 생성
                        if (thumbnail == null && fileList.stream().noneMatch(f -> "THUMBNAIL".equals(f.getFileType()))) {
                        	NoticeFileVO autoThumbFile = generateThumbnailFromContent(contentFile);
                            autoThumbFile.setNoticeId(noVO.getNoId());
                            autoThumbFile.setFileType("THUMBNAIL");
                            fileDAO.insertFile(autoThumbFile);
                            fileList.add(autoThumbFile);
                        }
                    }
                }
            }
            
            noVO.setFiles(fileList);
            
            // 이메일 발송 (광고성 정보 수신 동의한 사용자에게)
            if (noVO.isImportant()) {
                // emailService.sendNotification(noVO);
            }
                   
        } catch (Exception e) {
            logger.info("공지사항 등록 중 오류 발생", e);
            throw new NoticeException("공지사항 등록에 실패했습니다.", e);
        }
    }
    
    // 썸네일 이미지 처리
    private NoticeFileVO processThumbnail(MultipartFile file) throws IOException {
        BufferedImage originalImage = ImageIO.read(file.getInputStream());
        BufferedImage thumbnail = createSquareThumbnail(originalImage);
        
        String thumbnailName = "thumb_" + UUID.randomUUID().toString() + getExtension(file.getOriginalFilename());
        File thumbnailFile = new File(uploadPath + File.separator + thumbnailName);
        
        ImageIO.write(thumbnail, getExtension(file.getOriginalFilename()).substring(1), thumbnailFile);
        
        return createFileVO(file, thumbnailName, thumbnailFile.length(), "THUMBNAIL");
    }
    
    // 본문 이미지 처리
    private NoticeFileVO processContentImage(MultipartFile file) throws IOException {
        String storedFileName = "content_" + UUID.randomUUID().toString() + getExtension(file.getOriginalFilename());
        File savedFile = new File(uploadPath + File.separator + storedFileName);
        file.transferTo(savedFile);
        
        return createFileVO(file, storedFileName, savedFile.length(), "CONTENT");
    }
    
    // 본문 이미지로부터 썸네일 생성
    private NoticeFileVO generateThumbnailFromContent(MultipartFile file) throws IOException {
        BufferedImage originalImage = ImageIO.read(file.getInputStream());
        BufferedImage thumbnail = createSquareThumbnail(originalImage);
        
        String thumbnailName = "auto_thumb_" + UUID.randomUUID().toString() + getExtension(file.getOriginalFilename());
        File thumbnailFile = new File(uploadPath + File.separator + thumbnailName);
        
        ImageIO.write(thumbnail, getExtension(file.getOriginalFilename()).substring(1), thumbnailFile);
        
        return createFileVO(file, thumbnailName, thumbnailFile.length(), "THUMBNAIL");
    }
    
    // 정사각형 썸네일 생성
    private BufferedImage createSquareThumbnail(BufferedImage original) {
        int width = original.getWidth();
        int height = original.getHeight();
        int thumbSize = 300;  // 썸네일 크기
        
        // 정사각형으로 자를 영역 계산
        int squareSize = Math.min(width, height);
        int x = (width - squareSize) / 2;
        int y = 0;  // 상단부터 시작
        
        // 이미지 자르기
        BufferedImage cropped = original.getSubimage(x, y, squareSize, squareSize);
        
        // 썸네일 크기로 리사이징
        BufferedImage thumbnail = new BufferedImage(thumbSize, thumbSize, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = thumbnail.createGraphics();
        
        // 이미지 품질 설정
        g2d.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BICUBIC);
        g2d.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        
        g2d.drawImage(cropped, 0, 0, thumbSize, thumbSize, null);
        g2d.dispose();
        
        return thumbnail;
    }
    
    // FileVO 생성
    private NoticeFileVO createFileVO(MultipartFile file, String storedName, long fileSize, String fileType) {
        NoticeFileVO fileVO = new NoticeFileVO();
        fileVO.setOriginalName(file.getOriginalFilename());
        fileVO.setStoredName(storedName);
        fileVO.setFilePath(uploadPath);
        fileVO.setFileSize(fileSize);
        fileVO.setFileType(fileType);
        return fileVO;
    }
    
    // 파일 확장자 추출
    private String getExtension(String filename) {
        return filename.substring(filename.lastIndexOf("."));
    }
    
    @Override
    @Transactional
    public Map<String, Object> getNoticeList(int page, int size, String category, String keyword) throws Exception {
        // 페이징 처리
        int start = (page - 1) * size;
        
        // 검색 조건 설정
        Map<String, Object> params = new HashMap<>();
        params.put("start", start);
        params.put("size", size);
        params.put("category", category);
        params.put("keyword", keyword);
        params.put("status", "ACTIVE");  // 삭제되지 않은 게시글만 조회
        
        // 게시글 목록 조회
        List<NoticeVO> notice = noDAO.selectNoticeList(params);
        int totalCount = noDAO.selectNoticeCount(params);
        
        // 결과 맵 생성
        Map<String, Object> result = new HashMap<>();
        result.put("boards", notice);
        result.put("totalCount", totalCount);
        result.put("hasMore", (start + size) < totalCount);
        
        return result;
    }
    
    @Override
    @Transactional
    public void updateNotice(NoticeVO noVO, MultipartFile thumbnail, MultipartFile[] contentFiles) throws Exception {
        try {
            // 1. 기존 공지사항 조회
            NoticeVO existingNotice = noDAO.selectNotice(noVO.getNoId());
            if (existingNotice == null) {
                throw new NoticeException("존재하지 않는 공지사항입니다.");
            }

            // 2. 공지사항 기본 정보 업데이트
            noDAO.updateNotice(noVO);

            // 3. 새로운 썸네일이 있는 경우
            if (thumbnail != null && !thumbnail.isEmpty()) {
                // 기존 썸네일 삭제
                fileDAO.deleteFilesByType(noVO.getNoId(), "THUMBNAIL");
                // 새 썸네일 추가
                NoticeFileVO thumbnailFile = processThumbnail(thumbnail);
                thumbnailFile.setNoticeId(noVO.getNoId());
                thumbnailFile.setFileType("THUMBNAIL");
                fileDAO.insertFile(thumbnailFile);
            }

            // 4. 새로운 컨텐츠 파일이 있는 경우
            if (contentFiles != null && contentFiles.length > 0) {
                // 기존 컨텐츠 파일 삭제
                fileDAO.deleteFilesByType(noVO.getNoId(), "CONTENT");
                
                for (MultipartFile contentFile : contentFiles) {
                    if (contentFile.getContentType().startsWith("image/")) {
                        NoticeFileVO contentFileVO = processContentImage(contentFile);
                        contentFileVO.setNoticeId(noVO.getNoId());
                        contentFileVO.setFileType("CONTENT");
                        fileDAO.insertFile(contentFileVO);
                    }
                }
            }
        } catch (Exception e) {
            logger.error("공지사항 수정 중 오류 발생", e);
            throw new NoticeException("공지사항 수정에 실패했습니다.", e);
        }
    }

    @Override
    @Transactional
    public void deleteNotice(Long noId) throws Exception {
        try {
            // 1. 파일 삭제
            List<NoticeFileVO> files = fileDAO.selectFilesByNoticeId(noId);
            for (NoticeFileVO file : files) {
                File physicalFile = new File(file.getFilePath() + File.separator + file.getStoredName());
                if (physicalFile.exists()) {
                    physicalFile.delete();
                }
            }
            fileDAO.deleteFilesByNoticeId(noId);

            // 2. 공지사항 상태 업데이트 (실제 삭제가 아닌 상태 변경)
            noDAO.updateStatus(noId, "DELETED");
        } catch (Exception e) {
            logger.error("공지사항 삭제 중 오류 발생", e);
            throw new NoticeException("공지사항 삭제에 실패했습니다.", e);
        }
    }

    @Override
    @Transactional
    public NoticeVO getNotice(Long noId) throws Exception {
        try {
            // 1. 조회수 증가
            noDAO.updateViewCount(noId);

            // 2. 공지사항 조회 (파일 정보 포함)
            NoticeVO notice = noDAO.selectNotice(noId);
            if (notice == null) {
                throw new NoticeException("존재하지 않는 공지사항입니다.");
            }

            // 3. 파일 정보 조회 및 설정
            List<NoticeFileVO> files = fileDAO.selectFilesByNoticeId(noId);
            notice.setFiles(files);

            return notice;
        } catch (Exception e) {
            logger.error("공지사항 조회 중 오류 발생", e);
            throw new NoticeException("공지사항 조회에 실패했습니다.", e);
        }
    }
   
}