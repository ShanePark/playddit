package feed.main;

import java.util.List;

import feed.dao.FeedDaoImpl;
import feed.dao.IFeedDao;
import feed.service.FeedServiceImpl;
import feed.service.IFeedService;
import feed.vo.MypageFeedVO;

public class ShaneTester {
	public static void main(String[] args) {

		IFeedDao dao = FeedDaoImpl.getDao();
		IFeedService service = FeedServiceImpl.getService();
		String user_id = "psh40963@naver.com";
		
		List<MypageFeedVO> list = service.loadUserFeeds(user_id);
		
		for(MypageFeedVO vo : list) {
			System.out.println(vo.getFeed_no());
			System.out.println(vo.getContent());
			System.out.println(vo.getPic());
		}
		
	}
}
