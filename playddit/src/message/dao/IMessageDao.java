package message.dao;

import java.sql.SQLException;
import java.util.List;

import message.vo.MessageVO;

public interface IMessageDao {
	// 특정 사용자와 주고 받은 메시지들 리스트로 불러오기
	public List<MessageVO> getMessage(String user,String audience) throws SQLException;
}
