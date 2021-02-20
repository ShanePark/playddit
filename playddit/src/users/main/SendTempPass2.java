package users.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import users.service.IUsersService;
import users.service.UsersServiceImpl;
import web.IAction;

public class SendTempPass2 implements IAction {

	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		IUsersService service = UsersServiceImpl.getService();
		
		int result = service.sendTempPass2(email);
		request.setAttribute("result", result);
		return "/index.html";
	}

}
