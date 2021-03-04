package feed.main;

import java.sql.SQLException;
import java.util.List;

import feed.dao.FeedDaoImpl;
import feed.dao.IFeedDao;
import feed.service.FeedServiceImpl;
import feed.service.IFeedService;
import feed.vo.ComVO;
import feed.vo.FeedVO;

public class FeedTest {

	public static void main(String[] args) {

		// dao 받아오기
		IFeedDao dao = FeedDaoImpl.getDao();

		// service 받아오기
		IFeedService service = FeedServiceImpl.getService();

		int feedno = 98;
		String id = "expedition1205@gmail.com";
		
		System.out.println(service.insertLike(id,feedno));
	}

}
