package feed.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import feed.service.FeedServiceImpl;
import feed.service.IFeedService;
import login.vo.ProfileVO;
import web.IAction;

public class UpdateFeed implements IAction {

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 세션에서 프로필 정보 받아와서 유저 아이디 변수에 저장
		HttpSession session = request.getSession();
		String profileJson = (String) session.getAttribute("profile");
		Gson gson = new Gson();
		ProfileVO profile = gson.fromJson(profileJson, ProfileVO.class);
		
		String id = profile.getUser_id();
		
		
		// update 할 feed_cont , feed_pic("feedpictest"), feed_no
		String feed_cont = request.getParameter("feed_cont");
		int feed_no = Integer.parseInt(request.getParameter("feed_no"));
		
		
		// feed 의 feedpic 저장 . 사진으로 저장해야하는데 방법 좀 더 알아보기
		
		String feedpic = "feedpictest";
		
		IFeedService service = FeedServiceImpl.getService();
		
		int result = service.updateFeed(feed_cont, feedpic, feed_no);
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().write(String.valueOf(result));	
		
		return null;
	}

}
