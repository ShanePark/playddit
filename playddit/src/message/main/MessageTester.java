package message.main;

import java.util.List;

import message.dao.IMessageDao;
import message.dao.MessageDaoImpl;
import message.service.IMessageService;
import message.service.MessageServiceImpl;
import users.vo.UsersVO;

public class MessageTester {

	public static void main(String[] args) {
		IMessageDao dao = MessageDaoImpl.getDao();
		IMessageService service = MessageServiceImpl.getService();
		String user_id = "psh40963@naver.com";
		
		List<UsersVO> list = null;
		
		list = service.getAudiences(user_id);
		
		for(UsersVO vo : list) {
			System.out.println(vo.getUser_id());
			System.out.println(vo.getUser_nickname());
		}
	

	}

}
