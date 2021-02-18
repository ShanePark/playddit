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
import users.vo.UsersVO;

@WebServlet("/match.do")
public class Match extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		IUsersService service = UsersServiceImpl.getService();

		UsersVO vo = service.match(id, pw);

		request.setAttribute("match", vo);


		RequestDispatcher disp = request.getRequestDispatcher("jsp/users/match.jsp");
		disp.forward(request, response);
	
	}

}
