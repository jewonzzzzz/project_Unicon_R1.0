package com.Unicon.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.Unicon.domain.InquiryVO;
import com.Unicon.persistence.InquiryDAO;

@Service
public class InquiryServiceImpl implements InquiryService {

	private static final Logger logger = LoggerFactory.getLogger(InquiryServiceImpl.class);

	@Autowired
	private InquiryDAO inquiryDAO;

	private final String uploadDir = "C:/uploads/";

	// 게시글 목록 조회
	public List<InquiryVO> getAllInquiries() {
		return inquiryDAO.getAllInquiries(); // DAO 호출
	}

	public Map<String, Object> getPagedBoards(int page, int size) {
		int offset = (page - 1) * size;
		List<InquiryVO> boards = inquiryDAO.getBoards(offset, size);
		int totalCount = inquiryDAO.getTotalCount();

		Map<String, Object> response = new HashMap<>();
		response.put("boards", boards);
		response.put("totalCount", totalCount);
		response.put("totalPages", (int) Math.ceil((double) totalCount / size));
		response.put("currentPage", page);

		return response;
	}

	// 문의 데이터 삽입
	@Override
	public void insertInquiry(InquiryVO inquiry) {
		logger.debug("문의 작성 전"+inquiry);
		inquiryDAO.insertInquiry(inquiry);
		logger.debug("문의 작성 완료"+inquiry);
	}

	// 파일 저장
	@Override
	public void saveFile(MultipartFile file) throws Exception {
		if (!Files.exists(Paths.get(uploadDir))) {
			Files.createDirectories(Paths.get(uploadDir)); // 폴더 없으면 생성
		}

		Path filePath = Paths.get(uploadDir + file.getOriginalFilename());
		Files.write(filePath, file.getBytes()); // 파일 저장
	}

}
