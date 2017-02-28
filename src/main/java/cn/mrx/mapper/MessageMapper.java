package cn.mrx.mapper;

import java.util.List;

import cn.mrx.dto.Message;

public interface MessageMapper {
	/**
	 * 添加站内信息
	 * @param message
	 */
	void insert(Message Message);

	/**
	 * 查询时会否有新消息
	 * @return
	 */
	List<Message> selectAll();

	/**
	 * 修改成已读
	 * @param messageId
	 * @return
	 */
	int updateIsRead(Integer messageId);

	/**
	 * 删除信息
	 * @param id
	 * @return
	 */
	int deleteById(Integer id);
}
