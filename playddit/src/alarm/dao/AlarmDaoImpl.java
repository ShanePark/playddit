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

	@Override
	public int deleteAlarm(String user, String sender, int type) throws SQLException {
		AlarmVO vo = new AlarmVO();
		vo.setReceiver(user);
		vo.setSender(sender);
		vo.setType(type);
		return client.delete("alarm.deleteAlarm", vo);
	}

	@Override
	public int newAlarm(String user, String cont, int type, String sender) throws SQLException {
		AlarmVO vo = new AlarmVO();
		vo.setReceiver(user);
		vo.setCont(cont);
		vo.setType(type);
		vo.setSender(sender);
		if(client.insert("alarm.newAlarm", vo) == null) {
			return 1;
		}else return 0;
	}

}
