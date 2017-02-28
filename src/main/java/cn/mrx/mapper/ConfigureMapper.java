package cn.mrx.mapper;

import java.util.List;

import cn.mrx.dto.Configure;

public interface ConfigureMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Configure record);

    int insertSelective(Configure record);

    Configure selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Configure record);

    int updateByPrimaryKey(Configure record);

	/**
	 * 获取所有的配置信息
	 * @return
	 */
	List<Configure> selectAllConfigure();

	/**
	 * 获取可以提前几天购票
	 * @param i
	 * @return
	 */
	int selectDaysByType(int type);
}