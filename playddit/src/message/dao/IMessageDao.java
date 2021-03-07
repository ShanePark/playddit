package message.dao;

import java.sql.SQLException;
import java.util.List;

import message.vo.AudienceVO;
import message.vo.MessageVO;

public interface IMessageDao {
	// 특정 사용자와 주고 받은 메시지들 리스트로 불러오기
	public List<MessageVO> getMessage(String user,String audience) throws SQLException;

	// 나와 메시지를 주고 받는 사람들의 목록을 불러오기
	public List<AudienceVO> getAudiences(String user_id) throws SQLException;
	
	// 메시지 전송하기. message 테이블에 관련 데이터 추가
	public int insertMessage(String sender, String receiver, String content) throws SQLException;
	
	// 특정 클래스의 단체 메시지를 리스트로 불러오기
	public List<MessageVO> getClassMessage(String class_id) throws SQLException;
	
	// 학급에 단체 메시지 보내기
	public int insertMessageClass(String sender, String receiver, String content) throws SQLException;
}
