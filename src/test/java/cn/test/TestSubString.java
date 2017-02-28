package cn.test;

import org.junit.Test;

public class TestSubString {

	@Test
	public void test(){
		String str = "雅安[yaan]";
		String str2 = "都江堰[dujiangyan]";
		System.out.println(str.substring(0, str.indexOf("[")));
		System.out.println(str2.substring(0, str2.indexOf("[")));
		
		System.out.println(str.endsWith("]"));
		
		String str3 = "雅安yaan]";
		if (str3.indexOf("[") != -1) {
			System.out.println("包含！");
		}else{
			System.out.println("不包含！");
		}
		
		
		String str4 = "clickInfo_24";
		System.out.println(str4.substring(10, str4.length()));
	}
}
