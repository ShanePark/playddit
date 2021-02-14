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


@WebServlet("/idCheck.do")
public class idCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 클라이언트 요청시 전송되는 값을 리턴
		String user_id = request.getParameter("id");
		
		// 2. service 객체 얻는다.
		IUsersService service = UsersServiceImpl.getService();
		
		// 3. service 메서드 호출해서 결과값 받기
		String result = service.selectById(user_id);
		
		// 4. 결과값을 request에 저장
		request.setAttribute("resultvalue", result);
		
		// 5. view페이지로 forward
		RequestDispatcher disp = request.getRequestDispatcher("jsp/users/idCheck.jsp");
		disp.forward(request, response);
	}

}
