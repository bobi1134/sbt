package cn.mrx.service;

import java.util.List;

import cn.mrx.dto.Rider;

/**
 * 乘车人的业务接口层
 * @Author Nothing
 * @Description: TODO
 * @Date 2016年11月9日 下午9:39:46 
 * @version V1.0
 */
public interface IRiderService {

	/**
	 * 查询该用户的乘客人信息
	 * @param id
	 * @return
	 */
	List<Rider> getRider(Integer userId);

	/**
	 * 修改乘车人信息
	 * @param rider
	 * @return
	 */
	int updateRider(Rider rider);

	/**
	 * 保存乘车人
	 * @param rider
	 * @return
	 */
	int addRider(Rider rider);

	/**
	 * 删除乘车人
	 * @param valueOf
	 * @return
	 */
	int deleteRider(Integer id);


}
