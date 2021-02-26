package message.service;

import java.util.List;

import message.vo.MessageVO;
import users.vo.UsersVO;

public interface IMessageService {
	// 특정 사용자와 주고 받은 메시지들 리스트로 불러오기
	public List<MessageVO> getMessage(String user,String audience);
	
	// 나와 메시지를 주고 받는 사람들의 목록을 불러오기
	public List<UsersVO> getAudiences(String user_id);
}
