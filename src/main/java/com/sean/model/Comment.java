package com.sean.model;

import java.util.Date;

public class Comment {

	private Integer commentId;
	private String commenterName;
	private String commentContent;
	private String commentDateStr;
	private Date commentDate;
	private Integer commentState;
	private Blog blog;
	public Integer getCommentId() {
		return commentId;
	}
	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}
	public String getCommenterName() {
		return commenterName;
	}
	public void setCommenterName(String commenterName) {
		this.commenterName = commenterName;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	public Integer getCommentState() {
		return commentState;
	}
	public void setCommentState(Integer commentState) {
		this.commentState = commentState;
	}
	public Blog getBlog() {
		return blog;
	}
	public void setBlog(Blog blog) {
		this.blog = blog;
	}
	public String getCommentDateStr() {
		return commentDateStr;
	}
	public void setCommentDateStr(String commentDateStr) {
		this.commentDateStr = commentDateStr;
	}
	
	
}
