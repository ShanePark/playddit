package users.main;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import users.service.IUsersService;
import users.service.UsersServiceImpl;


@WebServlet("/nicknameCheck.do")
public class NicknameCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_nickname = request.getParameter("user_nickname");
		
		IUsersService service = UsersServiceImpl.getService();
		
		String result = service.selectByNick(user_nickname);
		
		request.setAttribute("nickvalue", result);
		
		RequestDispatcher disp = request.getRequestDispatcher("jsp/users/nickCheck.jsp");
		
		disp.forward(request, response);
		
	}

}
