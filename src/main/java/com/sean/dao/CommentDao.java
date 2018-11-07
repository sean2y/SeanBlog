package com.sean.dao;

import java.util.List;
import java.util.Map;

import com.sean.model.Comment;

public interface CommentDao {

	public void addComment(Comment comment);
	
	public void delComment(Integer commentId);
	
	public void delCommentByBlogId(Integer blogId);
	
	public void updCommentState(Comment comment);
	
	public List<Comment> listComment(Map<String, Object> map);
	
	public List<Comment> listCommented(Map<String, Object> map);
	
	public List<Comment> listCommentByBlogId(Integer blogId);

	public Long getCommentTotal();
	
	public Long getCommentedTotal();
	
	public Long getCommentTotalByBlogId(Integer blogId);
	
	public List<Comment> listCommentsByBlogId(Integer blogId);
}
