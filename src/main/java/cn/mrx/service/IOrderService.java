package cn.mrx.service;

import cn.mrx.dto.Order;

/**
 * 订单业务接口层
 * @Author Mr.x
 * @Description: TODO
 * @Date 2016年11月11日 下午3:22:46 
 * @version V1.0
 */
public interface IOrderService {

	/**
	 * 添加订单
	 * @param order
	 * @return
	 */
	int add(Order order);

}
