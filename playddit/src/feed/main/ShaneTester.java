package feed.main;

import java.sql.SQLException;
import java.util.List;

import feed.dao.FeedDaoImpl;
import feed.dao.IFeedDao;
import feed.service.FeedServiceImpl;
import feed.service.IFeedService;
import feed.vo.ComVO;

public class ShaneTester {
	public static void main(String[] args) {

		IFeedDao dao = FeedDaoImpl.getDao();
		IFeedService service = FeedServiceImpl.getService();

		String user_id = "psh40963@naver.com";
		String comment = "zzz";
		int feed_no = 6;
		int result = service.insertComment(user_id, comment, feed_no);
		System.out.println(result);
	}
}
