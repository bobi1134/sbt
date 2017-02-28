package cn.test;

import org.junit.Test;

public class TestRandom {
	
	@Test
	public void test1(){
		String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
		String str = "";
		for (int i = 0; i < 200; i++) {
			str = str + chars.charAt((int)(Math.random() * 26));
		}
		System.out.println(str);
	}
}
