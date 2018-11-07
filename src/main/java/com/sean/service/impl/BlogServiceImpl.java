package com.sean.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sean.dao.BlogDao;
import com.sean.model.Blog;
import com.sean.service.BlogService;

@Service("blogService")
public class BlogServiceImpl implements BlogService {

	@Autowired
	private BlogDao blogDao;
	
	@Override
	public void addBlog(Blog blog) {
		// TODO Auto-generated method stub
		this.blogDao.addBlog(blog);
	}

	@Override
	public void delBlog(Integer blogId) {
		// TODO Auto-generated method stub
		this.blogDao.delBlog(blogId);
	}

	@Override
	public void updBlog(Blog blog) {
		// TODO Auto-generated method stub
		this.blogDao.updBlog(blog);
	}

	@Override
	public List<Blog> listBlog(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.blogDao.listBlog(map);
	}

	@Override
	public Long getTotal() {
		// TODO Auto-generated method stub
		return this.blogDao.getTotal();
	}

	@Override
	public List<Blog> listBlogNoPage() {
		// TODO Auto-generated method stub
		return this.blogDao.listBlogNoPage();
	}

	@Override
	public Integer getBlogByTypeId(Integer typeId) {
		// TODO Auto-generated method stub
		return this.blogDao.getBlogByTypeId(typeId);
	}

	@Override
	public Blog getBlogById(Integer blogId) {
		// TODO Auto-generated method stub
		return this.blogDao.getBlogById(blogId);
	}

	@Override
	public List<Blog> findBlogByTitle(String blogTitle) {
		// TODO Auto-generated method stub
		return this.blogDao.findBlogByTitle(blogTitle);
	}

	@Override
	public Long getFindBlogTotal(String blogTitle) {
		// TODO Auto-generated method stub
		return this.blogDao.getFindBlogTotal(blogTitle);
	}

	@Override
	public List<Blog> listBlogByTypeId(Integer typeId) {
		// TODO Auto-generated method stub
		return this.blogDao.listBlogByTypeId(typeId);
	}

}
