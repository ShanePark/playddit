package users.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import login.vo.ProfileVO;
import users.service.IUsersService;
import users.service.UsersServiceImpl;
import users.vo.FollowerVO;
import web.IAction;

public class FollowingList implements IAction{
	
	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		
		IUsersService service = UsersServiceImpl.getService();
		List<FollowerVO> list = service.followingList(id);
		
		String listJson = new Gson().toJson(list);
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().write(listJson);
		
		return null;
	}
}
