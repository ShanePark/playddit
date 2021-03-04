package news.dao;

import java.sql.SQLException;

import news.vo.NewsVO;

public interface INewsDao {
	
	// 뉴스 내용 가져오기
	public NewsVO getNews() throws SQLException;
}
