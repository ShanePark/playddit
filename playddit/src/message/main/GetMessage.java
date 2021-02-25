package message.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
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
		String user = request.getParameter("user");
		String audience = request.getParameter("audience");
		
		IMessageService service = MessageServiceImpl.getService();

		List<MessageVO> list = service.getMessage(user, audience);
		String listJson = new Gson().toJson(list);
		request.setAttribute("message", listJson);
		
		return "/message/getMessage.jsp";
	
	}

}


