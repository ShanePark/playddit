package login.main;

import java.util.List;

import login.service.ILoginService;
import login.service.LoginServiceImpl;
import users.service.IUsersService;
import users.service.UsersServiceImpl;

public class TESTLoginTEST {

	public static void main(String[] args) {
		ILoginService service = LoginServiceImpl.getService();
		IUsersService userService = UsersServiceImpl.getService();
		
		String class_id = "C202011302";
		List<String> list = userService.getRightHolders(class_id);
		for( String str : list){
			System.out.println(str);
		}
		
	}

}
