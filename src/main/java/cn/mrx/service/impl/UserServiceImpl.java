package cn.mrx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mrx.dto.Rider;
import cn.mrx.dto.User;
import cn.mrx.mapper.UserMapper;
import cn.mrx.service.IUserService;

/**
 * 用户信息业务层实现类
 * @Author Nothing
 * @Description: TODO
 * @Date 2016年11月8日 上午10:48:46 
 * @version V1.0
 */
@Service
public class UserServiceImpl implements IUserService {

	@Autowired
	private UserMapper userMapper;
	
	/**
	 * 查询用户
	 * @param id 用户主键id
	 * @return
	 */
	public User getUser(Integer id) {
		return userMapper.selectByPrimaryKey(id);
	}

	/**
	 * 查询用户
	 * @param username 用户名
	 */
	public User getUser(String username) {
		return userMapper.getUserByUsername(username);
	}

	/**
	 * 添加用户
	 * @param user 用户实体
	 * @return
	 */
	public int addUser(User user) {
		return userMapper.insert(user);
	}

	/**
	 * 激活用户
	 * @param id 用户主键id
	 */
	public int activeUser(Integer id) {
		return userMapper.activeUserById(id);
	}

	/**
	 * 用户是否激活
	 * @param username 用户名
	 * @return
	 */
	public int isActive(String username) {
		return userMapper.isActiveByUsername(username);
	}

}
