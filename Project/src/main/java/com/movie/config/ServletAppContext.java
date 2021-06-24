package com.movie.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
@EnableWebMvc
@ComponentScan("com.movie.model")
@ComponentScan("com.movie.controller")
@ComponentScan("com.movie.model.board")
@ComponentScan("com.movie.model.member")

public class ServletAppContext implements WebMvcConfigurer {
	//viewResolver
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		WebMvcConfigurer.super.configureViewResolvers(registry);
		registry.jsp("/WEB-INF/views/",".jsp");
	}
	//정적 파일 세팅
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/**").addResourceLocations("/resources/");
		registry.addResourceHandler("/movieProject/**").addResourceLocations("file:///C:/movieproject_image/");
		 registry.addResourceHandler("/summernoteImage/**").addResourceLocations("file:///C:/summernote/");
			registry.addResourceHandler("/miniProject/**").addResourceLocations("file:///C:/miniproject_image/");
	}

@Bean
public StandardServletMultipartResolver multipartResolver() {
   return new StandardServletMultipartResolver();
}
}





