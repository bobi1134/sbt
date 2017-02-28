package cn.mrx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mrx.dto.Configure;
import cn.mrx.mapper.ConfigureMapper;
import cn.mrx.service.IConfigureService;

/**
 * 配置信息业务层实现类
 * @Author Nothing
 * @Description: Configure业务层的实现类
 * @Date 2016年11月7日 下午10:44:10 
 * @version V1.0
 */
@Service
public class ConfigureServiceImpl implements IConfigureService {
	
	@Autowired
	private ConfigureMapper configureMapper;

	/**
	 * 获取所有的配置信息
	 * @return
	 */
	public List<Configure> getConfigure() {
		return configureMapper.selectAllConfigure();
	}

	/**
	 * 获取可以提前几天购票
	 * @param i
	 * @return
	 */
	public int getDays(int type) {
		return configureMapper.selectDaysByType(type);
	}

}
