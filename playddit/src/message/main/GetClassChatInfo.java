package message.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import login.vo.ProfileVO;
import message.service.IMessageService;
import message.service.MessageServiceImpl;
import message.vo.GroupChatVO;
import web.IAction;

public class GetClassChatInfo implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String profileJson = (String) session.getAttribute("profile");
		Gson gson = new Gson();
		ProfileVO profile = gson.fromJson(profileJson, ProfileVO.class);
		
		String user_id = profile.getUser_id();
		
		IMessageService service = MessageServiceImpl.getService();
		
		GroupChatVO vo = service.getClassChatInfo(user_id);
		
		String voJson = new Gson().toJson(vo);
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().write(voJson);
		
		return null;
	
	}

}


