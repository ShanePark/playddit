package alarm.dao;

import java.sql.SQLException;
import java.util.List;

import alarm.vo.AlarmVO;

public interface IAlarmDao {
	// 특정 사용자의 알람 목록을 리스트로 불러오기
	public List<AlarmVO> getAlarm(String user) throws SQLException;
	
	// 특정 사용자의 특정 content와 type에 해당하는 알람을 삭제한다.
	public int deleteAlarm(String user, String cont, int type) throws SQLException;
	
	// 새로운 알람을 추가한다.
	public int newAlarm(String user, String cont, int type) throws SQLException;
}
