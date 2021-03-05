package news.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapClientFactory;
import news.vo.NewsVO;

public class NewsDaoImpl implements INewsDao {

	private SqlMapClient client;
	private static INewsDao dao;
	
	public NewsDaoImpl() {
		client = SqlMapClientFactory.getClient();
	}
	
	public static INewsDao getDao() {
		if(dao == null) dao = new NewsDaoImpl();
		return dao;
	}

	// 뉴스 전체 가져오기
	@SuppressWarnings("unchecked")
	@Override
	public List<NewsVO> getNewsList() throws SQLException {
		return (List<NewsVO>)client.queryForList("news.getNewsList");
	}
	
	// 뉴스 내용 출력하기

	@Override
	public NewsVO getNews(int news_no) throws SQLException {
		return (NewsVO)client.queryForObject("news.getNews", news_no);
	}

}
