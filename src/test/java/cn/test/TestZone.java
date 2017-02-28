package cn.test;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.mrx.dto.Bus;
import cn.mrx.service.IBusService;

//相当于TestMybatis03 extends SpringJUnit4ClassRunner
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext-service.xml","classpath:applicationContext-dao.xml"})
public class TestZone {
	
	@Autowired
	IBusService busService;
	
	@Test
	public void test1(){
		Bus bus = new Bus();
		bus.setTime(new Date());
		bus.setPrice(100.0);
		busService.add(bus);
		
	}
}
