package com.sean.service;

import java.util.List;
import java.util.Map;

import com.sean.model.Blog;

public interface BlogService {
	public void addBlog(Blog blog);

	public void delBlog(Integer blogId);

	public void updBlog(Blog blog);

	public List<Blog> listBlog(Map<String, Object> map);

	public Long getTotal();

	public List<Blog> listBlogNoPage();

	public Integer getBlogByTypeId(Integer typeId);

	public Blog getBlogById(Integer blogId);
	
	public List<Blog> findBlogByTitle(String blogTitle);
	
	public Long getFindBlogTotal(String blogTitle);
	
	public List<Blog> listBlogByTypeId(Integer typeId);
}
