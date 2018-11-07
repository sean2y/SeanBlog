package com.sean.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sean.model.Blogger;
import com.sean.service.BloggerService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/blogger")
public class BloggerController {

	@Autowired
	private BloggerService bloggerService;
	
	@RequestMapping("/getBloggerById")
	@ResponseBody
	public JSONObject getBloggerById() {
		Blogger blogger = this.bloggerService.getBloggerById();
		JSONObject result = JSONObject.fromObject(blogger);
		return result;
	}
	
	@RequestMapping("/updBlogger")
	@ResponseBody
	public JSONObject updBlogger(Blogger blogger) {
		this.bloggerService.updBlogger(blogger);;
		JSONObject result = new JSONObject();
		result.put("success", true);
		return result;
	}
	@RequestMapping("/login")
	public String login(Blogger blogger,HttpServletRequest request) {
		Blogger blogger2 = this.bloggerService.getBloggerById();
		if(blogger2.getUserName().equals(blogger.getUserName()) && blogger2.getUserPassword().equals(blogger.getUserPassword())) {
			request.getSession().setAttribute("flag", "flag");
			return "redirect:/admin/main.jsp";
		}else {
			request.setAttribute("errorBlogger", blogger);
			request.setAttribute("errorInfo", "账号和密码出错，请检查");
			return "login";
		}
	}
}
