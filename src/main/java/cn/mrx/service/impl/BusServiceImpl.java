package cn.mrx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mrx.dto.Bus;
import cn.mrx.mapper.BusMapper;
import cn.mrx.service.IBusService;

/**
 * 车次信息业务层实现类
 * @Author Nothing
 * @Description: TODO
 * @Date 2016年11月8日 上午10:48:36 
 * @version V1.0
 */
@Service
public class BusServiceImpl implements IBusService {
	
	@Autowired
	private BusMapper busMapper;

	/**
	 * 按照起始地、目的地、日期查询所有车次信息
	 * @param start
	 * @param end
	 * @param date
	 * @return
	 */
	public List<Bus> getBus(String start, String end, int date) {
		return busMapper.selectAllBus(start, end, date);
	}

	public void add(Bus bus) {
		busMapper.insert(bus);
	}

	/**
	 * 查询车次信息
	 * @param id
	 * @return
	 */
	public Bus getBus(int id) {
		return busMapper.selectByPrimaryKey(id);
	}

	/**
	 * 查询余票
	 * @param bus_id
	 * @return
	 */
	public int getSurplus(int id) {
		return busMapper.selectSurplusById(id);
	}

	/**
	 * 修改余票
	 * @param bus
	 * @return
	 */
	public int updateSurplus(Bus bus) {
		return busMapper.updateByPrimaryKeySelective(bus);
	}

	
}
