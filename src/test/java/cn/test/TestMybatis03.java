package cn.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.mrx.dto.User;
import cn.mrx.service.IUserService;

//相当于TestMybatis03 extends SpringJUnit4ClassRunner
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext-service.xml","classpath:applicationContext-dao.xml"})
public class TestMybatis03 {
	
	@Autowired
	IUserService userService;
	
	@Test
	public void test1(){
		User user = userService.getUser(1);
		System.out.println(user.getUsername());
	}
}
