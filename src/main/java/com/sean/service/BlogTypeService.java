package com.sean.service;

import java.util.List;
import java.util.Map;

import com.sean.model.BlogType;
import com.sean.model.ChartVo;

public interface BlogTypeService {
	
	public void addType(BlogType blogType);
	
	public void delType(Integer typeId);
	
	public void updType(BlogType blogType);
	
	public List<BlogType> listType(Map<String, Object> map);
	
	public Long getTotal();
	
	public List<BlogType> listTypeNoPage();
	
	public BlogType findTypeById(Integer typeId);
	
	public List<ChartVo> showChart();
}
