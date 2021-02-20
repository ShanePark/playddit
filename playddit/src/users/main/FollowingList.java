package users.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import users.service.IUsersService;
import users.service.UsersServiceImpl;
import users.vo.UsersVO;
import web.IAction;

public class FollowingList implements IAction{
	
	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("user_id");
		IUsersService service = UsersServiceImpl.getService();
		List<UsersVO> following = service.followingList(id);
		request.setAttribute("following", following);
		return "/users/following.jsp";
	}
}
