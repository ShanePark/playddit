package message.main;

import java.util.List;

import message.dao.IMessageDao;
import message.dao.MessageDaoImpl;
import message.service.IMessageService;
import message.service.MessageServiceImpl;
import message.vo.MessageVO;

public class MessageTester {

	public static void main(String[] args) {
		IMessageDao dao = MessageDaoImpl.getDao();
		IMessageService service = MessageServiceImpl.getService();
		String user = "psh40963@naver.com";
		String audience = "expedition1205@gmail.com";
		List<MessageVO> list = null;
		list = service.getMessage(user, audience);
		
		for(MessageVO vo : list) {
			System.out.print(vo.getSender() +" : ");
			System.out.println(vo.getContent());
			System.out.println(vo.getSentdate());
			System.out.println();
		}

	}

}
