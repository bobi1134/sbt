package cn.mrx.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import cn.mrx.dto.Bus;
import cn.mrx.dto.Message;
import cn.mrx.dto.Order;
import cn.mrx.dto.User;
import cn.mrx.service.IBusService;
import cn.mrx.service.IMessageService;
import cn.mrx.service.IOrderService;

/**
 * 订单处理Controller
 * @Author Nothing
 * @Description: TODO
 * @Date 2016年11月8日 上午10:23:10 
 * @version V1.0
 */
@Controller
public class OrderController {
	
	@Autowired
	private IBusService busService;
	
	@Autowired
	private IOrderService orderService;
	
	@Autowired
	private IMessageService messageService;
	
	@RequestMapping("/order/add")
	@ResponseBody
	public Map<String,Object> add(String riderIds, String busId, String date, HttpSession session, HttpServletRequest request) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		if (request.getMethod().equals("GET")) {
			map.put("status", "Fuck! Do not use get request! mdzd");
		}else{
			//1、判断用户是否登陆
			User user = (User) session.getAttribute("login_user");
			if (user == null) {
				map.put("status", "notLogin");
			}else{
				//判断riderIds是否为空，riderIds是数组，应该用null
				if (riderIds == null) {
					map.put("status", "null_riderIds");
				}else if (date == "") {
					map.put("status", "null_date");
				}else{
					//userId,busId,riderId(1,2,3),money,datetime,ispay
					//userId
					int userId = user.getId();
					//busId
					int bus_id = Integer.valueOf(busId);
					//riderId
					String[] array = riderIds.split(",");
					String rider_ids = "";
					for (String str : array) {
						rider_ids = rider_ids + str.substring(10, str.length()) + ",";
					}
					//money
					Bus bus = busService.getBus(bus_id);
					double money = bus.getPrice() * array.length;
					//datetime
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					Date datetime = format.parse(date);
					//默认为未支付....because未接入支付宝
					int ispay = 1;
					
					Order order = new Order();
					order.setUserid(userId);
					order.setBusid(bus_id);
					order.setRiderid(rider_ids);
					order.setMoney(money);
					order.setDatetime(datetime);
					order.setIspay(ispay);
					//查询余票
					int surplus = busService.getSurplus(bus_id);
					if(surplus >= array.length){
						//添加订单
						int res = orderService.add(order);
						if (res > 0) {
							//修改余票
							bus.setSurplus(bus.getSurplus()-array.length);
							busService.updateSurplus(bus);
							//发送站内信息通知（这里默认用户在30分钟之内为完成支付，所以应该发送站内消息通知......******）
							String title = "亲爱的"+user.getUsername()+"，您好，你有一笔订单还未支付！";
							String content = "您购买的从"+bus.getStart()+"开往"+bus.getEnd()+"，时间是："+date+"的车票，还未完成支付，请及时完成支付，以免影响您的出行！";
							Message message = new Message();
							message.setTitle(title);
							message.setContent(content);
							message.setDatetime(datetime);
							message.setUserId(userId);
							message.setIsRead(1);
							messageService.add(message);
							map.put("status", "add_ok");
						}
					}else{
						map.put("status", "notEnough");
					}
				}
			}
		}
		return map;
	}
}
