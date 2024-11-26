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

import com.Unicon.domain.AnimalHealthVO;
import com.Unicon.domain.AdptVO;
import com.Unicon.domain.AnimalVaccineVO;
import com.Unicon.domain.ImageVO;
import com.Unicon.service.AdptService;

import lombok.extern.log4j.Log4j2;


@RestController
@Log4j2
@RequestMapping("/adptmgmt/**")
public class AdptRestController {
	
	@Inject
	AdptService aService;

	
}
