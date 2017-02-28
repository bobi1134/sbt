package cn.mrx.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.mrx.dto.Configure;
import cn.mrx.dto.Message;
import cn.mrx.dto.User;
import cn.mrx.service.IConfigureService;
import cn.mrx.service.IMessageService;

/**
 * 处理信息的Controller
 * @Author Mr.x
 * @Description: TODO
 * @Date 2016年11月13日 下午1:37:18 
 * @version V1.0
 */
@Controller
public class MessageController {

	@Autowired
	private IConfigureService configureService;
	
	@Autowired
	private IMessageService messageService;
	
	@RequestMapping("/user/message")
	public String message(Model model, HttpSession session){
		User user = (User) session.getAttribute("login_user");
		if (user == null) {
			return "redirect:/bus";
		}else{
			//加载该页面的底部信息
			List<Configure> configures = configureService.getConfigure();
			//所有信息
			List<Message> messages = messageService.getMessage();
			int isRead = 2;//已读
			for (Message message : messages) {
				if (message.getIsRead() == 1) {
					isRead = 1;
				}
			}
			model.addAttribute("messages", messages);			
			model.addAttribute("configures", configures);
			model.addAttribute("isRead", isRead);
			return "web/message";
		}
	}
	
	/**
	 * 设置已经阅读
	 * @param messageId
	 * @param session
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/user/message/read")
	@ResponseBody
	public Map<String,Object> add(String messageId, HttpSession session, HttpServletRequest request) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		if (request.getMethod().equals("GET")) {
			map.put("status", "Fuck! Do not use get request! mdzd");
		}else{
			//1、判断用户是否登陆
			User user = (User) session.getAttribute("login_user");
			if (user == null) {
				map.put("status", "notLogin");
			}else{
				if(messageId.equals("")){
					map.put("status", "null_messagesId");
				}else{
					//执行操作
					int res = messageService.isRead(Integer.valueOf(messageId));
					if(res > 0){
						map.put("status", "udpate_ok");
						//再次查询所有是否都已读
						//所有信息
						List<Message> messages = messageService.getMessage();
						int isRead = 2;//已读
						for (Message message : messages) {
							if (message.getIsRead() == 1) {
								isRead = 1;
							}
						}
						map.put("isRead", isRead);
					}
				}
			}
		}
		return map;
	}
	
	/**
	 * 删除信息
	 * @param id
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/message/delete/{id}")
	public String delete(@PathVariable("id") String id, HttpServletRequest request, Model model, HttpSession session){
		User user = (User) session.getAttribute("login_user");
		if (user == null) {
			return "redirect:/user/message";
		}else{
			if(id.equals("")){
				return "redirect:/user/message";
			}else{
				int res = messageService.delete(Integer.valueOf(id));
				if(res > 0){
					//model.addAttribute("deleteRes", "ok");
				}
				return "redirect:/user/message";
			}
		}
	}
}
