package news.service;

import java.sql.SQLException;

import news.vo.NewsVO;

public interface INewsService {
	
	// 뉴스 내용 가져오기
	public NewsVO getNews() throws SQLException;

}
