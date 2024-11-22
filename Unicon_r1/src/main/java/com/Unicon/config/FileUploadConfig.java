package com.Unicon.config;

import java.io.File;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Configuration
public class FileUploadConfig {
    
    private static final String UPLOAD_PATH = "C:/uploads/notice";
    
    @Bean
    public CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver resolver = new CommonsMultipartResolver();
        resolver.setMaxUploadSize(10485760); // 10MB
        resolver.setMaxInMemorySize(1048576); // 1MB
        resolver.setDefaultEncoding("UTF-8");
        return resolver;
    }
    
    @Bean
    public String uploadPath() {
        File uploadDirectory = new File(UPLOAD_PATH);
        if (!uploadDirectory.exists()) {
            uploadDirectory.mkdirs();
        }
        return UPLOAD_PATH;
    }
}
