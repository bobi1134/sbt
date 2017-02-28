package cn.test;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.junit.Test;

public class TestDate {
	
	@Test
	public void test01() throws ParseException{
		Calendar c = Calendar.getInstance();
		c.setTime(new Date());
		System.out.println(c.get(Calendar.YEAR));//获取年
		System.out.println(c.get(Calendar.MONTH) + 1);//获取月(比实际的少1月)
		System.out.println(c.get(Calendar.DAY_OF_MONTH));//获取天
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date date = df.parse("2016-10-28");
		Calendar c1 = Calendar.getInstance();
		c1.setTime(date);
		System.out.println(c1.get(Calendar.YEAR));//获取年
		System.out.println(c1.get(Calendar.MONTH) + 1);//获取月(比实际的少1月)
		System.out.println(c1.get(Calendar.DAY_OF_MONTH));//获取天
	}
}
