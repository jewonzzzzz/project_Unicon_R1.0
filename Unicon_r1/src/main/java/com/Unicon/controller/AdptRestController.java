package com.Unicon.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.Unicon.domain.AdptHealthVO;
import com.Unicon.domain.AdptVO;
import com.Unicon.domain.AdptVaccineVO;
import com.Unicon.domain.ImageVO;
import com.Unicon.service.AdptService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/adptmgmt/**")
public class AdptRestController {
	
	@Inject
	AdptService aService;
	
	
	/*
	@PostMapping("")
	public ResponseEntity<String> adptInsert(AdptVO adptVO) {
		log.info("( •̀ ω •́ )✧ adptInsert() 실행");
		log.info("( •̀ ω •́ )✧ adptVO : "+adptVO);
		
		List<ImageVO> images = adptVO.getAdpt_images();
		if (images == null) {
		    images = new ArrayList<ImageVO>();
		    adptVO.setAdpt_images(images);
		}
		List<AdptHealthVO> healths = adptVO.getAdpt_healths();
		if (healths == null) {
			healths = new ArrayList<AdptHealthVO>();
		    adptVO.setAdpt_healths(healths);
		}
		List<AdptVaccineVO> vaccines = adptVO.getAdpt_vaccines();
		if (vaccines == null) {
			vaccines = new ArrayList<AdptVaccineVO>();
		    adptVO.setAdpt_vaccines(vaccines);
		}
		
		
		for(int i = 1; i < 6; i++) {
			ImageVO imageVO = new ImageVO();
			imageVO.setImage_id("입양이미지테스트id");
			imageVO.setImage_type("입양이미지종류테스트");
			imageVO.setImage_src("입양이미지경로테스트");
			imageVO.setImage_sequence(i);
			images.add(imageVO);
		}
		for(int i = 1; i < 6; i++) {
			AdptHealthVO healthVO = new AdptHealthVO();
			healthVO.setAdpt_id(adptVO.getAdpt_id());
			healthVO.setHealth("검진정보테스트");
			healthVO.setHealth_check("검진정보확인테스트");
			healths.add(healthVO);
		}
		for(int i = 1; i < 6; i++) {
			AdptVaccineVO vaccineVO = new AdptVaccineVO();
			vaccineVO.setAdpt_id(adptVO.getAdpt_id());
			vaccineVO.setVaccine("접종정보테스트");
			vaccineVO.setVaccine_check("접종정보확인테스트");
			vaccines.add(vaccineVO);
		}
		
		aService.adptInsert(adptVO);
		return new ResponseEntity<String>("입력완료",HttpStatus.OK);
		
	}
	*/

	
}
