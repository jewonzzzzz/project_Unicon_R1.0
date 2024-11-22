package com.Unicon.controller;

import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.Unicon.domain.NoticeFileVO;
import com.Unicon.domain.NoticeVO;
import com.Unicon.service.NoticeFileService;
import com.Unicon.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
    
    private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
    
    @Inject
    private NoticeService noService;
    
    @Inject
    private NoticeFileService fileService;
    
    // ======= 사용자 뷰 매핑 =======
    // http://localhost:8088/notice
    
    // 사용자 공지사항 목록
    @GetMapping("")
    public String userList(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "size", defaultValue = "12") int size,
            @RequestParam(value = "category", required = false) String category,
            @RequestParam(value = "keyword", required = false) String keyword,
            Model model) throws Exception {
        
        Map<String, Object> result = noService.getNoticeList(page, size, category, keyword);
        
        model.addAttribute("notices", result.get("boards"));
        model.addAttribute("totalCount", result.get("totalCount"));
        model.addAttribute("page", page);
        model.addAttribute("size", size);
        model.addAttribute("category", category);
        model.addAttribute("keyword", keyword);
        
        return "notice/list"; 
    }
    
    @GetMapping("/{noId}")
    public String userDetail(@PathVariable Long noId, Model model) throws Exception {
        NoticeVO notice = noService.getNotice(noId);
        List<NoticeFileVO> files = fileService.getFilesByNoticeId(noId);
        notice.setFiles(files);
        
        model.addAttribute("notice", notice);
        return "notice/detail"; 
    }
    
    // ======= 관리자 뷰 매핑 =======
    // http://localhost:8088/notice/manage
    
    // 관리자 공지사항 목록
    @GetMapping("/manage")
    public String adminList(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "size", defaultValue = "12") int size,
            @RequestParam(value = "category", required = false) String category,
            @RequestParam(value = "keyword", required = false) String keyword,
            Model model) throws Exception {
            
        Map<String, Object> result = noService.getNoticeList(page, size, category, keyword);
        
        int totalCount = (Integer) result.get("totalCount");
        int totalPages = (int) Math.ceil(totalCount / (double) size);
        
        model.addAttribute("result", result);
        model.addAttribute("boards", result.get("boards"));
        model.addAttribute("page", page);
        model.addAttribute("size", size);
        model.addAttribute("totalPages", totalPages);  
        
        return "notice/manage/list";
    }
    
    @GetMapping("/manage/{noId}")
    public String adminDetail(@PathVariable Long noId, Model model) throws Exception {
        NoticeVO notice = noService.getNotice(noId);
        List<NoticeFileVO> files = fileService.getFilesByNoticeId(noId);
        notice.setFiles(files);
        
        model.addAttribute("notice", notice);
        return "notice/manage/detail"; 
    }
    
    @GetMapping("/manage/form")
    public String adminForm(
            @RequestParam(value = "noId", required = false) Long noId,
            Model model) throws Exception {
        if (noId != null) {
            model.addAttribute("notice", noService.getNotice(noId));
        }
        return "notice/manage/form"; 
    }
    
    @PostMapping("/manage/update/{noId}")
    public String updateAndRedirect(
            @PathVariable("noId") Long noId,
            @RequestParam("noWriter") String noWriter,
            @RequestParam("noTitle") String noTitle,
            @RequestParam("noContent") String noContent,
            @RequestParam("noCategory") String noCategory,
            @RequestParam(value = "important", defaultValue = "false") boolean important,
            @RequestParam(value = "noEmail", defaultValue = "false") boolean noEmail,
            @RequestPart(value = "thumbnail", required = false) MultipartFile thumbnail,
            @RequestPart(value = "files", required = false) MultipartFile[] files) {
        try {
            NoticeVO noVO = new NoticeVO();
            noVO.setNoId(noId);
            noVO.setNoWriter(noWriter);
            noVO.setNoTitle(noTitle);
            noVO.setNoContent(noContent);
            noVO.setNoCategory(noCategory);
            noVO.setImportant(important);
            noVO.setNoEmail(noEmail);
            
            noService.updateNotice(noVO);
            
            if (thumbnail != null && !thumbnail.isEmpty()) {
                fileService.deleteFilesByType(noId, "THUMBNAIL");
                NoticeFileVO thumbnailFile = fileService.uploadFile(thumbnail, "THUMBNAIL");
                thumbnailFile.setNoticeId(noId);
                fileService.saveFile(thumbnailFile);
            }
            
            if (files != null && files.length > 0) {
                fileService.deleteFilesByType(noId, "CONTENT");
                for (MultipartFile file : files) {
                    if (!file.isEmpty()) {
                        NoticeFileVO contentFile = fileService.uploadFile(file, "CONTENT");
                        contentFile.setNoticeId(noId);
                        fileService.saveFile(contentFile);
                    }
                }
            }
            
            return "redirect:/notice/manage";
            
        } catch (Exception e) {
            logger.error("공지사항 수정 실패", e);
            return "redirect:/notice/manage/form?noId=" + noId;
        }
    }
    
    // ======= REST API 엔드포인트 =======
    
    @PostMapping("/api")
    @ResponseBody
    public ResponseEntity<String> register(
    		@RequestParam("noWriter") String noWriter,
            @RequestParam("noTitle") String noTitle,
            @RequestParam("noContent") String noContent,
            @RequestParam("noCategory") String noCategory,
            @RequestParam(value = "important", defaultValue = "false") boolean important,
            @RequestParam(value = "noEmail", defaultValue = "false") boolean noEmail,
            @RequestPart(value = "thumbnail", required = false) MultipartFile thumbnail,
            @RequestPart(value = "files", required = false) MultipartFile[] files) {
        try {
            // 1. 공지사항 기본 정보 저장
            NoticeVO noVO = new NoticeVO();
            noVO.setNoWriter(noWriter);
            noVO.setNoTitle(noTitle);
            noVO.setNoContent(noContent);
            noVO.setNoCategory(noCategory);
            noVO.setImportant(important);
            noVO.setNoEmail(noEmail);
            
            noService.registerNotice(noVO);
            
            // 2. 파일 처리
            if (thumbnail != null && !thumbnail.isEmpty()) {
                NoticeFileVO thumbnailFile = fileService.uploadFile(thumbnail, "THUMBNAIL");
                thumbnailFile.setNoticeId(noVO.getNoId());
                fileService.saveFile(thumbnailFile);
            }
            
            if (files != null && files.length > 0) {
                for (MultipartFile file : files) {
                    if (!file.isEmpty()) {
                        NoticeFileVO contentFile = fileService.uploadFile(file, "CONTENT");
                        contentFile.setNoticeId(noVO.getNoId());
                        fileService.saveFile(contentFile);
                    }
                }
            }
            
            return new ResponseEntity<>("등록 성공", HttpStatus.CREATED);
        } catch (Exception e) {
            logger.error("공지사항 등록 실패", e);
            return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/api/{noId}/update")
    @ResponseBody
    public ResponseEntity<String> update(
            @PathVariable("noId") Long noId,
            @RequestParam("noWriter") String noWriter,
            @RequestParam("noTitle") String noTitle,
            @RequestParam("noContent") String noContent,
            @RequestParam("noCategory") String noCategory,
            @RequestParam(value = "important", defaultValue = "false") boolean important,
            @RequestParam(value = "noEmail", defaultValue = "false") boolean noEmail,
            @RequestPart(value = "thumbnail", required = false) MultipartFile thumbnail,
            @RequestPart(value = "files", required = false) MultipartFile[] files) {
        try {
            NoticeVO noVO = new NoticeVO();
            noVO.setNoId(noId);
            noVO.setNoWriter(noWriter);
            noVO.setNoTitle(noTitle);
            noVO.setNoContent(noContent);
            noVO.setNoCategory(noCategory);
            noVO.setImportant(important);
            noVO.setNoEmail(noEmail);
            
            noService.updateNotice(noVO);
            
            if (thumbnail != null && !thumbnail.isEmpty()) {
                fileService.deleteFilesByType(noId, "THUMBNAIL");
                NoticeFileVO thumbnailFile = fileService.uploadFile(thumbnail, "THUMBNAIL");
                thumbnailFile.setNoticeId(noId);
                fileService.saveFile(thumbnailFile);
            }
            
            if (files != null && files.length > 0) {
                fileService.deleteFilesByType(noId, "CONTENT");
                for (MultipartFile file : files) {
                    if (!file.isEmpty()) {
                        NoticeFileVO contentFile = fileService.uploadFile(file, "CONTENT");
                        contentFile.setNoticeId(noId);
                        fileService.saveFile(contentFile);
                    }
                }
            }
            
            return new ResponseEntity<>("수정 성공", HttpStatus.OK);
        } catch (Exception e) {
            logger.error("공지사항 수정 실패", e);
            return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @RequestMapping(value = "/api/{noId}", method = RequestMethod.DELETE)
    @ResponseBody
    public ResponseEntity<String> delete(@PathVariable("noId") Long noId) {
        try {
            fileService.deleteFilesByNoticeId(noId);
            noService.deleteNotice(noId);
            return new ResponseEntity<>("삭제 성공", HttpStatus.OK);
        } catch (Exception e) {
            logger.error("공지사항 삭제 실패", e);
            return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @RequestMapping(value = "/api/file/{fileId}", method = RequestMethod.DELETE)
    @ResponseBody
    public ResponseEntity<String> deleteFile(@PathVariable Long fileId) {
        try {
            fileService.deleteFile(fileId);
            return new ResponseEntity<>("파일 삭제 성공", HttpStatus.OK);
        } catch (Exception e) {
            logger.error("파일 삭제 실패", e);
            return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}