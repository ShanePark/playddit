package feedtest.service;

import java.sql.SQLException;
import java.util.List;

import feedtest.dao.FeedTestDaoImpl;
import feedtest.dao.IFeedTestDao;
import feedtest.vo.FeedTestVO;

public class FeedTestServiceImpl implements IFeedTestService {
	
	
	// ???????????
	private IFeedTestDao dao;
	private static IFeedTestService service;
	
	// 1. 생성자에서 dao 객체 얻어오기
	public FeedTestServiceImpl() {
		dao = FeedTestDaoImpl.getDao();
	}
	
	public static IFeedTestService getService() {
		if (service == null)
			service = new FeedTestServiceImpl();

		return service;
	}

	
	@Override
	public List<FeedTestVO> getFeed(String user_id) {
		List<FeedTestVO> list = null;
		
		try {
			list = dao.getFeed(user_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

}
