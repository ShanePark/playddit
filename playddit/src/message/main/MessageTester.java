package message.main;

import java.sql.SQLException;
import java.util.List;

import message.dao.IMessageDao;
import message.dao.MessageDaoImpl;
import message.service.IMessageService;
import message.service.MessageServiceImpl;
import message.vo.AudienceVO;
import message.vo.GroupChatVO;

public class MessageTester {

	public static void main(String[] args) {
		IMessageDao dao = MessageDaoImpl.getDao();
		IMessageService service = MessageServiceImpl.getService();

		String user_id = "psh40963@naver.com";
		String keyword = "세현";
		String receiver = "C202011302";
		String content = "이번엔 service에서 보내보는 테스트 입니다.";

		try {
			GroupChatVO vo = dao.getClassChatInfo(user_id);
			System.out.println(vo.getGroup_id());
			System.out.println(vo.getLastmsg());
			System.out.println(vo.getTitle());
			System.out.println(vo.getTitle2());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
