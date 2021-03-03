package users.main;

import java.util.List;

import users.dao.IUsersDao;
import users.dao.UsersDaoImpl;
import users.service.IUsersService;
import users.service.UsersServiceImpl;
import users.vo.GroupVO;

public class TEST {

	public static void main(String[] args) {

		String user = "psh40963@naver.com";
		IUsersService service = UsersServiceImpl.getService();
		IUsersDao dao = UsersDaoImpl.getDao();

		List<GroupVO> list = service.getGroups(user);
		
		for(GroupVO vo : list){
			System.out.println(vo.getName());
			System.out.println(vo.getNum());
			System.out.println(vo.getType());
		}
	}

}
