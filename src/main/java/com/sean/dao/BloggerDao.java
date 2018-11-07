package com.sean.dao;

import com.sean.model.Blogger;

public interface BloggerDao {

	public void updBlogger(Blogger blogger);
	
	public Blogger getBloggerById();
}
