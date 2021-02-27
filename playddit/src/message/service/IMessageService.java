package message.service;

import java.util.List;

import message.vo.MessageVO;
import users.vo.UsersVO;

public interface IMessageService {
	// 특정 사용자와 주고 받은 메시지들 리스트로 불러오기
	public List<MessageVO> getMessage(String user,String audience);
	
	// 나와 메시지를 주고 받는 사람들의 목록을 불러오기
	public List<UsersVO> getAudiences(String user_id);
	
	// 메시지 전송하기. message 테이블에 관련 데이터 추가
	public int insertMessage(String sender, String receiver, String content);
	
	// 특정 클래스의 단체 메시지를 리스트로 불러오기
	public List<MessageVO> getClassMessage(String class_id);
	
	// 그룹에 메시지를 보내는 기능입니다. 재사용을 염두해 두고 작성했습니다.
	public int insertMessageGroup(String sender, String receiver, String content, String groupType);
}
