package users.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import users.service.IUsersService;
import users.service.UsersServiceImpl;
import web.IAction;

public class NicknameCheck implements IAction {

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String user_nickname = request.getParameter("user_nickname");
		IUsersService service = UsersServiceImpl.getService();
		String result = service.selectByNick(user_nickname);
		String resultJson = new Gson().toJson(result);
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().write(resultJson);

		return null;
		
	}

}
