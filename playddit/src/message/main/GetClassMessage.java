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

public class GetClassMessage implements IAction {

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
		
		String class_id = profile.getClass_id();
		
		IMessageService service = MessageServiceImpl.getService();
		List<MessageVO> list = service.getClassMessage(class_id);
		
		String listJson = new Gson().toJson(list);
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().write(listJson);
		
		return null;
	
	}

}


