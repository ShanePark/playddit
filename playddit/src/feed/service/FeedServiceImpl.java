package feed.service;

import java.sql.SQLException;
import java.util.List;

import feed.dao.FeedDaoImpl;
import feed.dao.IFeedDao;
import feed.vo.ComVO;
import feed.vo.FeedVO;

public class FeedServiceImpl implements IFeedService {
	
	private IFeedDao dao;
	private static IFeedService service;
	
	// 1. 생성자에서 dao 객체 얻어오기
	public FeedServiceImpl() {
		dao = FeedDaoImpl.getDao();
	}
	
	public static IFeedService getService() {
		if (service == null)
			service = new FeedServiceImpl();

		return service;
	}

	@Override
	public List<FeedVO> getFeed(String user_id) {
		
		try {
			return dao.getFeed(user_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ComVO> getCom(int feed_no) {
		
		try {
			 return dao.getCom(feed_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	


}
