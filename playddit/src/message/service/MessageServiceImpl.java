package message.service;

import java.sql.SQLException;
import java.util.List;

import message.dao.IMessageDao;
import message.dao.MessageDaoImpl;
import message.vo.AudienceVO;
import message.vo.GroupChatVO;
import message.vo.MessageVO;

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
	public List<AudienceVO> getAudiences(String user_id) {
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
	public int insertMessageGroup(String sender, String receiver, String content, String groupType) {
		try {
			switch(groupType) {
			case "class" :
				return dao.insertMessageClass(sender, receiver, content);
			default :
				break;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<AudienceVO> searchToChat(String user_id, String keyword) {
		try {
			return dao.searchToChat(user_id, keyword);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public GroupChatVO getClassChatInfo(String user_id) {
		try {
			return dao.getClassChatInfo(user_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<MessageVO> getClassMessages(String user_id, String class_id) {
		try {
			return dao.getClassMessages(user_id, class_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
