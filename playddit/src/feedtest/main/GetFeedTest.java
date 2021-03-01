package feedtest.main;

import java.sql.SQLException;
import java.util.List;

import feedtest.dao.FeedTestDaoImpl;
import feedtest.dao.IFeedTestDao;
import feedtest.service.FeedTestServiceImpl;
import feedtest.service.IFeedTestService;
import feedtest.vo.FeedTestVO;

public class GetFeedTest {

	public static void main(String[] args) {
	IFeedTestService service = FeedTestServiceImpl.getService();
	
	//IFeedTestDao dao = FeedTestDaoImpl.getDao();
	
	List<FeedTestVO> list = null;
	
	
	
	list = service.getFeed("psh40963@naver.com");
	for(FeedTestVO vo : list) {
		System.out.println(vo.getFeed_cont());
	}
	
	
	}

}
