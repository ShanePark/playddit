package news.service;

import java.sql.SQLException;
import java.util.List;

import news.vo.NewsVO;

public interface INewsService {
	
	// 뉴스 내용 전체 가져오기
	public List<NewsVO> getNewsList();
	
	
	// 뉴스 내용 가져오기
	public NewsVO getNews(int news_no);

}
