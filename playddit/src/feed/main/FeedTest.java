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

		String user_id = "psh40963@naver.com";
		int feed_no = 10;
		
		
		System.out.println("==========================");
		
		String id = "psh40963@naver.com";
		String cont = "피드 내용 테스트 입니다.";
		String feedpic = "피드 사진 테스트용 입니다. 사진으로 저장해야함.";
		
		
		System.out.println("service.insertfeed : "+ service.insertFeed(id, cont, feedpic));

		try {
			System.out.println("dao.insertFeed : " + dao.insertFeed(id, cont, feedpic));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		List<FeedVO> list = service.getFeed(user_id);

		for(FeedVO vo : list) {
			
			System.out.println(); System.out.println("피드번호 : " + vo.getFeedno());
			System.out.println("닉네임 : " + vo.getNickname()); 
			
			feed_no = vo.getFeedno();
			
		List<ComVO> list2 = service.getCom(feed_no);
			for(ComVO vo2 : list2) {
				
				System.out.println("==============================");
				System.out.println(vo2.getNickname());
				System.out.println(vo2.getComcont());
				System.out.println(vo2.getTime());
				System.out.println("==============================");

			
			}
					
			
		}
	



	}

}
