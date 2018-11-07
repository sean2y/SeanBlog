package com.sean.listener;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sean.model.Blog;
import com.sean.model.BlogType;
import com.sean.model.Blogger;
import com.sean.service.BlogService;
import com.sean.service.BlogTypeService;
import com.sean.service.BloggerService;

public class InitBlogData implements ServletContextListener, ApplicationContextAware {

	private static ApplicationContext applicationContext;
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		// TODO Auto-generated method stub
		this.applicationContext = applicationContext;
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		applicationContext = new ClassPathXmlApplicationContext("classpath:spring-mybatis.xml");
		ServletContext servletContext = sce.getServletContext();
		BlogTypeService typeService = applicationContext.getBean(BlogTypeService.class);
		List<BlogType> typeList = typeService.listTypeNoPage();
		servletContext.setAttribute("typeList", typeList);
		BlogService blogService = applicationContext.getBean(BlogService.class);
		List<Blog> blogList = blogService.listBlogNoPage();
		for (Blog blog : blogList) {
			try {
				blog.setBlogDateStr(dateFormat2.format(dateFormat1.parse(blog.getBlogDate().toString())));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		servletContext.setAttribute("blogList", blogList);
		BloggerService bloggerService = applicationContext.getBean(BloggerService.class);
		Blogger blogger = bloggerService.getBloggerById();
		servletContext.setAttribute("blogger", blogger);
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
	}

}
