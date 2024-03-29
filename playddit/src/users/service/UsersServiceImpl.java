package users.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import login.vo.ProfileVO;
import users.dao.IUsersDao;
import users.dao.UsersDaoImpl;
import users.vo.FollowerVO;
import users.vo.GroupVO;
import users.vo.UsersVO;

public class UsersServiceImpl implements IUsersService {
	private IUsersDao dao;
	private static IUsersService service;
	
	private UsersServiceImpl() {
		dao = UsersDaoImpl.getDao();
	}
	
	public static IUsersService getService() {
		if(service == null) service = new UsersServiceImpl();
		
		return service;
	}
	

	@Override
	public List<UsersVO> getAllUsers() {
		return dao.getAllUsers();
	}
	/**
	 * 아이디 중복 검사
	 */
	@Override
	public String selectById(String user_id) {
		String resId = null;
		
		try {
			resId = dao.selectById(user_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resId;
	}
	
	/**
	 * 닉네임 중복 검사
	 */
	@Override
	public String selectByNick(String user_nickname) {
		String resNick = null;
		try {
			resNick = dao.selectByNick(user_nickname);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resNick;
	}


	/**
	 * 아이디 비밀번호 일치 여부
	 */
	@Override
	public UsersVO match(String user_id,String user_pw) {
		UsersVO vo = null;
		try {
			vo = dao.match(user_id, user_pw);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public int setNewPass(String email, String password) {
		int result = 0;
		try {
			result = dao.setNewPass(email, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}


	@Override
	public List<FollowerVO> followingList(String user_id) {
		try {
			return dao.followingList(user_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<FollowerVO> followerList(String user_id) {
		try {
			return dao.followerList(user_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int followUser(String follower, String followee) {
		try {
			return dao.followUser(follower, followee);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int unfollowUser(String follower, String followee) {
		try {
			return dao.unfollowUser(follower, followee);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int setUserPic(String user_id, String user_pic) {
		try {
			return dao.setUserPic(user_id, user_pic);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<GroupVO> getGroups(String user_id) {
		List<GroupVO> list = new ArrayList<>();
		try {
			GroupVO classVo = dao.getGroupInfo_class(user_id);
			classVo.setType("class");
			list.add(classVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int setUserClass(String user_id, String class_id){
		try {
			return dao.setUserClass(user_id, class_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<String> getRightHolders(String class_id){
		try {
			return dao.getRightHolders(class_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int setUserRate(String user_id, int user_rating) {
		try {
			return dao.setUserRate(user_id, user_rating);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public ProfileVO loadSomeonesProfile(String user_id, String target_id) {
		try {
			return dao.loadSomeonesProfile(user_id, target_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
		
	
	
	
	
}
