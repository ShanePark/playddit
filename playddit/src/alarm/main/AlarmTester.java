package alarm.main;

import java.sql.SQLException;
import java.util.List;

import alarm.dao.AlarmDaoImpl;
import alarm.dao.IAlarmDao;
import alarm.service.AlarmServiceImpl;
import alarm.service.IAlarmService;
import alarm.vo.AlarmVO;

public class AlarmTester {
	public static void main(String[] args) {
		IAlarmDao dao = AlarmDaoImpl.getDao();
		IAlarmService service = AlarmServiceImpl.getService();
		
		String user = "psh40963@naver.com";
		String content = "스칼렛";
		String sender = "chdnjs7610@gmail.com";
		int type = 12;
		
		System.out.println(service.renewAlarm(user, content, type, sender));

	}
}
