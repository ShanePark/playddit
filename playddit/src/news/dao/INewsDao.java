package news.dao;

import java.sql.SQLException;
import java.util.List;

import news.vo.NewsVO;

public interface INewsDao {
	
	// 뉴스 전체 가져오기
	public List<NewsVO> getNewsList() throws SQLException;
	
	// 뉴스 내용 가져오기
	public NewsVO getNews(int news_no) throws SQLException;
	
}
