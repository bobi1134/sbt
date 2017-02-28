package cn.mrx.service;

import java.util.List;

import cn.mrx.dto.Configure;

/**
 * 配置信息业务层接口
 * @Author Nothing
 * @Description: Configure业务层的接口
 * @Date 2016年11月7日 下午10:47:46 
 * @version V1.0
 */
public interface IConfigureService {

	/**
	 * 获取所有的配置信息
	 * @return
	 */
	List<Configure> getConfigure();

	/**
	 * 获取可以提前几天购票
	 * @param i
	 * @return
	 */
	int getDays(int type);

}
