package message.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapClientFactory;
import message.vo.MessageVO;

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

}
