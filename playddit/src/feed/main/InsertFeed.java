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

public class InsertFeed implements IAction {

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 세션에서 프로필 정보 받아와서 유저 아이디, 닉네임 변수에 저장하기.
		HttpSession session = request.getSession();
		String profileJson = (String) session.getAttribute("profile");
		Gson gson = new Gson();
		ProfileVO profile = gson.fromJson(profileJson, ProfileVO.class);
		
		String id = profile.getUser_id();
		String nickname = profile.getUser_nickname();
		
		// feed 의 cont를 저장 
		String cont = request.getParameter("cont");
		
		// feed 의 feedpic 저장 . 사진으로 저장해야하는데 방법 좀더 알아보기
		
		String feedpic = request.getParameter("feedpic");
		
		IFeedService service = FeedServiceImpl.getService();
		
		service.insertFeed(id, cont, feedpic);
		
		
		return null;
	}

}
