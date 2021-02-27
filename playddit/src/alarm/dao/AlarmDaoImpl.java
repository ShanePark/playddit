package alarm.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import alarm.vo.AlarmVO;
import config.SqlMapClientFactory;

public class AlarmDaoImpl implements IAlarmDao {
	
	private SqlMapClient client;
	private static IAlarmDao dao;
	
	private AlarmDaoImpl() {
		client = SqlMapClientFactory.getClient();
	}
	
	public static IAlarmDao getDao() {
		if(dao == null) dao = new AlarmDaoImpl();
		return dao;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AlarmVO> getAlarm(String user) throws SQLException {
		return client.queryForList("alarm.getAlarm", user);
	}

}
