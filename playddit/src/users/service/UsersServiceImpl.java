package users.service;

import java.util.List;

import users.dao.UsersDao;
import users.dao.UsersDaoImpl;
import users.vo.UsersVO;

public class UsersServiceImpl implements UsersService {
	private UsersDao dao;
	private static UsersServiceImpl single;
	
	public static UsersServiceImpl getInstance() {
		if(single==null) new UsersServiceImpl();
		return single;
	}
	
	public UsersServiceImpl() {
		this.dao = new UsersDaoImpl();
	}

	@Override
	public List<UsersVO> getAllUsers() {
		return dao.getAllUsers();
	}
	
	
}
