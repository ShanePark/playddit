package login.main;

import login.service.ILoginService;
import login.service.LoginServiceImpl;

public class TESTLoginTEST {

	public static void main(String[] args) {
		ILoginService service = LoginServiceImpl.getService();
		System.out.println(service.loadRandomFriends());
	}

}
