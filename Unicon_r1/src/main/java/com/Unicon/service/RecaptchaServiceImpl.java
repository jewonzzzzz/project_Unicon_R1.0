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
    
    @Value("${recaptcha.secret.key}")
    private String secretKey;

    private static final Logger logger = LoggerFactory.getLogger(RecaptchaServiceImpl.class);
    
    @Override
    public boolean verify(String recaptchaToken) {
        RestTemplate restTemplate = new RestTemplate();
        try {
            // reCAPTCHA 검증을 위한 URL 생성 (UriComponentsBuilder 사용)
            String url = UriComponentsBuilder.fromHttpUrl(RECAPTCHA_VERIFY_URL)
                    .queryParam("secret", secretKey)  // secret key를 URL에 추가
                    .queryParam("response", recaptchaToken)  // 사용자로부터 받은 reCAPTCHA 토큰을 URL에 추가
                    .toUriString();  // 최종 URL로 변환

            // reCAPTCHA API 호출
            ResponseEntity<String> response = restTemplate.postForEntity(url, null, String.class);

            // 응답 본문을 JSON으로 파싱
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode responseJson = objectMapper.readTree(response.getBody());

            // reCAPTCHA 인증 성공 여부 확인
            boolean success = responseJson.get("success").asBoolean();
            if (success) {
                return true; // 인증 성공
            } else {
                // 실패한 경우 error-codes를 로그로 출력
                logger.error("reCAPTCHA 검증 실패: {}", responseJson.get("error-codes"));
            }

        } catch (Exception e) {
            logger.error("reCAPTCHA 검증 중 오류 발생", e);
        }
        return false; // 인증 실패
    }
}

