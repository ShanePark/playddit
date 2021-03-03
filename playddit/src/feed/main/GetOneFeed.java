package feed.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import feed.service.FeedServiceImpl;
import feed.service.IFeedService;
import feed.vo.ComVO;
import feed.vo.FeedVO;
import login.vo.ProfileVO;
import message.service.IMessageService;
import message.service.MessageServiceImpl;
import message.vo.MessageVO;
import web.IAction;

public class GetOneFeed implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 1. 세션에서 프로필 정보 받아와서 유저 아이디 변수에 저장하기.
		HttpSession session = request.getSession();
		String profileJson = (String) session.getAttribute("profile");
		Gson gson = new Gson();
		ProfileVO profile = gson.fromJson(profileJson, ProfileVO.class);
		
		String user_id = profile.getUser_id();
		int feed_no = Integer.parseInt(request.getParameter("feed_no"));
		
		// 2. 해당 변수들을 parameter로 service에 넘겨서 피드 정보 받아오기 
		IFeedService service = FeedServiceImpl.getService();
		FeedVO vo = service.getOneFeed(user_id, feed_no);
		
		
		// 3. 받아온 피드를 json 데이터로 변경한다.
		String voJson = new Gson().toJson(vo);
				
		// 4. 해당객체(json으로 변경된 것)를 ajax 로 보낸다.
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().write(voJson);
		
		return null;
	
	}

}


