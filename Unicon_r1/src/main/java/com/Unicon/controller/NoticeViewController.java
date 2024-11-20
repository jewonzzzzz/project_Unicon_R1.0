package com.Unicon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeViewController {
    
	// http://localhost:8088/notice
    // 사용자 공지사항 목록 페이지
    @RequestMapping("/notice")
    public String noticeList() {
        return "notice/list";
    }
    
    // 사용자 공지사항 상세 페이지
    @RequestMapping("/notice/detail/{noId}")
    public String noticeDetail(@PathVariable Long noId) {
        return "notice/detail";
    }
    
    // 관리자 공지사항 관리 페이지
    @RequestMapping("/admin/notice")
    public String adminNoticeList() {
        return "noticeAdmin/list";
    }
    
    // 관리자 공지사항 등록/수정 페이지
    @RequestMapping("/admin/notice/form")
    public String adminNoticeForm() {
        return "noticeAdmin/form";
    }
}
