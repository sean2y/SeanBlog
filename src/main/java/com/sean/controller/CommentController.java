package com.sean.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sean.model.Comment;
import com.sean.model.PageBean;
import com.sean.service.CommentService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

@Controller
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	private CommentService commentService;
	
	@RequestMapping("listComment")
	@ResponseBody
	public JSONObject listComment(@RequestParam(value="page",required=false) String page,
								  @RequestParam(value="rows",required=false) String rows,
								  @RequestParam(value="type",required=false) Integer type) {
		PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		Map<String, Object> map = new HashMap<>();
		map.put("start", pageBean.getPage());
		map.put("pageSize", pageBean.getPageSize());
		List<Comment> list = new ArrayList<>();
		Long total = 0l;
		if(type == 0) {
			list = this.commentService.listComment(map);	
			total = this.commentService.getCommentTotal();
		}else {
			list = this.commentService.listCommented(map);
			total = this.commentService.getCommentedTotal();
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
		JSONArray jsonArray = JSONArray.fromObject(list,jsonConfig);
		result.put("rows", jsonArray);
		result.put("total", total);
		return result;
	}
	
	@RequestMapping("/review")
	@ResponseBody
	public JSONObject reviewComment(@RequestParam(value="ids",required=false) String ids,
									@RequestParam(value="state",required=false) Integer state) {
		String[] commentIds = ids.split(",");
		JSONObject result = new JSONObject();
		for(int i=0; i<commentIds.length; i++) {
			Comment comment = new Comment();
			comment.setCommentId(Integer.parseInt(commentIds[i]));
			comment.setCommentState(state);
			this.commentService.updCommentState(comment);
		}
		result.put("success", true);
		return result;
	}
	
	@RequestMapping("/delComment")
	@ResponseBody
	public JSONObject delComment(@RequestParam(value="ids",required=false) String ids) {
		String[] commentIds = ids.split(",");
		JSONObject result = new JSONObject();
		for(int i=0; i<commentIds.length; i++) {
			this.commentService.delComment(Integer.parseInt(commentIds[i]));
		}
		result.put("success", true);
		return result;
	}
	@RequestMapping("/addComment")
	@ResponseBody
	public String addComment(Comment comment) throws ParseException {
		
		this.commentService.addComment(comment);
		return "{}";
	}
	
	@RequestMapping("/listCommentByBlogId")
	public ModelAndView listCommentByBlogId(@RequestParam(value="blogId") Integer blogId) {
		List<Comment> list = this.commentService.listCommentByBlogId(blogId);
		ModelAndView mav = new ModelAndView();
		mav.addObject("commentList", list);
		return mav;
	}
}
