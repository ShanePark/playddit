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
		int feed_no = 50;

		try {
			List<ComVO> list = dao.getComReplies(1);
			System.out.println(list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
