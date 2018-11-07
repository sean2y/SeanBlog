package com.sean.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sean.dao.CommentDao;
import com.sean.model.Comment;
import com.sean.service.CommentService;

@Service("commentService")
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDao commentDao;
	
	@Override
	public void addComment(Comment comment) {
		// TODO Auto-generated method stub
		this.commentDao.addComment(comment);
	}

	@Override
	public void delComment(Integer commentId) {
		// TODO Auto-generated method stub
		this.commentDao.delComment(commentId);
	}

	@Override
	public void updCommentState(Comment comment) {
		// TODO Auto-generated method stub
		this.commentDao.updCommentState(comment);
	}

	@Override
	public List<Comment> listComment(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.commentDao.listComment(map);
	}

	@Override
	public List<Comment> listCommented(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.commentDao.listCommented(map);
	}

	@Override
	public Long getCommentTotal() {
		// TODO Auto-generated method stub
		return this.commentDao.getCommentTotal();
	}

	@Override
	public Long getCommentedTotal() {
		// TODO Auto-generated method stub
		return this.commentDao.getCommentedTotal();
	}

	@Override
	public List<Comment> listCommentByBlogId(Integer blogId) {
		// TODO Auto-generated method stub
		return this.commentDao.listCommentByBlogId(blogId);
	}


	@Override
	public List<Comment> listCommentsByBlogId(Integer blogId) {
		// TODO Auto-generated method stub
		return this.commentDao.listCommentByBlogId(blogId);
	}

	@Override
	public Long getCommentTotalByBlogId(Integer blogId) {
		// TODO Auto-generated method stub
		return this.commentDao.getCommentTotalByBlogId(blogId);
	}

	@Override
	public void delCommentByBlogId(Integer blogId) {
		// TODO Auto-generated method stub
		this.commentDao.delCommentByBlogId(blogId);
	}

}
