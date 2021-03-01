package feedtest.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapClientFactory;
import feedtest.vo.FeedTestVO;

public class FeedTestDaoImpl implements IFeedTestDao {
	
	private SqlMapClient client;
	private static IFeedTestDao dao;
	
//	1. SqlMapClient객체 얻기
//	생성자를 생성한 후 객체를 얻어온다.
	

	private FeedTestDaoImpl() {
		client = SqlMapClientFactory.getClient();
		
	}
//	2.service에서 사용될 자신의 객체를 생성하기
//	2-1.자신의 객체를 리턴하는 getDao()메서드 정의
	public static IFeedTestDao getDao() {
		if(dao == null) dao = new FeedTestDaoImpl();
		return dao;
		
	}

	
	
	@Override
	public List<FeedTestVO> getFeed(String user_id) throws SQLException {
		// TODO Auto-generated method stub
		return (List<FeedTestVO>)client.queryForList("FeedTest.getFeed",user_id);
	}

}
