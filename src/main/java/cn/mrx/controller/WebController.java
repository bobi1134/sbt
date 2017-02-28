package cn.mrx.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.mrx.dto.Configure;
import cn.mrx.service.IConfigureService;

/**
 * 首页跳转Controller
 * @Author Nothing
 * @Description: TODO
 * @Date 2016年11月8日 上午10:22:04 
 * @version V1.0
 */
@Controller
public class WebController {
	
	@Autowired
	private IConfigureService configureService;
	
	/**
	 * 首页
	 * @param id
	 * @return
	 */
	@RequestMapping("/index")
	public String getUser(Model model){
		//加载首页的底部信息
		List<Configure> configures = configureService.getConfigure();
		model.addAttribute("configures", configures);
		return "web/index";
	}
}
