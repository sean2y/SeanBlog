package com.sean.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Blog {

	private Integer blogId;
	private String blogTitle;
	private String blogSummary;
	private Date blogDate;
	private String blogDateStr;
	private String blogContent;
	private Integer blogCount;
	private BlogType blogType;
	private List<Comment> comment = new ArrayList<>();
	
	public Integer getBlogId() {
		return blogId;
	}
	public void setBlogId(Integer blogId) {
		this.blogId = blogId;
	}
	public String getBlogTitle() {
		return blogTitle;
	}
	public void setBlogTitle(String blogTitle) {
		this.blogTitle = blogTitle;
	}
	public String getBlogSummary() {
		return blogSummary;
	}
	public void setBlogSummary(String blogSummary) {
		this.blogSummary = blogSummary;
	}
	public Date getBlogDate() {
		return blogDate;
	}
	public void setBlogDate(Date blogDate) {
		this.blogDate = blogDate;
	}
	public String getBlogContent() {
		return blogContent;
	}
	public void setBlogContent(String blogContent) {
		this.blogContent = blogContent;
	}
	public Integer getBlogCount() {
		return blogCount;
	}
	public void setBlogCount(Integer blogCount) {
		this.blogCount = blogCount;
	}
	public BlogType getBlogType() {
		return blogType;
	}
	public void setBlogType(BlogType blogType) {
		this.blogType = blogType;
	}
	public List<Comment> getComment() {
		return comment;
	}
	public void setComment(List<Comment> comment) {
		this.comment = comment;
	}
	public String getBlogDateStr() {
		return blogDateStr;
	}
	public void setBlogDateStr(String blogDateStr) {
		this.blogDateStr = blogDateStr;
	}
	
	
}
