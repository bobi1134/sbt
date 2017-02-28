package cn.mrx.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import cn.mrx.dto.Bus;
import cn.mrx.dto.Configure;
import cn.mrx.dto.Rider;
import cn.mrx.dto.User;
import cn.mrx.service.IBusService;
import cn.mrx.service.IConfigureService;
import cn.mrx.service.IRiderService;
import cn.mrx.service.IUserService;
import cn.mrx.tools.security.DESUtil;

/**
 * 乘车人处理Controller
 * @Author Nothing
 * @Description: TODO
 * @Date 2016年11月9日 下午9:41:29 
 * @version V1.0
 */
@Controller
public class RiderController {

	@Autowired
	private IConfigureService configureService;
	
	@Autowired
	private IBusService busService;
	
	@Autowired
	private IRiderService riderService;
	
	@RequestMapping("/rider")
	public String rider(String hiddenBusIds,String hiddenDate, Model model, HttpSession session, HttpServletRequest request) throws Exception{
		//处理get
		if (request.getMethod().equals("GET")) {
			return "redirect:/bus";
		}else{
			System.out.println("hiddenBusIds-->"+hiddenBusIds);
			System.out.println("hiddenBusIds-->"+DESUtil.decrypt(hiddenBusIds));
			System.out.println("hiddenDate-->"+hiddenDate);
			
			//加载该页面的底部信息
			List<Configure> configures = configureService.getConfigure();
			//判断用户是否登陆
			User user = (User) session.getAttribute("login_user");
			if (user == null) {
				return "redirect:/bus";
			}else{
				//其他操作
				//查询该车次的信息
				Bus t_bus = busService.getBus(Integer.valueOf(DESUtil.decrypt(hiddenBusIds)));
				model.addAttribute("bus", t_bus);
				model.addAttribute("date", hiddenDate);
				//查询该用户的乘客人信息
				List<Rider> riders = riderService.getRider(user.getId());
				for(Rider rider : riders){
					System.out.println(JSON.toJSONString(rider));
				}
				model.addAttribute("riders", riders);
			}
			
			model.addAttribute("configures", configures);
			return "web/rider";
		}
	}
	
	/**
	 * 修改乘车人信息
	 * @param riderId
	 * @param name
	 * @param idcard
	 * @param request
	 * @return
	 */
	@RequestMapping("/rider/update")
	@ResponseBody
	public Map<String,Object> update(String riderId, String name, String idcard, HttpServletRequest request, HttpSession session){
		Map<String,Object> map = new HashMap<String,Object>();
		if (request.getMethod().equals("GET")) {
			map.put("status", "Fuck! Do not use get request! mdzd");
		}else{
			User user = (User) session.getAttribute("login_user");
			if(user == null){
				map.put("status", "notLogin");
			}else{
				if (riderId.equals("")) {
					map.put("status", "null_riderId");
				}else if(name.equals("")){
					map.put("status", "null_name");
				}else if(idcard.equals("")){
					map.put("status", "null_idcard");
				}else{
					//更新
					Rider rider = new Rider();
					rider.setId(Integer.valueOf(riderId));
					rider.setName(name);
					rider.setIdcard(idcard);
					int res = riderService.updateRider(rider);
					if (res > 0) {
						map.put("status", "update_ok");
					}
				}
			}
		}
		return map;
	}
	
	/**
	 * 保存乘车人信息
	 * @param name
	 * @param idcard
	 * @param request
	 * @return
	 */
	@RequestMapping("/rider/add")
	@ResponseBody
	public Map<String,Object> add(String name, String idcard, HttpServletRequest request, HttpSession session){
		Map<String,Object> map = new HashMap<String,Object>();
		if (request.getMethod().equals("GET")) {
			map.put("status", "Fuck! Do not use get request! mdzd");
		}else{
			User user = (User) session.getAttribute("login_user");
			if(user == null){
				map.put("status", "notLogin");
			}else{
				if(name.equals("")){
					map.put("status", "null_name");
				}else if(idcard.equals("")){
					map.put("status", "null_idcard");
				}else{
					//保存
					Rider rider = new Rider();
					rider.setName(name);
					rider.setIdcard(idcard);
					rider.setUserid(user.getId());
					int res = riderService.addRider(rider);
					if (res > 0) {
						map.put("status", "add_ok");
						map.put("key", rider.getId());//返回添加后的主键
					}
				}
			}
		}
		return map;
	}
	
	@RequestMapping("/rider/delete")
	@ResponseBody
	public Map<String,Object> delete(String riderId, HttpServletRequest request, HttpSession session){
		Map<String,Object> map = new HashMap<String,Object>();
		if (request.getMethod().equals("GET")) {
			map.put("status", "Fuck! Do not use get request! mdzd");
		}else{
			User user = (User) session.getAttribute("login_user");
			if(user == null){
				map.put("status", "notLogin");
			}else{
				if(riderId.equals("")){
					map.put("status", "null_id");
				}else{
					//删除
					int res = riderService.deleteRider(Integer.valueOf(riderId));
					if (res > 0) {
						map.put("status", "delete_ok");
					}
				}
			}
		}
		return map;
	}
}
