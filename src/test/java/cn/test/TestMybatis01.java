package cn.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.alibaba.fastjson.JSON;

import cn.mrx.dto.User;
import cn.mrx.service.IUserService;

public class TestMybatis01 {

	@Test
	public void test1(){
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(new String[]{"applicationContext-service.xml","applicationContext-dao.xml"});
		IUserService userService = (IUserService) applicationContext.getBean("userServiceImpl");
		User user = userService.getUser(1);
		System.out.println(JSON.toJSONStringWithDateFormat(user, "yyyy-MM-dd HH:mm:ss"));
		System.out.println(user);
		System.out.println(user.getUsername());
	}
}
