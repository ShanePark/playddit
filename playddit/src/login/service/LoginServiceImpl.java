package login.service;

import java.sql.SQLException;
import java.util.List;

import login.dao.ILoginDao;
import login.dao.LoginDaoImpl;
import login.vo.ProfileVO;

public class LoginServiceImpl implements ILoginService {
	private ILoginDao dao;
	private static ILoginService service;
	
	public LoginServiceImpl() {
		dao = LoginDaoImpl.getDao();
	}
	
	public static ILoginService getService() {
		if(service == null) service = new LoginServiceImpl();
		
		return service;
	}

	@Override
	public ProfileVO loadProfile(String user_id) {
		try {
			return dao.loadProfile(user_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ProfileVO> loadRandomFriends() {
		try {
			return dao.loadRandomFriends();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
