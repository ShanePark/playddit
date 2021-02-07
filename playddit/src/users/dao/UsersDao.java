package users.dao;

import java.util.List;

import users.vo.UsersVO;

public interface UsersDao {
	public List<UsersVO> getAllUsers();
}
