package login.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapClientFactory;
import login.vo.ProfileVO;

public class LoginDaoImpl implements ILoginDao{
	
	private SqlMapClient client;
	private static ILoginDao dao;
	
	private LoginDaoImpl() {
		client = SqlMapClientFactory.getClient();
	}
	
	public static ILoginDao getDao() {
		if(dao == null) dao = new LoginDaoImpl();
		return dao;
	}

	@Override
	public ProfileVO loadProfile(String user_id) throws SQLException {
		return (ProfileVO)client.queryForObject("login.loadProfile",user_id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProfileVO> loadRandomFriends(String user_id) throws SQLException {
		return client.queryForList("login.loadRandomFriends", user_id);
	}

}
