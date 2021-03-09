package message.service;

import java.sql.SQLException;
import java.util.List;

import message.vo.AudienceVO;
import message.vo.GroupChatVO;
import message.vo.MessageVO;

public interface IMessageService {
	// 특정 사용자와 주고 받은 메시지들 리스트로 불러오기
	public List<MessageVO> getMessage(String user,String audience);
	
	// 나와 메시지를 주고 받는 사람들의 목록을 불러오기
	public List<AudienceVO> getAudiences(String user_id);
	
	// 메시지 전송하기. message 테이블에 관련 데이터 추가
	public int insertMessage(String sender, String receiver, String content);
	
	// 그룹에 메시지를 보내는 기능입니다. 재사용을 염두해 두고 작성했습니다.
	public int insertMessageGroup(String sender, String receiver, String content, String groupType);
	
	/**
	 * 채팅을 위해 친구 검색하는 기능입니다.
	 * @param user_id
	 * @param keyword
	 * @return	리턴중에 content 값은 해당 유저와의 총 대화수 입니다. vo 재활용중 0인지를 구분하기 위해 인자사용했습니다.
	 */
	public List<AudienceVO> searchToChat(String user_id, String keyword);
	
	// 채팅을 위한 학급 정보 불러오기
	public GroupChatVO getClassChatInfo(String user_id);
		
	// 학급 채팅 목록 불러오기
	public List<MessageVO> getClassMessages(String user_id, String class_id);
}
