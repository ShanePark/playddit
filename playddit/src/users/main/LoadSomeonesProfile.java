package users.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import login.vo.ProfileVO;
import users.service.IUsersService;
import users.service.UsersServiceImpl;
import web.IAction;

public class LoadSomeonesProfile implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target_id = request.getParameter("feed_id");
		String user_id = request.getParameter("user_id");
		
		IUsersService service = UsersServiceImpl.getService();

		ProfileVO profile = service.loadSomeonesProfile(user_id, target_id);
		String profileJson = new Gson().toJson(profile);
		
		// 해당 profile(json으로 변경된 것)을 ajax 로 보낸다.
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().write(profileJson);
		
		return null;
	}

}


