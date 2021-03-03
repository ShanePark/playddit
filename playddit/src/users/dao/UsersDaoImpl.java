package users.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapClientFactory;
import users.vo.FollowerVO;
import users.vo.GroupVO;
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

	/**
	 * 아이디 중복검사
	 */
	@Override
	public String selectById(String user_id) throws SQLException {
		String resId = null;
		
		// sql문의 수행 결과를 리턴받음
		resId = (String)client.queryForObject("users.selectById", user_id);
		
		return resId;
	}

	/**
	 * 닉네임 중복검사
	 */
	
	@Override
	public String selectByNick(String user_nickname) throws SQLException {
		return (String) client.queryForObject("users.selectByNick", user_nickname);
	}
	

	/**
	 * 아이디 비밀번호 일치여부
	 */
	@Override
	public UsersVO match(String user_id, String user_pw) throws SQLException {
		UsersVO vo = null;
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_pw", user_pw);
		vo = (UsersVO) client.queryForObject("users.match", map);

		return vo;
	}

	@Override
	public int setNewPass(String user_id, String password) throws SQLException {
		Map<String, String> map = new HashMap<>();
		map.put("email", user_id);
		map.put("password", password);
		return client.update("users.setNewPass", map);
	}
	
	/**
	 * 팔로잉 목록 출력
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<FollowerVO> followingList(String user_id) throws SQLException {
		return (List<FollowerVO>) client.queryForList("users.followingList", user_id);
	}
	
	/**
	 * 팔로워 목록 출력
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<FollowerVO> followerList(String user_id) throws SQLException {
		return (List<FollowerVO>) client.queryForList("users.followerList", user_id);
	}

	@Override
	public int followUser(String follower, String followee) throws SQLException {
		Map<String, String> map = new HashMap<>();
		map.put("follower", follower);
		map.put("followee", followee);
		if(client.insert("users.followUser", map) == null)
			return 1;
		else return 0;
	}

	@Override
	public int unfollowUser(String follower, String followee) throws SQLException {
		Map<String, String> map = new HashMap<>();
		map.put("follower", follower);
		map.put("followee", followee);
		return client.delete("users.unfollowUser", map);
	}

	@Override
	public int setUserPic(String user_id, String user_pic) throws SQLException {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_pic", user_pic);
		return client.update("users.setUserPic", map);
	}

	@Override
	public GroupVO getGroupInfo_class(String user_id) throws SQLException {
		return (GroupVO) client.queryForObject("users.getGroupInfo_class",user_id);
	}	
	
	

}
