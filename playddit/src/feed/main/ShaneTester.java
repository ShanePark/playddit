package feed.main;

import java.sql.SQLException;

import feed.dao.FeedDaoImpl;
import feed.dao.IFeedDao;
import feed.service.FeedServiceImpl;
import feed.service.IFeedService;
import feed.vo.FeedVO;

public class ShaneTester {
	public static void main(String[] args) {

		IFeedDao dao = FeedDaoImpl.getDao();
		IFeedService service = FeedServiceImpl.getService();

		String user_id = "psh40963@naver.com";
		int feed_no = 50;

		FeedVO vo = service.getOneFeed(user_id,feed_no);
		
		System.out.println(vo);
	}
}
