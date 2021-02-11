package users.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapClientFactory;
import users.vo.UsersVO;

public class UsersDaoImpl implements IUsersDao {
	
	private SqlMapClient client;
	private static IUsersDao dao;
	
	private UsersDaoImpl() {
		client = SqlMapClientFactory.getClient();
	}
	
	public static IUsersDao getDao() {
		if(dao == null) dao = new UsersDaoImpl();
		
		return dao;
	}
	
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<UsersVO> getAllUsers() {
		List<UsersVO> list = new ArrayList<>();
		try {
			list = client.queryForList("users.selectAll");
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 아이디 중복체크
	@Override
	public String selectById(String user_id) throws SQLException {
		String resId = null;
		
		// sql문의 수행 결과를 리턴받음
		resId = (String)client.queryForObject("users.selectById", user_id);
		
		return resId;
	}

	/**
	 * 팔로잉 목록 출력
	 */
	@Override
	public UsersVO followingList(String user_id) throws SQLException {
		UsersVO following = null;
		
		// sql문의 수행 결과를 리턴받음
		following = (UsersVO) client.queryForObject("users.followingList", user_id);
		
		return following;
	}

}
