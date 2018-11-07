package com.sean.model;

import java.util.ArrayList;
import java.util.List;

public class BlogType {

	private Integer typeId;
	private String typeImage;
	private String typeName;
	private Integer typeOrderNum;
	private List<Blog> blogs = new ArrayList<>();
	
	
	public String getTypeImage() {
		return typeImage;
	}
	public void setTypeImage(String typeImage) {
		this.typeImage = typeImage;
	}
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public Integer getTypeOrderNum() {
		return typeOrderNum;
	}
	public void setTypeOrderNum(Integer typeOrderNum) {
		this.typeOrderNum = typeOrderNum;
	}
	public List<Blog> getBlogs() {
		return blogs;
	}
	public void setBlogs(List<Blog> blogs) {
		this.blogs = blogs;
	}
	
}
