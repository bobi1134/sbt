package cn.mrx.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;

import cn.mrx.dto.Message;
import cn.mrx.mapper.MessageMapper;

/**
 * 处理信息的业务层接口
 * @Author Mr.x
 * @Description: TODO
 * @Date 2016年11月12日 下午11:18:56 
 * @version V1.0
 */
@Service
public class MessageServiceImpl implements IMessageService {
	
	@Autowired
	private MessageMapper messageMapper;

	/**
	 * 添加站内信息
	 * @param message
	 */
	public void add(Message message) {
		messageMapper.insert(message);
	}

	/**
	 * 查询时会否有新消息
	 * @return
	 */
	public List<Message> getMessage() {
		return messageMapper.selectAll();
	}

	/**
	 * 修改成已读
	 * @param messageId
	 * @return
	 */
	public int isRead(Integer messageId) {
		return messageMapper.updateIsRead(messageId);
	}

	/**
	 * 删除信息
	 * @param id
	 * @return
	 */
	public int delete(Integer id) {
		return messageMapper.deleteById(id);
	}

}
