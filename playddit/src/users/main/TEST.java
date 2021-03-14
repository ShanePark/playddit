package users.main;

import java.sql.SQLException;

import login.vo.ProfileVO;
import users.dao.IUsersDao;
import users.dao.UsersDaoImpl;
import users.service.IUsersService;
import users.service.UsersServiceImpl;

public class TEST {

	public static void main(String[] args) {

		String user_id = "psh40963@naver.com";
		IUsersService service = UsersServiceImpl.getService();
		IUsersDao dao = UsersDaoImpl.getDao();
		
		String target_id ="vhvhglgl@naver.com";
		try {
			ProfileVO vo = dao.loadSomeonesProfile(user_id, target_id);
			System.out.println(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
