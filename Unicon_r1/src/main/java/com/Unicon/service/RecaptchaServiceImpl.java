package com.Unicon.service;


import java.util.HashMap;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class RecaptchaServiceImpl implements RecaptchaService {

    private static final String RECAPTCHA_VERIFY_URL = "https://www.google.com/recaptcha/api/siteverify";
    
   
    @Value("6LeEYooqAAAAAOggttPuqtDJxI-yFaW0-eQ2RN1P")
    private String secretKey;

  
    private static final Logger logger = LoggerFactory.getLogger(RecaptchaServiceImpl.class);

    @Override
    public boolean verify(String recaptchaToken) {
        if (recaptchaToken == null || recaptchaToken.isEmpty()) {
            logger.error("reCAPTCHA 응답 토큰이 비어 있습니다.");
            return false;
        }
        	
        
        RestTemplate restTemplate = new RestTemplate();
        try {
            String url = UriComponentsBuilder.fromHttpUrl(RECAPTCHA_VERIFY_URL)
                    .queryParam("secret", secretKey)                    
                    .queryParam("response", recaptchaToken)
                    .toUriString();
            logger.debug("secret : "+secretKey);

            ResponseEntity<String> response = restTemplate.postForEntity(url, null, String.class);
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode responseJson = objectMapper.readTree(response.getBody());

            boolean success = responseJson.get("success").asBoolean();
            if (success) {
                return true;
            } else {
                logger.error("reCAPTCHA 검증 실패: {}", responseJson.get("error-codes"));
            }
        } catch (Exception e) {
            logger.error("reCAPTCHA 검증 중 오류 발생", e);
        }
        return false;
    }
}

