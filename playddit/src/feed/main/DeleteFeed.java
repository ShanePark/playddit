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

public class DeleteFeed implements IAction {

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {	
		int feedno = Integer.parseInt(request.getParameter("feedno"));
		
		// 세션을 받아온다. 
		HttpSession session = request.getSession();
		String profileJson = (String) session.getAttribute("profile");
		Gson gson = new Gson();
		ProfileVO profile = gson.fromJson(profileJson, ProfileVO.class);
		
		// 세션에 작성한 피드 갯수 정보를 -1 해서 새로 저장한다.
		profile.setAllfeed(profile.getAllfeed()-1);
		profileJson = new Gson().toJson(profile);
		session.setAttribute("profile", profileJson);
		
		IFeedService service = FeedServiceImpl.getService();
		service.deleteFeed(feedno);
		 
		return null;
	}

}
