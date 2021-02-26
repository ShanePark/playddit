package message.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import message.service.IMessageService;
import message.service.MessageServiceImpl;
import users.vo.UsersVO;
import web.IAction;

public class GetAudiences implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		
		IMessageService service = MessageServiceImpl.getService();
		
		List<UsersVO> list = service.getAudiences(user_id);
		String listJson = new Gson().toJson(list);
		
		request.setAttribute("list", listJson);
		
		
		return "/message/GetAudiences.jsp";
		
	}

}
