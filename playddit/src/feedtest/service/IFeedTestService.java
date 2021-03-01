package feedtest.service;

import java.util.List;

import feedtest.vo.FeedTestVO;

public interface IFeedTestService {

	
	// 팔로우회원  내피드 리스트로 불러오기
		public List<FeedTestVO> getFeed(String user_id);
	
}
