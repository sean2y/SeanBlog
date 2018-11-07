package com.sean.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sean.dao.BloggerDao;
import com.sean.model.Blogger;
import com.sean.service.BloggerService;

@Service("bloggerService")
public class BloggerServiceImpl implements BloggerService {

	@Autowired
	private BloggerDao bloggerDao;

	@Override
	public void updBlogger(Blogger blogger) {
		// TODO Auto-generated method stub
		this.bloggerDao.updBlogger(blogger);
	}

	@Override
	public Blogger getBloggerById() {
		// TODO Auto-generated method stub
		return this.bloggerDao.getBloggerById();
	}
	
	

}
