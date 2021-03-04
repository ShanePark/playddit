package feed.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapClientFactory;
import feed.vo.ComVO;
import feed.vo.FeedVO;

public class FeedDaoImpl implements IFeedDao {

	private SqlMapClient client;
	private static IFeedDao dao;

//	1. SqlMapClient객체 얻기
//	생성자를 생성한 후 객체를 얻어온다.

	private FeedDaoImpl() {
		client = SqlMapClientFactory.getClient();

	}

//	2.service에서 사용될 자신의 객체를 생성하기
//	2-1.자신의 객체를 리턴하는 getDao()메서드 정의
	public static IFeedDao getDao() {
		if (dao == null)
			dao = new FeedDaoImpl();
		return dao;

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<FeedVO> getFeed(String user_id) throws SQLException {
		return (List<FeedVO>) client.queryForList("feed.getFeed", user_id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ComVO> getCom(int feed_no) throws SQLException {
		return (List<ComVO>) client.queryForList("feed.getCom", feed_no);
	}

	@Override
	public int insertFeed(String id, String cont, String feedpic) throws SQLException {
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("cont", cont);
		map.put("feedpic", feedpic);

		if (client.insert("feed.insertFeed", map) == null) {

			return 1;

		} else {

			return 0;
		}

	}

	@Override
	public FeedVO getOneFeed(String user_id, int feed_no) throws SQLException {
		FeedVO vo = new FeedVO();
		vo.setId(user_id);
		vo.setFeedno(feed_no);
		return (FeedVO) client.queryForObject("feed.getOneFeed", vo);
	}
  
  	@Override
	public int deleteFeed(int feedno) throws SQLException {
		return client.delete("feed.deleteFeed",feedno);
	}

	@Override
	public int insertLike(String id, int feedno) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("feedno", feedno);
		
		if(client.insert("feed.insertLike", map)==null) {
			
			return 1;

		} else {

			return 0;
		}
	
	}

	@Override
	public int deleteLike(String id, int feedno) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("feedno", feedno);
		
		return client.delete("feed.deleteLike", map);
	
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ComVO> getComReplies(int feed_com_no) throws SQLException {
		return client.queryForList("feed.getComReplies", feed_com_no);
	}

}
