package cn.mrx.mapper;

import java.util.List;

import cn.mrx.dto.Rider;
import cn.mrx.dto.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    /**
	 * 根据username查询用户
	 * @param username
	 */
	User getUserByUsername(String username);

	/**
	 * 激活用户
	 * @param id 用户主键id
	 */
	int activeUserById(Integer id);

	/**
	 * 用户是否激活
	 * @param username 用户名
	 * @return
	 */
	int isActiveByUsername(String username);

}