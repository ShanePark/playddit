package alarm.dao;

import java.sql.SQLException;
import java.util.List;

import alarm.vo.AlarmVO;

public interface IAlarmDao {
	// 특정 사용자의 알람 목록을 리스트로 불러오기
	public List<AlarmVO> getAlarm(String user) throws SQLException;
	
	// user에게 있는 sender id 와 type 이 일치하는 알람을 제거한다.
	public int deleteAlarm(String user, String sender, int type) throws SQLException;
	
	// 새로운 알람을 추가한다.
	public int newAlarm(String user, String cont, int type, String sender) throws SQLException;
}
