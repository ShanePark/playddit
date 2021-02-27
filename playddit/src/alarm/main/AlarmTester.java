package alarm.main;

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

		List<AlarmVO> list = service.getAlarm(user);

		for(AlarmVO vo : list)
			System.out.println(vo.getType() + " " + vo.getCont() + " " + vo.getChk());


	}
}
