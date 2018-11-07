package com.sean.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sean.model.BlogType;
import com.sean.model.Blogger;
import com.sean.model.ChartVo;
import com.sean.service.BlogTypeService;
import com.sean.service.BloggerService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:spring-mybatis.xml"})
public class TestDemo {

	@Autowired
	private BloggerService bloggerService;
	
	@Autowired
	private BlogTypeService blogTypeService;

	
	@Test
	public void demo02() {
		// TODO Auto-generated method stub
		BlogType blogType = new BlogType();
		blogType.setTypeName("123");
		blogType.setTypeOrderNum(1);
		blogTypeService.addType(blogType);
	}
	@Test
	public void demo22() {
		String a = "1";
		String b ="1";
		if(a.equals("1")) {
			System.out.println("ok");
		}else {
			System.out.println("error");
		}
	}
	
	@Test
	public void demo3() {
		List<BlogType> list = blogTypeService.listTypeNoPage();
		for (BlogType blogType : list) {
			System.out.println(blogType.getTypeId()+"   "+blogType.getTypeName());
		}
	}
	@Test
	public void demo4() {
		List<ChartVo> list = this.blogTypeService.showChart();
		for (ChartVo chartVo : list) {
			System.out.println(chartVo);
		}
	}
}
