package cn.mrx.mapper;

import java.util.List;

import cn.mrx.dto.Rider;

public interface RiderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Rider record);

    int insertSelective(Rider record);

    Rider selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Rider record);

    int updateByPrimaryKey(Rider record);

    /**
	 * 查询该用户的乘客人信息
	 * @param id
	 * @return
	 */
	List<Rider> selectRiderByUserIs(Integer userId);

}