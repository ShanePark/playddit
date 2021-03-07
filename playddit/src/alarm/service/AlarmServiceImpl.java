package alarm.service;

import java.sql.SQLException;
import java.util.List;

import alarm.dao.AlarmDaoImpl;
import alarm.dao.IAlarmDao;
import alarm.vo.AlarmVO;

public class AlarmServiceImpl implements IAlarmService{
	
	private IAlarmDao dao;
	private static IAlarmService service;
	
	private AlarmServiceImpl() {
		dao = AlarmDaoImpl.getDao();
	}
	
	public static IAlarmService getService() {
		if(service == null) service = new AlarmServiceImpl();
		return service;
	}

	@Override
	public List<AlarmVO> getAlarm(String user) {
		try {
			return dao.getAlarm(user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int renewAlarm(String user, String cont, int type, String sender) {
		try {
			dao.deleteAlarm(user, sender, type);
			return dao.newAlarm(user, cont, type, sender);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int deleteAlarm(String user, String sender, int type) {
		try {
			return dao.deleteAlarm(user, sender, type);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

}
