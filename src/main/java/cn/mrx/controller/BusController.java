package cn.mrx.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
import cn.mrx.dto.User;
import cn.mrx.service.IBusService;
import cn.mrx.service.IConfigureService;
import cn.mrx.tools.security.DESUtil;

/**
 * 车次处理Controller
 * @Author Nothing
 * @Description: TODO
 * @Date 2016年11月8日 上午10:23:10 
 * @version V1.0
 */
@Controller
public class BusController {

	@Autowired
	private IConfigureService configureService;
	
	@Autowired
	private IBusService busService;
	
	/**
	 * 跳转到车次页面
	 * @return
	 */
	@RequestMapping("/bus")
	public String bus(Model model){
		//加载该页面的底部信息
		List<Configure> configures = configureService.getConfigure();
		//加载可以提前几天购票
		int days = configureService.getDays(5);
		//默认加载当天雅安-温江的车次信息
		List<Bus> buses = busService.getBus("雅安", "温江", 1);
		//对每个bus的id加密显示到页面上
		for(Bus bus : buses){
			try {
				//对id加密显示到页面上去
				bus.setIds(DESUtil.encrypt(String.valueOf(bus.getId())));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//搜索框默认给出雅安-温江-第一天
		Bus bus = new Bus();
		bus.setStart("雅安");
		bus.setEnd("温江");
		model.addAttribute("configures", configures);
		model.addAttribute("days", days);
		model.addAttribute("buses", buses);
		model.addAttribute("bus", bus);
		model.addAttribute("chooseDate", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		model.addAttribute("buses_size", buses.size());
		return "web/bus";
	}
	
	/**
	 * 搜索车次信息
	 * @param model
	 * @param bus
	 * @param chooseDate
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/bus/search")
	public String search(Model model, Bus bus, String chooseDate, HttpServletRequest request){
		if (request.getMethod().equals("GET")) {
			return "redirect:/bus";
		}else{
			//加载该页面的底部信息
			List<Configure> configures = configureService.getConfigure();
			//加载可以提前几天购票
			int days = configureService.getDays(5);
			//对传过来的start,end,date进行处理和验证
			//1、start
			if (bus.getStart().indexOf("[") != -1) {
				bus.setStart(bus.getStart().substring(0, bus.getStart().indexOf("[")));
			}
			//2、end
			if (bus.getEnd().indexOf("[") != -1) {
				bus.setEnd(bus.getEnd().substring(0, bus.getEnd().indexOf("[")));
			}
			//3、date
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date date = null;
			try {
				date = format.parse(chooseDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			int chooseDate_day = calendar.get(Calendar.DAY_OF_MONTH);
			
			calendar.setTime(new Date());
			int system_day = calendar.get(Calendar.DAY_OF_MONTH);
			
			int which_day = chooseDate_day - system_day + 1;
			
			System.out.println("start-->"+bus.getStart());
			System.out.println("end-->"+bus.getEnd());
			System.out.println("which_day-->"+which_day);
			
			List<Bus> buses = busService.getBus(bus.getStart(), bus.getEnd(), which_day);
			//对每个bus的id加密显示到页面上
			for(Bus b : buses){
				try {
					//对id加密显示到页面上去
					b.setIds(DESUtil.encrypt(String.valueOf(b.getId())));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			model.addAttribute("configures", configures);
			model.addAttribute("days", days);
			model.addAttribute("buses", buses);
			model.addAttribute("chooseDate", chooseDate);
			model.addAttribute("buses_size", buses.size());
			return "web/bus";
		}
	}

	@RequestMapping("/bus/order")
	@ResponseBody
	public Map<String,Object> order(String busIds, HttpSession session, HttpServletRequest request) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		if (request.getMethod().equals("GET")) {
			map.put("status", "Fuck! Do not use get request! mdzd");
		}else{
			//1、判断用户是否登陆
			User user = (User) session.getAttribute("login_user");
			System.out.println(JSON.toJSONString(user));
			if (user == null) {
				map.put("status", "notLogin");
			}else{
				//2、检查改车次信息是否存在
				System.out.println("加密传过来的id-->"+busIds);
				System.out.println("解密后的id-->"+DESUtil.decrypt(busIds));
				//解密id
				int id = Integer.valueOf(DESUtil.decrypt(busIds));
				Bus bus = busService.getBus(id);
				if (bus == null) {
					map.put("status", "notExist");
				}else{
					//3、检查是否还有余票
					if (bus.getSurplus() < 1) {
						map.put("status", "notEnough");
					}else{
						//跳转到添加乘客的页面
						//跳转处理在js上处理，加点提示信息
					}
				}
			}
		}
		return map;
	}
}
