package news.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import news.service.INewsService;
import news.service.NewsServiceImpl;
import news.vo.NewsVO;
import web.IAction;

public class GetNewsList implements IAction {

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		INewsService service = NewsServiceImpl.getService();
		
		List<NewsVO> list = service.getNewsList();
		String listJson = new Gson().toJson(list);
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().write(listJson);
		
		return null;
	}

}
