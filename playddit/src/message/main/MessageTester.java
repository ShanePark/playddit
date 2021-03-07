package message.main;

import java.util.List;

import message.dao.IMessageDao;
import message.dao.MessageDaoImpl;
import message.service.IMessageService;
import message.service.MessageServiceImpl;
import message.vo.AudienceVO;

public class MessageTester {

	public static void main(String[] args) {
		IMessageDao dao = MessageDaoImpl.getDao();
		IMessageService service = MessageServiceImpl.getService();

		String user_id = "psh40963@naver.com";
		String keyword = "세현";
		String receiver = "C202011302";
		String content = "이번엔 service에서 보내보는 테스트 입니다.";

		List<AudienceVO> list = service.searchToChat(user_id, keyword);
		
		for(AudienceVO vo : list) {
			System.out.println(vo.getBio());
			System.out.println(vo.getClassname());
			System.out.println(vo.getContent());
			System.out.println(vo.getId());
			System.out.println(vo.getNickname());
			System.out.println(vo.getProfile());
		}

	}

}
