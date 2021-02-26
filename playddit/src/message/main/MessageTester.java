package message.main;

import message.dao.IMessageDao;
import message.dao.MessageDaoImpl;
import message.service.IMessageService;
import message.service.MessageServiceImpl;

public class MessageTester {

	public static void main(String[] args) {
		IMessageDao dao = MessageDaoImpl.getDao();
		IMessageService service = MessageServiceImpl.getService();
	
		String sender = "psh40963@naver.com";
		String receiver = "expedition1205@gmail.com";
		String content = "서비스에서 보내보는 테스트 입니다.";
		
		System.out.println(service.insertMessage(sender, receiver, content));

	}

}
