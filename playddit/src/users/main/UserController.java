package users.main;

import java.util.List;

import users.service.IUsersService;
import users.service.UsersServiceImpl;
import users.vo.UsersVO;

public class UserController {

	public static void main(String[] args) {
		IUsersService service = new UsersServiceImpl();
		List<UsersVO> list = service.getAllUsers();
		System.out.println("====== USER LIST =====");
		for(UsersVO user : list) {
			System.out.println("아이디 : "+user.getUser_id());
			System.out.println("이름 : "+user.getUser_name());
			System.out.println("비밀번호 : "+user.getUser_password());
		}

	}

}
