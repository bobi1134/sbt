package cn.mrx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mrx.dto.Order;
import cn.mrx.mapper.OrderMapper;
import cn.mrx.service.IOrderService;

/**
 * 订单业务接口实现层
 * @Author Mr.x
 * @Description: TODO
 * @Date 2016年11月11日 下午3:22:46 
 * @version V1.0
 */
@Service
public class OrderServiceImpl implements IOrderService {
	
	@Autowired
	private OrderMapper orderMapper;

	/**
	 * 添加订单
	 * @param order
	 * @return
	 */
	public int add(Order order) {
		return orderMapper.insert(order);
	}

}
