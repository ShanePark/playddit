package users.service;

import java.util.List;
import users.vo.UsersVO;

public interface IUsersService {
	public List<UsersVO> getAllUsers();
	
	// 아이디 중복 검사
	public String selectById(String user_id);
	
	
}
