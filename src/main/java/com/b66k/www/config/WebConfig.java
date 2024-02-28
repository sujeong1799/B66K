package com.b66k.www.config;

import java.util.UUID;

import javax.servlet.Filter;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.context.annotation.Bean;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class WebConfig extends AbstractAnnotationConfigDispatcherServletInitializer{

	@Override
	protected Class<?>[] getRootConfigClasses() {
		// TODO Auto-generated method stub
		return new Class[] {RootConfig.class, SecurityConfig.class};
		}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		// TODO Auto-generated method stub
		return new Class[] {ServletConfiguration.class};
	}

	@Override
	protected String[] getServletMappings() {
		// HomeController의 "/"에 반응하여 이동
		return new String[] {"/"};
	}

	@Override
	protected Filter[] getServletFilters() {
		// 인코딩 필터(utf-8로 설정하기 위함)
		CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
		encodingFilter.setEncoding("UTF-8"); // 들어오는 값 인코딩해서 들어옴
		encodingFilter.setForceEncoding(true); // 나가는 값도 인코딩해서 나감
		return new Filter[] {encodingFilter};
	}

	@Override
	protected void customizeRegistration(Dynamic registration) {
		// 파일첨부 기능 구현할때 사용
		// throwExceptionIfNotHandlerFound 존재하지 않는 API요청(핸들러)에 대한 응답
		registration.setInitParameter("throwExceptionIfNotHandlerFound", "true");
		
		//파일 첨부
		String uploadLocation = "D:\\_b66k\\fileUpload";
		int maxFileSize = 1024*1024*20; // 올릴 수 있는 파일 사이즈 2M
		int maxRequestSize = maxFileSize*5; // 파일 업로드 요청 최대 크기
		int fileSizeThreshold = maxFileSize; // 파일 전송시 만들어지는 임시공간
		MultipartConfigElement multipartConfigElement = new MultipartConfigElement
				(uploadLocation, maxFileSize, maxRequestSize, fileSizeThreshold);
		registration.setMultipartConfig(multipartConfigElement);
	}

	
	
}
