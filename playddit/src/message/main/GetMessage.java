package message.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import login.vo.ProfileVO;
import message.service.IMessageService;
import message.service.MessageServiceImpl;
import message.vo.MessageVO;
import web.IAction;

public class GetMessage implements IAction {

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
		
		// 2. user는 세션에서 받아오고, audience는 ajax에서 넘겨받는다.
		String user = profile.getUser_id();
		String audience = request.getParameter("audience");
		
		// 3. 해당 변수들을 parameter로 service에 넘겨서 메시지 주고받은 리스트를 받아와 jsp에 보낸다.
		IMessageService service = MessageServiceImpl.getService();
		List<MessageVO> list = service.getMessage(user, audience);
		String listJson = new Gson().toJson(list);
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().write(listJson);
		
		return null;
	
	}

}


