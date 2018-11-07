package com.sean.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sean.model.Blog;
import com.sean.model.BlogType;
import com.sean.model.Blogger;
import com.sean.service.BlogService;
import com.sean.service.BlogTypeService;
import com.sean.service.BloggerService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/admin/system")
public class SystemController {

	@Autowired
	private BlogService blogService;
	
	@Autowired
	private BlogTypeService blogTypeService;
	
	@Autowired
	private BloggerService bloggerService;
	
	@RequestMapping("/refreshSystemCache")
	@ResponseBody
	public JSONObject refreshSystemCache(HttpServletRequest request) throws ParseException {
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		ServletContext servletContext = request.getSession().getServletContext();
		List<Blog> blogList = this.blogService.listBlogNoPage();
		for (Blog blog : blogList) {
			blog.setBlogDateStr(dateFormat2.format(dateFormat1.parse(blog.getBlogDate().toString())));
		}
		List<BlogType> typeList = this.blogTypeService.listTypeNoPage();
		Blogger blogger = this.bloggerService.getBloggerById();
		servletContext.setAttribute("blogList", blogList);
		servletContext.setAttribute("typeList", typeList);
		servletContext.setAttribute("blogger", blogger);
		JSONObject result = new JSONObject();
		result.put("success", true);
		return result;
	}
}
