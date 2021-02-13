package users.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import users.service.IUsersService;
import users.service.UsersServiceImpl;
import users.vo.UsersVO;


@WebServlet("/followingList.do")
public class FollowingList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	 public FollowingList() {
	        super();
	        
	    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("user_id");
		
		IUsersService service = UsersServiceImpl.getService();
		
		List<UsersVO> following = service.followingList(id);
		
		request.setAttribute("following", following);
		
		RequestDispatcher disp = request.getRequestDispatcher("test/following.jsp");
		disp.forward(request, response);
	}
	
	

}
