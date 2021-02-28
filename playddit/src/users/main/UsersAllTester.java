package users.main;

import java.sql.SQLException;
import java.util.List;

import users.dao.IUsersDao;
import users.dao.UsersDaoImpl;
import users.service.IUsersService;
import users.service.UsersServiceImpl;
import users.vo.FollowerVO;

public class UsersAllTester {

	public static void main(String[] args) {

		String user = "psh40963@naver.com";
		IUsersService service = UsersServiceImpl.getService();
		IUsersDao dao = UsersDaoImpl.getDao();

		List<FollowerVO> list = service.followerList(user);
		for(FollowerVO vo : list) {
			System.out.println(vo.getId());
			System.out.println(vo.getNickname());
			System.out.println(vo.getDepartment());
			System.out.println(vo.getProfile());
			System.out.println(vo.getFollowback());
		}



	}


}
