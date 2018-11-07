package com.sean.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sean.model.Blog;
import com.sean.model.BlogType;
import com.sean.model.Comment;
import com.sean.service.BlogService;
import com.sean.service.BlogTypeService;
import com.sean.service.CommentService;

@Controller
@RequestMapping("/blog")
public class ShowController {

	@Autowired
	private BlogService blogService;
	
	@Autowired
	private CommentService commentService; 
	
	@Autowired
	private BlogTypeService blogTypeService;
	
	@RequestMapping("/articles/{blogId}")
	public ModelAndView details(@PathVariable(value="blogId") Integer blogId) throws ParseException {
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Blog blog = this.blogService.getBlogById(blogId);
		blog.setBlogDateStr(dateFormat2.format(dateFormat1.parse(blog.getBlogDate().toString())));
		List<Comment> commentList = this.commentService.listCommentByBlogId(blogId);
		for (Comment comment : commentList) {
			comment.setCommentDateStr(dateFormat2.format(dateFormat1.parse(comment.getCommentDate().toString())));
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("blog", blog);
		mav.addObject("commentList", commentList);
		mav.setViewName("blogDetail");
		return mav;
	}
	@RequestMapping("/category/{typeId}")
	public ModelAndView typeDetils(@PathVariable(value="typeId") Integer typeId) throws ParseException {
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<Blog> list = this.blogService.listBlogByTypeId(typeId);
		for (Blog blog : list) {
			blog.setBlogDateStr(dateFormat2.format(dateFormat1.parse(blog.getBlogDate().toString())));
		}
		BlogType blogType = this.blogTypeService.findTypeById(typeId);
		ModelAndView mav = new ModelAndView();
		mav.addObject("blogByTypeList", list);
		mav.addObject("typeName", blogType.getTypeName());
		mav.setViewName("categoryDetail");
		return mav;
	}
}
