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

		
	}
}
