package feed.service;

import java.sql.SQLException;
import java.util.List;

import feed.vo.ComVO;
import feed.vo.FeedVO;

public interface IFeedService {

	// 내피드 리스트로 불러오기
	public List<FeedVO> getFeed(String user_id);
	
	// 댓글 목록 불러오기
	public List<ComVO> getCom(int feed_no);
	
	// 피드 작성 하기 
	public int insertFeed(String id, String cont, String feedpic);
	
	// 단일 피드 정보 불러오기
	public FeedVO getOneFeed(String user_id, int feed_no);

	// 피드 삭제 하기 (내 피드만)
	public int deleteFeed(int feedno);
	
	// 피드 수정 하기 (내 피드만)
	
	// 피드 좋아요 입력
	public int insertLike(String id, int feedno);
	
}
