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

public class DeleteCommentReply implements IAction {

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int comRepNo = Integer.parseInt(request.getParameter("comRepNo"));
		IFeedService service = FeedServiceImpl.getService();
		
		service.deleteComReply(comRepNo);
		
		return null;
	}

}
