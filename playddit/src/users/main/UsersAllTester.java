package users.main;

import java.sql.SQLException;

import users.dao.IUsersDao;
import users.dao.UsersDaoImpl;
import users.service.IUsersService;
import users.service.UsersServiceImpl;

public class UsersAllTester {

	public static void main(String[] args) {
		IUsersDao dao = UsersDaoImpl.getDao();
		IUsersService service = UsersServiceImpl.getService();
		
		String email = "psh40963@naver.com";
		
		int result = -1;
		result = service.sendTempPass2(email);
		
		System.out.println(result);
		
		
	}

}
