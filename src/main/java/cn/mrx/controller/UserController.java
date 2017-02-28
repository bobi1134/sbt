package cn.mrx.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import cn.mrx.controller.validation.ValidGroup1;
import cn.mrx.controller.validation.ValidGroup2;
import cn.mrx.dto.Configure;
import cn.mrx.dto.Message;
import cn.mrx.dto.User;
import cn.mrx.service.IConfigureService;
import cn.mrx.service.IMessageService;
import cn.mrx.service.IUserService;
import cn.mrx.tools.email.EmailUtil;
import cn.mrx.tools.security.MD5Util;

/**
 * 用户处理Controller
 * @Author Nothing
 * @Description: TODO
 * @Date 2016年11月8日 上午10:22:57 
 * @version V1.0
 */
@Controller
public class UserController {
	
	@Autowired
	IUserService userService;
	
	@Autowired
	private IConfigureService configureService;
	
	@Autowired
	private IMessageService messageService;

//	@RequestMapping("/user/getUser")
//	public String getUser(Integer id){
//		User user = userService.getUser(id);
//		System.out.println(user.getUsername());
//		return "user/zone";
//	}
	
	/**
	 * 用户注册
	 * @param user
	 * @return
	 */
	@RequestMapping("/user/reg")
	@ResponseBody
	public Map<String,Object> reg(@Validated(ValidGroup1.class) User user, BindingResult br, String vcode, HttpSession session){
		Map<String,Object> map = new HashMap<String,Object>();
		if (br.hasErrors()) {
			List<ObjectError> objectErrors = br.getAllErrors();
			map.put("objectErrors", objectErrors);
		}else{
			//校验验证码是否正确
			String vCodeSession = (String)session.getAttribute("vcode_session");
			if (vCodeSession.equals(vcode)) {
				//校验用户是否重复
				User t_user = userService.getUser(user.getUsername());
				if (t_user != null) {
					map.put("status", "exist");
				}else{
					//默认设置为普通会员
					user.setRole(2);
					//默认设置为未激活
					user.setActive(2);
					//默认头像
					user.setImg("imgs/head.jpg");
					//密码加密
					user.setPassword(MD5Util.getMD5(user.getPassword()));
					int res = userService.addUser(user);
					if (res > 0) {
						map.put("status", "success");
						//发送邮件
						String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
						String str = "";
						for (int i = 0; i < 200; i++) {
							str = str + chars.charAt((int)(Math.random() * 52));
						}
						EmailUtil.send(user.getEmail(), "四川农业大学校车票购票系统", "恭喜您注册成功，请点击下面链接进行激活：<br/><a href='http://www.xlbweb.cn/sbt/user/active/"+user.getId()+"/"+user.getUsername()+"'>http://www.xlbweb.cn/sbt/user/active/"+str+"</a>");
					}else{
						map.put("status", "error");
					}
				}
			}else{
				map.put("status", "vcode");
			}
		}
		return map;
	}
	
	/**
	 * 激活用户
	 * @param id
	 * @param username
	 * @return
	 */
	@RequestMapping("/user/active/{id}/{username}")
	public String active(@PathVariable("id")String id, @PathVariable("username")String username, Model model){
		userService.activeUser(Integer.valueOf(id));
		//加载该页面的底部信息
		List<Configure> configures = configureService.getConfigure();
		model.addAttribute("configures", configures);
		return "web/active";
	}
	
	/**
	 * 用户登陆
	 * @param user
	 * @param br
	 * @param session
	 * @return
	 */
	@RequestMapping("/user/login")
	@ResponseBody
	public Map<String,Object> login(@Validated(ValidGroup2.class) User user, BindingResult br, HttpSession session){
		Map<String,Object> map = new HashMap<String,Object>();
		if (br.hasErrors()) {
			List<ObjectError> objectErrors = br.getAllErrors();
			map.put("objectErrors", objectErrors);
		}else{
			//校验账号是否存在
			User t_user = userService.getUser(user.getUsername());
			if (t_user == null) {
				map.put("status", "notExist");
			}else{
				//校验账号是否激活
				int active = userService.isActive(user.getUsername());
				if (active == 2) {
					map.put("status", "notActive");
				}else{
					//校验密码
					user.setPassword(MD5Util.getMD5(user.getPassword()));
					if (user.getPassword().equals(t_user.getPassword())) {
						//放进session
						session.setAttribute("login_user", t_user);
						//判断管理员和普通用户
						if (t_user.getRole() == 1) {
							map.put("status", "loginSuccess_and_role_1");
						}else{
							map.put("status", "loginSuccess_and_role_2");
						}
					}else{
						map.put("status", "loginError");
					}
				}
			}
		}
		return map;
	}
	
	/**
	 * 用户退出
	 * @param session
	 * @return
	 */
	@RequestMapping("/user/logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/index";
	}
	
	/**
	 * 个人中心
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/user/zone")
	public String zone(Model model, HttpSession session){
		User user = (User) session.getAttribute("login_user");
		if (user == null) {
			return "redirect:/bus";
		}else{
			//加载该页面的底部信息
			List<Configure> configures = configureService.getConfigure();
			// 查询时会否有新消息
			List<Message> messages = messageService.getMessage();
			int isRead = 2;//已读
			for (Message message : messages) {
				if (message.getIsRead() == 1) {
					isRead = 1;
				}
			}
			model.addAttribute("configures", configures);
			model.addAttribute("isRead", isRead);
			return "web/zone";
		}
	}
	
	/**
	 * 跳到个人资料页面【暂未做其他操作】
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/user/info")
	public String info(Model model, HttpSession session){
		User user = (User) session.getAttribute("login_user");
		if (user == null) {
			return "redirect:/bus";
		}else{
			//加载该页面的底部信息
			List<Configure> configures = configureService.getConfigure();
			model.addAttribute("configures", configures);
			return "web/info";
		}
	}
	
	/**
	 * 跳到个人资料页面【暂未做其他操作】
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/user/order")
	public String order(Model model, HttpSession session){
		User user = (User) session.getAttribute("login_user");
		if (user == null) {
			return "redirect:/bus";
		}else{
			//加载该页面的底部信息
			List<Configure> configures = configureService.getConfigure();
			model.addAttribute("configures", configures);
			return "web/order";
		}
	}
	
	/**
	 * 跳到后台管理界面
	 * @param session
	 * @return
	 */
	@RequestMapping("/user/admin")
	public String admin(HttpSession session){
		User user = (User) session.getAttribute("login_user");
		if (user == null) {
			return "redirect:/index";
		}else{
			if(user.getRole() == 1){
				return "admin/admin";
			}else{
				return "redirect:/index";
			}
		}
	}
	
	/**
	 * 跳到图表类界面
	 * @param session
	 * @return
	 */
	@RequestMapping("/user/chart")
	public String chart(HttpSession session){
		User user = (User) session.getAttribute("login_user");
		if (user == null) {
			return "redirect:/index";
		}else{
			if(user.getRole() == 1){
				return "admin/chart";
			}else{
				return "redirect:/index";
			}
		}
	}
	
	
	
	
	
	
	
	
	
	
	/*@RequestMapping("/reg")
	@ResponseBody
	public Map<String,Object> reg(User user){
		Map<String,Object> map = new HashMap<String,Object>();  
		System.out.println(JSON.toJSONStringWithDateFormat(user, "yyyy-MM-dd HH:mm:ss"));
		map.put("msg", "成功");  
		map.put("aa", "666");  
		map.put("bb", "777");  
		return map;
	}*/
	
//	@RequestMapping("/reg")
//	@ResponseBody
//	public Map<String,Object> reg(User user){
//		//com.alibaba.fastjson.JSONObject
//		JSONObject json = new JSONObject();
//		json.put("msg", "成功");  
//		json.put("aa", "666");  
//		json.put("bb", "777");  
//		return json;
//	}
}
