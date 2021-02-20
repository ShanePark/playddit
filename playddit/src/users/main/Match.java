package users.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import users.service.IUsersService;
import users.service.UsersServiceImpl;
import users.vo.UsersVO;
import web.IAction;

public class Match implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		IUsersService service = UsersServiceImpl.getService();

		UsersVO vo = service.match(id, pw);

		request.setAttribute("match", vo);
		return "/users/match.jsp";
	
	}

}


