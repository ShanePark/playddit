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
		List<FeedVO> list = null;
		try {
			list= dao.getFeed(user_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		for(FeedVO vo : list) {
			try {
				int feedNo = vo.getFeedno();
				List<ComVO> replyList = dao.getCom(feedNo);
				vo.setReplyList(replyList);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
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

	@Override
	public int insertFeed(String id, String cont, String feedpic) {
		
		try {
			return dao.insertFeed(id, cont, feedpic);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public int deleteFeed(int feedno) {
	
			try {
				return dao.deleteFeed(feedno);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return 0;
	}

	


}
