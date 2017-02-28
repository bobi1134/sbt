package cn.mrx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.mrx.dto.Bus;

public interface BusMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Bus record);

    int insertSelective(Bus record);

    Bus selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Bus record);

    int updateByPrimaryKey(Bus record);

    /**
	 * 按照起始地、目的地、日期查询所有车次信息
	 * @param start
	 * @param end
	 * @param date
	 * @return
	 */
	List<Bus> selectAllBus(@Param("start")String start, @Param("end")String end, @Param("date")int date);

	/**
	 * 查询余票
	 * @param bus_id
	 * @return
	 */
	int selectSurplusById(int id);
}