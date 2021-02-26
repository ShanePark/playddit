package message.dao;

import java.sql.SQLException;
import java.util.List;

import message.vo.MessageVO;
import users.vo.UsersVO;

public interface IMessageDao {
	// 특정 사용자와 주고 받은 메시지들 리스트로 불러오기
	public List<MessageVO> getMessage(String user,String audience) throws SQLException;

	// 나와 메시지를 주고 받는 사람들의 목록을 불러오기
	public List<UsersVO> getAudiences(String user_id) throws SQLException;
	
	// 메시지 전송하기. message 테이블에 관련 데이터 추가
	public int insertMessage(String sender, String receiver, String content) throws SQLException;
	
}
