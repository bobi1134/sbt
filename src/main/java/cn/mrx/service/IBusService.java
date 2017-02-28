package cn.mrx.service;

import java.util.List;

import cn.mrx.dto.Bus;

/**
 * 车次信息业务层接口
 * @Author Nothing
 * @Description: TODO
 * @Date 2016年11月8日 上午10:47:15 
 * @version V1.0
 */
public interface IBusService {

	/**
	 * 按照起始地、目的地、日期查询所有车次信息
	 * @param start
	 * @param end
	 * @param date
	 * @return
	 */
	List<Bus> getBus(String start, String end, int date);

	void add(Bus bus);

	/**
	 * 查询车次信息
	 * @param id
	 * @return
	 */
	Bus getBus(int id);

	/**
	 * 查询余票
	 * @param bus_id
	 * @return
	 */
	int getSurplus(int id);

	/**
	 * 修改余票
	 * @param bus
	 * @return
	 */
	int updateSurplus(Bus bus);

	
	

}
