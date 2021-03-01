package feedtest.dao;

import java.sql.SQLException;
import java.util.List;

import feedtest.vo.FeedTestVO;

public interface IFeedTestDao {
	
	// 팔로우회원  내피드 리스트로 불러오기
		public List<FeedTestVO> getFeed(String user_id) throws SQLException;

	
}
