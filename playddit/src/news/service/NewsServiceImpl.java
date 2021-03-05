package news.service;

import java.sql.SQLException;
import java.util.List;

import news.dao.INewsDao;
import news.dao.NewsDaoImpl;
import news.vo.NewsVO;

public class NewsServiceImpl implements INewsService {
	private INewsDao dao;
	private static INewsService service;
	
	public NewsServiceImpl() {
		dao = NewsDaoImpl.getDao();
	}
	
	public static INewsService getService() {
		if(service == null) service = new NewsServiceImpl();
		
		return service;
	}
	
	// 뉴스 전체 가져오기
	@Override
	public List<NewsVO> getNewsList(){
		List<NewsVO> list = null;
		
		try {
			list = dao.getNewsList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	// 뉴스 내용 가져오기
	@Override
	public NewsVO getNews(int news_no) {
		NewsVO vo = null;
		try {
			vo = dao.getNews(news_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

}
