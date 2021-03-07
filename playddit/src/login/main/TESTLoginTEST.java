package login.main;

import login.service.ILoginService;
import login.service.LoginServiceImpl;

public class TESTLoginTEST {

	public static void main(String[] args) {
		ILoginService service = LoginServiceImpl.getService();
		String user_id = "psh40963@naver.com";
		System.out.println(service.loadRandomFriends(user_id));
	}

}
