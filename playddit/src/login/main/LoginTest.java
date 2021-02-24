package login.main;

import login.dao.ILoginDao;
import login.dao.LoginDaoImpl;
import login.service.ILoginService;
import login.service.LoginServiceImpl;
import login.vo.ProfileVO;

public class LoginTest {

	public static void main(String[] args) {
		ILoginDao dao = LoginDaoImpl.getDao();
		ILoginService service = LoginServiceImpl.getService();
		ProfileVO vo = null; 
			vo = service.loadProfile("psh40963@naver.com");
		
		System.out.println(vo.getClassname());
		System.out.println(vo.getAllfeed());
		System.out.println(vo.getFollower());
		System.out.println(vo.getFollowing());
		System.out.println(vo.getUser_bio());
		System.out.println(vo.getUser_id());
		System.out.println(vo.getUser_nickname());
		

	}

}
