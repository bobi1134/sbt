package cn.mrx.service;

import java.util.List;

import cn.mrx.dto.Message;

/**
 * 处理信息的业务层接口
 * @Author Mr.x
 * @Description: TODO
 * @Date 2016年11月12日 下午11:18:56 
 * @version V1.0
 */
public interface IMessageService {

	/**
	 * 添加站内信息
	 * @param message
	 */
	void add(Message message);

	/**
	 * 查询时会否有新消息
	 * @return
	 */
	List<Message> getMessage();

	/**
	 * 修改成已读
	 * @param messageId
	 * @return
	 */
	int isRead(Integer messageId);

	/**
	 * 删除信息
	 * @param id
	 * @return
	 */
	int delete(Integer id);

}
