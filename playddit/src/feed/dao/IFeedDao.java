package feed.dao;

import java.sql.SQLException;
import java.util.List;

import feed.vo.ComVO;
import feed.vo.FeedVO;

public interface IFeedDao {

	// 내피드 리스트로 불러오기
	public List<FeedVO> getFeed(String user_id) throws SQLException;

	// 댓글 목록 불러오기
	public List<ComVO> getCom(int feed_no) throws SQLException;
	
	// 피드 작성 하기 

	
	// 피드 삭제 하기 (내 피드만)
	
	
	// 피드 수정 하기 (내 피드만)
	
	
	
	
	

}
