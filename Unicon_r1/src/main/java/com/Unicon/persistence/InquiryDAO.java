package com.Unicon.persistence;

import java.util.List;

import com.Unicon.domain.InquiryVO;

public interface InquiryDAO {

	List<InquiryVO> getAllInquiries();
	
	public List<InquiryVO> getBoards(int offset, int limit);
	 
	public int getTotalCount();

	void insertInquiry(InquiryVO inquiry);
}
