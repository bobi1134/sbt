package cn.mrx.service;

import java.util.List;

import cn.mrx.dto.Rider;
import cn.mrx.dto.User;

/**
 * 用户信息业务层接口
 * @Author Nothing
 * @Description: TODO
 * @Date 2016年11月8日 上午10:47:27 
 * @version V1.0
 */
public interface IUserService {
	/**
	 * 查询用户
	 * @param id 用户主键id
	 * @return
	 */
	public User getUser(Integer id);

	/**
	 * 查询用户
	 * @param username 用户名
	 */
	public User getUser(String username);

	/**
	 * 添加用户
	 * @param user 用户实体
	 * @return
	 */
	public int addUser(User user);

	/**
	 * 激活用户
	 * @param id 用户主键id
	 */
	public int activeUser(Integer id);

	/**
	 * 用户是否激活
	 * @param username 用户名
	 * @return
	 */
	public int isActive(String username);

}
