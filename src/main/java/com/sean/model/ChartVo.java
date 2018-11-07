package com.sean.model;


public class ChartVo {

	private String typeName;
	private int blogNum;
	
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public int getBlogNum() {
		return blogNum;
	}
	public void setBlogNum(int blogNum) {
		this.blogNum = blogNum;
	}
	@Override
	public String toString() {
		return "ChartVo [typeName=" + typeName + ", blogNum=" + blogNum + "]";
	}
	
	
	
}
