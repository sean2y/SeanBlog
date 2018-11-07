package com.sean.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sean.dao.BlogTypeDao;
import com.sean.model.BlogType;
import com.sean.model.ChartVo;
import com.sean.service.BlogTypeService;

@Service("blogTypeService")
public class BlogTypeServiceImpl implements BlogTypeService {

	@Autowired
	private BlogTypeDao blogTypeDao;
	
	@Override
	public void addType(BlogType blogType) {
		// TODO Auto-generated method stub
		this.blogTypeDao.addType(blogType);
	}

	@Override
	public void delType(Integer typeId) {
		// TODO Auto-generated method stub
		this.blogTypeDao.delType(typeId);
	}

	@Override
	public void updType(BlogType blogType) {
		// TODO Auto-generated method stub
		this.blogTypeDao.updType(blogType);
	}

	@Override
	public List<BlogType> listType(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.blogTypeDao.listType(map);
	}

	@Override
	public Long getTotal() {
		// TODO Auto-generated method stub
		return this.blogTypeDao.getTotal();
	}

	@Override
	public List<BlogType> listTypeNoPage() {
		// TODO Auto-generated method stub
		return this.blogTypeDao.listTypeNoPage();
	}

	@Override
	public BlogType findTypeById(Integer typeId) {
		// TODO Auto-generated method stub
		return this.blogTypeDao.findTypeById(typeId);
	}

	@Override
	public List<ChartVo> showChart() {
		// TODO Auto-generated method stub
		return this.blogTypeDao.showChart();
	}


}
