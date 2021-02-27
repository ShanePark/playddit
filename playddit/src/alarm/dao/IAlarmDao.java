package alarm.dao;

import java.sql.SQLException;
import java.util.List;

import alarm.vo.AlarmVO;

public interface IAlarmDao {
	// 특정 사용자의 알람 목록을 리스트로 불러오기
	public List<AlarmVO> getAlarm(String user) throws SQLException;
}
