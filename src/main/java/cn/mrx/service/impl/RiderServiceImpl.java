package cn.mrx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mrx.dto.Rider;
import cn.mrx.mapper.RiderMapper;
import cn.mrx.service.IRiderService;

/**
 * 乘车人的业务接口实现层
 * @Author Nothing
 * @Description: TODO
 * @Date 2016年11月9日 下午9:39:46 
 * @version V1.0
 */
@Service
public class RiderServiceImpl implements IRiderService {
	
	@Autowired
	private RiderMapper riderMapper;

	/**
	 * 查询该用户的乘客人信息
	 * @param id
	 * @return
	 */
	public List<Rider> getRider(Integer userId) {
		return riderMapper.selectRiderByUserIs(userId);
	}

	/**
	 * 修改乘车人信息
	 * @param rider
	 * @return
	 */
	public int updateRider(Rider rider) {
		return riderMapper.updateByPrimaryKeySelective(rider);
	}

	/**
	 * 保存乘车人
	 * @param rider
	 * @return
	 */
	public int addRider(Rider rider) {
		return riderMapper.insert(rider);
	}

	/**
	 * 删除乘车人
	 * @param valueOf
	 * @return
	 */
	public int deleteRider(Integer id) {
		return riderMapper.deleteByPrimaryKey(id);
	}


}
