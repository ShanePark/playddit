package message.service;

import java.sql.SQLException;
import java.util.List;

import message.dao.IMessageDao;
import message.dao.MessageDaoImpl;
import message.vo.MessageVO;
import users.vo.UsersVO;

public class MessageServiceImpl implements IMessageService{
	private IMessageDao dao;
	private static IMessageService service;
	
	public MessageServiceImpl() {
		dao = MessageDaoImpl.getDao();
	}
	
	public static IMessageService getService() {
		if(service == null) service = new MessageServiceImpl();
		
		return service;
	}
		
	@Override
	public List<MessageVO> getMessage(String user, String audience) {
		try {
			return dao.getMessage(user, audience);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<UsersVO> getAudiences(String user_id) {
		try {
			return dao.getAudiences(user_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int insertMessage(String sender, String receiver, String content) {
		try {
			return dao.insertMessage(sender, receiver, content);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<MessageVO> getClassMessage(String class_id) {
		try {
			return dao.getClassMessage(class_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
