package com.sean.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sean.model.Blog;
import com.sean.model.BlogType;
import com.sean.model.PageBean;
import com.sean.service.BlogService;
import com.sean.service.BlogTypeService;
import com.sean.service.CommentService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

@Controller
@RequestMapping("/admin/blog")
public class BlogController {

	private static Logger log = LoggerFactory.getLogger(BlogController.class);
	
	@Autowired
	private BlogService blogService;
	
	@Autowired
	private BlogTypeService typeService;
	
	@Autowired
	private CommentService CommentService;
	
	@RequestMapping("/listBlog")
	@ResponseBody
	public JSONObject listBlog(@RequestParam(value="page",required=false) String page,
							   @RequestParam(value="rows",required=false) String rows,
							   @RequestParam(value="blogTitle",required=false) String blogTitle) {
		PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String, Object> map = new HashMap<>();
		map.put("start", pageBean.getPage());		
		map.put("pageSize", pageBean.getPageSize());
		List<Blog> list = new ArrayList<>();
		Long total = 0l;
		if(blogTitle != null) {
			list = this.blogService.findBlogByTitle(blogTitle);
			total = this.blogService.getFindBlogTotal(blogTitle);
		}else {
			list = this.blogService.listBlog(map);
			total = this.blogService.getTotal();
		}
		JSONObject result = new JSONObject();
		JsonConfig jsonConfig = new JsonConfig();
		
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonValueProcessor() {

			private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			@Override
			public Object processArrayValue(Object date, JsonConfig jsonConfig) {
				// TODO Auto-generated method stub
				return dateFormat.format(date);
			}
			@Override
			public Object processObjectValue(String arg0, Object date, JsonConfig jsonConfig) {
				// TODO Auto-generated method stub
				return dateFormat.format(date);
			}});
		
		JSONArray jsonArray = JSONArray.fromObject(list, jsonConfig);
		result.put("rows", jsonArray);
		result.put("total", total);
		return result;
	}
	
	@RequestMapping("/addBlog")
	@ResponseBody
	public JSONObject addBlog(Blog blog) throws ParseException {
		JSONObject result = new JSONObject();
		if(blog != null) {
			if(blog.getBlogId() == null) {
				this.blogService.addBlog(blog);
				
			}else {
				this.blogService.updBlog(blog);
			}
			result.put("success", true);
		}else {
			result.put("success", false);
		}
		
		return result;
	}
	
	@RequestMapping("/delBlog")
	@ResponseBody
	public JSONObject delBlog(@RequestParam(value="ids",required=false) String ids) {
		String[] blogIdStr = ids.split(","); 
		JSONObject result = new JSONObject();
		for(int i=0; i<blogIdStr.length; i++) {
			int blogId = Integer.parseInt(blogIdStr[i]);
			if(this.CommentService.getCommentTotalByBlogId(blogId) > 0) {
				this.CommentService.delCommentByBlogId(blogId);
			}
			this.blogService.delBlog(blogId);
			result.put("success", true);
		}
		return result;
	}
	
	@RequestMapping("/findBlogById")
	@ResponseBody
	public JSONObject findBlogById(@RequestParam(value="blogId",required=false) Integer blogId) {
		Blog blog = this.blogService.getBlogById(blogId);
		JSONObject result = JSONObject.fromObject(blog);
		return result;
	}
	
	@RequestMapping("/findBlogByTitle")
	@ResponseBody
	public JSONObject findBlogByTitle(@RequestParam(value="blogTitle",required=false)String blogTitle) {
		List<Blog> list = this.blogService.findBlogByTitle(blogTitle);
		JSONObject result = new JSONObject();
		JsonConfig jsonConfig = new JsonConfig();
		
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonValueProcessor() {

			private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			@Override
			public Object processArrayValue(Object date, JsonConfig jsonConfig) {
				// TODO Auto-generated method stub
				return dateFormat.format(date);
			}
			@Override
			public Object processObjectValue(String arg0, Object date, JsonConfig jsonConfig) {
				// TODO Auto-generated method stub
				return dateFormat.format(date);
			}});
		
		JSONArray jsonArray = JSONArray.fromObject(list, jsonConfig);
		result.put("rows", jsonArray);
		Long total = this.blogService.getTotal();
		result.put("total", total);
		return result;
	}
	
}
