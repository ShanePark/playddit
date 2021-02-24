package users.main;

import users.service.IUsersService;
import users.service.UsersServiceImpl;
import users.vo.UsersVO;

public class Test {

	public static void main(String[] args) {
		IUsersService service = UsersServiceImpl.getService();
		UsersVO vo = new UsersVO();
		
		vo.setUser_id("a");
		vo.setUser_nickname("nickname");
		vo.setUser_password("user_password");
		vo.setUser_name("user_name");
		vo.setUser_tel("user_tel");

		vo.setUser_class("user_class");
		service.insertUser(vo);
		
		System.out.println("끝");


	}

}
