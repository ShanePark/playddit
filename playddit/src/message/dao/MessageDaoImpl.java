package message.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapClientFactory;
import message.vo.AudienceVO;
import message.vo.MessageVO;
import users.vo.UsersVO;

public class MessageDaoImpl implements IMessageDao{
	
	private SqlMapClient client;
	private static IMessageDao dao;
	
	private MessageDaoImpl() {
		client = SqlMapClientFactory.getClient();
	}
	
	public static IMessageDao getDao() {
		if(dao == null) dao = new MessageDaoImpl();
		return dao;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MessageVO> getMessage(String user, String audience) throws SQLException {
		Map<String, String> map = new HashMap<>();
		map.put("user", user);
		map.put("audience", audience);
		return (List<MessageVO>)client.queryForList("message.getMessage", map);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AudienceVO> getAudiences(String user_id) throws SQLException {
		return (List<AudienceVO>)client.queryForList("message.getAudiences",user_id);
	}

	@Override
	public int insertMessage(String sender, String receiver, String content) throws SQLException {
		Map<String, String> map = new HashMap<>();
		map.put("sender", sender);
		map.put("receiver", receiver);
		map.put("content", content);
		
		return client.update("message.insertMessage", map);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MessageVO> getClassMessage(String class_id) throws SQLException {
		return client.queryForList("message.getClassMessage",class_id);
	}

	@Override
	public int insertMessageClass(String sender, String receiver, String content) throws SQLException {
		Map<String, String> map = new HashMap<>();
		map.put("sender", sender);
		map.put("receiver",receiver);
		map.put("content", content);
		return client.update("message.insertMessageClass", map);
	}

}
