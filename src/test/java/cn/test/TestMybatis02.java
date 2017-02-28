package cn.test;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.mrx.dto.User;
import cn.mrx.service.IUserService;

public class TestMybatis02 {
	ApplicationContext applicationContext;
	IUserService userService;
	@Before
	public void before(){
		applicationContext = new ClassPathXmlApplicationContext(new String[]{"applicationContext-service.xml","applicationContext-dao.xml"});
		userService = (IUserService) applicationContext.getBean("userServiceImpl");
	}
	

	@Test
	public void test1(){
		User user = userService.getUser(1);
		System.out.println(user.getUsername());
	}
}
