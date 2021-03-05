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
	public FeedVO getOneFeed(String user_id, int feed_no) {
		FeedVO vo = null;
		try {
			vo= dao.getOneFeed(user_id, feed_no);
			List<ComVO> replyList = dao.getCom(feed_no);
			
			for(ComVO comVo : replyList) {	// comVo 들에 대댓글 정보 넣어주기
				int comNo = comVo.getComno();
				List<ComVO> comRepList = dao.getComReplies(comNo);
				comVo.setReplyList(comRepList);
			}
			
			vo.setReplyList(replyList);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
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
				e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int insertLike(String id, int feedno) {
			
		try {
			return dao.insertLike(id, feedno);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int deleteLike(String id, int feedno) {

			try {
				return dao.deleteLike(id, feedno);
			} catch (SQLException e) {
			
				e.printStackTrace();
			}
		
			
			return 0;
	}

	@Override
	public int modifyFeed(String feed_cont, String feed_pic, int feed_no) {
			
		try {
			return dao.modifyFeed(feed_cont, feed_pic, feed_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public int insertComment(String id, String content, int feedno) {
		try {
			return dao.insertComment(id, content, feedno);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int deleteComment(int feedno) {
		try {
			return dao.deleteComment(feedno);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	


}
