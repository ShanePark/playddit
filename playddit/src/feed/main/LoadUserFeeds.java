package feed.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import feed.service.FeedServiceImpl;
import feed.service.IFeedService;
import feed.vo.MypageFeedVO;
import web.IAction;

public class LoadUserFeeds implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = request.getParameter("feed_id");
	
		// 2. 해당 변수들을 parameter로 service에 넘겨서 메시지 주고받은 리스트를 받아온다.
		IFeedService service = FeedServiceImpl.getService();
		List<MypageFeedVO> list = service.loadUserFeeds(id);
		
		// 3. 받아온 리스트를 json 데이터로 변경한다.
		String listJson = new Gson().toJson(list);
				
		// 4. 해당 리스트(json으로 변경된 것)를 ajax 로 보낸다.
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().write(listJson);
		
		return null;
	
	}

}


