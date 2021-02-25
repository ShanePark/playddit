package message.service;

import java.util.List;

import message.vo.MessageVO;

public interface IMessageService {
	// 특정 사용자와 주고 받은 메시지들 리스트로 불러오기
	public List<MessageVO> getMessage(String user,String audience);
}
