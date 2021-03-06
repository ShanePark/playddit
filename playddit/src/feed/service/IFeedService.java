package feed.service;

import java.sql.SQLException;
import java.util.List;

import feed.vo.ComVO;
import feed.vo.FeedVO;
import feed.vo.MypageFeedVO;

public interface IFeedService {

	// 내피드 리스트로 불러오기
	public List<FeedVO> getFeed(String user_id);
	
	// 댓글 목록 불러오기
	public List<ComVO> getCom(int feed_no);
	
	// 피드 작성 하기 
	public int insertFeed(String id, String cont);
	
	// 단일 피드 정보 불러오기
	public FeedVO getOneFeed(String user_id, int feed_no);

	// 피드 삭제 하기 (내 피드만)
	public int deleteFeed(int feedno);
	
	// 피드 수정 하기 (내 피드만)
	public int modifyFeed(String feed_cont, String feed_pic, int feed_no);
	
	// 피드 좋아요 입력
	public int insertLike(String id, int feedno);
	
	// 피드 좋아요 삭제
	public int deleteLike(String id, int feedno);
	
	// 댓글 등록
	public int insertComment(String id, String content, int feedno);

	// 댓글 삭제
	public int deleteComment(int comno);
	
	// 대 댓글 등록
	public int insertComReply(String id, String content, int comno);

	// 대 댓글 삭제
	public int deleteComReply(int recomno);
	
	// 마이페이지 피드자료 가볍게 불러오기
	public List<MypageFeedVO> loadUserFeeds(String user_id);
}
