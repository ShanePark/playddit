package alarm.service;

import java.util.List;

import alarm.vo.AlarmVO;

public interface IAlarmService {
	// 특정 사용자의 알람 목록을 리스트로 불러오기
	public List<AlarmVO> getAlarm(String user);
	// user에게 있는 특정 cont 와 type 이 일치하는 알람을 제거한 뒤, 새로운 알람으로 갈음
	public int renewAlarm(String user, String cont, int type);
}
