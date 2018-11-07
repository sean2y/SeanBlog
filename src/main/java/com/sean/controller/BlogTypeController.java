package com.sean.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sean.model.BlogType;
import com.sean.model.ChartVo;
import com.sean.model.PageBean;
import com.sean.service.BlogService;
import com.sean.service.BlogTypeService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/admin/blogType")
public class BlogTypeController {

	private static Logger log = LoggerFactory.getLogger(BlogTypeController.class);
	
	@Autowired
	private BlogTypeService blogTypeService;
	
	@Autowired
	private BlogService blogService;
	
	@RequestMapping("/listType")
	@ResponseBody
	public JSONObject listType(@RequestParam(value="page",required=false) String page,
							   @RequestParam(value="rows",required=false) String rows) {
		PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		Map<String,Object> map = new HashMap<>();
		map.put("start",pageBean.getPage());
		map.put("pageSize",pageBean.getPageSize());
		List<BlogType> list = this.blogTypeService.listType(map);
		Long total = this.blogTypeService.getTotal();
		JSONObject result = new JSONObject();
		JSONArray jsonArray = JSONArray.fromObject(list);
		result.put("rows", jsonArray);
		result.put("total", total);
		return result;
	}
	
	@RequestMapping("/addType")
	public void addType(HttpServletRequest request, HttpServletResponse response, BlogType blogType, MultipartFile file) throws Exception, IOException {
		String imageName = UUID.randomUUID().toString().replaceAll("-", "");
		String extName = FilenameUtils.getExtension(file.getOriginalFilename());
		String imagePath = request.getSession().getServletContext().getRealPath("/static/upload");
		file.transferTo(new File(imagePath+"/"+imageName+"."+extName));
		blogType.setTypeImage("static/upload/"+imageName+"."+extName);
		if(blogType.getTypeId() == null) {
			this.blogTypeService.addType(blogType);
		}else {
			this.blogTypeService.updType(blogType);
		}
		Map<String, Boolean> map = new HashMap<>();
		map.put("success", true);
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), map);
	}
	@RequestMapping("/delType")
	@ResponseBody
	public JSONObject delType(@RequestParam(value="ids",required=false) String ids) {
		String[] typeIdStr = ids.split(",");
		JSONObject result  = new JSONObject();
		for(int i=0; i<typeIdStr.length; i++) {
			int typeId = Integer.parseInt(typeIdStr[i]);
			if(this.blogService.getBlogByTypeId(typeId) > 0) {
				result.put("exist", "该分类下有博客文章...");
			}else {
				this.blogTypeService.delType(typeId);
			}
			result.put("success", true);
		}
		return result;
	}
	
	@RequestMapping("/showChart")
	@ResponseBody
	public List<ChartVo> showChart(){
		List<ChartVo> list = this.blogTypeService.showChart();
		return list;
	}
}
